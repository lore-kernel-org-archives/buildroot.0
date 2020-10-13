From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 13 Oct 2020 23:16:21 +0300
Subject: [Buildroot] [PATCH v2 3/3] board/udoo: use common freescale
 infrastructure
In-Reply-To: <20201013201621.910051-1-geomatsi@gmail.com>
References: <20201013201621.910051-1-geomatsi@gmail.com>
Message-ID: <20201013201621.910051-4-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot 2020.10 no longer provides boot command in default environment for
Udoo Quad/Dual board. Boot script needs to be added to the image. In order
to keep using common infrastructure for freescale boards, move boot files
to root filesystem and add boot script there. Also switch Udoo Neo board
to common freescale infrastructure to simplify maintenance.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/udoo/{neo => common}/boot.scr.txt |  2 +-
 board/udoo/common/post-build.sh         |  3 +++
 board/udoo/mx6qdl/readme.txt            |  2 +-
 board/udoo/neo/genimage.cfg             | 32 -------------------------
 board/udoo/neo/post-build.sh            |  7 ------
 board/udoo/neo/post-image.sh            | 15 ------------
 board/udoo/neo/readme.txt               |  2 +-
 configs/mx6sx_udoo_neo_defconfig        |  6 +++--
 configs/mx6udoo_defconfig               |  5 ++++
 9 files changed, 15 insertions(+), 59 deletions(-)
 rename board/udoo/{neo => common}/boot.scr.txt (66%)
 create mode 100755 board/udoo/common/post-build.sh
 delete mode 100644 board/udoo/neo/genimage.cfg
 delete mode 100755 board/udoo/neo/post-build.sh
 delete mode 100755 board/udoo/neo/post-image.sh

diff --git a/board/udoo/neo/boot.scr.txt b/board/udoo/common/boot.scr.txt
similarity index 66%
rename from board/udoo/neo/boot.scr.txt
rename to board/udoo/common/boot.scr.txt
index 7a8aa4bd54..7acceed0fb 100644
--- a/board/udoo/neo/boot.scr.txt
+++ b/board/udoo/common/boot.scr.txt
@@ -1,7 +1,7 @@
 setenv finduuid "part uuid mmc 0:1 uuid"
 run finduuid
 run findfdt
-setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
+setenv bootargs "console=${console} root=PARTUUID=${uuid} rootwait rootfstype=ext4"
 load mmc 0:1 ${fdt_addr} boot/${fdtfile}
 load mmc 0:1 ${loadaddr} boot/zImage
 bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/udoo/common/post-build.sh b/board/udoo/common/post-build.sh
new file mode 100755
index 0000000000..d3f612f811
--- /dev/null
+++ b/board/udoo/common/post-build.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/udoo/mx6qdl/readme.txt b/board/udoo/mx6qdl/readme.txt
index cf1a610421..a7ca98cc8a 100644
--- a/board/udoo/mx6qdl/readme.txt
+++ b/board/udoo/mx6qdl/readme.txt
@@ -14,4 +14,4 @@ directory, ready to be dumped on a micro SD card:
 dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
 
 For details about the medium image layout, see the definition in
-board/udoo/mx6qdl/genimage.cfg.
+board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl.
diff --git a/board/udoo/neo/genimage.cfg b/board/udoo/neo/genimage.cfg
deleted file mode 100644
index 46209120f0..0000000000
--- a/board/udoo/neo/genimage.cfg
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
index f037ad484a..94ebcc12f2 100644
--- a/board/udoo/neo/readme.txt
+++ b/board/udoo/neo/readme.txt
@@ -13,4 +13,4 @@ directory, ready to be dumped on an SD card:
 dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
 
 For details about the medium image layout, see the definition in
-board/udoo/neo/genimage.cfg.
+board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl.
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 57b9562c06..4a2f8b0bc0 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -5,8 +5,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 5.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/neo/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/neo/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
@@ -28,3 +28,5 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/udoo/common/boot.scr.txt"
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index be56f3014e..058dc4534d 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -7,6 +7,7 @@ BR2_GLOBAL_PATCH_DIR="board/udoo/mx6qdl/patches"
 # Linux headers same as kernel, a 5.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -23,7 +24,11 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-udoo imx6dl-udoo"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/udoo/common/boot.scr.txt"
-- 
2.28.0
