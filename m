From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 14:00:47 +0200
Subject: [Buildroot] [PATCH 3/7] configs/nanopc_t4: remove defconfig
In-Reply-To: <20190829120051.22415-1-thomas.petazzoni@bootlin.com>
References: <20190829120051.22415-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190829120051.22415-4-thomas.petazzoni@bootlin.com>
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

  https://gitlab.com/buildroot.org/buildroot/-/jobs/278489325

Cc: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                            |  1 -
 DEVELOPERS                                |  2 -
 board/friendlyarm/nanopc-t4/extlinux.conf |  4 --
 board/friendlyarm/nanopc-t4/genimage.cfg  | 22 ---------
 board/friendlyarm/nanopc-t4/post-build.sh |  8 ----
 board/friendlyarm/nanopc-t4/readme.txt    | 49 --------------------
 configs/nanopc_t4_defconfig               | 54 -----------------------
 7 files changed, 140 deletions(-)
 delete mode 100644 board/friendlyarm/nanopc-t4/extlinux.conf
 delete mode 100644 board/friendlyarm/nanopc-t4/genimage.cfg
 delete mode 100755 board/friendlyarm/nanopc-t4/post-build.sh
 delete mode 100644 board/friendlyarm/nanopc-t4/readme.txt
 delete mode 100644 configs/nanopc_t4_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0024e33ae0..9de3b2c927 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -211,7 +211,6 @@ mx53loco_defconfig: { extends: .defconfig }
 mx6cubox_defconfig: { extends: .defconfig }
 mx6sx_udoo_neo_defconfig: { extends: .defconfig }
 mx6udoo_defconfig: { extends: .defconfig }
-nanopc_t4_defconfig: { extends: .defconfig }
 nanopi_m1_defconfig: { extends: .defconfig }
 nanopi_m1_plus_defconfig: { extends: .defconfig }
 nanopi_m4_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index e50ac78ae7..93ae5c50fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2096,13 +2096,11 @@ F:	package/wolfssl/
 N:	Shyam Saini <shyam.saini@amarulasolutions.com>
 F:	board/friendlyarm/nanopi-m4/
 F:	board/friendlyarm/nanopi-neo4/
-F:	board/friendlyarm/nanopc-t4/
 F:	board/olimex/a33_olinuxino/
 F:	board/pine64/rockpro64/
 F:	board/radxa/rock-pi4/
 F:	configs/nanopi_m4_defconfig
 F:	configs/nanopi_neo4_defconfig
-F:	configs/nanopc_t4_defconfig
 F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/pine64_rockpro64_defconfig
 F:	configs/radxa_rock_pi4_defconfig
diff --git a/board/friendlyarm/nanopc-t4/extlinux.conf b/board/friendlyarm/nanopc-t4/extlinux.conf
deleted file mode 100644
index b09c20db84..0000000000
--- a/board/friendlyarm/nanopc-t4/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label NanoPc T4
-  kernel /boot/Image
-  devicetree /boot/rk3399-nanopc-t4.dtb
-  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p1 rootwait
diff --git a/board/friendlyarm/nanopc-t4/genimage.cfg b/board/friendlyarm/nanopc-t4/genimage.cfg
deleted file mode 100644
index 6404b0ad3b..0000000000
--- a/board/friendlyarm/nanopc-t4/genimage.cfg
+++ /dev/null
@@ -1,22 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot-spl-dtb {
-		in-partition-table = "no"
-		image = "u-boot-spl-dtb.img"
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
diff --git a/board/friendlyarm/nanopc-t4/post-build.sh b/board/friendlyarm/nanopc-t4/post-build.sh
deleted file mode 100755
index 9b0c4ecc83..0000000000
--- a/board/friendlyarm/nanopc-t4/post-build.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-MKIMAGE=$HOST_DIR/bin/mkimage
-BOARD_DIR="$(dirname $0)"
-
-$MKIMAGE -n rk3399 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/friendlyarm/nanopc-t4/readme.txt b/board/friendlyarm/nanopc-t4/readme.txt
deleted file mode 100644
index dc2cd8444b..0000000000
--- a/board/friendlyarm/nanopc-t4/readme.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Intro
-=====
-
-NanoPc T4 is a RK3399 SoC based ARM64 board.
-
-Official Wiki: http://wiki.friendlyarm.com/wiki/index.php/NanoPC-T4
-
-Build
-=====
-
-Run NanoPc T4 configuration
-
-  $ make nanopc_t4_defconfig
-
-To build, run make comamnd.
-
-  $ make
-
-Files created in output directory
-=================================
-
-output/images/
-
-??? bl31.bin
-??? bl31.elf
-??? Image
-??? rk3399-nanopc-t4.dtb
-??? rootfs.ext2
-??? rootfs.ext4 -> rootfs.ext2
-??? rootfs.tar
-??? sdcard.img
-??? u-boot.bin
-??? u-boot.itb
-??? u-boot-spl-dtb.bin
-??? u-boot-spl-dtb.img
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
diff --git a/configs/nanopc_t4_defconfig b/configs/nanopc_t4_defconfig
deleted file mode 100644
index f6aaf75531..0000000000
--- a/configs/nanopc_t4_defconfig
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
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="980ca75ae0438b4a1847d044605c492f3c844f88"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopc-t4-rk3399"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-nanopc-t4"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_GENERIC_HOSTNAME="NanoPc T4"
-BR2_TARGET_GENERIC_ISSUE="Welcome to NanoPc T4!"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopc-t4/genimage.cfg"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopc-t4/post-build.sh"
-- 
2.21.0
