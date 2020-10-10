From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 10 Oct 2020 09:30:19 +0300
Subject: [Buildroot] [PATCH 2/5] configs/mx6udoo: bump bsp versions and
 modify image
In-Reply-To: <20201010063022.448414-1-geomatsi@gmail.com>
References: <20201010063022.448414-1-geomatsi@gmail.com>
Message-ID: <20201010063022.448414-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot to 2020.10 and kernel to 5.8.13 version. Updated U-Boot no
longer provides specific boot command in default environment for this
board. So boot script needs to be added to the image. For this purpose
switch from Freescale common scripts to custom image generation similar
to what Udoo Neo board does. Create a single rootfs partition with all
the required boot files including boot.scr, kernel, and dtb.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/udoo/mx6qdl/boot.scr.txt  |  7 +++++++
 board/udoo/mx6qdl/genimage.cfg  | 32 ++++++++++++++++++++++++++++++++
 board/udoo/mx6qdl/post-build.sh |  7 +++++++
 board/udoo/mx6qdl/post-image.sh | 15 +++++++++++++++
 configs/mx6udoo_defconfig       | 13 ++++++++-----
 5 files changed, 69 insertions(+), 5 deletions(-)
 create mode 100644 board/udoo/mx6qdl/boot.scr.txt
 create mode 100644 board/udoo/mx6qdl/genimage.cfg
 create mode 100755 board/udoo/mx6qdl/post-build.sh
 create mode 100755 board/udoo/mx6qdl/post-image.sh

diff --git a/board/udoo/mx6qdl/boot.scr.txt b/board/udoo/mx6qdl/boot.scr.txt
new file mode 100644
index 0000000000..7acceed0fb
--- /dev/null
+++ b/board/udoo/mx6qdl/boot.scr.txt
@@ -0,0 +1,7 @@
+setenv finduuid "part uuid mmc 0:1 uuid"
+run finduuid
+run findfdt
+setenv bootargs "console=${console} root=PARTUUID=${uuid} rootwait rootfstype=ext4"
+load mmc 0:1 ${fdt_addr} boot/${fdtfile}
+load mmc 0:1 ${loadaddr} boot/zImage
+bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/udoo/mx6qdl/genimage.cfg b/board/udoo/mx6qdl/genimage.cfg
new file mode 100644
index 0000000000..46209120f0
--- /dev/null
+++ b/board/udoo/mx6qdl/genimage.cfg
@@ -0,0 +1,32 @@
+# Minimal SD card image for the MX6SX Udoo Neo board
+#
+# The SD card must have at least 1 MB free at the beginning.
+# U-Boot and its environment are dumped as is.
+# A single root filesystem partition is required (Ext4 in this case).
+#
+# For details about the layout, see:
+# http://wiki.wandboard.org/index.php/Boot-process
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition spl {
+    in-partition-table = "no"
+    image = "SPL"
+    offset = 1K
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.img"
+    offset = 69K
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+    offset = 1M
+    size = 512M
+  }
+}
diff --git a/board/udoo/mx6qdl/post-build.sh b/board/udoo/mx6qdl/post-build.sh
new file mode 100755
index 0000000000..6ccd87fafd
--- /dev/null
+++ b/board/udoo/mx6qdl/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -d -m 755 $TARGET_DIR/boot
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
+	-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr
diff --git a/board/udoo/mx6qdl/post-image.sh b/board/udoo/mx6qdl/post-image.sh
new file mode 100755
index 0000000000..18e76aa40d
--- /dev/null
+++ b/board/udoo/mx6qdl/post-image.sh
@@ -0,0 +1,15 @@
+#!/usr/bin/env bash
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
+
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 86ad13bbf3..2cf13ae559 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -3,27 +3,30 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 5.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/mx6qdl/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/mx6qdl/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/udoo/mx6qdl/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-udoo imx6dl-udoo"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.28.0
