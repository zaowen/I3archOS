augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'

  " Optional:
  Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

map <leader><Tab> :-1 read ~/.vim/snip/%:e<CR> <leader><Space>
inoremap <leader><Space> <Esc>/<++><Enter>"_c4l
nnoremap <leader><Space> <Esc>/<++><Enter>"_c4l


" Latex
autocmd FileType tex map <F4> :!bibtex %:r.aux<CR>
autocmd FileType tex map <F5> :!pdflatex -output-directory=%:p:h %:p<CR>
autocmd FileType tex map <F6> :silent :!evince %:r.pdf &<CR>
autocmd FileType tex inoremap \bf \textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap \if \textit{}<Space><++><Esc>T{i
autocmd FileType tex inoremap \align \begin{align*}<CR><Space><CR>\end{align*}<Esc>kA
autocmd FileType tex inoremap \enu \begin{enumerate}<CR>\item <CR>\end{enumerate} <++><Esc>kA
autocmd FileType tex :set spell
"END

" Bash
   " Google Indentation
autocmd FileType sh set tabstop=2          "Set Display tabstop
autocmd FileType sh set softtabstop=2      "Set inserted tabstop
autocmd FileType sh set shiftwidth=2      "Set inserted tabspace
"END

" C++
   " Google Indentation
autocmd FileType cpp set tabstop=2          "Set Display tabstop
autocmd FileType cpp set softtabstop=2      "Set inserted tabstop
autocmd FileType cpp set shiftwidth=2      "Set inserted tabspace
"END

" Python
au BufRead SCons* set filetype=python
au BufNewFile SCons* set filetype=python

:autocmd BufNew,BufRead SConstruct setf python
:autocmd BufNew,BufRead SConscript setf python

   " Google Indentation
autocmd FileType py set tabstop=2          "Set Display tabstop
autocmd FileType py set softtabstop=2      "Set inserted tabstop
autocmd FileType py set shiftwidth=2      "Set inserted tabspace
"END

" Set Retarded things that should be standard
:colorscheme corporation

:set number
:set relativenumber
:syntax on
:set ruler
:set backspace=2
:set showcmd

" split movement and QOL
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Moveing line remaping
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Save aliases because i'm shit
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

"Turn gvim into sudo gvim
cmap w!! w !sudo tee >/dev/null %

" Whitespace show config
:set list
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:·
:hi NonText guifg=#3333AA
:hi SpecialKey guifg=#3333AA

" Tab stuff
:set expandtab          "Use spaces instead of tabs
:set autoindent         "infer indent from previous line
:set smartindent        "somehow diffrent from autoindent
:set cindent            "somehow diffrent from smartindent

" Folding
:set foldmethod=syntax
:set foldnestmax=1
:set foldlevel=99
nnoremap <space> za

" Cursor
if has ('gui_running')
   :hi Cursor guifg=black guibg=grey
   :set cursorline
   :hi CursorLine guibg=#333333
   :set cursorcolumn
   :hi CursorColumn guibg=#333333
   "Edgy bitmap font
   :set guifont=Hack
endif

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <CR> :noh<CR><CR>

"Menu bar config
:set wildmenu           "allow tab completion in status bar

"Use System Clipboard
set clipboard=unnamed

" Open .cpp from .h and .h from .cpp
map <F4> :vsp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Open Maximized in Windows
if has ("win16") || has("win32") || has("win64")
   if has ('gui_running')
      au GUIEnter * simalt ~x
   endif
endif 
