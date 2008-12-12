From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Fri, 12 Dec 2008 14:44:13 +0100
Subject: [Buildroot] dropbear & openssh transfers are limited to about
 800k !?
In-Reply-To: <49411ED2.1060601@gin.de>
References: <4940C961.7080602@gin.de> <87ljunkojx.fsf@macbook.be.48ers.dk>
	<4940EDF4.7040400@gin.de> <49410D22.1010206@cetrtapot.si>
	<49411ED2.1060601@gin.de>
Message-ID: <49426AAD.7030308@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas Kuehn wrote:
> 
> First, scp (sftp) segfaults in both directions.
> 
>  - getting a file from the host to the box ends at 880KB
>  - putting a file from the box to the host ends at 992KB
> 
> 
>  1. Here is the debug output of "scp user at host:gimp.ps ."
> Right in the middle you see a "segmentation fault"
> 

I would suggest to run the segfaulting process under
gdb(server) and backtrace when segfault occurs. You'll
probably need to rebuild uClibc and busybox with
debugging symbols.

...
> 
> read(7, "-!s8W-!s8W-!s8W-!s8W-!s8N\'!zz!!*"..., 4096) = 4096
> write(3, "-!s8W-!s8W-!s8W-!s8W-!s8N\'!zz!!*"..., 4096) = 4096
> read(7, "W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-"..., 4096) = 4096
> write(3, "W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-"..., 4096) = 4096
> read(7, "/\\;FNo=3&s;b3C6/$S=5uJs8W-!s8W-!"..., 4096) = 4096
> write(3, "/\\;FNo=3&s;b3C6/$S=5uJs8W-!s8W-!"..., 4096) = 4096
> --- SIGALRM (Alarm clock) @ 0 (0) ---
> getpgrp()                               = 884
> ioctl(1, TIOCGPGRP, [884])              = 0
> time(NULL)                              = 6388
> gimp.ps                                         8%  324KB 324.0KB/s
> 00:01    ) = 80
> --- SIGSEGV (Segmentation fault) @ 0 (0) ---
> +++ killed by SIGSEGV +++
> 

Segfault at 0, hmm, and in first second. Maybe time(NULL)
is the culprit here. Another thing - can you verify that
segfault occurs at the first second (eg. when time(NULL)
is first called), or does it happen on random elapsed time?

IIRC, latest buildroot uses uclibc-0.9.30, do early
versions work, try uClibc-0.9.29 perhaps?

HTH,
Hinko

-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si
