From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 01:37:46 +0200
Subject: [Buildroot] [PATCH v4 7/7] beaglebone: adds barebox bootloader
	defconfig
In-Reply-To: <1458513351-6556-8-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-8-git-send-email-pieter@boesman.nl>
Message-ID: <5702FACA.6080001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/16 23:35, Pieter Smith wrote:
> * Builds the barebox MLO and bootloader.
> * Generates a barebox environment that boots from eMMC by default.
> * Barebox integrates a perfectly good device-tree for the bbb, so no dtb is
>    being generated with the kernel.
>
> Signed-off-by: Pieter Smith <pieter@boesman.nl>
> ---
>   board/beaglebone/barebox.env/boot/sd      |  6 +++++
>   board/beaglebone/barebox.env/config-board |  4 +++
>   configs/beaglebone_barebox_defconfig      | 41 +++++++++++++++++++++++++++++++
>   3 files changed, 51 insertions(+)
>   create mode 100644 board/beaglebone/barebox.env/boot/sd
>   create mode 100644 board/beaglebone/barebox.env/config-board
>   create mode 100644 configs/beaglebone_barebox_defconfig
>
> diff --git a/board/beaglebone/barebox.env/boot/sd b/board/beaglebone/barebox.env/boot/sd
> new file mode 100644
> index 0000000..7a80e29
> --- /dev/null
> +++ b/board/beaglebone/barebox.env/boot/sd
> @@ -0,0 +1,6 @@
> +#!/bin/sh

  Is that needed/useful?

> +
> +global.bootm.image=/boot/zImage
> +#global.bootm.oftree=/boot/oftree

  Maybe repeat here the comment about using the built-in DT.

> +#global.bootm.initrd=<path to initrd>

  I would remove this line, it's not very useful.

> +global.linux.bootargs.dyn.root="root=/dev/mmcblk0p2 rootfstype=ext2 rootwait"
> diff --git a/board/beaglebone/barebox.env/config-board b/board/beaglebone/barebox.env/config-board
> new file mode 100644
> index 0000000..cd7b26d
> --- /dev/null
> +++ b/board/beaglebone/barebox.env/config-board
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +global.boot.default=sd
> +
> diff --git a/configs/beaglebone_barebox_defconfig b/configs/beaglebone_barebox_defconfig
> new file mode 100644
> index 0000000..6324dbf
> --- /dev/null
> +++ b/configs/beaglebone_barebox_defconfig
> @@ -0,0 +1,41 @@
> +# architecture
> +BR2_arm=y
> +BR2_cortex_a8=y
> +BR2_ARM_EABIHF=y
> +
> +# system
> +BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"

  Does the default (console) not work well?

> +# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set

  Why?

> +# BR2_ROOTFS_POST_IMAGE_SCRIPT is not set

  This is the default. However, it would be nice if you could add a genimage 
script. Pandaboard should be a good basis.

> +
> +# filesystem
> +BR2_PACKAGE_AM33X_CM3=y
> +BR2_TARGET_ROOTFS_EXT2=y

  We tend to prefer ext4 nowadays.

> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Linux headers same as kernel, a 4.4 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y

  The version should be really locked down, i.e.:

BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.6"

> +
> +# bootloader
> +BR2_TARGET_BAREBOX=y
> +BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="am335x"
> +BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE="barebox-am33xx-beaglebone.img"
> +BR2_TARGET_BAREBOX_CUSTOM_ENV=y
> +BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH="board/beaglebone/barebox.env"
> +BR2_TARGET_BAREBOX_2=y
> +BR2_TARGET_BAREBOX_2_BOARD_DEFCONFIG="am335x_mlo"
> +BR2_TARGET_BAREBOX_2_BUILT_IMAGE_FILE="barebox-am33xx-beaglebone-mlo.img"
> +BR2_TARGET_BAREBOX_2_OUTPUT_IMAGE_FILE="MLO"
> +
> +# kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.6"

  Maybe you can switch to 4.5 already?

> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> +BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +
> +# Use the barebox built-in dtb
> +# BR2_LINUX_KERNEL_DTS_SUPPORT is not set

  Good to put this here!

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
