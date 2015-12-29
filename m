From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 29 Dec 2015 10:21:52 -0200
Subject: [Buildroot] [PATCH] pandaboard_defconfig: bump u-boot to
 2015.10 and kernel to 4.3
In-Reply-To: <20151227120631.78043b59@free-electrons.com>
References: <1450978394-822-1-git-send-email-sergio.prado@e-labworks.com>
 <20151227120631.78043b59@free-electrons.com>
Message-ID: <CANu7NGsP5K4268wtVMAcvUD+OaTxdEUvnV8aaoVqFhY1X-oOfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2015-12-27 9:06 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:
>
> Dear Sergio Prado,
>
> On Thu, 24 Dec 2015 15:33:14 -0200, Sergio Prado wrote:
> > VFPv3 and NEON was enabled and a readme.txt file was added.
> >
> > Fixes bug #7580.
> >
> > Tested on Pandaboard ES.
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
> Thanks a lot for this update. I have a number of comments, see below.
>
> > ---
> > diff --git a/board/pandaboard/readme.txt b/board/pandaboard/readme.txt
> > new file mode 100644
> > index 000000000000..7a0e1660c0cb
> > --- /dev/null
> > +++ b/board/pandaboard/readme.txt
> > @@ -0,0 +1,74 @@
> > +Pandaboard
> > +====================
>
> Nit: excess "=====" signs.

OK. I'll remove them.

>
> > +
> > +This file documents the Buildroot support for the Pandaboard, a
> > +low-power, low-cost single-board computer development platform based
> > +on the Texas Instruments OMAP4 system on a chip (SoC).
> > +
> > +
>
> One too many empty new line.

OK.

>
> > +Configuring and building Buildroot
> > +----------------------------------
> > +
> > +Start from the defconfig:
> > +
> > +  $ make pandaboard_defconfig
> > +
> > +You can edit build options the usual way:
> > +
> > +  $ make menuconfig
> > +
> > +When you are happy with the setup, run:
> > +
> > +  $ make
> > +
> > +The result of the build with the default settings should be these
files:
> > +
> > +  output/images
> > +  ??? MLO
> > +  ??? omap4-panda-a4.dtb
> > +  ??? omap4-panda.dtb
> > +  ??? omap4-panda-es.dtb
> > +  ??? rootfs.ext2
> > +  ??? u-boot.img
> > +  ??? zImage
> > +
> > +
>
> Ditto.

OK.

>
> > +Setting up your SD card
> > +-----------------------
> > +
> > +*Important*: pay attention which partition you are modifying so you
don't
> > +accidentally erase the wrong file system, e.g your host computer or
your
> > +external storage!
> > +
> > +In the default setup you need to create two partitions on your SD card:
> > +a boot partition and a rootfs partition.
> > +
> > +The sdcard needs to be formatted in an specific way. You can use the
> > +shell script below to format the sdcard (this script was extracted
> > +from http://elinux.org/Panda_How_to_MLO_%26_u-boot).
> > +
> > +#!/bin/sh
> > +if [ ! "$1" = "/dev/sda" ] ; then
>
> I think this check is silly. I know it is in the original script, but
> it is still silly.
>
> > +     DRIVE=$1
> > +     if [ -b "$DRIVE" ] ; then
> > +             dd if=/dev/zero of=$DRIVE bs=1024 count=1024
> > +             SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
> > +             echo DISK SIZE - $SIZE bytes
> > +             CYLINDERS=`echo $SIZE/255/63/512 | bc`
> > +             echo CYLINDERS - $CYLINDERS
> > +             {
> > +             echo ,9,0x0C,*
> > +             echo ,,,-
> > +             } | sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE
> > +             mkfs.vfat -F 32 -n "boot" ${DRIVE}1
> > +             mke2fs -j -L "rootfs" ${DRIVE}2
> > +     fi
> > +fi
>
> Could you instead replace this with a genimage configuration file ? You
> can look at the support for the following boards for examples:
>
> ./board/via/imx6_vab820/genimage.cfg
> ./board/intel/galileo/genimage.cfg
> ./board/wandboard/genimage.cfg

That was my first attempt, but it didn't work. The ROM code from OMAP
processors (and I think also Sitara processors) need the SD card to be
formatted with a special geometry in the partition table. That's the reason
of the script above. I did not find any option in the genimage tool to
configure thinks like sectors and cylinders. So I do not see an easy way to
generate a sdcard image in this case. What do you think?

>
> > diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
> > index 50c3714d84d9..53870b0e1f8d 100644
> > --- a/configs/pandaboard_defconfig
> > +++ b/configs/pandaboard_defconfig
> > @@ -1,39 +1,19 @@
> > -# Architecture
> >  BR2_arm=y
> >  BR2_cortex_a9=y
> > -
> > -# system
> > -BR2_TARGET_GENERIC_GETTY=y
> > +BR2_ARM_ENABLE_NEON=y
> > +BR2_ARM_FPU_VFPV3=y
> >  BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
> > -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
> > -
> > -# filesystem
> > -BR2_TARGET_ROOTFS_EXT2=y
> > -# BR2_TARGET_ROOTFS_TAR is not set
> > -
> > -# Lock to 3.12 headers to avoid breaking with newer kernels
> > -BR2_KERNEL_HEADERS_VERSION=y
> > -BR2_DEFAULT_KERNEL_VERSION="3.12.2"
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
>
> You need to keep something like this to lock the kernel headers version
> to a version matching the kernel version being used.

Right. My bad.

>
> > -
> > -# Kernel
> >  BR2_LINUX_KERNEL=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
>
> You also need to keep something like this to lock the kernel version
> being used. Right now, you're using the "latest" kernel, which is not
> what we want, as we want defconfigs to use a fixed kernel and
> bootloader version, which have been tested by the submitter of the
> defconfig.

OK.

>
> >  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
> > -BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
> > -BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
> > -BR2_LINUX_KERNEL_APPENDED_DTB=y
> > -BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> > -# might need omap4-panda or omap4-panda-a4 instead
> > -BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es"
> > -
> > -# Bootloaders
> > +BR2_LINUX_KERNEL_ZIMAGE=y
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es omap4-panda
omap4-panda-a4"
> > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > +BR2_TARGET_ROOTFS_EXT2=y
>
> In your report, you said that the failure was caused by the filesystem
> being ext2, but the bootloader trying to mount it as ext3. And now
> you're producing an ext2. Is it because the bootloader default kernel
> arguments have changed?

Yes, the old bootloader's default kernel arguments had a "rootfstype=ext3"
option, and the new one doesn't, so the kernel is able to find out and
mount any supported filesystem. I kept the ext2 format because most of the
boards use it. Is this the right approach, or should I change to ext4?

>
> > +# BR2_TARGET_ROOTFS_TAR is not set
> >  BR2_TARGET_UBOOT=y
>
> You also need to lock the bootloader version, like was done before.

Right.

>
> Could you rework those points and submit an updated version?

Sure. I'll just wait for your comments to send an updated version of the
patch.

>
> Thanks a lot!

Thanks!

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151229/86520f9f/attachment.html>
