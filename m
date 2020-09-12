From: Andreas Ziegler <br015@umbiko.net>
Date: Sat, 12 Sep 2020 06:58:25 +0200
Subject: [Buildroot] How do I create a compressed buildroot system image
 that expands to fill the available storage of the media it is flashed to?
In-Reply-To: <mailman.2604.1599383993.89434.buildroot@busybox.net>
References: <mailman.2604.1599383993.89434.buildroot@busybox.net>
Message-ID: <1eaca7a09f8213f5ccb8b778adb024ac@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Noah,

> Hi!  I need to make a Buildroot system for various x86_64 EFI systems 
> with
> varying storage sizes, but unfortunately, the pc_x86_64_efi_defconfig
> config creates an IMG file with a fixed partition size, not one that
> expands to the full size of the media it is flashed to. If I want it to
> fill the various drives, I need to manually specify the size of each 
> drive
> in the filesystem config, and then recompile, which is a major pain and
> ends up making a massive 128GB+ image file. I tried causing it to 
> resize
> from within the running system using resize2fs, but that did not work.
> Ideally, I would like it to either expand to the full size of the drive
> when it is flashed or to have it resize when it first boots. Is this
> possible, or is it outside the limits of Buildroot?

You could use parted to increase the partition size, afterwards 
resize2fs to extend the file system. The partition must not be in use.

The "self-expansion" mechanism observed in some distributions uses a 
script early during boot.

This is how Raspian handles the resize: 
https://salsa.debian.org/raspi-team/image-specs/-/blob/master/rootfs/usr/sbin/rpi-resizerootfs

Before systemd, this used to be wrapped in a link in init.d which was 
deleted after successful execution; now the logic is contained in the 
systemd configuration.

Regards,
Andreas
