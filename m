From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 20:55:37 +0200
Subject: [Buildroot] [PATCH 2/2] board/sifive: add support for the
 HiFive Unleashed board
In-Reply-To: <20190414134307.24754-2-mark.corbin@embecosm.com>
References: <20190414134307.24754-1-mark.corbin@embecosm.com>
 <20190414134307.24754-2-mark.corbin@embecosm.com>
Message-ID: <7261729c-385b-8dd1-e969-72f95c9ac0be@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/04/2019 15:43, Mark Corbin wrote:
> This patch adds support for the SiFive HiFive Unleashed board and
> generates a system that attempts to closely match the output
> produced by the Freedom Unleashed Software Development Kit
> (sifive/freedom-u-sdk repository) release v1_0.
> 
> The kernel patch has been generated from the Linux 4.19 tree of
> the sifive/riscv-linux repository (commit id
> 20eeb6522e3302c5f6e435c0bdba40ff57ffa41a).
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  ...es-for-SiFive-HiFive-Unleashed-board.patch | 3704 +++++++++++++++++

 Yikes. Why not just download the tarball from github, like we do for so many
other boards? E.g. imx8mpico does that as well.

> diff --git a/board/sifive/u540-unleashed/linux.config.fragment b/board/sifive/u540-unleashed/linux.config.fragment
> new file mode 100644
> index 0000000000..c73a3d3cc3
> --- /dev/null
> +++ b/board/sifive/u540-unleashed/linux.config.fragment
> @@ -0,0 +1,652 @@
> +CONFIG_AFS_FS=m
> +CONFIG_AF_RXRPC=m
> +CONFIG_AUTOFS4_FS=m
> +CONFIG_AUTOFS_FS=m

 If you're going to give a config fragment, make it a minimal fragment. There is
something to be said for turning off drivers that you don't need, maybe, but
definitely don't go and enable random filesystems etc.

[snip]
> +CONFIG_EXTRA_FIRMWARE="radeon/BTC_rlc.bin radeon/CAICOS_mc.bin radeon/CAICOS_me.bin radeon/CAICOS_pfp.bin radeon/CAICOS_smc.bin radeon/SUMO_uvd.bin"

 This might be a relevant one, but do we really need all of them?


> +CONFIG_HZ=100

 Huh? This is a blind option, how does it even end up in a config fragment?

> +CONFIG_SERIAL_SIFIVE=y

 This might be one you want to keep, and maybe a few others as well...

> diff --git a/board/sifive/u540-unleashed/post-image.sh b/board/sifive/u540-unleashed/post-image.sh
> new file mode 100755
> index 0000000000..c8e5682626
> --- /dev/null
> +++ b/board/sifive/u540-unleashed/post-image.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +# When using a CPIO initramfs image as part of the kernel we
> +# need to rebuild the riscv-pk (bbl) bootloader again after the
> +# kernel has been rebuilt with the rootfs image.

 Yes that's annoying. But why do we use a linked-in cpio, and not the usual ext4
on SD card?

> +
> +make riscv-pk-rebuild
> +
> +exit $?
> diff --git a/board/sifive/u540-unleashed/readme.txt b/board/sifive/u540-unleashed/readme.txt
> new file mode 100644
> index 0000000000..3b2f42ca91
> --- /dev/null
> +++ b/board/sifive/u540-unleashed/readme.txt
> @@ -0,0 +1,91 @@
> +SiFive HiFive Unleashed
> +=======================
> +
> +This file describes how to use the pre-defined Buildroot
> +configuration for the SiFive HiFive Unleashed board.
> +
> +Further information about the HiFive Unleashed board can be found
> +at https://www.sifive.com/boards/hifive-unleashed
> +
> +Introduction
> +============
> +
> +The default board configuration (and these instructions) have
> +been created to match the system produced by the Freedom Unleashed
> +Software Development Kit as closely as possible. This is based on
> +the freedom-u-sdk v1_0 release that can be found at
> +https://github.com/sifive/freedom-u-sdk/tree/v1_0
> +
> +Building
> +========
> +
> +Configure Buildroot using the default board configuration:
> +
> +  $ make sifive_u540_unleashed_defconfig

 Why is it u540 instead of hifive?

