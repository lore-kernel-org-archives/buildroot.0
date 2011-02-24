From: Williams, Michael (mwilli60) <mwilli60@harris.com>
Date: Thu, 24 Feb 2011 10:15:29 -0500
Subject: [Buildroot] Unable to login to buildroot
In-Reply-To: <201102241516.22825.dargaud@lpsc.in2p3.fr>
References: <201102241048.48537.dargaud@lpsc.in2p3.fr><201102241359.42509.dargaud@lpsc.in2p3.fr><4D665ADD.10608@daccii.it>
	<201102241516.22825.dargaud@lpsc.in2p3.fr>
Message-ID: <818976D2341E8345BAE1673D4C4C4D88017C0D5E@mlbe2k10.cs.myharris.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Guillaume Dargaud
> Sent: Thursday, February 24, 2011 9:16 AM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Unable to login to buildroot
> 
> > There isn't any reason that these folders for containing something
> > because proc, sysfs, devpts and tmpfs (generally used on /tmp) are
> > virtual filesystems handled by the kernel ... there isn't anything
> > written on the disk.
> 
> OK, I suspected as much...
> 
> > If you didn't see anything it means that init get executed but the
> > console isn't started on the serial port.
> > Do a simply test: set as init, on boot options, /bin/ls (for
> example),
> > just to see if something is showed on the serial console after the
> boot.
> 
> I'm not sure I understand.
> sbin/init is already a symbolic link to bin/busybox. Should I make
that
> a
> symbolic link to ls ?
> 
> If I add the following to inittab:
> ::wait:/bin/ls -alF / /tmp
> 
> I get:
> ...
> [   33.070279] Freeing unused kernel memory: 108k init
> /:
> total 52
> drwxr-xr-x   16 root     root          4096 Feb 24  2011 ./
> drwxr-xr-x   16 root     root          4096 Feb 24  2011 ../
> drwxr-xr-x    2 root     root          4096 Feb 24  2011 bin/
> drwxr-xr-x    6 root     root          4096 Feb 24  2011 dev/
> drwxr-xr-x    7 root     root          4096 Feb 24  2011 etc/
> drwxr-xr-x    3 root     root          4096 Feb 24  2011 home/
> drwxr-xr-x    2 root     root          4096 Feb 24  2011 lib/
> lrwxrwxrwx    1 root     root            11 Feb 24  2011 linuxrc ->
> bin/busybox*
> drwxr-xr-x    2 root     root          4096 Feb 24  2011 mnt/
> drwxr-xr-x    2 root     root          4096 Feb 24  2011 opt/
> dr-xr-xr-x   26 root     root             0 Jan  1 00:00 proc/
> drwxr-xr-x    2 root     root          4096 Feb 24  2011 root/
> drwxr-xr-x    2 root     root          4096 Feb 24  2011 sbin/
> drwxr-xr-x   11 root     root             0 Jan  1 00:00 sys/
> drwxrwxrwt    2 root     root            80 Jan  1 00:00 tmp/
> drwxr-xr-x    6 root     root          4096 Feb 24  2011 usr/
> drwxr-xr-x    3 root     root          4096 Feb 14  2011 var/
> 
> /tmp:
> total 4
> drwxrwxrwt    2 root     root            80 Jan  1 00:00 ./
> drwxr-xr-x   16 root     root          4096 Feb 24  2011 ../
> -rw-r--r--    1 root     root             0 Jan  1 00:00 messages
> -rw-r--r--    1 root     root             0 Jan  1 00:00 utmp
> 
> Welcome to the Gandalf acquisition
> gandalf login: root
> Password:
> Jan  1 00:00:57 login[255]: root login on 'ttyUL0'
> 
> Welcome to the Gandalf acquisition
> gandalf login:
> 
> And still can't login.
> And if it's only a tty problem, why is rcS not launched ?

Just a heads up, I fought with a similar problem with bizarre,
inconsistent results running programs from init, with the same symptoms
from sysv init as busybox's. Have you tried tracing using
::respawn:-strace /bin/sh in inittab? In my case, everything worked
perfectly on 2.6.38-rc5, but failed on kernel 2.6.24.

In the end, it turned out to be a floating-point support configuration
mismatch between buildroot and my old kernel (2.6.24). After changing
everything to a soft FPU on the old kernel and the buildroot toolchain,
it all worked.


> 
> > If something get showed, it means that, with high probability, the
> only
> > problem is that getty isn't started on the right console. Have you
> tried
> > to start getty on ttyUL1? Can be that ttyUL0 is used for something
> else
> > on the board (but really, i don't know).
> 
> That doesn't display anything after "Freeing unused kernel memory"
> --
> Guillaume Dargaud
> http://www.gdargaud.net/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
