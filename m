From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 15 Jul 2010 15:06:03 +0100
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <AANLkTinsUwFgYEaRhtAwzO2I5Y2frnUunmtzBKTSveF9@mail.gmail.com>
References: <1279123755.7058.242.camel@cabbage.rehill.info>
	<4C3E102D.50105@zacarias.com.ar>
	<1279192188.6184.2.camel@dubciaranr1.verifone.com>
	<AANLkTinsUwFgYEaRhtAwzO2I5Y2frnUunmtzBKTSveF9@mail.gmail.com>
Message-ID: <1279202763.3572.22.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mitch,

Ar D?ar, 2010-07-15 ag 22:06 +1000, scr?obh Mitch Davis:


> I don't know if this is helpful or not, but can you run strace -p
> $(pidof tic) and show the result?  That might tell us what tic is
> doing.  In addition, you may consider adding "set -x" to run_tic.sh.
> That will tell us how tic is being invoked.

I'd actually done both of these before but drew nothing from them
myself, then again I don't really know what "tic" does so I'm at an
immediate disadvantage.  "strace -p pid" doesn't work since it doesn't
seem to be looping.  So, editing
"output/build/ncurses-5.7/misc/run_tic.sh" to add "set -x" after
#!/bin/sh and adding strace before the tic call:

        $ make ncurses
        ...
        make[2]: Entering directory `/home/qvr/obair/buildroot.org/output/build/ncurses-5.7/misc'
        DESTDIR=/home/qvr/obair/buildroot.org/output/staging \
        	prefix=/usr \
        	exec_prefix=/usr \
        	bindir=/usr/bin \
        	top_srcdir=.. \
        	srcdir=. \
        	datadir=/usr/share \
        	ticdir=/usr/share/terminfo \
        	source=terminfo.tmp \
        	cross_compiling="yes" \
        	/bin/sh ./run_tic.sh
        /usr/bin/install -c ncurses-config /home/qvr/obair/buildroot.org/output/staging/usr/bin/ncurses5-config
        + echo '** Building terminfo database, please wait...'
        ** Building terminfo database, please wait...
        + :
        + : /home/qvr/obair/buildroot.org/output/staging
        + : /usr
        + : /usr
        + : /usr/bin
        + : ..
        + : .
        + : /usr/share
        + : /usr/share/terminfo
        + : terminfo.tmp
        + : 'ln -s'
        + : yes
        + : 1
        + test -z /home/qvr/obair/buildroot.org/output/staging
        + test yes '!=' yes
        + SHLIB=
        + suffix=
        + SHLIB_PATH=/home/qvr/bin:/home/qvr/CodeSourcery/Sourcery_G++_Lite/bin:/usr/kerberos/bin:/usr/lib/ccache:/usr/local/bin:/bin:/usr/bin
        + export SHLIB_PATH
        + SHLIB_HOST=linux-gnu
        + export SHLIB_HOST
        + TERMINFO=/home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo
        + export TERMINFO
        + umask 022
        ++ echo /home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo
        ++ sed -e 's%/share/\([^/]*\)$%/lib/\1%'
        + TICDIR=/home/qvr/obair/buildroot.org/output/staging/usr/lib/terminfo
        + test -d /home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo
        + test 1 = 1
        + cat
        Running tic to install /home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo ...
        
        	You may see messages regarding extended capabilities, e.g., AX.
        	These are extended terminal capabilities which are compiled
        	using
        		tic -x
        	If you have ncurses 4.2 applications, you should read the INSTALL
        	document, and install the terminfo without the -x option.
        
        + strace tic -x -s -o /home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo terminfo.tmp
        execve("/usr/bin/tic", ["tic", "-x", "-s", "-o", "/home/qvr/obair/buildroot.or", "terminfo.tmp"], [/* 55 vars */]) = 0
        brk(0)                                  = 0x8b16000
        access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
        open("/etc/ld.so.cache", O_RDONLY)      = 3
        fstat64(3, {st_mode=S_IFREG|0644, st_size=65791, ...}) = 0
        mmap2(NULL, 65791, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7fcf000
        close(3)                                = 0
        open("/usr/lib/libncursesw.so.5", O_RDONLY) = 3
        read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\260\371S\0004\0\0\0"..., 512) = 512
        fstat64(3, {st_mode=S_IFREG|0755, st_size=330428, ...}) = 0
        mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7fce000
        mmap2(0x530000, 330212, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x530000
        mmap2(0x578000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x48) = 0x578000
        mmap2(0x580000, 2532, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x580000
        close(3)                                = 0
        open("/lib/libdl.so.2", O_RDONLY)       = 3
        read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0P\272O\0004\0\0\0"..., 512) = 512
        fstat64(3, {st_mode=S_IFREG|0755, st_size=16428, ...}) = 0
        mmap2(0x4fb000, 12408, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x4fb000
        mmap2(0x4fd000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1) = 0x4fd000
        close(3)                                = 0
        open("/lib/libc.so.6", O_RDONLY)        = 3
        read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\340\3779\0004\0\0\0"..., 512) = 512
        fstat64(3, {st_mode=S_IFREG|0755, st_size=1611564, ...}) = 0
        mmap2(0x38a000, 1332676, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x38a000
        mprotect(0x4c9000, 4096, PROT_NONE)     = 0
        mmap2(0x4ca000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x13f) = 0x4ca000
        mmap2(0x4cd000, 9668, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4cd000
        close(3)                                = 0
        mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7fcd000
        set_thread_area({entry_number:-1 -> 6, base_addr:0xb7fcd6c0, limit:1048575, seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1, seg_not_present:0, useable:1}) = 0
        mprotect(0x4fd000, 4096, PROT_READ)     = 0
        mprotect(0x4ca000, 8192, PROT_READ)     = 0
        mprotect(0x386000, 4096, PROT_READ)     = 0
        munmap(0xb7fcf000, 65791)               = 0
        brk(0)                                  = 0x8b16000
        brk(0x8b37000)                          = 0x8b37000
        open("terminfo.tmp", O_RDONLY|O_LARGEFILE) = 3
        fstat64(3, {st_mode=S_IFREG|0644, st_size=949524, ...}) = 0
        fstat64(3, {st_mode=S_IFREG|0644, st_size=949524, ...}) = 0
        mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7fdf000
        _llseek(3, 0, [0], SEEK_CUR)            = 0
        read(3, "######## TERMINAL TYPE DESCRIPTI"..., 4096) = 4096
        read(3, "is nicer (among other things, it"..., 4096) = 4096
        read(3, "ode (black on white)\n#\t-s\tEnable"..., 4096) = 4096
        read(3, "he headers for each manufacturer"..., 4096) = 4096
        read(3, "ming terminal has bold; not dim,"..., 4096) = 4096
        read(3, " by the Intel\n# Binary Compatibi"..., 4096) = 4096
        read(3, "cansi-m|pcansi-mono|ibm-pc termi"..., 4096) = 4096
        brk(0x8b58000)                          = 0x8b58000
        read(3, "th ansi.sys also affects PC-DOS "..., 4096) = 4096
        read(3, ".13 (at least) set the screen si"..., 4096) = 4096
        read(3, "c=+\\020\\,\\021-\\030.^Y0\\333`\\004a"..., 4096) = 4096
        read(3, "\\E[19~, kf9=\\E[20~,\n\tkhome=\\E[1~"..., 4096) = 4096
        read(3, "t|AT&T WGS 6386 console,\n\tam, bw"..., 4096) = 4096
        read(3, "l describing the VT100 sequences"..., 4096) = 4096
        read(3, "clo=\\EOV, kclr=\\E[J, kcmd=\\EOu, "..., 4096) = 4096
        read(3, "ry used to be known as ibmx.\n# I"..., 4096) = 4096
        read(3, "h, mcud1=\\E/>1l\\E/>9h, mcuf=\\E/>"..., 4096) = 4096
        read(3, "e, I translated these into termi"..., 4096) = 4096
        brk(0x8b79000)                          = 0x8b79000
        read(3, "l=^G, blink=\\E[5m$<2>, bold=\\E[1"..., 4096) = 4096
        read(3, "bel=^G, blink=\\E[5m, bold=\\E[1m,"..., 4096) = 4096
        read(3, "o ansi mode),\n\tlines#30, use=con"..., 4096) = 4096
        read(3, "cr=^M, cub=\\E[%p1%dD, cub1=^H,\n\t"..., 4096) = 4096
        read(3, "ferent modes: Cursor Mode and Ap"..., 4096) = 4096
        read(3, "h legacy termcap\n# support:\nvt10"..., 4096) = 4096
        read(3, " mc5=\\E[5i,\n\trc=\\E8, rev=\\E[7m$<"..., 4096) = 4096
        brk(0x8b9a000)                          = 0x8b9a000
        read(3, "0 description maps F5--F9 to the"..., 4096) = 4096
        read(3, "f2=pf2, lf3=pf3, lf4=pf4, mc0=\\2"..., 4096) = 4096
        read(3, "E[0$},\n\thome=\\E[H, ht=^I, hts=\\E"..., 4096) = 4096
        read(3, "l=\\E[2$~\\E[1$}\\E[1;%dH,\n\n# DEC d"..., 4096) = 4096
        read(3, " 21) then value = key + 1;\n#    "..., 4096) = 4096
        read(3, "vt525: I added <rmam>/<smam> bas"..., 4096) = 4096
        read(3, "[%i%p1%d;%p2%dH, cuu=\\E[%p1%dA, "..., 4096) = 4096
        read(3, "\\263y\\363z\\362{\\343|\\330}\\234~\\3"..., 4096) = 4096
        read(3, " a minimal subset of a vt100 (co"..., 4096) = 4096
        brk(0x8bbb000)                          = 0x8bbb000
        read(3, "M, knp=\\E[6~, kpp=\\E[5~,\n\tkslt=\\"..., 4096) = 4096
        read(3, "%t;7%;%?%p4%t;5%;m%?%p9%t\\016%e\\"..., 4096) = 4096
        read(3, "[5C,\n\tkRIT6=\\E[6C, kRIT7=\\E[7C, "..., 4096) = 4096
        read(3, "on,\n\tOTbs, am, bce, km, mc5i, mi"..., 4096) = 4096
        read(3, "sgr, npc, xenl, AX,\n\tcolors#8, c"..., 4096) = 4096
        read(3, ", cuu1=\\EA, ed=\\EJ, el=\\EK,\n\thom"..., 4096) = 4096
        read(3, "et colors (along with everything"..., 4096) = 4096
        brk(0x8bdc000)                          = 0x8bdc000
        read(3, "ay automatically use the content"..., 4096) = 4096
        read(3, "11@, kf12@, kf13@, kf14@, kf15@,"..., 4096) = 4096
        read(3, "s=\\E(B, rmam=\\E[?7l, rmcup=\\E[?1"..., 4096) = 4096
        read(3, "[ 5 ^    ESC [ 5 @\n#  Next      "..., 4096) = 4096
        read(3, "=\\E[5$, kRIT=\\E[c, kcub1=\\E[D, k"..., 4096) = 4096
        read(3, "rm-256color|Eterm with xterm 256"..., 4096) = 4096
        read(3, "nal emulator with color,\n\tccc,\n\t"..., 4096) = 4096
        read(3, "9=\\E[33~,\n\tkf4=\\EOt, kf40=\\E[34~"..., 4096) = 4096
        brk(0x8bfd000)                          = 0x8bfd000
        read(3, ", il=\\E[%p1%dL,\n\til1=\\E[L, ind=\\"..., 4096) = 4096
        read(3, " esr)\n#\n# 'screen' defines exten"..., 4096) = 4096
        read(3, "s those (tested with screen 4.00"..., 4096) = 4096
        read(3, "sed on xterm-vt220,\n# xterm+sl, "..., 4096) = 4096
        read(3, "tty\" entry;\n# as an added bonus,"..., 4096) = 4096
        read(3, "n-nic|sune|Sun Microsystems Work"..., 4096) = 4096
        brk(0x8c1e000)                          = 0x8c1e000
        read(3, "=^H,\n\tkcud1=^J, nel=^M^J,\n\n#### "..., 4096) = 4096
        read(3, "wp511|nwp-511|nwp-511 vt100,\n\tOT"..., 4096) = 4096
        read(3, "e are as distributed with EMX 0."..., 4096) = 4096
        read(3, "plemented\n#   khome [home key] r"..., 4096) = 4096
        read(3, "bc=\\E[2g, vpa=\\E[%i%p1%dd, use=v"..., 4096) = 4096
        read(3, "E[H, ht=^I, ich=\\E[%p1%d@, ich1="..., 4096) = 4096
        read(3, "=^I, hts=\\EH$<2/>, ind=\\ED$<5/>,"..., 4096) = 4096
        brk(0x8c3f000)                          = 0x8c3f000
        read(3, "mmon, but have proprietary comma"..., 4096) = 4096
        read(3, "ON CONSOLES section for the 700s"..., 4096) = 4096
        read(3, "621-fl,\n\n# Needed for UCB ARPAVA"..., 4096) = 4096
        read(3, "d.\n#\nhp2640a|hp 2640a,\n\tcup@, rm"..., 4096) = 4096
        read(3, "rmcap -- esr)\nhp+labels|\"standar"..., 4096) = 4096
        brk(0x8c60000)                          = 0x8c60000
        read(3, "\\Ev\\r,\n\tkf8=\\Ew\\r, khome=\\Eh, ki"..., 4096) = 4096
        read(3, "\n\tif=/usr/share/tabset/std, il1="..., 4096) = 4096
        read(3, "dalf.moria> 11 Jan 93\n#\n\n# Honey"..., 4096) = 4096
        read(3, "(\\r, home=^^, ht=^I,\n\tkbs=^H, kc"..., 4096) = 4096
        read(3, "-Siegler ADM 31.\n#\n# Main board:"..., 4096) = 4096
        read(3, "OFF selects Conversation Mode - "..., 4096) = 4096
        read(3, "$$<200/>\\E$P,\n\thome=\\E$B, ht=^I,"..., 4096) = 4096
        brk(0x8c81000)                          = 0x8c81000
        read(3, "0, lines#24, xmc#0,\n\tbel=^G, cbt"..., 4096) = 4096
        read(3, " use=adm+sgr,\n# From: Alan R. Ro"..., 4096) = 4096
        read(3, "#  TVI-920B || tvi920b\n#  TVI-92"..., 4096) = 4096
        read(3, " Closed:\tNot allowed\n#\n# 5 Close"..., 4096) = 4096
        read(3, "t for the page print mode\n# sequ"..., 4096) = 4096
        read(3, " option \"visible bell\"; no attri"..., 4096) = 4096
        read(3, "suppress tic warning -- esr)\ntvi"..., 4096) = 4096
        read(3, "------------------------\n# 2\t\t\tX"..., 4096) = 4096
        read(3, "ideo|Transmiss'n| Hz  |Click|\n# "..., 4096) = 4096
        read(3, " 950 with two pages adds the fol"..., 4096) = 4096
        brk(0x8ca2000)                          = 0x8ca2000
        read(3, "=\\ED, cuf1=\\E[C, cup=\\E[%i%p1%d;"..., 4096) = 4096
        read(3, "6-9050.\n# Or visit White Pine on"..., 4096) = 4096
        read(3, "verbose. maybe\n# an initializati"..., 4096) = 4096
        read(3, ", wsl#45,\n\tacsc=0wa_h[jukslrmqnx"..., 4096) = 4096
        read(3, "p9%t\\EH\\002%e\\EH\\003%;,\n\tsgr0=\\E"..., 4096) = 4096
        read(3, "n\n#\talt-charset mode.  Try \\EcE\\"..., 4096) = 4096
        read(3, "=^J, kcuf1=^L, kcuu1=^K, kdch1=\\"..., 4096) = 4096
        brk(0x8cc3000)                          = 0x8cc3000
        read(3, "n 9600 baud.  No padding is need"..., 4096) = 4096
        read(3, ", rmxon=\\Ec20\\Ec30,\n\trs2=\\Eu\\E~4"..., 4096) = 4096
        read(3, "-w-vb|wy160-wvb|wyse160-wvb|Wyse"..., 4096) = 4096
        read(3, "1%dX, ed=\\E[J$<110>, el=\\E[K$<1>"..., 4096) = 4096
        read(3, "lays 25 lines.  These lines may "..., 4096) = 4096
        read(3, "%t%{4}%|%;%?%p4%t%{2}%|%;%?%p1%p"..., 4096) = 4096
        read(3, "\n\ttbc=\\E[3g, tsl=\\E[40l\\E[40h\\E7"..., 4096) = 4096
        brk(0x8ce4000)                          = 0x8ce4000
        read(3, "programmed to generate BS in smc"..., 4096) = 4096
        read(3, "w|wyse 520 in 132-column mode wi"..., 4096) = 4096
        read(3, "!  <clear> does\n# not work, but "..., 4096) = 4096
        read(3, "4i\\E[m\\E[r\\E[2$~,\n\tsc=\\E7, sgr0="..., 4096) = 4096
        read(3, "<smacs>/<smul>/<smso> capabiliti"..., 4096) = 4096
        read(3, "#\n\n#### AT&T (att, tty)\n#\n# This"..., 4096) = 4096
        read(3, "3>, el1=\\E[1K$<3>,\n\tenacs=\\E(B\\E"..., 4096) = 4096
        read(3, "\n# Note that this mode permits p"..., 4096) = 4096
        brk(0x8d05000)                          = 0x8d05000
        read(3, "4, lm#72,\n\tbel=^G, clear=\\EH\\EJ,"..., 4096) = 4096
        read(3, "?6;97;99l\\E[?7h\\E[4i\\Ex\\E[25;1j\\"..., 4096) = 4096
        read(3, " key 16 corresponds to the right"..., 4096) = 4096
        read(3, "?, smso=\\E[7m,\n\tsmul=\\E[4m, tbc="..., 4096) = 4096
        read(3, "r0=\\E[0m, smso=\\E[7m, smul=\\E[4m"..., 4096) = 4096
        read(3, ", kclr=\\E[2J, kcub1=\\E[D, kcud1="..., 4096) = 4096
        read(3, ", kf32=\\EOS, kf33=\\EOw, kf34=\\EO"..., 4096) = 4096
        read(3, "what's going onm in the init str"..., 4096) = 4096
        read(3, "EOl, kf41=\\EOq, kf42=\\EOr,\n\tkf43"..., 4096) = 4096
        read(3, "s#24, use=att730r,\n\n# The follow"..., 4096) = 4096
        read(3, " line mode\n#                    "..., 4096) = 4096
        read(3, "ET version 1 24 lines,\n\tlines#24"..., 4096) = 4096
        brk(0x8d26000)                          = 0x8d26000
        read(3, "E+, cnorm=\\E.4, cub1=^H, cud1=^V"..., 4096) = 4096
        read(3, "e/LF is down one line, same colu"..., 4096) = 4096
        read(3, "nn arbor ambassador/24 lines+rev"..., 4096) = 4096
        read(3, "4;97;100p\\E8\\E[J, smcup=\\E[44p,\n"..., 4096) = 4096
        brk(0x8d47000)                          = 0x8d47000
        read(3, "s have bad ROMs that foo up on ^"..., 4096) = 4096
        read(3, " on a980, check internal switch "..., 4096) = 4096
        read(3, "r=\\E[%i%p1%d;%p2%dr, cub=\\E[%p1%"..., 4096) = 4096
        read(3, "%{32}%+%c,\n\tcuu1=^W, el=^K, home"..., 4096) = 4096
        read(3, " cuf=\\E[%p1%dC, cuf1=\\E[C,\n\tcup="..., 4096) = 4096
        read(3, "which the\n# terminal recognizes "..., 4096) = 4096
        read(3, "\n#\t\t\t\\177\\E$Q\\177\n#\t\t\\E[45;1u\t\ts"..., 4096) = 4096
        read(3, "e 'O' in kf43 to kf46 to a '$'.\n"..., 4096) = 4096
        read(3, "uals, but based on other ansi/vt"..., 4096) = 4096
        read(3, "e/no status line,\n\tflash=\\E[=205"..., 4096) = 4096
        brk(0x8d68000)                          = 0x8d68000
        read(3, ", kf35=\\233205z,\n\tkf36=\\233206z,"..., 4096) = 4096
        read(3, "%gD%t;2%;%?%gU%t;4%;%?%gB%t;5%;%"..., 4096) = 4096
        read(3, "\tcuu1=\\E[A, ed=\\E[J, el=\\E[K, ho"..., 4096) = 4096
        read(3, "p4%t5;%;%?%p2%p6%|%t4;%;%?%p1%p5"..., 4096) = 4096
        read(3, "5%{1}%e%{0}%;%PB%?%p2%p6%|%t;4%{"..., 4096) = 4096
        read(3, " smacs=^N, use=dgkeys+7b, use=d4"..., 4096) = 4096
        brk(0x8d89000)                          = 0x8d89000
        read(3, "ral D414/D464 in wide DG-UNIX mo"..., 4096) = 4096
        read(3, "7b-w|Data General DASHER D577 in"..., 4096) = 4096
        read(3, "ts/Char   0=7    1=8\n# \tCRT Save"..., 4096) = 4096
        read(3, ">, cr=^M, csr=\\E[%i%p1%d;%p2%dr,"..., 4096) = 4096
        brk(0x8daa000)                          = 0x8daa000
        read(3, "p@, is2@, kclr=^^, kdch1=\\EW, kd"..., 4096) = 4096
        read(3, "to phone conversation\n# with mfr"..., 4096) = 4096
        read(3, " description is tricky: being ab"..., 4096) = 4096
        read(3, "ame along with\n# Harris. They ha"..., 4096) = 4096
        read(3, "sert. That's in insert mode whil"..., 4096) = 4096
        read(3, "ge,\n\trmcup=\\E>B, s0ds=\\E>B, s1ds"..., 4096) = 4096
        read(3, "51,\n\tuse=ibm+color,\nibmega-c|ibm"..., 4096) = 4096
        brk(0x8dcb000)                          = 0x8dcb000
        read(3, "0K,\n\thome=\\E[H, hpa=\\E[%i%p1%dG,"..., 4096) = 4096
        read(3, ", cuf1=^Y, cuu1=^\\,\n\ted=^K, ind="..., 4096) = 4096
        read(3, "l mode only)\n#ESC N           se"..., 4096) = 4096
        read(3, "1 = 3  screen 4\n#ESC o p1 p2    "..., 4096) = 4096
        read(3, ",\n\tcuf1=\\E[C, cup=\\E[%i%p1%d;%p2"..., 4096) = 4096
        read(3, "me=^^,\n\tkich1=\\EQ, kil1=\\EE, tsl"..., 4096) = 4096
        read(3, "\n\tind=^J, kbs=^H, khome=^A, vpa="..., 4096) = 4096
        read(3, "rmir=\\E[4l, rmso=\\E[27m, rmul=\\E"..., 4096) = 4096
        brk(0x8dec000)                          = 0x8dec000
        read(3, "args on Sytek multiplexors.  No "..., 4096) = 4096
        read(3, "J,\n# This came from University o"..., 4096) = 4096
        read(3, "ng various attributes is not vit"..., 4096) = 4096
        read(3, "p1%d;%p2%dH$<30>,\n\tis2=\\E[!p\\E[?"..., 4096) = 4096
        read(3, "=\\E[10~, kf5=\\E[M, kf6=\\E[17~,\n\t"..., 4096) = 4096
        read(3, "p1%{15}%=%t%{56}%;\\Edy%c11$<100>"..., 4096) = 4096
        read(3, "r, msgr, xon,\n\tcols#80, lines#24"..., 4096) = 4096
        read(3, "0vt200an,\nncr160vt200pp|NCR 2900"..., 4096) = 4096
        brk(0x8e0d000)                          = 0x8e0d000
        read(3, "<==> Dim attribute parameter\n# F"..., 4096) = 4096
        read(3, "500,\n\nndr9500-25|NDR 9500 with 2"..., 4096) = 4096
        read(3, "cs=\\EF, smam=\\E[?7m, smso=\\E[7m,"..., 4096) = 4096
        read(3, "sc=, rmacs=\\E^O, smacs=\\E^N, use"..., 4096) = 4096
        read(3, " ht=^I,\n\til1=\\013\\035ili;, ind=^"..., 4096) = 4096
        read(3, "\tOTbs, OTpt, msgr, xon,\n\tOTkn#8,"..., 4096) = 4096
        read(3, "207 with sysline but no memory,\n"..., 4096) = 4096
        brk(0x8e2e000)                          = 0x8e2e000
        read(3, "=\\E[L, ind=^J, invis=\\E[8m, kbs="..., 4096) = 4096
        read(3, "0, it#8, lines#30, ncv#49, pairs"..., 4096) = 4096
        read(3, "olker-Craig (vc)\n#\n# If you saw "..., 4096) = 4096
        read(3, "II\n#\n# Apple II firmware console"..., 4096) = 4096
        read(3, ", eo, xt,\n\tcols#80, lines#24,\n\ta"..., 4096) = 4096
        read(3, ", bold=\\E[1m, clear=\\E[H\\E[2J, c"..., 4096) = 4096
        read(3, "st\n# applications.\n#\n# It provid"..., 4096) = 4096
        read(3, ",\n\tdsl=\\E]2;\\007, fsl=^G, tsl=\\E"..., 4096) = 4096
        brk(0x8e4f000)                          = 0x8e4f000
        read(3, "section of System Prefs to make "..., 4096) = 4096
        read(3, "7,\n\tkcub1=\\EOD, kcud1=\\EOB, kcuf"..., 4096) = 4096
        read(3, "win-128x40-m|Darwin PowerPC Cons"..., 4096) = 4096
        brk(0x8e70000)                          = 0x8e70000
        read(3, "which comes with all Ataris now\n"..., 4096) = 4096
        read(3, "cs=^O, rmcup=\\233?7h, rmso=\\2330"..., 4096) = 4096
        read(3, "%c%p2%{32}%+%c, cuu1=^K, dch1=\\E"..., 4096) = 4096
        read(3, "el=\\EK, home=\\EH, ht=^I, ind=^J,"..., 4096) = 4096
        read(3, "# From: Igor Tamitegama <igor@pp"..., 4096) = 4096
        read(3, "loned its parts, and the Blit wa"..., 4096) = 4096
        read(3, "1=\\E[A,\n\tdl1=\\E[M$<2*>, ed=\\E[J$"..., 4096) = 4096
        read(3, "c=\\E[2g,\n\ttsl=\\EPY99\\:98\\E\\\\\\E[0"..., 4096) = 4096
        brk(0x8e91000)                          = 0x8e91000
        read(3, "mns terminal,\n\tam, eo, eslok, hs"..., 4096) = 4096
        read(3, "\tcsi 6 3 ; 1 \" p\n#\tChar. and Lin"..., 4096) = 4096
        read(3, "3~,\n\tkf7=\\23324~, kf8=\\23325~, k"..., 4096) = 4096
        read(3, "7800 wide 72 lines,\n\tcols#132, l"..., 4096) = 4096
        read(3, "16\\0\\230\\0\\317\\025\\027\\030\\E\\004"..., 4096) = 4096
        read(3, "|decwriter IV,\n\tOTbs, am, hc, os"..., 4096) = 4096
        read(3, "[1C, cup=\\E[%i%p1%d;%p2%dH,\n\tcuu"..., 4096) = 4096
        brk(0x8eb2000)                          = 0x8eb2000
        read(3, "and changing it back to H19 mode"..., 4096) = 4096
        read(3, "E[0m, smacs=\\E(0,\n\tsmir=\\E[4h, s"..., 4096) = 4096
        read(3, "s personal computers long ago in"..., 4096) = 4096
        read(3, "Q, kf3=\\EOR, kf4=\\EOS, rc=\\E8, r"..., 4096) = 4096
        read(3, "cols#40, lines#24,\n\tclear=^L, cu"..., 4096) = 4096
        read(3, "^^F, smso=^^^V,\n\n#### Synertek\n#"..., 4096) = 4096
        read(3, "4,\n\tbel=^G, clear=^L, cr=^M, cub"..., 4096) = 4096
        read(3, "317~,\n\tkf10=\\23328~, kf11=\\23329"..., 4096) = 4096
        brk(0x8ed3000)                          = 0x8ed3000
        read(3, "34~, kf2=\\23318~, kf3=\\23319~, k"..., 4096) = 4096
        read(3, "his display while running X11.  "..., 4096) = 4096
        read(3, "f colors (as well as all\n# other"..., 4096) = 4096
        read(3, "uf1=\\EOC, kcuu1=\\EOA, kf1=\\EOP, "..., 4096) = 4096
        read(3, "d=\\Eh, ht=^I, hu=\\EH,\n\tind=^J,\na"..., 4096) = 4096
        read(3, "%t;1%;m$<2>,\n\tuse=vt100,\n# These"..., 4096) = 4096
        read(3, "als\n# (3221) cost about $1500 ea"..., 4096) = 4096
        read(3, "     Parameter   or\n# Mnemonic  "..., 4096) = 4096
        read(3, "         ^I                  -  "..., 4096) = 4096
        read(3, " Char. Spacing *    \\E [ Ps SPC "..., 4096) = 4096
        read(3, "ue.  ECMA-48 calls this \"Cursor "..., 4096) = 4096
        read(3, " = Editing Boundary Mode, 20 = L"..., 4096) = 4096
        read(3, ", DSR, ED, EL, HTS, HVP, IND,\n# "..., 4096) = 4096
        read(3, "rase in line\n#\tCSI <n>L\t(il)\tins"..., 4096) = 4096
        read(3, " invented to take advantage of t"..., 4096) = 4096
        read(3, "\n# making perfectly synchronized"..., 4096) = 4096
        read(3, "es removed.\n#\t* Small fixes merg"..., 4096) = 4096
        read(3, "* Added entry for QNX console.\n#"..., 4096) = 4096
        read(3, "ansi-m entry.\n#\t* Corrected ansi"..., 4096) = 4096
        read(3, "3:08 EST 1996):\n#\t* Another swee"..., 4096) = 4096
        read(3, "rious terminals.\n#\t* Sun entry c"..., 4096) = 4096
        read(3, "u9 to sun-il description\n# 10.1."..., 4096) = 4096
        read(3, "--------------------------------"..., 4096) = 4096
        read(3, " modify ncv to add 'dim' -TD\n#\t*"..., 4096) = 4096
        read(3, "pple_Terminal\" entries -TD\n#\t* m"..., 4096) = 4096
        read(3, "TD\n#\t* update xterm-new and xter"..., 4096) = 4096
        read(3, "(km sends ESC rather than settin"..., 4096) = 3348
        read(3, "", 4096)                       = 0
        brk(0x8ef4000)                          = 0x8ef4000
        brk(0x8f15000)                          = 0x8f15000
        brk(0x8f14000)                          = 0x8f14000
        brk(0x8f35000)                          = 0x8f35000
        brk(0x8f34000)                          = 0x8f34000
        brk(0x8f55000)                          = 0x8f55000
        brk(0x8f54000)                          = 0x8f54000

