From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Aug 2017 22:23:28 +0200
Subject: [Buildroot] [PATCH 1/1] configs/toradex_colibri_imx6_defconfig:
 new board
In-Reply-To: <20170825155659.8819-1-munoz0raul@gmail.com>
References: <20170825155659.8819-1-munoz0raul@gmail.com>
Message-ID: <f606ad4b-5db8-1120-0841-d13ba91632e3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Raul,

On 25-08-17 17:56, Raul Munoz wrote:
> Add support to Colibri i.MX6 Toradex module.
> 
> Based on commit e7127d25c56b9af237366dac79e3b4a67b306fa4,
> since the module works pretty much the same as Apalis iMX6.

 Since they are so similar, perhaps you can reuse the board files and merge the
readme? Rename apalis-imx6 to just imx6 (in a separate patch), and then refer to
that from the new colibri_defconfig.

> 
> Signed-off-by: Raul Munoz <munoz0raul@gmail.com>
> ---
>  board/toradex/colibri-imx6/genimage.cfg  | 15 ++++++++
>  board/toradex/colibri-imx6/post-image.sh | 20 +++++++++++
>  board/toradex/colibri-imx6/readme.txt    | 59 ++++++++++++++++++++++++++++++++
>  board/toradex/colibri-imx6/uEnv.txt      |  7 ++++
>  configs/toradex_colibri_imx6_defconfig   | 25 ++++++++++++++
>  5 files changed, 126 insertions(+)
>  create mode 100644 board/toradex/colibri-imx6/genimage.cfg
>  create mode 100755 board/toradex/colibri-imx6/post-image.sh
>  create mode 100644 board/toradex/colibri-imx6/readme.txt
>  create mode 100644 board/toradex/colibri-imx6/uEnv.txt
>  create mode 100644 configs/toradex_colibri_imx6_defconfig
> 
> diff --git a/board/toradex/colibri-imx6/genimage.cfg b/board/toradex/colibri-imx6/genimage.cfg
> new file mode 100644
> index 0000000..fe359bd
> --- /dev/null
> +++ b/board/toradex/colibri-imx6/genimage.cfg
> @@ -0,0 +1,15 @@
> +# Minimal SD card image for the Toradex Apalis i.MX6 COM
                                           ^^^^^^ Ahem...

> +#
> +# It does not need a boot section for a bootloader since it is booted
> +# from its internal flash memory (eMMC).

 Is this also true for the Colibri, that you can't boot from SD card? If you can
use the bootloader from the SD card (e.g. by setting a DIP switch or jumper),
then we really prefer that. Of course, in that case, you probably *don't* want
to merge the Apalis and Colibri directories.


> +
> +image sdcard.img {
> +  hdimage {
> +  }
> +
> +  partition rootfs {
> +    partition-type = 0x83
> +    image = "rootfs.ext2"
> +    size = 512M

 Is this useful? The ext2 image size is only 60M, so you're not going to be able
to use those 512M anyway... And if you resize the rootfs on the fly, you can
just as well repartition it. But it's much easier to not specify a size and let
genimage figure it out based on the size of the rootfs.ext2 image.

 If you *do* specify a size, you should also take one which is significantly
smaller than a power of 2, so that it actually fits on an SD card of 512M.
Remember that a so-called 512 megabyte SD card is in fact only 510 megabyte or
so, and that the 512M means 512 Mibibyte which is quite a bit larger. That's why
our default rootfs.ext2 size is 60M and not 64M.

 *However*, I think in this case using genimage is not needed. Indeed, there is
no reason to have a partition table, instead you can write the image straight to
SD card and boot with root=/dev/mmcblk1. That way, using the full SD card is
just a simple resize2fs away.

> +  }
> +}
> diff --git a/board/toradex/colibri-imx6/post-image.sh b/board/toradex/colibri-imx6/post-image.sh
> new file mode 100755
> index 0000000..b95e175
> --- /dev/null
> +++ b/board/toradex/colibri-imx6/post-image.sh
> @@ -0,0 +1,20 @@
> +#!/usr/bin/env bash

 Don't use bash if you don't use bashisms, just use /bin/sh.

> +
> +GENIMAGE_CFG="$(dirname $0)/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +# copy the uEnv.txt to the output/images directory
> +cp board/toradex/colibri-imx6/uEnv.txt $BINARIES_DIR/uEnv.txt

 I don't think this makes a lot of sense. Instead, throw it in /boot on the
target together with the rest of the boot stuff. And while you're at it, also
copy u-boot.img and SPL in there, so they are available after you boot from the
SD card. Right now we're saying that the boot loader can be written to eMMC, but
the boot loader isn't even present on the SD card...

 In fact, it would be nice if we would have an option
BR2_TARGET_UBOOT_INSTALL_TARGET like we have for the kernel...


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

 Instead of open-coding this, call support/scripts/genimage.sh directly as a
POST_IMAGE_SCRIPT. See e.g. configs/engicam_imx6qdl_icore_defconfig.

> +
> +RET=${?}
> +exit ${RET}

 The exit code of a script is the exit code of the last run command, so these
two lines are useless.

