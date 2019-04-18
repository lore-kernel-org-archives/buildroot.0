From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 18 Apr 2019 21:17:23 +0530
Subject: [Buildroot] [PATCH] board/friendlyarm: Add support fot RK3399
 NanoPi M4 board
In-Reply-To: <20190418153205.27040-1-shyam.saini@amarulasolutions.com>
References: <20190418153205.27040-1-shyam.saini@amarulasolutions.com>
Message-ID: <CAMty3ZAx1i06jTu0Y7LEpu3DmNL=ggJ_VmSw38A0ASLkv4oVgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 18, 2019 at 9:02 PM Shyam Saini
<shyam.saini@amarulasolutions.com> wrote:
>
> This initial support includes:
>         Custom u-boot
>         Linux v5.1-rc1
>         ATF v2.0
>         Buildroot default packages
>
> Mainline uboot does not automatically builds so one
> u-boot patch is add to fix this
>
> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
> ---
> Rk3399 soc based board uses python pyelftools library in uboot so it
> is mad as uboot dependency.
>
> This support is added on top of these two patches:
> [1] https://patchwork.ozlabs.org/patch/1087590/
> [2] https://patchwork.ozlabs.org/patch/1087591/
>
>
> Here are complete test boots logs for this support:
> https://paste.ubuntu.com/p/hYcwB5KqkR/
> ---
>  .gitlab-ci.yml                                     |  1 +
>  DEVELOPERS                                         |  4 ++
>  ...e-rk3328-needs-itb-image-to-boot-properly.patch | 32 ++++++++++++
>  board/friendlyarm/nanopi-m4/extlinux.conf          |  4 ++
>  board/friendlyarm/nanopi-m4/genimage.cfg           | 22 ++++++++
>  ...e-rk3328-needs-itb-image-to-boot-properly.patch | 13 +++++
>  board/friendlyarm/nanopi-m4/post-build.sh          |  8 +++
>  board/friendlyarm/nanopi-m4/readme.txt             | 45 +++++++++++++++++
>  configs/nanopi_m4_defconfig                        | 58 ++++++++++++++++++++++
>  9 files changed, 187 insertions(+)
>  create mode 100644 board/friendlyarm/nanopi-m4/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
>  create mode 100644 board/friendlyarm/nanopi-m4/extlinux.conf
>  create mode 100644 board/friendlyarm/nanopi-m4/genimage.cfg
>  create mode 100644 board/friendlyarm/nanopi-m4/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
>  create mode 100755 board/friendlyarm/nanopi-m4/post-build.sh
>  create mode 100644 board/friendlyarm/nanopi-m4/readme.txt
>  create mode 100644 configs/nanopi_m4_defconfig
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 02d6f6c0cc..0ac94059f9 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -175,6 +175,7 @@ mx6sx_udoo_neo_defconfig: { extends: .defconfig }
>  mx6udoo_defconfig: { extends: .defconfig }
>  nanopi_m1_defconfig: { extends: .defconfig }
>  nanopi_m1_plus_defconfig: { extends: .defconfig }
> +nanopi_m4_defconfig: {extends: .defconfig}
>  nanopi_neo_defconfig: { extends: .defconfig }
>  nexbox_a95x_defconfig: { extends: .defconfig }
>  nitrogen6sx_defconfig: { extends: .defconfig }
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f23479703b..c15333ab78 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2001,6 +2001,10 @@ F:       package/tunctl/
>  F:     package/ubus/
>  F:     package/wolfssl/
>
> +N:     Shyam Saini <shyam.saini@amarulasolutions.com>
> +F:     board/friendlyarm/nanopi-m4/
> +F:     configs/nanopi_m4_defconfig
> +
>  N:     Simon Dawson <spdawson@gmail.com>
>  F:     boot/at91bootstrap3/
>  F:     package/cppzmq/
> diff --git a/board/friendlyarm/nanopi-m4/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch b/board/friendlyarm/nanopi-m4/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
> new file mode 100644
> index 0000000000..2d35b78daa
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-m4/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
> @@ -0,0 +1,32 @@
> +From 211bf049084e6e374dac253138fa813682910146 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
> +Date: Tue, 5 Feb 2019 22:08:54 +0100
> +Subject: [PATCH] Makefile: rk3328 needs itb image to boot properly
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> +---
> + Makefile | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 8086f3c93e..a6425b5b03 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -799,6 +799,11 @@ ifneq ($(BUILD_ROM),)
> + ALL-$(CONFIG_X86_RESET_VECTOR) += u-boot.rom
> + endif
> +
> ++# rk3328 needs itb image to boot properly
> ++ifeq ($(CONFIG_ROCKCHIP_RK3328),y)
> ++ALL-y += u-boot.itb
> ++endif
> ++
> + # enable combined SPL/u-boot/dtb rules for tegra
> + ifeq ($(CONFIG_TEGRA)$(CONFIG_SPL),yy)
> + ALL-y += u-boot-tegra.bin u-boot-nodtb-tegra.bin
> +--
> +2.18.1
> +
> diff --git a/board/friendlyarm/nanopi-m4/extlinux.conf b/board/friendlyarm/nanopi-m4/extlinux.conf
> new file mode 100644
> index 0000000000..e5861cdcbe
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-m4/extlinux.conf
> @@ -0,0 +1,4 @@
> +label NanoPi M4 5.1-rc1
> +  kernel /boot/Image
> +  devicetree /boot/rk3399-nanopi-m4.dtb
> +  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p1 rootwait
> diff --git a/board/friendlyarm/nanopi-m4/genimage.cfg b/board/friendlyarm/nanopi-m4/genimage.cfg
> new file mode 100644
> index 0000000000..9c83ae425d
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-m4/genimage.cfg
> @@ -0,0 +1,22 @@
> +image sdcard.img {
> +       hdimage {
> +       }
> +
> +       partition u-boot-spl-dtb {
> +               in-partition-table = "no"
> +               image = "u-boot-spl-dtb.img"
> +               offset = 32K
> +       }
> +
> +       partition u-boot-dtb {
> +               in-partition-table = "no"
> +               image = "u-boot.itb"
> +               offset = 8M
> +               size = 30M
> +       }
> +
> +       partition rootfs {
> +               partition-type = 0x83
> +               image = "rootfs.ext4"
> +       }
> +}
> diff --git a/board/friendlyarm/nanopi-m4/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch b/board/friendlyarm/nanopi-m4/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
> new file mode 100644
> index 0000000000..ef363e0a96
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-m4/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch

