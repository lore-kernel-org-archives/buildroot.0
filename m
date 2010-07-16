From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 16 Jul 2010 10:25:06 +0100
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <AANLkTikfJUKA0Y1Wv8iJ2Wa8w4IspA5wY-WkhBmkWueV@mail.gmail.com>
References: <1279123755.7058.242.camel@cabbage.rehill.info>
	<4C3E102D.50105@zacarias.com.ar>
	<1279192188.6184.2.camel@dubciaranr1.verifone.com>
	<AANLkTinsUwFgYEaRhtAwzO2I5Y2frnUunmtzBKTSveF9@mail.gmail.com>
	<1279202763.3572.22.camel@dubciaranr1.verifone.com>
	<AANLkTiks30hgwzuxxsGuxSPsP2iO1S7b1avRHCV9JllD@mail.gmail.com>
	<1279205058.3572.29.camel@dubciaranr1.verifone.com>
	<AANLkTiknnWawF0mRHGu73MxCCuAcGpYWxK-i-uaUKXub@mail.gmail.com>
	<1279212734.3572.42.camel@dubciaranr1.verifone.com>
	<AANLkTikfJUKA0Y1Wv8iJ2Wa8w4IspA5wY-WkhBmkWueV@mail.gmail.com>
Message-ID: <1279272306.3572.93.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar Aoine, 2010-07-16 ag 11:28 +1000, scr?obh Mitch Davis:
> If you're keen you can grab the debug RPM and use rpm2cpio to extract
> the contents, then point gdb at it.  It would be nice to know the line
> of code at 0x0055d2e5...
> 
        $ gdb
        ...
        (gdb) set debug-file-directory /home/qvr/debuginfo/fs/usr/lib/debug
        (gdb) file /usr/bin/tic
        Reading symbols from /usr/bin/tic...Reading symbols from /home/qvr/debuginfo/fs/usr/lib/debug/usr/bin/tic.debug...done.
        done.
        (gdb) run -x -s -o /home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo terminfo.tmp
        Starting program: /usr/bin/tic -x -s -o /home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo terminfo.tmp
        
        Program received signal SIGINT, Interrupt.
        adjust_cancels (to=<value optimized out>, from=<value optimized out>) at ../../ncurses/tinfo/alloc_ttype.c:351
        351	../../ncurses/tinfo/alloc_ttype.c: No such file or directory.
        	in ../../ncurses/tinfo/alloc_ttype.c
        (gdb) bt
        #0  adjust_cancels (to=<value optimized out>, from=<value optimized out>) at ../../ncurses/tinfo/alloc_ttype.c:351
        #1  0x0055d2e5 in _nc_align_termtype (to=<value optimized out>, from=<value optimized out>) at ../../ncurses/tinfo/alloc_ttype.c:415
        #2  0x0055bcb6 in _nc_merge_entry (to=<value optimized out>, from=<value optimized out>) at ../../ncurses/tinfo/alloc_entry.c:239
        #3  0x0056061a in _nc_resolve_uses2 (fullresolve=<value optimized out>, literal=<value optimized out>) at ../../ncurses/tinfo/comp_parse.c:398
        #4  0x0804b913 in main (argc=6, argv=0xbfb073f4) at ../../progs/tic.c:692

And on for a second run:

        (gdb) bt
        #0  _nc_find_ext_name (tp=<value optimized out>, name=<value optimized out>, token_type=<value optimized out>) at ../../ncurses/tinfo/alloc_ttype.c:205
        #1  0x0055cd72 in adjust_cancels (to=<value optimized out>, from=<value optimized out>) at ../../ncurses/tinfo/alloc_ttype.c:359
        #2  0x0055d2e5 in _nc_align_termtype (to=<value optimized out>, from=<value optimized out>) at ../../ncurses/tinfo/alloc_ttype.c:415
        #3  0x0055bcb6 in _nc_merge_entry (to=<value optimized out>, from=<value optimized out>) at ../../ncurses/tinfo/alloc_entry.c:239
        #4  0x0056061a in _nc_resolve_uses2 (fullresolve=<value optimized out>, literal=<value optimized out>) at ../../ncurses/tinfo/comp_parse.c:398
        #5  0x0804b913 in main (argc=6, argv=0xbfe6d554) at ../../progs/tic.c:692
