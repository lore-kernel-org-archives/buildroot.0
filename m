From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 10 Jun 2017 17:44:38 +0200
Subject: [Buildroot] How to generate initrd for booting rootfs with
	root=LABEL= in kernel command line
In-Reply-To: <A112705D-AEA2-495C-8717-A2FCC1142CBE@jens-maus.de>
References: <A112705D-AEA2-495C-8717-A2FCC1142CBE@jens-maus.de>
Message-ID: <DBE2C4B1-2318-490E-A4EF-85DE8A8C0F10@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jens,

> Am 08.06.2017 um 09:34 schrieb Jens Maus <mail@jens-maus.de>:
> 
> Hi,
> 
> I am currently working on a project that is using buildroot and generates system images (*.img) that a user should either be able to put on a SD card or on an external USB drive for booting. For convenience reasons I already modified my /etc/fstab and busybox setup within buildroot to mount the user partitions via ?LABEL=? statements so that a user doesn?t have to manually patch /etc/fstab himself in case he installs the *.img on a USB drive rather than on the SD card of, e.g. a RaspberryPi (/dev/sdaX vs. /dev/mmcblkpX). This already works flawlessly and quite smooth with my buildroot environment.
> 
> However, the only thing missing is to be able to actually boot the linux kernel with a command line where also ?root=LABEL=rootfs? is used rather than ?root=/dev/sdaX? or ?root=/dev/mmcblkpX? so that during boot up it identifies itself from where it should mount the root filesystem. This of course doesn?t work out-of-the-box since the linux kernel itself doesn?t seem to know anything about filesystem labels or how to query them. The only specifiers that can be directly used by the kernel (depending on the kernel version, of course) seems to be UUID= and PARTUUID= which both don?t seem to be solutions for my problem since these UUIDs are regenerated with every filesystem regeneration and PARTUUID is only available with a GUID partition table, which I don?t use. In addition, I even couldn?t get my test system with kernel 4.4.x properly booted with either UUID= or PARTUUID= specified.

I want to correct this statement.
PARTUUID is possible without GUID.
I have used this for the same use case for an embedded x86 board and grub in the past. (pc engines board)
The usage was automated in this script:
https://cgit.openadk.org/cgi/cgit/openadk.git/tree/scripts/install.sh

The script generates a MBR with a random NT signature, which is then passed to the kernel via root= with grub.

See the do_mount.c code in the kernel for this UUID use case.

It might work for Raspberry PI, but i didn't tried.

best regards
 Waldemar 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170610/d1c40cba/attachment.html>