> +
> +Customise the build as necessary:
> +
> +  $ make menuconfig
> +
> +Start the build:
> +
> +  $ make
> +
> +Result of the build
> +===================
> +
> +Once the build has finished you will have the following files:
> +
> +    output/images/
> +    +-- bbl
> +    +-- bbl.bin
> +    +-- rootfs.cpio
> +    +-- rootfs.cpio.gz
> +    +-- rootfs.tar
> +    +-- vmlinux
> +    
> +
> +Creating a bootable SD card
> +===========================
> +
> +At the current time the genimage utility (v10) used by Buildroot
> +does not support GPT partitions which are required by the HiFive
> +Unleashed FSBL. This means that a bootable SD card must be created
> +manually using the instructions below.

 You can still do that from a post-image script. Cfr. pc_x86_64_efi_defconfig
and board/pc/post-image-efi-gpt.sh.

> +
> +Create the partitions on the SD card:
> +
> +  $ sudo sgdisk --clear \
> +        --new=1:2048:67583  \
> +        --change-name=1:bootloader \
> +        --typecode=1:2E54B353-1271-4842-806F-E436D6AF6985 \
> +        --new=2:264192: \
> +        --change-name=2:root \
> +        --typecode=2:0FC63DAF-8483-4772-8E79-3D69D8477DE4 \
> +        /dev/mmcblk0
> +
> +The first partition will contain the kernel and the combined rootfs
> +ram disk image (bbl.bin). The second partition is just an empty
> +Linux filesystem that can be used to expand or replace the initramfs
> +image in the kernel.
> +
> +Copy the kernel and combined rootfs image to the SD card:
> +
> +  $ sudo dd if=output/images/bbl.bin of=/dev/mmcblk0p1 bs=4096
> +
> +Create an empty ext3 filesystem on the second partition:
> +
> +  $ sudo mkfs.ext3 /dev/mmcblk0p2
> +
> +Make sure that the all DIP switches are set to the off position for
> +default boot mode (MSEL mode = 1111), insert the SD card and power
> +up the board.
> +
> +Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).

 How do you know it is ttyUSB1? It is usually USB0...

> +
> +See the 'SiFive HiFive Unleashed Getting Started Guide' for
> +more details (https://www.sifive.com/documentation).
> +
> +--
> +
> +Mark Corbin <mark.corbin@embecosm.com> April 2019
> diff --git a/configs/sifive_u540_unleashed_defconfig b/configs/sifive_u540_unleashed_defconfig
> new file mode 100644
> index 0000000000..b56ae1b164
> --- /dev/null
> +++ b/configs/sifive_u540_unleashed_defconfig
> @@ -0,0 +1,29 @@
> +# Architecture
> +BR2_riscv=y
> +BR2_RISCV_64=y
> +
> +# Patches
> +BR2_GLOBAL_PATCH_DIR="board/sifive/patches"
> +
> +# Linux headers same as kernel, a 4.20 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
> +
> +# System
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sifive/u540-unleashed/post-image.sh"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.20.17"

 Oh, now I see, you're porting the changes done by sifive from 4.19 to 4.20...
Is that also what the freedom-u-sdk does? I don't think so...

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/u540-unleashed/linux.config.fragment"
> +BR2_LINUX_KERNEL_VMLINUX=y
> +#BR2_LINUX_KERNEL_IMAGE=y

 Don't leave commented-out things in there.

> +
> +# Bootloader
> +BR2_TARGET_RISCV_PK=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_CPIO_GZIP=y

 It doesn't make sense to compress the cpio, because it's the uncompressed one
that gets linked into the kernel.

 And setting ROOTFS_CPIO explicitly is not needed, it's selected by INITRAMFS.

 Regards,
 Arnout

> +BR2_TARGET_ROOTFS_INITRAMFS=y
> 
