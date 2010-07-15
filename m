From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 15 Jul 2010 17:52:14 +0100
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <AANLkTiknnWawF0mRHGu73MxCCuAcGpYWxK-i-uaUKXub@mail.gmail.com>
References: <1279123755.7058.242.camel@cabbage.rehill.info>
	<4C3E102D.50105@zacarias.com.ar>
	<1279192188.6184.2.camel@dubciaranr1.verifone.com>
	<AANLkTinsUwFgYEaRhtAwzO2I5Y2frnUunmtzBKTSveF9@mail.gmail.com>
	<1279202763.3572.22.camel@dubciaranr1.verifone.com>
	<AANLkTiks30hgwzuxxsGuxSPsP2iO1S7b1avRHCV9JllD@mail.gmail.com>
	<1279205058.3572.29.camel@dubciaranr1.verifone.com>
	<AANLkTiknnWawF0mRHGu73MxCCuAcGpYWxK-i-uaUKXub@mail.gmail.com>
Message-ID: <1279212734.3572.42.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar Aoine, 2010-07-16 ag 02:33 +1000, scr?obh Mitch Davis:
> On Fri, Jul 16, 2010 at 12:44 AM, Quotient Remainder
> <quotientvremainder@gmail.com> wrote:
> >
> >> If you run this from the command line (ie, not via buildroot), what
> >> happens?  Does it still hang?
> >
> > Yes, same result.
> 
> Good.  Now what happens if you run tic manually from the command line
> under gdb?  If you wait until it hangs, then press ^C, then run "bt"
> in gdb, what happens?  (You may like to install debug info for tic.
> In Fedora, I'd do this:
> 

Unfortunately I don't have root on this machine so debug symbols are not
available.

        $ gdb tic
        GNU gdb Fedora (6.8-37.el5)
        Copyright (C) 2008 Free Software Foundation, Inc.
        License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
        This is free software: you are free to change and redistribute it.
        There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
        and "show warranty" for details.
        This GDB was configured as "i386-redhat-linux-gnu"...
        (no debugging symbols found)
        (gdb) run -x -s -o /home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo terminfo.tmp
        Starting program: /usr/bin/tic -x -s -o /home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo terminfo.tmp
        (no debugging symbols found)
        (no debugging symbols found)
        (no debugging symbols found)
        (no debugging symbols found)
        (no debugging symbols found)
        
        Program received signal SIGINT, Interrupt.
        0x0055c6e3 in ?? () from /usr/lib/libncursesw.so.5
        (gdb) bt
        #0  0x0055c6e3 in ?? () from /usr/lib/libncursesw.so.5
        #1  0x0055cd72 in ?? () from /usr/lib/libncursesw.so.5
        #2  0x0055d2e5 in _nc_align_termtype () from /usr/lib/libncursesw.so.5
        #3  0x0055bcb6 in _nc_merge_entry () from /usr/lib/libncursesw.so.5
        #4  0x0056061a in _nc_resolve_uses2 () from /usr/lib/libncursesw.so.5
        #5  0x0804b913 in ?? ()
        #6  0x0039fe9c in __libc_start_main () from /lib/libc.so.6
        #7  0x08049541 in ?? ()

If I run it again, I stop it in a slightly different place, naturally
enough but it's always in somewhere called from _nc_align_termtype().

        #0  0x0055c6cd in ?? () from /usr/lib/libncursesw.so.5
        #1  0x0055cd1e in ?? () from /usr/lib/libncursesw.so.5
        #2  0x0055d2e5 in _nc_align_termtype () from /usr/lib/libncursesw.so.5
        ...
