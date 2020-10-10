From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 10 Oct 2020 09:30:20 +0300
Subject: [Buildroot] [PATCH 3/5] board/udoo: use common image generation
 files
In-Reply-To: <20201010063022.448414-1-geomatsi@gmail.com>
References: <20201010063022.448414-1-geomatsi@gmail.com>
Message-ID: <20201010063022.448414-4-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both Udoo boards use the same set of boot scripts and image generation
scripts. Move all such scripts and files to common directory in order
to avoid duplication.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/udoo/{mx6qdl => common}/boot.scr.txt  |  0
 board/udoo/{neo => common}/genimage.cfg     |  9 ------
 board/udoo/{mx6qdl => common}/post-build.sh |  0
 board/udoo/{mx6qdl => common}/post-image.sh |  0
 board/udoo/mx6qdl/genimage.cfg              | 32 ---------------------
 board/udoo/mx6qdl/readme.txt                |  2 +-
 board/udoo/neo/boot.scr.txt                 |  7 -----
 board/udoo/neo/post-build.sh                |  7 -----
 board/udoo/neo/post-image.sh                | 15 ----------
 board/udoo/neo/readme.txt                   |  2 +-
 configs/mx6sx_udoo_neo_defconfig            |  4 +--
 configs/mx6udoo_defconfig                   |  4 +--
 12 files changed, 6 insertions(+), 76 deletions(-)
 rename board/udoo/{mx6qdl => common}/boot.scr.txt (100%)
 rename board/udoo/{neo => common}/genimage.cfg (50%)
 rename board/udoo/{mx6qdl => common}/post-build.sh (100%)
 rename board/udoo/{mx6qdl => common}/post-image.sh (100%)
 delete mode 100644 board/udoo/mx6qdl/genimage.cfg
 delete mode 100644 board/udoo/neo/boot.scr.txt
 delete mode 100755 board/udoo/neo/post-build.sh
 delete mode 100755 board/udoo/neo/post-image.sh

diff --git a/board/udoo/mx6qdl/boot.scr.txt b/board/udoo/common/boot.scr.txt
similarity index 100%
rename from board/udoo/mx6qdl/boot.scr.txt
rename to board/udoo/common/boot.scr.txt
diff --git a/board/udoo/neo/genimage.cfg b/board/udoo/common/genimage.cfg
similarity index 50%
rename from board/udoo/neo/genimage.cfg
rename to board/udoo/common/genimage.cfg
index 46209120f0..79d3ba6fee 100644
--- a/board/udoo/neo/genimage.cfg
+++ b/board/udoo/common/genimage.cfg
@@ -1,12 +1,3 @@
-# Minimal SD card image for the MX6SX Udoo Neo board
-#
-# The SD card must have at least 1 MB free at the beginning.
-# U-Boot and its environment are dumped as is.
-# A single root filesystem partition is required (Ext4 in this case).
-#
-# For details about the layout, see:
-# http://wiki.wandboard.org/index.php/Boot-process
-
 image sdcard.img {
   hdimage {
   }
diff --git a/board/udoo/mx6qdl/post-build.sh b/board/udoo/common/post-build.sh
similarity index 100%
rename from board/udoo/mx6qdl/post-build.sh
rename to board/udoo/common/post-build.sh
diff --git a/board/udoo/mx6qdl/post-image.sh b/board/udoo/common/post-image.sh
similarity index 100%
rename from board/udoo/mx6qdl/post-image.sh
rename to board/udoo/common/post-image.sh
diff --git a/board/udoo/mx6qdl/genimage.cfg b/board/udoo/mx6qdl/genimage.cfg
deleted file mode 100644
index 46209120f0..0000000000
--- a/board/udoo/mx6qdl/genimage.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-# Minimal SD card image for the MX6SX Udoo Neo board
-#
-# The SD card must have at least 1 MB free at the beginning.
-# U-Boot and its environment are dumped as is.
-# A single root filesystem partition is required (Ext4 in this case).
-#
-# For details about the layout, see:
-# http://wiki.wandboard.org/index.php/Boot-process
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition spl {
-    in-partition-table = "no"
-    image = "SPL"
-    offset = 1K
-  }
-
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.img"
-    offset = 69K
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-    offset = 1M
-    size = 512M
-  }
-}
diff --git a/board/udoo/mx6qdl/readme.txt b/board/udoo/mx6qdl/readme.txt
index cf1a610421..2e439ffa4c 100644
--- a/board/udoo/mx6qdl/readme.txt
+++ b/board/udoo/mx6qdl/readme.txt
@@ -14,4 +14,4 @@ directory, ready to be dumped on a micro SD card:
 dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
 
 For details about the medium image layout, see the definition in
-board/udoo/mx6qdl/genimage.cfg.
+board/udoo/common/genimage.cfg.
diff --git a/board/udoo/neo/boot.scr.txt b/board/udoo/neo/boot.scr.txt
deleted file mode 100644
index 7a8aa4bd54..0000000000
--- a/board/udoo/neo/boot.scr.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-setenv finduuid "part uuid mmc 0:1 uuid"
-run finduuid
-run findfdt
-setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
-load mmc 0:1 ${fdt_addr} boot/${fdtfile}
-load mmc 0:1 ${loadaddr} boot/zImage
-bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/udoo/neo/post-build.sh b/board/udoo/neo/post-build.sh
deleted file mode 100755
index 6ccd87fafd..0000000000
--- a/board/udoo/neo/post-build.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-install -d -m 755 $TARGET_DIR/boot
-$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
-	-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr
diff --git a/board/udoo/neo/post-image.sh b/board/udoo/neo/post-image.sh
deleted file mode 100755
index 18e76aa40d..0000000000
--- a/board/udoo/neo/post-image.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
-
diff --git a/board/udoo/neo/readme.txt b/board/udoo/neo/readme.txt
index f037ad484a..4d9659e02f 100644
--- a/board/udoo/neo/readme.txt
+++ b/board/udoo/neo/readme.txt
@@ -13,4 +13,4 @@ directory, ready to be dumped on an SD card:
 dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
 
 For details about the medium image layout, see the definition in
-board/udoo/neo/genimage.cfg.
+board/udoo/common/genimage.cfg.
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 57b9562c06..bec87561bb 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -5,8 +5,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 5.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/neo/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/neo/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 2cf13ae559..bd0583b955 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -6,8 +6,8 @@ BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 5.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/mx6qdl/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/mx6qdl/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-- 
2.28.0
