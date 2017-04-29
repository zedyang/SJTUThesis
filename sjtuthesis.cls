%# -*- coding: utf-8-unix -*-
%==================================================
%% sjtuthesis.cls for SJTU Master Thesis
%%==================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sjtuthesis}[2016/04/06 v0.9 Shanghai Jiao Tong University Template]
\def\version{v0.9}
\newif\ifsjtu@bachelor\sjtu@bachelorfalse
\newif\ifsjtu@master\sjtu@masterfalse
\newif\ifsjtu@doctor\sjtu@doctorfalse
\newif\ifsjtu@review\sjtu@reviewfalse
\newif\ifsjtu@submit\sjtu@submitfalse
\DeclareOption{bachelor}{\sjtu@bachelortrue}
\DeclareOption{master}{\sjtu@mastertrue}
\DeclareOption{doctor}{\sjtu@doctortrue}
\DeclareOption{review}{\sjtu@reviewtrue}
\DeclareOption{submit}{\sjtu@submittrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
%\LoadClass[a4paper,UTF8]{ctexbook}
%\LoadClass[a4paper,UTF8,scheme=english]{ctexbook}
\LoadClass[a4paper,UTF8]{ctexbook}
\ifsjtu@bachelor\relax\else
  \ifsjtu@master\relax\else
    \ifsjtu@doctor\relax\else
      \ClassError{sjtuthesis}%
      		{You have to specify one of thesis options: bachelor, master or doctor.}{}
    \fi
  \fi
\fi


%% sjtuthesis.cls segments
% 0. Import sjtuthesis.cfg
% 1. Import and configure LaTeX packages.
% 2. Define general-purpose LaTeX commands. 
% 3. Configure the imported packages, also extend LaTeX command in sjtuthesis
% 4. Draw the sjtuthesis

%==========
% Segment 0. Import sjtuthesis.cfg 
%==========

%% \UTF{5BFC}入 sjtuthesis.cfg 文件
\AtEndOfClass{\input{sjtuthesis.cfg}}


%==========
% Segment 1. Import LaTeX packages.
%==========

\RequirePackage[centering,a4paper,body={16cm,22cm}]{geometry} %\UTF{8BBE}置版面
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{fontspec}
\RequirePackage{metalogo,doc}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm,mathrsfs} 
\RequirePackage{upgreek}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
%\RequirePackage{ccaption}
%\RequirePackage[backend=bibtex, style=caspervector,utf8, bibencoding=utf8, sorting=none]{biblatex}
%change here to import bibtex instead of bibter
\RequirePackage[backend=bibtex, bibencoding=utf8,sorting=none]{biblatex}
\RequirePackage{xcolor}
\RequirePackage{wasysym}
\RequirePackage{listings}
\RequirePackage[xetex, bookmarksnumbered, colorlinks, urlcolor=black, linkcolor=black, citecolor=black, plainpages=false, pdfstartview=FitH]{hyperref}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage[inline]{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
%\RequirePackage{algorithm, algorithmic}
\RequirePackage{siunitx}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}

%Add here to import assumption
\usepackage{amsthm}
\usepackage{amsmath}
{
	\theoremstyle{plain}
	\newtheorem{assumption}{Assumption}
}
\usepackage{amssymb}
\usepackage{threeparttable}
\usepackage{booktabs}

\usepackage{algorithm}

%% This package is used for setting the line spaces
\usepackage{setspace}

%% This package is important for change in the chapter's properties. 
\usepackage{titlesec}


%\usepackage{algpseudocode}
\usepackage[noend]{algpseudocode}
% \usepackage[noend]{algorithm2e}

%\usepackage{varwidth}
%\usepackage{bm}
% This template can not work with following to packages, I don't know why.  
%\usepackage{subfig}
%\usepackage{multirow}
%

%change figure name and table name back to english
%You should not add options when importing caption package, because there are conflicts with biblatex package. I don't know how to solve it.  
%\usepackage[figurename=Figure , tablename=Table ]{caption}
\usepackage{caption}
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}


\newtheorem{definition}{Definition}
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\newcommand{\ie}{\textit{i}.\textit{e}., }
\newcommand{\eg}{\textit{e}.\textit{g}., }


%==========
% Segment 2. Define general-purpose LaTeX commands.
%==========

