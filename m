From: Sebastian <bastisoft@arcor.de>
Date: Tue, 08 Apr 2008 12:02:58 +0200
Subject: [Buildroot] Creating a bootable filesystem image?
In-Reply-To: <326f33790804071158h125bc8c3n9701bf1774ce5611@mail.gmail.com>
References: <326f33790804071158h125bc8c3n9701bf1774ce5611@mail.gmail.com>
Message-ID: <47FB42D2.7040905@arcor.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arun,

 > My question is, does anyone know if there is a way to configure 
buildroot to make rootfs.i386.ext2 bootable? Please note that I disabled 
RAMDISK in the > kernel .config before compiling buildroot because I 
don't need to use one.

This is because rootfs.i386.ext2 is only a file system image, not a hard 
disk image. It is missing the boot sector of the disk, which contains 
the Master Boot Record and the partition table. The BIOS on i386 does 
only execute the first sector on the disk (the MBR code) which usually 
only boots from the active partition. So you need a bootloader, as the 
kernel itself is not able to be loaded this way.

Like John said, you can use GRUB. But if you only want to boot a ext2 
partition, you can easily get away with Extlinux. It is a syslinux 
derivate with support for ext2 (and ext3) instead of FAT. It installs 
only into the partition (not into the master boot record), which means 
you should be fine by creating and activating the partition containing 
your ext2 image.

The changes in scripts/build-ext3-img references ext3 only while 
creating the file system. So you only need to change that if you want to 
use grub.

Best regards,
Sebastian