Look like you didn't include this patch in config? add this and drop
the above patch from global.

> @@ -0,0 +1,13 @@
> +diff --git a/Kconfig b/Kconfig
> +index 5679a288ec..46f511123a 100644
> +--- a/Kconfig
> ++++ b/Kconfig
> +@@ -230,7 +230,7 @@ config BUILD_TARGET
> +       default "u-boot-with-spl.sfp" if TARGET_SOCFPGA_GEN5
> +       default "u-boot-spl.kwb" if ARCH_MVEBU && SPL
> +       default "u-boot-elf.srec" if RCAR_GEN3
> +-      default "u-boot.itb" if SPL_LOAD_FIT && ARCH_SUNXI
> ++      default "u-boot.itb" if SPL_LOAD_FIT && (ARCH_ROCKCHIP || ARCH_SUNXI)
> +       default "u-boot.kwb" if KIRKWOOD
> +       help
> +         Some SoCs need special image types (e.g. U-Boot binary
> diff --git a/board/friendlyarm/nanopi-m4/post-build.sh b/board/friendlyarm/nanopi-m4/post-build.sh
> new file mode 100755
> index 0000000000..9b0c4ecc83
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-m4/post-build.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +MKIMAGE=$HOST_DIR/bin/mkimage
> +BOARD_DIR="$(dirname $0)"
> +
> +$MKIMAGE -n rk3399 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
> +
> +install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
> diff --git a/board/friendlyarm/nanopi-m4/readme.txt b/board/friendlyarm/nanopi-m4/readme.txt
> new file mode 100644
> index 0000000000..734070a911
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-m4/readme.txt
> @@ -0,0 +1,45 @@
> +Intro
> +=====
> +
> +NanoPi M4 is a RK3399 SoC based ARM board.

Link official page from nanopi m4 as well.

> +
> +Wiki: https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/nanopi_m4.html
> +
> +Build
> +=====
> +
> +Run NanoPi M4 configuration
> +
> +  $ make nanopi_m4_defconfig
> +
> +To build, run make comamnd.
> +
> +  $ make
> +
> +Files created in output directory
> +=================================
> +output/images/
> +??? bl31.bin
> +??? Image
> +??? rk3399-nanopi-m4.dtb
> +??? rootfs.ext2
> +??? rootfs.ext4 -> rootfs.ext2
> +??? rootfs.tar
> +??? sdcard.img
> +??? u-boot.bin
> +??? u-boot.itb
> +??? u-boot-spl-dtb.bin
> +??? u-boot-spl-dtb.img
> +
> +Creating bootable SD card:
> +=========================
> +
> +Simply invoke (as root)
> +
> +  # dd if=output/images/sdcard.img of=/dev/sdX && sync
> +
> +Where X is your SD card device
> +
> +Serial console
> +--------------
> +Baudrate for this board is 1500000
> diff --git a/configs/nanopi_m4_defconfig b/configs/nanopi_m4_defconfig
> new file mode 100644
> index 0000000000..229bc01654
> --- /dev/null
> +++ b/configs/nanopi_m4_defconfig
> @@ -0,0 +1,58 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_cortex_a72_a53=y
> +
> +# Linux headers same as kernel, a 5.0 series
> +BR2_KERNEL_HEADERS_5_0=y
> +
> +#Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"

Better to use Mainline ATF [1]

[1] https://github.com/ARM-software/arm-trusted-firmware.git

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rockdev"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-m4-rk3399"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="v5.1-rc1"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-nanopi-m4"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +

remove space.

> +
> +# Filesystem
> +BR2_TARGET_GENERIC_HOSTNAME="NanoPi M4"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to NanoPi M4!"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-m4/genimage.cfg"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-m4/post-build.sh"
> +BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-m4/patches"
> +

here as well.