\setcounter{secnumdepth}{4}  % 章\UTF{8282}\UTF{7F16}号深度 (part \UTF{5BF9}\UTF{5E94} -1)
\setcounter{tocdepth}{2}     % 目\UTF{5F55}深度 (part \UTF{5BF9}\UTF{5E94} -1)
    
% User defined command list
%% \me \mi \mj \dif \cleardoublepage \cndash \CJKLaTeX

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

% upper math letter
\newcommand{\me}{\mathrm{e}} 
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

\def\cleardoublepage{\clearpage%
	\if@openright%
	  \ifodd
	    \c@page%
	  \else%
  	    \thispagestyle{empty}%
  	    \hbox{}%
	    \newpage%
	  \fi%
	\fi}

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX} 

% cndash
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%==========
% Segment 3. Configure the imported packages, also extend LaTeX command in sjtuthesis
%==========

% Set the mainfont
\setmainfont{TeX Gyre Termes}

%% 行距\UTF{7F29}放因子
\linespread{1.5}

%% CTeX Settings
% 名称：目\UTF{5F55}、表格索引、插\UTF{56FE}索引、算法、算法索引、代\UTF{7801}%
\ctexset{contentsname={\sjtu@contentsname}}
\ctexset{listfigurename={\sjtu@listfigurename}}
\ctexset{listtablename={\sjtu@listtablename}}
\floatname{algorithm}{\sjtu@label@algo}
\renewcommand{\listalgorithmname}{\sjtu@listalgorithmname}
\renewcommand{\lstlistingname}{\sjtu@value@listingname}
% Title Settings at the chapter Level


%Change the format of each chapter
\ctexset{chapter={
	format = {\vspace*{-10\p@}},
	number = {Chapter~\thechapter },
	name = {,},
%	beforeskip={0\p@ },
%	afterskip={0\p@},
	}
}

%Change the number of each chapter
\titleformat{\chapter}{\centering\Large\bfseries}{Chapter\,\thechapter\,}{1em}{}

%Change the top-margin of each chapter
\titlespacing*{\chapter}{0pt}{10pt}{40pt}


