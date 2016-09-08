From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:25:40 +0200
Subject: [Buildroot] [git commit] configs: Add support for warp7 board
Message-ID: <20160908202553.297C5817F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d981c4b34a87db5833f42f050d7f548926994c98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for warp7, which is a board based on NXP i.MX7S processor.

More information about warp7 can be found at:
https://www.element14.com/community/docs/DOC-79058

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/warp7/genimage.cfg  | 41 +++++++++++++++++++++
 board/warp7/post-image.sh | 14 +++++++
 board/warp7/readme.txt    | 93 +++++++++++++++++++++++++++++++++++++++++++++++
 configs/warp7_defconfig   | 36 ++++++++++++++++++
 4 files changed, 184 insertions(+)

diff --git a/board/warp7/genimage.cfg b/board/warp7/genimage.cfg
new file mode 100644
index 0000000..6d963ac
--- /dev/null
+++ b/board/warp7/genimage.cfg
@@ -0,0 +1,41 @@
+# Minimal eMMC image for the Warp board
+#
+# We mimic the .sdcard Freescale's image format for i.MX7S:
+# * the eMMC card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx7s-warp.dtb",
+      "zImage"
+    }
+  }
+  size = 16M
+}
+
+image emmc.img {
+  hdimage {
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.imx"
+    offset = 1024
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 8M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/warp7/post-image.sh b/board/warp7/post-image.sh
new file mode 100755
index 0000000..b4ac460
--- /dev/null
+++ b/board/warp7/post-image.sh
@@ -0,0 +1,14 @@
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
diff --git a/board/warp7/readme.txt b/board/warp7/readme.txt
new file mode 100644
index 0000000..3c765f5
--- /dev/null
+++ b/board/warp7/readme.txt
@@ -0,0 +1,93 @@
+*****************
+Warp i.MX7S board
+*****************
+
+This file documents the Buildroot support for the Warp i.MX7S board.
+
+Build
+=====
+
+First, configure Buildroot for the Warp i.MX7S board:
+
+  make warp7_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - imx7s-warp.dtb
+  - rootfs.ext4
+  - rootfs.tar
+  - emmc.img
+  - u-boot.imx
+  - zImage
+
+Flash the eMMC image
+====================
+
+In the U-Boot prompt lauch:
+
+=> ums 0 mmc 0
+
+This will mount the eMMC content in the host PC as a mass storage device.
+
+To determine the device associated to the eMMC have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "emmc.img" image in the output/images/
+directory, ready to be dumped into the eMMC. Launch the following
+command:
+
+sudo dd if=output/images/emmc.img of=/dev/<your-emmc-device>
+
+*** WARNING! This will destroy all the eMMC content. Use it with care! ***
+
+For details about the medium image layout, see the definition in
+board/warp7/genimage.cfg.
+
+How to recover from a bad eMMC image
+====================================
+
+In case a bad U-Boot has been flashed to the eMMC and the board no
+longer boots, it is possible to recover using the imx_usb_loader utility.
+
+Put the warp7 board in USB download mode by removing the CPU board
+from the base board then putting switch 2 in the upper position.
+
+Connect a USB to serial adapter between the host PC and warp7 serial
+USB port, and also a USB cable between the OTG warp7 port and the host
+PC.
+
+Copy u-boot.imx to the imx_usb_loader folder.
+
+Load u-boot.imx via USB:
+
+$ sudo ./imx_usb u-boot.imx
+
+Then U-Boot should start and its messages will appear in the console program.
+
+Open a terminal program such as minicom.
+
+Use the default environment variables:
+
+=> env default -f -a
+=> saveenv
+=> ums 0 mmc 0
+
+sudo dd if=output/images/emmc.img of=/dev/<your-emmc-device>
+
+Put warp7 back in eMMC boot mode by placing switch 2 in the lower position
+and reboot the board.
+
+Boot the Warp i.MX7S board
+==========================
+
+To boot your newly created system:
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
new file mode 100644
index 0000000..0da34c3
--- /dev/null
+++ b/configs/warp7_defconfig
@@ -0,0 +1,36 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 4.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Freescale/linux-fslc.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="efaf36531fe7b1fc15a48033e5972825c91f9fc6"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="warp7"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Freescale/u-boot-fslc.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="7a8868eb526b7c1d5dc274bc666bfaef9585ba7c"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/warp7/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# required tools to create the eMMC image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