I've also run ltrace instead of strace and the following is output.  I
have *not* chopped off the end of the output (at 0x80495d0); that's all
that appears.

        + ltrace tic -x -s -o /home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo terminfo.tmp
        __libc_start_main(0x804b580, 6, 0xbff47ed4, 0x804f488, 0x804f480 <unfinished ...>
        _nc_rootname(0xbff497df, 0, 0, 0, 0)                                                                                        = 0xbff497df
        use_extended_names(0, 0, 0, 0, 0)                                                                                           = 1
        getopt(6, 0xbff47ed4, "0123456789CILNR:TUVace:fGgo:rstv"...)                                                                = 120
        __ctype_b_loc()                                                                                                             = 0xb7f21690
        use_extended_names(1, 0xbff47ed4, 0x804fe9c, 0, 0)                                                                          = 0
        getopt(6, 0xbff47ed4, "0123456789CILNR:TUVace:fGgo:rstv"...)                                                                = 115
        __ctype_b_loc()                                                                                                             = 0xb7f21690
        getopt(6, 0xbff47ed4, "0123456789CILNR:TUVace:fGgo:rstv"...)                                                                = 111
        __ctype_b_loc()                                                                                                             = 0xb7f21690
        getopt(6, 0xbff47ed4, "0123456789CILNR:TUVace:fGgo:rstv"...)                                                                = -1
        fopen64("terminfo.tmp", "r")                                                                                                = 0x8a65008
        fileno(0x8a65008)                                                                                                           = 3
        __fxstat64(3, 3, 0xbff45d1c)                                                                                                = 0
        _nc_set_source(0xbff49830, 0xbff47ed4, 0x804fe9c, 0, 0)                                                                     = 0xbff49830
        _nc_read_entry_source(0x8a65008, 0, 0, 0, 0x80495d0)                                                                        = 0x580364
        _nc_resolve_uses2(1, 0, 0, 0, 0x80495d0
