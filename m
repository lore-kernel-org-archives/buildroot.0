From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Apr 2019 20:08:14 +0200
Subject: [Buildroot] Possible conflict with systemd and e2fsprogs?
In-Reply-To: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
References: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
Message-ID: <20190427180814.GB27252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-04-25 20:15 +0200, Dominik Menke spake thusly:
> Greetings,
> 
> I've run into trouble with the following configuration on Buildroot
> 2019.02.1-100-g88eff22a9e (current 2019.02.x branch):
> 
>     (
>       echo BR2_INIT_SYSTEMD=y
>       echo BR2_PACKAGE_E2FSPROGS=y
>     ) | cat configs/raspberrypi3_defconfig - > configs/myrpi_defconfig
>     make myrpi_defconfig

How can that even work, when systemd depends on glibc?

And indeed, here, systemd is not selected when I do the above
commands...

Regards,
Yann E. MORIN.

> The actual board is a RPi 3B+, and the resulting system fails badly on
> systemd-fsck-root.service (shortly after it found and mounted /dev/root):
> 
>     [FAILED] Failed to start File System Check on Root Device.
>     See 'systemctl status systemd-fsck-root.service' for details.
> 
> Some green OK's appear, but most succeeding services fail to start. It looks
> like mounting the root file system fails completely, and I don't get a
> prompt, which makes checking the status as suggested a bit hard.
> 
> (sidenote: I can't see the preceeding log messages, because the scroll
> buffer on /dev/tty1 is too small, setting enable_uart=1 in /boot/config.txt
> [0] doesn't give me a serial console, systemd.log_level and similar kernel
> command line parameters are ignored... the RPi is a fun device to play with
> :-))
> 
> I've build the exact system without BR2_PACKAGE_E2FSPROGS, and that system
> does boot without problems.
> 
> make menuconfig tells me
> 
>     Symbol: BR2_PACKAGE_E2FSPROGS_FSCK [=n]
>     Type  : bool
>     Prompt: fsck
>       Location: (omitted)
>       Defined at package/e2fsprogs/Config.in:45
>       Depends on: BR2_PACKAGE_E2FSPROGS [=y] &&
>                   !BR2_PACKAGE_UTIL_LINUX_FSCK [=y]
> 
> which (should) configure e2fsprogs with --disable-fsck [1]. However, that
> only means to not build the wrapper (i.e. /sbin/fsck) [2].
> 
> In comparing the two systems built, I've noticed that the one including
> e2fsprogs contains additional binaries /sbin/fsck.ext{2,3,4} which symlink
> to /sbin/e2fsck.
> 
> Looking at /usr/lib/systemd/systemd-fsck (which is executed by
> systemd-fsck-root.service), it calls to /sbin/fsck only if /sbin/fsck.$type
> exists [3]. My guess is that it then fails to proceed because e2fsprog's
> fsck behaves differently then fsck (of package util linux).
> 
> I can't really go without systemd (I'm building appliances deeply integrated
> with it), and I do need to be able to resize/enlarge a data partition on a
> live system; I'm not sure how to proceed from here. I mean, I could rm/mv
> the fsck.* binaries in a post-build hook, but are there (cleaner)
> approaches?
> 
> Thanks for your time,
> Dominik
> 
> 
> [0]: https://www.raspberrypi.org/documentation/configuration/uart.md
> [1]: https://git.busybox.net/buildroot/tree/package/e2fsprogs/e2fsprogs.mk?h=88eff22a9e#n42
> [2]: https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/configure?h=v1.44.5#n1554
> [3]: https://github.com/systemd/systemd/blob/v240/src/fsck/fsck.c#L343-L349
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
