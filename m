From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 14:00:51 +0200
Subject: [Buildroot] [PATCH 7/7] configs/radxa_rock_pi4: remove defconfig
In-Reply-To: <20190829120051.22415-1-thomas.petazzoni@bootlin.com>
References: <20190829120051.22415-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190829120051.22415-8-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig tries to build an ARM Trusted Firmware version that
needs an ARM32 toolchain, which is not available as the platform is an
ARM64 one. The correct solution for this is to have a package in
Buildroot for an ARM32 bare-metal toolchain, but this wasn't done in
time for the 2019.08 release.

In order to not release 2019.08 with a broken defconfig, let's remove
it. It can be re-added later once the ARM32 bare-metal toolchain
problem has been resolved.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/278489410

Cc: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                     |  1 -
 DEVELOPERS                         |  2 --
 board/radxa/rock-pi4/extlinux.conf |  4 ---
 board/radxa/rock-pi4/genimage.cfg  | 22 ------------
 board/radxa/rock-pi4/post-build.sh |  9 -----
 board/radxa/rock-pi4/readme.txt    | 51 ----------------------------
 configs/radxa_rock_pi4_defconfig   | 54 ------------------------------
 7 files changed, 143 deletions(-)
 delete mode 100644 board/radxa/rock-pi4/extlinux.conf
 delete mode 100644 board/radxa/rock-pi4/genimage.cfg
 delete mode 100755 board/radxa/rock-pi4/post-build.sh
 delete mode 100644 board/radxa/rock-pi4/readme.txt
 delete mode 100644 configs/radxa_rock_pi4_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 85dfe95376..5d42d2a606 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -286,7 +286,6 @@ qemu_x86_64_defconfig: { extends: .defconfig }
 qemu_x86_defconfig: { extends: .defconfig }
 qemu_xtensa_lx60_defconfig: { extends: .defconfig }
 qemu_xtensa_lx60_nommu_defconfig: { extends: .defconfig }
-radxa_rock_pi4_defconfig: { extends: .defconfig }
 raspberrypi0_defconfig: { extends: .defconfig }
 raspberrypi0w_defconfig: { extends: .defconfig }
 raspberrypi2_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 15994ceb2d..3df21a78e6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2095,9 +2095,7 @@ F:	package/wolfssl/
 
 N:	Shyam Saini <shyam.saini@amarulasolutions.com>
 F:	board/olimex/a33_olinuxino/
-F:	board/radxa/rock-pi4/
 F:	configs/olimex_a33_olinuxino_defconfig
-F:	configs/radxa_rock_pi4_defconfig
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/board/radxa/rock-pi4/extlinux.conf b/board/radxa/rock-pi4/extlinux.conf
deleted file mode 100644
index f939cf5c56..0000000000
--- a/board/radxa/rock-pi4/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label Radxa Rock pi4 linux
-  kernel /boot/Image
-  devicetree /boot/rk3399-rock-pi-4.dtb
-  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk0p1 rootwait
diff --git a/board/radxa/rock-pi4/genimage.cfg b/board/radxa/rock-pi4/genimage.cfg
deleted file mode 100644
index b8c1cd5220..0000000000
--- a/board/radxa/rock-pi4/genimage.cfg
+++ /dev/null
@@ -1,22 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot-tpl-spl-dtb {
-		in-partition-table = "no"
-		image = "u-boot-tpl-spl-dtb.img"
-		offset = 32K
-	}
-
-	partition u-boot-dtb {
-		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 8M
-		size = 30M
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/radxa/rock-pi4/post-build.sh b/board/radxa/rock-pi4/post-build.sh
deleted file mode 100755
index e852ba6adf..0000000000
--- a/board/radxa/rock-pi4/post-build.sh
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-MKIMAGE=$HOST_DIR/bin/mkimage
-BOARD_DIR="$(dirname $0)"
-
-$MKIMAGE -n rk3399 -T rksd -d $BINARIES_DIR/u-boot-tpl-dtb.bin $BINARIES_DIR/u-boot-tpl-dtb.img
-cat $BINARIES_DIR/u-boot-tpl-dtb.img $BINARIES_DIR/u-boot-spl-dtb.bin > $BINARIES_DIR/u-boot-tpl-spl-dtb.img
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/radxa/rock-pi4/readme.txt b/board/radxa/rock-pi4/readme.txt
deleted file mode 100644
index a6c8f10e3c..0000000000
--- a/board/radxa/rock-pi4/readme.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-Intro
-=====
-
-Radxa Rock Pi4 is a RK3399 SoC based ARM64 board.
-
-Wiki: https://wiki.radxa.com/Rockpi4
-
-Build
-=====
-
-Run Rock Pi 4 configuration
-
-  $ make radxa_rock_pi4_defconfig
-
-To build, run make comamnd.
-
-  $ make
-
-Files created in output directory
-=================================
-
-output/images
-
-??? bl31.bin
-??? bl31.elf
-??? Image
-??? rk3399-rock-pi-4.dtb
-??? rootfs.ext2
-??? rootfs.ext4 -> rootfs.ext2
-??? rootfs.tar
-??? sdcard.img
-??? u-boot.bin
-??? u-boot.itb
-??? u-boot-spl-dtb.bin
-??? u-boot-tpl-dtb.bin
-??? u-boot-tpl-dtb.img
-??? u-boot-tpl-spl-dtb.img
-
-Creating bootable SD card:
-=========================
-
-Simply invoke (as root)
-
-  # dd if=output/images/sdcard.img of=/dev/sdX && sync
-
-Where X is your SD card device
-
-Serial console
---------------
-
-Baudrate for this board is 1500000
diff --git a/configs/radxa_rock_pi4_defconfig b/configs/radxa_rock_pi4_defconfig
deleted file mode 100644
index 99841b5511..0000000000
--- a/configs/radxa_rock_pi4_defconfig
+++ /dev/null
@@ -1,54 +0,0 @@
-# Architecture
-BR2_aarch64=y
-BR2_cortex_a72_a53=y
-
-# Linux headers same as kernel, a 5.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
-
-# Firmware
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="dd2b180c457d35de195707dfa0b57a83b97fb275"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-pi-4-rk3399"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl-dtb.bin"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-pi-4"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_GENERIC_HOSTNAME="Rock Pi4"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Rock Pi4!"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock-pi4/genimage.cfg"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock-pi4/post-build.sh"
-- 
2.21.0