> diff --git a/board/toradex/colibri-imx6/readme.txt b/board/toradex/colibri-imx6/readme.txt
> new file mode 100644
> index 0000000..f73d9f8
> --- /dev/null
> +++ b/board/toradex/colibri-imx6/readme.txt
> @@ -0,0 +1,59 @@
> +Toradex Colibri i.MX6 Computer on Module
> +
> +Intro
> +=====
> +
> +The Colibri iMX6 is a small form-factor Computer on Module that comes
> +in both quad core and dual core versions based on Freescale i.MX6Q and
                                                     ^^^^^^^^^NXP
 (and a year from now that's going to have to change again, but OK :-)

> +Freescale i.MX6D SoCs respectively. The Cortex A9 quad core and dual
   ^^^^^^^^^NXP

> +core CPU peaks at 1 GHz for commercial temperature variant, while the
> +industrial temperature variant has a peak frequency of 800 MHz.
> +
> +https://www.toradex.com/computer-on-modules/colibri-arm-family/nxp-freescale-imx6
> +
> +It supports two carrier boards:

 Two? You list four below...

> +
> +Colibri Evaluation Board
> +https://www.toradex.com/products/carrier-board/colibri-evaluation-carrier-board
> +
> +Iris Carrier Board
> +https://www.toradex.com/products/carrier-board/iris-carrier-board
> +
> +Aster Carrier Board
> +https://www.toradex.com/products/carrier-boards/aster-carrier-board
> +
> +Viola Carrier Board
> +https://www.toradex.com/products/carrier-board/viola-carrier-board
> +
> +How to build it
> +===============
> +
> +Configure Buildroot:
> +
> +    $ make toradex_colibri_imx6_defconfig
> +
> +Compile everything and build the rootfs image:
> +
> +    $ make
> +
> +How to boot the image
> +=====================
> +
> +The board only boots from its internal flash memory eMMC, so the
> +bootloader image should be copied to it, following the procedures
> +described in Toradex website.
> +
> +http://developer.toradex.com/knowledge-base/flashing-linux-on-imx6-modules

 Put this paragraph at the end of the section, so that this section follows the
logical flow of the steps people have to take (first boot from eMMC with the SD
card, then write U-Boot).

> +
> +Buildroot prepares a "sdcard.img" in output/images/ with the kernel
> +image, device tree and a root filesystem, ready to be dumped on an SD
> +card.
> +
> +    $ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
> +
> +To boot from the SD card, you should change the U-Boot
> +environment. Since U-Boot is running from internal eMMC, you will need
> +to access its command line prompt and manually set the necessary
> +variables to boot from the external SD card. For convenience, you can
> +use uEnv.txt provided in output/images/ as a reference to create the
> +necessary U-Boot variables to boot from the SD card.
> diff --git a/board/toradex/colibri-imx6/uEnv.txt b/board/toradex/colibri-imx6/uEnv.txt
> new file mode 100644
> index 0000000..4c28507
> --- /dev/null
> +++ b/board/toradex/colibri-imx6/uEnv.txt
> @@ -0,0 +1,7 @@
> +boot_file 'zImage'
> +fdt_file 'imx6dl-colibri-eval-v3.dtb'

 Put a comment above this saying to change it to the dtb corresponding to your
carrier board.

> +sdargs 'ip=off root=/dev/mmcblk1p1 rw,noatime rootfstype=ext4 rootwait'
> +sddtbload 'ext4load mmc 1:1 ${fdt_addr_r} boot/${fdt_file}'
> +sdkernelload 'ext4load mmc 1:1 ${kernel_addr_r} boot/${boot_file}'
> +bootcmd 'run setup; bootargs ${defargs} ${sdargs} ${setupargs} ${vidargs}; echo Booting from SD card...; run sddtbload; run sdkernelload; bootz ${kernel_addr_r} - ${fdt_addr_r}'
> +
> diff --git a/configs/toradex_colibri_imx6_defconfig b/configs/toradex_colibri_imx6_defconfig
> new file mode 100644
> index 0000000..b5d1965
> --- /dev/null
> +++ b/configs/toradex_colibri_imx6_defconfig
> @@ -0,0 +1,25 @@
> +BR2_arm=y
> +BR2_cortex_a9=y

 All mx6 have neon and FPU, so add

BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_FPU_VFPV3=y


> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/toradex/colibri-imx6/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3f68dc7c600c0354f5df7f06b931661319addafb"
> +BR2_LINUX_KERNEL_DEFCONFIG="colibri_imx6"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-colibri-aster imx6dl-colibri-cam-eval-v3 imx6dl-colibri-eval-v3"

 You mention four carrier boards, but only 3 are listed here. In fact, it looks
like iris and viola are missing, or is cam == iris?

 Also, you mention that the board has a quad-core option but only have dl device
trees.

> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.toradex.com/u-boot-toradex.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="f0e414972b5b225e33ebe75574562266116746f9"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="colibri_imx6"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +BR2_PACKAGE_HOST_GENIMAGE=y

 Our in-tree defconfig files are sometimes read by humans as a way to understand
how Buildroot or a particular board works. Therefore, it is nice to reorder
things in a logical order and add some comments. See
configs/engicam_imx6qdl_icore_defconfig again for an example.


 Sorry that I'm giving you so much work :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
