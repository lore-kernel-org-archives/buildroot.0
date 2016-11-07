From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Mon, 7 Nov 2016 12:55:27 -0200
Subject: [Buildroot] [PATCH] configs/imx23evk: Add support for imx23evk
Message-ID: <1478530527-30708-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for imx23evk board.

For more information about this board, please check:
http://www.nxp.com/products/software-and-tools/software-development-tools/i.mx-software-and-tools/i.mx23-evaluation-kit:IMX23EVK

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/freescale/imx23evk/readme.txt | 48 +++++++++++++++++++++++++++++++++++++
 configs/imx23evk_defconfig          | 34 ++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 board/freescale/imx23evk/readme.txt
 create mode 100644 configs/imx23evk_defconfig

diff --git a/board/freescale/imx23evk/readme.txt b/board/freescale/imx23evk/readme.txt
new file mode 100644
index 0000000..243e274
--- /dev/null
+++ b/board/freescale/imx23evk/readme.txt
@@ -0,0 +1,48 @@
+**************************
+Freescale i.MX23 EVK board
+**************************
+
+This file documents the Buildroot support for the Freescale i.MX23 EVK board.
+
+Build
+=====
+
+First, configure Buildroot for your i.MX23 EVK board:
+
+  make imx23evk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ directory the following files:
+  - imx23-evk.dtb
+  - rootfs.tar
+  - u-boot.sd
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
+Then, run the following command:
+
+*** WARNING! The command will destroy all the card content. Use with care! ***
+
+ sudo dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
+
+Boot the i.MX23 EVK board
+=========================
+
+- Put the Boot Mode Select jumper as 1 0 0 1 so that it can boot
+  from the SD card
+- Insert the SD card in the SD Card slot of the board;
+- Connect an RS232 UART cable to the Debug UART Port and connect using a
+  terminal emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/imx23evk_defconfig b/configs/imx23evk_defconfig
new file mode 100644
index 0000000..fe07440
--- /dev/null
+++ b/configs/imx23evk_defconfig
@@ -0,0 +1,34 @@
+# architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
+BR2_LINUX_KERNEL_DEFCONFIG="mxs"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-evk"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx23evk"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_FORMAT_SD=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT4=y
+
+# To generate SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/mxs/post-image.sh"
-- 
2.7.4
