From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 11 Apr 2016 21:46:27 -0300
Subject: [Buildroot] [PATCH 1/1] configs/toradex_apalis_imx6_defconfig:
	new board
In-Reply-To: <1450265472-18428-1-git-send-email-sergio.prado@e-labworks.com>
References: <1450265472-18428-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <CANu7NGtTDXSbbRo1k2JF0eaKJ7NgWAQo5ScSOq99x87NpQ6_ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Just a gentle reminder of this patch. Is it ready to be applied?

Best regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-12-16 9:31 GMT-02:00 Sergio Prado <sergio.prado@e-labworks.com>:

> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  board/toradex/apalis-imx6/genimage.cfg  | 15 ++++++++++
>  board/toradex/apalis-imx6/post-image.sh | 20 +++++++++++++
>  board/toradex/apalis-imx6/readme.txt    | 50
> +++++++++++++++++++++++++++++++++
>  board/toradex/apalis-imx6/uEnv.txt      |  6 ++++
>  configs/toradex_apalis_imx6_defconfig   | 26 +++++++++++++++++
>  5 files changed, 117 insertions(+)
>  create mode 100644 board/toradex/apalis-imx6/genimage.cfg
>  create mode 100755 board/toradex/apalis-imx6/post-image.sh
>  create mode 100644 board/toradex/apalis-imx6/readme.txt
>  create mode 100644 board/toradex/apalis-imx6/uEnv.txt
>  create mode 100644 configs/toradex_apalis_imx6_defconfig
>
> diff --git a/board/toradex/apalis-imx6/genimage.cfg
> b/board/toradex/apalis-imx6/genimage.cfg
> new file mode 100644
> index 000000000000..3458dc4f09fa
> --- /dev/null
> +++ b/board/toradex/apalis-imx6/genimage.cfg
> @@ -0,0 +1,15 @@
> +# Minimal SD card image for the Toradex Apalis i.MX6 COM
> +#
> +# It does not need a boot section for a bootloader since it is
> +# booted from its internal flash memory (eMMC).
> +
> +image sdcard.img {
> +  hdimage {
> +  }
> +
> +  partition rootfs {
> +    partition-type = 0x83
> +    image = "rootfs.ext2"
> +    size = 512M
> +  }
> +}
> diff --git a/board/toradex/apalis-imx6/post-image.sh
> b/board/toradex/apalis-imx6/post-image.sh
> new file mode 100755
> index 000000000000..c547049e4fdf
> --- /dev/null
> +++ b/board/toradex/apalis-imx6/post-image.sh
> @@ -0,0 +1,20 @@
> +#!/usr/bin/env bash
> +
> +GENIMAGE_CFG="board/toradex/apalis-imx6/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +# copy the uEnv.txt to the output/images directory
> +cp board/toradex/apalis-imx6/uEnv.txt $BINARIES_DIR/uEnv.txt
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +# generate rootfs.img
> +genimage \
> +  --rootpath "${TARGET_DIR}" \
> +  --tmppath "${GENIMAGE_TMP}" \
> +  --inputpath "${BINARIES_DIR}" \
> +  --outputpath "${BINARIES_DIR}" \
> +  --config "${GENIMAGE_CFG}"
> +
> +RET=${?}
> +exit ${RET}
> diff --git a/board/toradex/apalis-imx6/readme.txt
> b/board/toradex/apalis-imx6/readme.txt
> new file mode 100644
> index 000000000000..1367a469160b
> --- /dev/null
> +++ b/board/toradex/apalis-imx6/readme.txt
> @@ -0,0 +1,50 @@
> +Toradex Apalis i.MX6 Computer on Module
> +
> +Intro
> +=====
> +
> +The Apalis iMX6 is a small form-factor Computer on Module that comes in
> +both quad core and dual core versions based on Freescale i.MX6Q and
> +Freescale i.MX6D SoCs respectively. The Cortex A9 quad core and dual
> +core CPU peaks at 1 GHz for commercial temperature variant, while the
> +industrial temperature variant has a peak frequency of 800 MHz.
> +
> +
> https://www.toradex.com/computer-on-modules/apalis-arm-family/freescale-imx-6
> +
> +It supports two carrier boards:
> +
> +Apalis Evaluation Board
> +https://www.toradex.com/products/carrier-boards/apalis-evaluation-board
> +
> +Ixora Carrier Board
> +https://www.toradex.com/products/carrier-boards/ixora-carrier-board
> +
> +How to build it
> +===============
> +
> +Configure Buildroot:
> +
> +    $ make toradex_apalis_imx6_defconfig
> +
> +Compile everything and build the rootfs image:
> +
> +    $ make
> +
> +How to boot the image
> +========================
> +
> +The board only boots from its internal flash memory eMMC, so the
> +bootloader image should be copied to it, following the procedures
> +described in Toradex website.
> +
> +
> http://developer.toradex.com/knowledge-base/flashing-linux-on-imx6-modules
> +
> +Buildroot prepares a "sdcard.img" in output/images/ with the kernel
> +image, device trees and a root filesystem, ready to be dumped on an
> +SD card.
> +
> +    $ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
> +
> +To boot from the SD card, you should change U-Boot environment. For
> +convenience, a default environment "uEnv.txt" is provided in
> +output/images/.
> diff --git a/board/toradex/apalis-imx6/uEnv.txt
> b/board/toradex/apalis-imx6/uEnv.txt
> new file mode 100644
> index 000000000000..96ab80cfb6fa
> --- /dev/null
> +++ b/board/toradex/apalis-imx6/uEnv.txt
> @@ -0,0 +1,6 @@
> +boot_file=zImage
> +fdt_file=imx6q-apalis_v1_0-ixora.dtb
> +sdargs=ip=off root=/dev/mmcblk1p1 rw,noatime rootfstype=ext4 rootwait
> +sddtbload=ext2load mmc 2:1 ${fdt_addr_r} boot/${fdt_file}
> +sdkernelload=ext2load mmc 2:1 ${kernel_addr_r} boot/${boot_file}
> +bootcmd=run setup; setenv bootargs ${defargs} ${sdargs} ${setupargs}
> ${vidargs}; echo Booting from SD card...; run sddtbload; run sdkernelload;
> bootz ${kernel_addr_r} - ${fdt_addr_r}
> diff --git a/configs/toradex_apalis_imx6_defconfig
> b/configs/toradex_apalis_imx6_defconfig
> new file mode 100644
> index 000000000000..1700fbd42036
> --- /dev/null
> +++ b/configs/toradex_apalis_imx6_defconfig
> @@ -0,0 +1,26 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_FPU_VFPV3=y
> +BR2_KERNEL_HEADERS_3_14=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/toradex/apalis-imx6/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git
> "
>
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8f237ebe42f2cb911245369276a6b3043c2815f2"
> +BR2_LINUX_KERNEL_DEFCONFIG="apalis_imx6"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-apalis-eval imx6q-apalis-ixora
> imx6q-apalis_v1_0-eval imx6q-apalis_v1_0-ixora"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://
> git.toradex.com/u-boot-toradex.git"
>
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1ef4a29e8cea0239411dde64f9617ad76248fd02"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="apalis_imx6"
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.imx"
> +BR2_PACKAGE_HOST_GENIMAGE=y
> --
> 1.9.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160411/3f9b0753/attachment.html>
