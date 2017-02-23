""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sets how many lines of history VIM has to remember
set history=700

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Vim user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Highlight the cursor line
" set cursorline

" Turn on the Wild menu
set wildmenu

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers    
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a seconds to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable mouse
set mouse=a

" Set the window size
if has('gui_running')
    set lines=60
    set columns=110
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Color and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on 

" Set the scheme
if has('gui_running')
    colo solarized
endif
" set t_Co=256
" let g:solarized_termcolors=256
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Text, tab and indent related 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Have a line after 80 char
" set colorcolumn=80

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai

" Smart indent
set si

" set c indent
"filetype on
"if (&ft=='c' || &ft=='cpp')
"    set colorcolumn=80
"    set cindent
"endif

" Wrap lines
set wrap

" Make the backspace to erase more
set backspace=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Mapping keys 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change tabs
map <F6> :tabp<CR>
map <F7> :tabn<CR>

" Display the modified lines
map <F12> :w !diff % -<CR>

" Search for highlight text
vnoremap // y/<C-R>"<CR>

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Others
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd
set number
set laststatus=2
set title

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" diff current buffer and the origninal file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

