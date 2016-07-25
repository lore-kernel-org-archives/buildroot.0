From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:20:28 +0200
Subject: [Buildroot] [git commit] configs: Add new configuration for i.MX6UL
	Pico board
Message-ID: <20160725203012.2703481D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9cece6994fd1fd896e671a7063846dd154703b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for Technexion's i.MX6UL Pico board running U-boot 2016.07
and kernel 4.7.

For information about this board, please visit:
http://www.wandboard.org/images/hobbit/hobbitboard-imx6ul-reva1.pdf

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/technexion/imx6ulpico/genimage.cfg  | 41 +++++++++++++++++++++
 board/technexion/imx6ulpico/post-image.sh | 16 +++++++++
 board/technexion/imx6ulpico/readme.txt    | 59 +++++++++++++++++++++++++++++++
 configs/imx6ulpico_defconfig              | 34 ++++++++++++++++++
 4 files changed, 150 insertions(+)

diff --git a/board/technexion/imx6ulpico/genimage.cfg b/board/technexion/imx6ulpico/genimage.cfg
new file mode 100644
index 0000000..9e67105
--- /dev/null
+++ b/board/technexion/imx6ulpico/genimage.cfg
@@ -0,0 +1,41 @@
+# Minimal eMMC card image for the Technexion's i.MX6UL Pico board
+#
+# We mimic the .sdcard Freescale's image format for i.MX6UL:
+# * the eMMC must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx6ul-pico-hobbit.dtb",
+      "zImage"
+    }
+  }
+  size = 16M
+}
+
+image sdcard.img {
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
diff --git a/board/technexion/imx6ulpico/post-image.sh b/board/technexion/imx6ulpico/post-image.sh
new file mode 100755
index 0000000..8757355
--- /dev/null
+++ b/board/technexion/imx6ulpico/post-image.sh
@@ -0,0 +1,16 @@
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
+exit $?
diff --git a/board/technexion/imx6ulpico/readme.txt b/board/technexion/imx6ulpico/readme.txt
new file mode 100644
index 0000000..8046bdb
--- /dev/null
+++ b/board/technexion/imx6ulpico/readme.txt
@@ -0,0 +1,59 @@
+*****************************
+Technexion i.MX6UL Pico board
+*****************************
+
+This file documents the Buildroot support for the Technexion i.MX6UL Pico board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX6UL Pico board:
+
+  make imx6ulpico_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - imx6ul-pico-hobbit.dtb
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.imx
+  - zImage
+
+Create a bootable SD card
+=========================
+
+In the U-Boot prompt lauch:
+
+=> ums 0 mmc 0
+
+This will mount the eMMC content in the host PC as a mass storage device.
+
+To determine the device associated to the eMMC card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on the eMMC card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/technexion/imx6ulpico/genimage.cfg.
+
+Boot the i.MX6UL Pico board
+=========================
+
+To boot your newly created system:
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
new file mode 100644
index 0000000..2372636
--- /dev/null
+++ b/configs/imx6ulpico_defconfig
@@ -0,0 +1,34 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-hobbit"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="pico-imx6ul"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# required tools to create the eMMC image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# filesystem / image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technexion/imx6ulpico/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
