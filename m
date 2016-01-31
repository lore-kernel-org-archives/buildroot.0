From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:43:26 +0100
Subject: [Buildroot] [git commit] board: add support for Freescale i.MX6UL
	Evaluation Kit
Message-ID: <20160201224710.ED8617F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a057247237db7eeaadf0bdf81a64e8c974f0243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
[Thomas: simplify exit logic of post-image script.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/imx6ulevk/genimage.cfg  | 41 +++++++++++++++++++++
 board/freescale/imx6ulevk/post-image.sh | 15 ++++++++
 board/freescale/imx6ulevk/readme.txt    | 64 +++++++++++++++++++++++++++++++++
 configs/freescale_imx6ulevk_defconfig   | 38 ++++++++++++++++++++
 4 files changed, 158 insertions(+)

diff --git a/board/freescale/imx6ulevk/genimage.cfg b/board/freescale/imx6ulevk/genimage.cfg
new file mode 100644
index 0000000..36ede1c
--- /dev/null
+++ b/board/freescale/imx6ulevk/genimage.cfg
@@ -0,0 +1,41 @@
+# Minimal microSD card image for the Freescale's i.MX6UL EVK board
+#
+# We mimic the .sdcard Freescale's image format for i.MX6UL:
+# * the microSD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext2 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx6ul-14x14-evk.dtb",
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
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/freescale/imx6ulevk/post-image.sh b/board/freescale/imx6ulevk/post-image.sh
new file mode 100755
index 0000000..cb75a47
--- /dev/null
+++ b/board/freescale/imx6ulevk/post-image.sh
@@ -0,0 +1,15 @@
+#!/usr/bin/env bash
+
+GENIMAGE_CFG="board/freescale/imx6ulevk/genimage.cfg"
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
diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
new file mode 100644
index 0000000..b8243dc
--- /dev/null
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -0,0 +1,64 @@
+***************************
+Freescale i.MX6UL EVK board
+***************************
+
+This file documents the Buildroot support for the Freescale i.MX6UL EVK board.
+
+Please read the i.MX6UL Evaluation Kit Quick Start Guide [1] for an
+introduction to the board.
+
+Build
+=====
+
+First, configure Buildroot for your i.MX6UL EVK board:
+
+  make freescale_imx6ulevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in ./output/images/ the following files:
+  - imx6ul-14x14-evk.dtb
+  - rootfs.ext2
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.imx
+  - zImage
+
+Create a bootable microSD card
+==============================
+
+To determine the device associated to the microSD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a microSD card. Launch the following
+command as root:
+
+  dd if=./output/images/sdcard.img of=/dev/<your-microsd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/imx6ulevk/genimage.cfg.
+
+Boot the i.MX6UL EVK board
+=========================
+
+To boot your newly created system (refer to the i.MX6UL EVK Quick Start Guide
+[1] for guidance):
+- insert the microSD card in the microSD slot of the board;
+- verify that your i.MX6UL EVK board jumpers and switches are set as mentioned
+  in the i.MX6UL EVK Quick Start Guide [1];
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+[1] http://cache.freescale.com/files/32bit/doc/quick_start_guide/IMX6ULTRALITEQSG.pdf
diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
new file mode 100644
index 0000000..b739ff4
--- /dev/null
+++ b/configs/freescale_imx6ulevk_defconfig
@@ -0,0 +1,38 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="imx_3.14.38_6ul_ga"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="imx_v2015.04_3.14.38_6ul_ga"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# filesystem / image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx6ulevk/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
