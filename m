From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 23:41:43 +0200
Subject: [Buildroot] [PATCH 2/2] configs/cubieboard2_defconfig: use U-Boot
	boot script generation logic
In-Reply-To: <20170621214143.7184-1-thomas.petazzoni@free-electrons.com>
References: <20170621214143.7184-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170621214143.7184-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of a custom post-build script, use the boot script generation
logic of the U-Boot package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This is just one example on one specific platform of what it looks
like. If we agree on the feature, my intent is to rework all the
existing boards that generate such a boot script.
---
 board/cubietech/cubieboard2/post-build.sh | 11 -----------
 configs/cubieboard2_defconfig             |  4 ++--
 2 files changed, 2 insertions(+), 13 deletions(-)
 delete mode 100755 board/cubietech/cubieboard2/post-build.sh

diff --git a/board/cubietech/cubieboard2/post-build.sh b/board/cubietech/cubieboard2/post-build.sh
deleted file mode 100755
index 465d493..0000000
--- a/board/cubietech/cubieboard2/post-build.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# post-build.sh for Cubieboard2
-# 2013, Carlo Caione <carlo.caione@gmail.com>
-
-BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
-BOOT_CMD=$BOARD_DIR/boot.cmd
-BOOT_CMD_H=$BINARIES_DIR/boot.scr
-
-# U-Boot script
-$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 353aaa5..a0d2399 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -6,7 +6,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/cubietech/cubieboard2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
@@ -24,7 +23,8 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard2/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.9.4
