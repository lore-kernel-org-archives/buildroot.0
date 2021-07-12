From: David Laight <David.Laight@ACULAB.COM>
Date: Mon, 12 Jul 2021 08:51:48 +0000
Subject: [Buildroot] Installing the 'correct' version of grub
Message-ID: <94b53517cabf4a1084e7594ae4652d4a@AcuMS.aculab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to sort out how to get the correct version of grub
installed onto production (x86) system disks.

(I'm currently using the previous release - not the one from last month)

So I need to give someone else the files required to install grub.

Ideally I'd like the 'target' system grub binaries that buildroot
generates to be installed.

But I suspect our procedures are likely to install whichever version
of grub happens to be on the system the disk is actually built on.
While this generates a bootable system, it isn't ideal.

Now I do know what the x86 boot sequence involves.
(I fixed NetBSDs version a few years back.)
But grub2 is entirely too complicated and then hides all the
necessary complication - making it difficult to work out what
is actually happening.

What I'd like to do is populate the /boot filesystem with the
required files (which seems to be a lot!) and then run the
command to initialise the mbr and pbr sectors
(actually sector 0 and the first 8k of the partition.)
But grub-install seems to want to copy everything into /boot.

Now I've set BR2_TARGET_GRUB2_INSTALL_TOOLS to get all the
grub2 'bits' into my root filesystem (an easy way to get then
into the image I give production).
If I mount that filesystem and pass '-d /mnt/root/lib/grub/i396-pc'
I get an unbootable disk (resets instead of showing grub menu).

I also can't actually run grub-install when I boot the disk.
It wants some files that are (IIRC) usually in /use/share.
(There is no requirement for this to work.)

There is also the practical problem of the version of grub-install
to use.
The 'host' version that buildroot generates is likely to on
whatever system 'production' use - so I can arrange for that
to be used rather than the host's own copy.

Does anyone know if grub-install ends up writing a sector
list into the pbr?
The NetBSD versions all managed to read the filesystem in order
to load /boot (even the FAT one which has to fit in a single
sector rather than the 8k that most filesystems reserve for the
boot code).

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
