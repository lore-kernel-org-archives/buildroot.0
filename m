From: Fabio Estevam <festevam@gmail.com>
Date: Thu,  2 Jun 2016 19:59:54 -0300
Subject: [Buildroot] [PATCH] configs: new configuration for NXP i.MX51 EVK
Message-ID: <1464908394-26641-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new configuration for NXP i.MX51 EVK based on U-boot 2016.05
and kernel 4.6.1.

U-boot 2016.05 needs the patch c510f2e436008 ("video: ipu_common: fix build
error") that is already in mainline to fix an IPU build error.
    
We can remove this patch in the future when we switch to U-boot 2016.07.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx51evk/genimage.cfg              | 41 ++++++++++++++++
 .../0001-video-ipu_common-fix-build-error.patch    | 47 +++++++++++++++++++
 board/freescale/imx51evk/post-image.sh             | 16 +++++++
 board/freescale/imx51evk/readme.txt                | 54 ++++++++++++++++++++++
 configs/mx51evk_defconfig                          | 37 +++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 board/freescale/imx51evk/genimage.cfg
 create mode 100644 board/freescale/imx51evk/patches/uboot/0001-video-ipu_common-fix-build-error.patch
 create mode 100755 board/freescale/imx51evk/post-image.sh
 create mode 100644 board/freescale/imx51evk/readme.txt
 create mode 100644 configs/mx51evk_defconfig

diff --git a/board/freescale/imx51evk/genimage.cfg b/board/freescale/imx51evk/genimage.cfg
new file mode 100644
index 0000000..a44ed30
--- /dev/null
+++ b/board/freescale/imx51evk/genimage.cfg
@@ -0,0 +1,41 @@
+# Minimal SD card image for the Freescale's i.MX51 EVK board
+#
+# We mimic the .sdcard Freescale's image format for i.MX51:
+# * the microSD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx51-babbage.dtb",
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
diff --git a/board/freescale/imx51evk/patches/uboot/0001-video-ipu_common-fix-build-error.patch b/board/freescale/imx51evk/patches/uboot/0001-video-ipu_common-fix-build-error.patch
new file mode 100644
index 0000000..356d0b0
--- /dev/null
+++ b/board/freescale/imx51evk/patches/uboot/0001-video-ipu_common-fix-build-error.patch
@@ -0,0 +1,47 @@
+From c510f2e436008e55a50b063f2180cb1e63984224 Mon Sep 17 00:00:00 2001
+From: Peng Fan <van.freenix@gmail.com>
+Date: Thu, 28 Apr 2016 10:07:53 +0800
+Subject: [PATCH] video: ipu_common: fix build error
+
+Some toolchains fail to build
+"clk->rate = (u64)(clk->parent->rate * 16) / div;"
+And the cast usage is wrong.
+
+Use the following code to fix the issue,
+"
+  do_div(parent_rate, div);
+  clk->rate = parent_rate;
+"
+
+Reported-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: Peng Fan <van.freenix@gmail.com>
+Cc: Stefano Babic <sbabic@denx.de>
+Cc: Fabio Estevam <fabio.estevam@nxp.com>
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Anatolij Gustschin <agust@denx.de>
+Cc: Peter Robinson <pbrobinson@gmail.com>
+Reviewed-by: Tom Rini <trini@konsulko.com>
+Tested-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ drivers/video/ipu_common.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/video/ipu_common.c b/drivers/video/ipu_common.c
+index 36d4b23..5676a0f 100644
+--- a/drivers/video/ipu_common.c
++++ b/drivers/video/ipu_common.c
+@@ -352,7 +352,9 @@ static int ipu_pixel_clk_set_rate(struct clk *clk, unsigned long rate)
+ 	 */
+ 	__raw_writel((div / 16) << 16, DI_BS_CLKGEN1(clk->id));
+ 
+-	clk->rate = (u64)(clk->parent->rate * 16) / div;
++	do_div(parent_rate, div);
++
++	clk->rate = parent_rate;
+ 
+ 	return 0;
+ }
+-- 
+1.9.1
+
diff --git a/board/freescale/imx51evk/post-image.sh b/board/freescale/imx51evk/post-image.sh
new file mode 100755
index 0000000..8757355
--- /dev/null
+++ b/board/freescale/imx51evk/post-image.sh
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
diff --git a/board/freescale/imx51evk/readme.txt b/board/freescale/imx51evk/readme.txt
new file mode 100644
index 0000000..6639a92
--- /dev/null
+++ b/board/freescale/imx51evk/readme.txt
@@ -0,0 +1,54 @@
+**************************
+Freescale i.MX51 EVK board
+**************************
+
+This file documents the Buildroot support for the Freescale i.MX51 EVK board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX51 EVK board:
+
+  make mx51evk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - imx51-babbage.dtb
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.imx
+  - zImage
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/imx51evk/genimage.cfg.
+
+Boot the i.MX51 EVK board
+=========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
new file mode 100644
index 0000000..413f966
--- /dev/null
+++ b/configs/mx51evk_defconfig
@@ -0,0 +1,37 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a8=y
+
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx51evk/patches/"
+
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx51evk/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx51evk"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-babbage"
-- 
1.9.1