% Title Settings at the section Level
\ctexset{section={
	format={\large\bfseries},
	afterskip={1.0ex \@plus .2ex},
	}
}
% Title Settings at the subection Level
\ctexset{subsection={
	format={\bfseries\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}
% Title Settings at the subsubection Level
\ctexset{subsubsection={
	format={\normalfont\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}

%\CTEXsetup[number={Chapter~\thechapter }]{chapter}
%\CTEXsetup[name={,}]{chapter}                             
%\CTEXsetup[beforeskip={-22pt}]{chapter}

%\CTEXsetup[name={,}]{chapter} 
%\CTEXsetup[number={\arabic{chapter}}]{chapter} 
%\CTEXsetup[format={\noindent}]{chapter} 
%\CTEXsetup[nameformat={\bfseries\sihao \centering \kaishu}]{chapter} 
%\CTEXsetup[titleformat={\bfseries\sihao \centering \kaishu}]{chapter} 
%\CTEXsetup[beforeskip={6pt minus -22pt}]{chapter} 
%\CTEXsetup[afterskip={6pt}]{chapter} 

  

% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphic path & file extension
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% Caption setting in ccaption pacakge
%\captiondelim{\ }
%\captionnamefont{\kaishu\small}
%\captiontitlefont{\kaishu\small}

% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、\UTF{56FE}、表、算法的\UTF{7F16}号\UTF{4E3A}"3-1"的形式，即分隔符由.\UTF{53D8}\UTF{4E3A}短杠
\renewcommand{\theequation}{\arabic{chapter}--\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}--\arabic{figure}}
\renewcommand\p@subfigure{\thefigure}
\renewcommand{\thetable}{\arabic{chapter}--\arabic{table}}
\renewcommand{\thealgorithm}{\arabic{chapter}--\arabic{algorithm}}

% 使用enumitem宏包配制列表\UTF{73AF}境
% \UTF{7D27}\UTF{51D1}\UTF{95F4}距
\setlist{nosep}
% 列表和段落\UTF{5934}\UTF{5BF9}\UTF{9F50}%
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent} % Only the level 1

% 流程\UTF{56FE}定\UTF{4E49}基本形状
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{io} = [trapezium, trapezium left angle=75, trapezium right angle=105, minimum width=1cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{decision} = [diamond, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow} = [thick,->,>=stealth]

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代\UTF{7801}用\UTF{5E26}有\UTF{9634}影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注\UTF{91CA}%
  rulesepcolor=\color{red!20!green!20!blue!20},%代\UTF{7801}\UTF{5757}\UTF{8FB9}框\UTF{4E3A}淡青色
  keywordstyle=\color{blue!90}\bfseries, %代\UTF{7801}\UTF{5173}\UTF{952E}字的\UTF{989C}色\UTF{4E3A}\UTF{84DD}色，粗体
  showstringspaces=false,%不\UTF{663E}示代\UTF{7801}字符串中\UTF{95F4}的空格\UTF{6807}\UTF{8BB0}%
  stringstyle=\ttfamily, % 代\UTF{7801}字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左\UTF{4FA7}\UTF{663E}示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %\UTF{5BF9}\UTF{8FC7}\UTF{957F}的代\UTF{7801}自\UTF{52A8}\UTF{6362}行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代\UTF{7801}\UTF{5757}\UTF{8FB9}框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % \UTF{8BBE}定listing左右的空白
  texcl=true,
  % \UTF{8BBE}定中文冲突，断行，列模式，数学\UTF{73AF}境\UTF{8F93}入，listing数字的\UTF{6837}式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}

% 定理\UTF{73AF}境
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\sjtu@label@algo~}[chapter]
  \newtheorem{thm}{\sjtu@label@thm~}[chapter]
  \newtheorem{lem}[thm]{\sjtu@label@lem~}
  \newtheorem{prop}[thm]{\sjtu@label@prop~}
  \newtheorem{cor}[thm]{\sjtu@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\sjtu@label@defn~}[chapter]
  \newtheorem{conj}{\sjtu@label@conj~}[chapter]
  \newtheorem{exmp}{\sjtu@label@exmp~}[chapter]
  \newtheorem{rem}{\sjtu@label@rem~}
  \newtheorem{case}{\sjtu@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\sjtu@label@thm~}
  \newtheorem{blem}[thm]{\sjtu@label@lem~}
  \newtheorem{bprop}[thm]{\sjtu@label@prop~}
  \newtheorem{bcor}[thm]{\sjtu@label@cor~}
  \renewcommand{\proofname}{\bf\sjtu@label@proof}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following definitions are to extend the LaTeX algorithmic 
% package with SWITCH statements and one-line structures.
% The extension is by 
%   Prof. Farn Wang 
%   Dept. of Electrical Engineering, 
%   National Taiwan University. 
% 
\newcommand{\SWITCH}[1]{\STATE \textbf{switch} (#1)}
\newcommand{\ENDSWITCH}{\STATE \textbf{end switch}}
\newcommand{\CASE}[1]{\STATE \textbf{case} #1\textbf{:} \begin{ALC@g}}
\newcommand{\ENDCASE}{\end{ALC@g}}
\newcommand{\CASELINE}[1]{\STATE \textbf{case} #1\textbf{:} }
\newcommand{\DEFAULT}{\STATE \textbf{default:} \begin{ALC@g}}
\newcommand{\ENDDEFAULT}{\end{ALC@g}}
\newcommand{\DEFAULTLINE}[1]{\STATE \textbf{default:} }
% 
% End of the LaTeX algorithmic package extension.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==========
% Segment 4. Draw the sjtuthesis
%==========

\newcommand\classification[1]{\def\sjtu@value@classification{#1}}
\newcommand\studentnumber[1]{\def\sjtu@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\sjtu@value@confidential{#1}}
\newcommand\school[1]{\def\sjtu@value@school{#1}}
\newcommand\chinesedegree[1]{\def\sjtu@value@chinesedegree{#1}}
%\renewcommand\title[2][\sjtu@value@title]{%
\renewcommand\title[2][\sjtu@value@englishtitle]{%
  \def\sjtu@value@title{#2}
  \def\sjtu@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\sjtu@value@author{#1}}
\newcommand\advisor[1]{\def\sjtu@value@advisor{#1}}
\newcommand\coadvisor[1]{\def\sjtu@value@coadvisor{#1}}
\newcommand\major[1]{\def\sjtu@value@major{#1}}
\newcommand\submitdate[1]{\def\sjtu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\sjtu@value@defenddate{#1}}
\newcommand\institute[1]{\def\sjtu@value@institute{#1}}
\newcommand\chairman[1]{\def\sjtu@value@chairman{#1}}

\def\sjtu@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\sjtuunderline{\@ifnextchar[\sjtu@underline\CTEXunderline}


% “\UTF{7ED8}制”SJTU中文\UTF{6807}\UTF{9898}\UTF{9875} - v0.9.3
%\renewcommand\maketitle[1]{%
%  \cleardoublepage
%  \thispagestyle{empty}
%  \begin{center}
%  {\songti\zihao{-3}\sjtu@label@statement}
%  \vskip\stretch{1}
%  {\heiti\zihao{3}\sjtu@value@title}
%  \vskip\stretch{1}
%  {\fangsong\zihao{4}}
%  \def\tabcolsep{1pt}
%  \def\arraystretch{1.5}
%  \begin{tabular}{rl}
%    \ifsjtu@review
%      \begin{CJKfilltwosides}{4em}\heiti\sjtu@label@author\end{CJKfilltwosides} & \underline{\makebox[150pt]{}}\\
%      \begin{CJKfilltwosides}{4em}\heiti\sjtu@label@studentnumber\end{CJKfilltwosides} & \underline{\makebox[150pt]{}} \\
%      \begin{CJKfilltwosides}{4em}\heiti\sjtu@label@advisor\end{CJKfilltwosides}  & \underline{\makebox[150pt]{}} \\ 
%      \ifx\sjtu@value@coadvisor\undefined\else
%        \begin{CJKfilltwosides}{4em}\heiti\sjtu@label@coadvisor\end{CJKfilltwosides} & \underline{\makebox[150pt]{}} \\ 
%      \fi
%    \else
%      \begin{CJKfilltwosides}{4em}\heiti\sjtu@label@author\end{CJKfilltwosides}	& \underline{\makebox[150pt]{\sjtu@value@author}} \\
%      \begin{CJKfilltwosides}{4em}\heiti\sjtu@label@studentnumber\end{CJKfilltwosides} & \underline{\makebox[150pt]{\sjtu@value@studentnumber}} \\
%      \begin{CJKfilltwosides}{4em}\heiti\sjtu@label@advisor\end{CJKfilltwosides} 	 & \underline{\makebox[150pt]{\sjtu@value@advisor}} \\ 
%      \ifx\sjtu@value@coadvisor\undefined\else
%        \begin{CJKfilltwosides}{4em}\heiti\sjtu@label@coadvisor\end{CJKfilltwosides} 	 & \underline{\makebox[150pt]{\sjtu@value@coadvisor}} \\ 
%      \fi
%    \fi
%      \begin{CJKfilltwosides}{4em}\heiti\sjtu@label@major\end{CJKfilltwosides} 	 & \underline{\makebox[150pt]{\sjtu@value@major}} \\
%      \begin{CJKfilltwosides}{4em}\heiti\sjtu@label@defenddate\end{CJKfilltwosides} 	 & \underline{\makebox[150pt]{\sjtu@value@defenddate}}
%  \end{tabular}
%  \end{center}
%  \vskip \stretch{0.5}
%  \cleardoublepage
%}

% “\UTF{7ED8}制”SJTU中文\UTF{6807}\UTF{9898}\UTF{9875} - v0.5.2 - for english version
\renewcommand\maketitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
\begin{figure}[!htp]
 \centering
 \includegraphics[angle=0,origin=br,width=13cm]{figure/sjtu.jpg}
\end{figure}
\heiti\zihao{-2}\sjtu@label@sjtu
\vskip 15pt
\kaishu\zihao{1}\sjtu@label@statement
\vskip 5pt
\heiti\zihao{-2}\sjtu@label@bacheloreng
\begin{figure}[!htp]
 \centering
 \includegraphics[angle=0,origin=br,width=4cm]{figure/sjtulogo.pdf}
\end{figure}
    \vskip 20pt
    \begin{tabular}{ll}
    \huge{\kaishu\sjtu@label@title:} &\kaishu
\sjtuunderline[350pt]{\sjtu@value@title}
    \end{tabular}
    \vskip 5pt
    {\fangsong\zihao{4}}
    \def\tabcolsep{1pt}
    \def\arraystretch{1}
    \begin{tabular}{lc}
      \kaishu{\sjtu@label@studentname} &\kaishu
      \sjtuunderline[250pt]{\sjtu@value@studentname}
    \\
      \kaishu{\sjtu@label@studentnumber} &\kaishu
      \sjtuunderline[250pt]{\sjtu@value@studentnumber}
    \\
      \kaishu{\sjtu@label@major} &\kaishu
      \sjtuunderline[250pt]{\sjtu@value@major}
    \\  
      \kaishu{\sjtu@label@advisor} &\kaishu
      \sjtuunderline[250pt]{\sjtu@value@advisor}
    \\  
      \kaishu{\sjtu@label@institution} &\kaishu
      \sjtuunderline[250pt]{\sjtu@value@institution}
    \end{tabular}
  \end{center}
  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifsjtu@typeinfo
    \fi
    \cleardoublepage
}



% English Title Page
\newcommand\englishtitle[1]{\def\sjtu@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\sjtu@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\sjtu@value@englishadvisor{#1}}
\newcommand\englishcoadvisor[1]{\def\sjtu@value@englishcoadvisor{#1}}
\newcommand\englishschool[1]{\def\sjtu@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\sjtu@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\sjtu@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\sjtu@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\sjtu@value@englishmajor{#1}}
% "\UTF{7ED8}制"英文\UTF{6807}\UTF{9898}\UTF{9875}%
\newcommand\makeenglishtitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{4} \sjtu@label@englishstatement} 
      \vspace{20pt} \vskip\stretch{1}
      {\huge\sjtu@value@englishtitle \vskip 1pt}
      \vskip \stretch{1}
    \ifsjtu@review
      \vskip \stretch{1}
      \vskip 3pt
      \vskip \stretch{2}
    \else
      {\normalfont\zihao{4}\sjtu@value@englishauthor} 
      \vskip \stretch{1}
      {\normalfont\zihao{4}\sjtu@label@englishadvisor} 
      \vskip 2pt
      {\normalfont\zihao{4}\sjtu@value@englishadvisor} 
      \vskip 5pt
      \ifx\sjtu@value@englishcoadvisor\undefined\else
        {\normalfont\zihao{4}\sjtu@label@englishcoadvisor} 
        \vskip 2pt
        {\normalfont\zihao{4}\sjtu@value@englishcoadvisor} 
        \vskip \stretch{2}
      \fi
    \fi 
    \normalfont\sjtu@value@englishinstitute \vskip 30pt
    \normalfont\sjtu@value@englishdate \vskip 20pt
  \end{center}
  \cleardoublepage
}

% 原\UTF{521B}性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  	{\bf\zihao{3} \sjtu@value@school}\\
  	{\bf\zihao{3} \sjtu@label@original}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\sjtu@label@originalcontent\par}
  \vskip 60pt
  \hspace{13em}\sjtu@label@authorsign\hrulefill\hspace{1.5em}
  \vskip 15pt
  \hspace{16em}\sjtu@label@originalDate\hspace{1em}
  \cleardoublepage
}


% 授\UTF{6743}声明
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  	{\bf\zihao{3} \sjtu@value@school}\\
  	{\bf\zihao{3} \sjtu@label@authorization}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\sjtu@label@authorizationcontent\par}
  \vskip 60pt
  \sjtu@label@authorsign\hrulefill\hspace{3em}\sjtu@label@Supervisorsign\hrulefill
  \vskip 15pt
  \sjtu@label@originalDate\hfill\hspace{3em}\sjtu@label@originalDate
  \cleardoublepage
}

% fancyhdr\UTF{9875}眉\UTF{9875}脚\UTF{8BBE}置
\ifsjtu@bachelor
	% 本科学位\UTF{8BBA}文\UTF{9875}眉\UTF{9875}脚\UTF{8BBE}置
	%% 正文\UTF{9875}眉\UTF{9875}脚
	\fancypagestyle{main}{
	  \fancyhf{}
	  \fancyhead[L]{\includegraphics[width=0.22\textwidth]{figure/sjtubanner}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
	  \fancyfoot[C]{\small {\bfseries\thepage}/{\bfseries\pageref{LastPage}}}
	  \renewcommand{\headheight}{32pt}
	}
	%% \UTF{5F00}章\UTF{9875}\UTF{9875}眉\UTF{9875}脚
	\fancypagestyle{plain}{% \UTF{8BBE}置\UTF{5F00}章\UTF{9875}\UTF{9875}眉\UTF{9875}脚\UTF{98CE}格(只有\UTF{9875}\UTF{7801}作\UTF{4E3A}\UTF{9875}脚)
	  \fancyhf{}%
	  \fancyhead[L]{\nouppercase{\small\kaishu\includegraphics[width=0.22\textwidth]{figure/sjtubanner}}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
	  \fancyfoot[C]{\small {\bf\thepage}/{\bf\pageref{LastPage}}}
	  \renewcommand{\headheight}{32pt}
	}
\else
	% 研究生学位\UTF{8BBA}文\UTF{9875}眉\UTF{9875}脚\UTF{8BBE}置
	\if@twoside
	  %% 正文\UTF{9875}眉\UTF{9875}脚
	  \fancypagestyle{main}{
	    \fancyhead[LO, RE]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
	    \fancyhead[RO]{\nouppercase{\small\kaishu\leftmark}}
	    \fancyhead[LE]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
	    \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
	    \renewcommand{\headheight}{32pt}
	  }
	  %% \UTF{5F00}章\UTF{9875}\UTF{9875}眉\UTF{9875}脚
	  \fancypagestyle{plain}{
	    \fancyhf{}
	    \fancyhead[LO,RE]{\nouppercase{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}}
	    \fancyhead[RO]{\nouppercase{\small\kaishu\leftmark}}
	    \fancyhead[LE]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
	    \fancyfoot[C]{\small ---~{\bf\thepage}~---}
	    \renewcommand{\headheight}{32pt}
	  }
	\else
	%% 正文\UTF{9875}%
	\fancypagestyle{main}{
	  \fancyhead[L]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
	  \fancyhead[R]{\nouppercase{\small\kaishu\leftmark}}
	  \fancyfoot[C]{\small ---~{\bf\thepage}~---}
	  \renewcommand{\headheight}{32pt}
	}
	\fancypagestyle{plain}{
	  \fancyhf{}
	  \fancyhead[L]{\nouppercase{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\leftmark}}
	  % \fancyhead[L]{\small {\it\sjtu@value@titlemark}}
	  \fancyfoot[C]{\small ---~{\bf\thepage}~---}
	  \renewcommand{\headheight}{32pt}
	}
	\fi
\fi

% 中英文摘要
\newenvironment{abstract}{\chapter*{\sjtu@value@title\vskip 20pt\sjtu@label@abstract}\markboth{\sjtu@label@abstract}{}}{}
\newcommand\keywords[1]{\vspace{2ex}\noindent{\bf\large \sjtu@label@keywords} #1}
\newenvironment{englishabstract}{\chapter*{\sjtu@value@englishtitle\vskip 20pt\bfseries \sjtu@label@englishabstract}\markboth{\sjtu@label@englishabstract}{}}{}
\newcommand\englishkeywords[1]{\vspace{2ex}\noindent{\bf\large \sjtu@label@englishkeywords} #1}

\renewcommand\tableofcontents{%
  \chapter*{\contentsname}
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

\newenvironment{publications}[1]
     {\chapter{\sjtu@label@publications}%
      \@mkboth{\MakeUppercase\sjtu@label@publications}
              {\MakeUppercase\sjtu@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}

\newenvironment{patents}[1]
     {\chapter{\sjtu@label@patents}%
      \@mkboth{\MakeUppercase\sjtu@label@patents}
              {\MakeUppercase\sjtu@label@patents}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `patents' environment}}%
      \endlist}

\newenvironment{projects}[1]
     {\chapter{\sjtu@label@projects}%
      \@mkboth{\MakeUppercase\sjtu@label@projects}
              {\MakeUppercase\sjtu@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

\newenvironment{resume}
  {\chapter{\sjtu@label@resume}}
  {}
  
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}
   
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}
   
\renewenvironment{thanks}
  {\chapter{\sjtu@label@thanks}}
  {}

\newenvironment{summary}
{\chapter*{\sjtu@label@summary\markboth{\sjtu@label@summary}{}}\addcontentsline{toc}{chapter}{\sjtu@label@summary}
}{}

\newenvironment{symbolnote}{\chapter{\sjtu@label@symbolnote}}{} 

\endinput

%%
%% End of file `sjtuthesis.cls'.

