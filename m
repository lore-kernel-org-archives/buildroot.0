From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Sep 2015 00:08:52 +0200
Subject: [Buildroot] [PATCH v3] board: add support for Intel Galileo Gen
 2
In-Reply-To: <1440157889.2902.23.camel@intel.com>
References: <1440157889.2902.23.camel@intel.com>
Message-ID: <20150902000852.2892cf9d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ray,

Thanks again for your contribution, definitely great to see Intel
Galileo support coming in Buildroot! See my comments below.

On Fri, 21 Aug 2015 11:51:31 +0000, Kinsella, Ray wrote:

> diff --git a/board/intel/galileo/S10mdev b/board/intel/galileo/S10mdev
> new file mode 100644
> index 0000000..4f6756b
> --- /dev/null
> +++ b/board/intel/galileo/S10mdev
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +#
> +# Start mdev....
> +#
> +
> +case "$1" in
> +  start)
> +    echo "Starting mdev..."
> +    echo /sbin/mdev >/proc/sys/kernel/hotplug
> +    echo "Triggering pci hotplug events"
> +    cd /sys/devices/pci0000:00
> +    find . -name uevent -exec /sbin/force_hotplug {} \;
> +    /sbin/mdev -s

Do we really need a custom mdev script? Could you explain why we need
this pci0000:00 magic compared to the default script?

> diff --git a/board/intel/galileo/create-boot-sd.sh b/board/intel/galileo/create-boot-sd.sh
> new file mode 100755
> index 0000000..93a8bbd
> --- /dev/null
> +++ b/board/intel/galileo/create-boot-sd.sh

Ultimately, it would be good to try to use genimage to directly
generate a SD card image. Though for the time being, a shell script is
good enough.

> diff --git a/board/intel/galileo/force_hotplug b/board/intel/galileo/force_hotplug
> new file mode 100755
> index 0000000..d19ea00
> --- /dev/null
> +++ b/board/intel/galileo/force_hotplug
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +echo add > $1

Maybe a rootfs overlay would be nicer, so that all those files get
copied properly without the need for a post-build script.

> diff --git a/board/intel/galileo/grub.cfg b/board/intel/galileo/grub.cfg
> new file mode 100644
> index 0000000..bf9e354
> --- /dev/null
> +++ b/board/intel/galileo/grub.cfg
> @@ -0,0 +1,14 @@
> +set default="0"
> +set timeout="1"
> +
> +#assumes that dos partition table is being used.
> +#assumes linux is on the second partion of the sdcard

Nit: capital letter + space after #.

> +
> +menuentry "Buildroot" {
> +    #Grub2 supports fat/ext2, its safe to put the kernel on the Linux parition
> +    #set root tells grub to seach the 2nd partition for the bzImage

Ditto, space after #.
its -> it's.
parition -> partition
seach -> search

> +    set root=(hd0,msdos2)
> +
> +    #Set Linux to boot from the 2nd partition, SD/MMC support is baked into the kernel
> +    linux /boot/bzImage root=/dev/mmcblk0p2 console=ttyS1,115200n8 reboot=efi,warm apic=debug rw
> +}
> diff --git a/board/intel/galileo/linux-3.8.config b/board/intel/galileo/linux-3.8.config
> new file mode 100644
> index 0000000..41d569d
> --- /dev/null
> +++ b/board/intel/galileo/linux-3.8.config
> @@ -0,0 +1,3067 @@
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Linux/i386 3.8.7 Kernel Configuration
> +#

This file is way too long. Please use make linux-savedefconfig to
generate a minimal defconfig instead.


> diff --git a/board/intel/galileo/mdev.conf b/board/intel/galileo/mdev.conf
> new file mode 100644
> index 0000000..f13b7b6
> --- /dev/null
> +++ b/board/intel/galileo/mdev.conf
> @@ -0,0 +1,38 @@
> +# null may already exist; therefore ownership has to be changed with command
> +null		root:root 666 @chmod 666 $MDEV
> +zero		root:root 666
> +full		root:root 666
> +random		root:root 444
> +urandom		root:root 444
> +hwrandom	root:root 444
> +grsec		root:root 660
> +
> +kmem		root:root 640
> +mem		root:root 640
> +port		root:root 640
> +# console may already exist; therefore ownership has to be changed with command
> +console		root:tty 600 @chmod 600 $MDEV
> +ptmx		root:tty 666
> +pty.*		root:tty 660
> +
> +# Typical devices
> +tty		root:tty 666
> +tty[0-9]*	root:tty 660
> +vcsa*[0-9]*	root:tty 660
> +ttyS[0-9]*	root:root 660
> +
> +# alsa sound devices
> +pcm.*		root:audio 660 =snd/
> +control.*	root:audio 660 =snd/
> +midi.*		root:audio 660 =snd/
> +seq		root:audio 660 =snd/
> +timer		root:audio 660 =snd/
> +
> +# input stuff
> +event[0-9]+	root:root 640 =input/
> +mice		root:root 640 =input/
> +mouse[0-9]	root:root 640 =input/
> +ts[0-9]		root:root 600 =input/
> +
> +#load modules
> +$MODALIAS=.* 0:0 660 @modprobe "$MODALIAS"

Why do we need a custom mdev.conf file here? Is it just because of the
module loading thing? If that's the case, then I'm wondering if we
shouldn't do that by default.

> diff --git a/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch b/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch
> new file mode 100644
> index 0000000..7814ae4
> --- /dev/null
> +++ b/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch

This patch requires a description + Signed-off-by line, as explained in
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

I remember we discussed this issue, but I don't remember the
conclusion. Is this issue going to be fixed upstream? I vaguely
remember that there was a gcc command line option to omit the lock
prefix, but you did not use that for some reason. Could you explain
that in the patch ?

> @@ -0,0 +1,11 @@
> +--- a/gas/config/tc-i386.orig	2015-07-24 15:54:51.359080778 +0100
> ++++ b/gas/config/tc-i386.c	2015-07-24 15:54:59.692192247 +0100
> +@@ -545,7 +545,7 @@ static int allow_index_reg = 0;
> + 
> + /* 1 if the assembler should ignore LOCK prefix, even if it was
> +    specified explicitly.  */
> +-static int omit_lock_prefix = 0;
> ++static int omit_lock_prefix = 1;
> + 
> + static enum check_kind
> +   {
> diff --git a/board/intel/galileo/post-build.sh b/board/intel/galileo/post-build.sh
> new file mode 100755
> index 0000000..e90f646
> --- /dev/null
> +++ b/board/intel/galileo/post-build.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +cp board/intel/galileo/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
> +cp board/intel/galileo/S10mdev ${TARGET_DIR}/etc/init.d/S10mdev
> +cp board/intel/galileo/force_hotplug ${TARGET_DIR}/sbin/force_hotplug
> +cp board/intel/galileo/mdev.conf ${TARGET_DIR}/etc/mdev.conf

The last three lines would no longer be needed with a rootfs overlay.

> diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
> new file mode 100644
> index 0000000..40d4079
> --- /dev/null
> +++ b/configs/galileo_defconfig
> @@ -0,0 +1,18 @@
> +BR2_GLOBAL_PATCH_DIR="board/intel/galileo/patches"
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="3.8"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
> +BR2_BINUTILS_VERSION_2_25_X=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
> +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/galileo/post-build.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mdr78/Linux-3.8.7-galileo.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d1a51d55dc67022be6c2d15163ce6dd28540042f"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.8.config"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_GRUB2=y
> +BR2_TARGET_GRUB2_I386_EFI=y

This defconfig looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
