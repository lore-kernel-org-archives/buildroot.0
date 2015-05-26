From: Vincent Stehle <vincent.stehle@laposte.net>
Date: Tue, 26 May 2015 16:42:22 +0200
Subject: [Buildroot] [PATCH] configs: add Freescale i.MX6 SoloX Sabre SD
	support
Message-ID: <1432651342-30564-1-git-send-email-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Stehl? <vincent.stehle@laposte.net>

The i.MX6 SoloX SABRE board for smart devices is Freescale's reference design
board based on the heterogeneous ARM Cortex-A9 + Cortex-M4 i.MX6 SoloX
applications processor.

This defconfig is inspired from previous freescale_imx6*sabresd_defconfig, and
is based on Freescale "official" git repo on git.freescale.com and SW release
3.10.53_1.1.0_ga.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---


Hi,

This is a proposed defconfig for i.MX6 SoloX.

Because the i.MX6 SoloX is not supported with the Freescale release 3.10.17
currently in use by i.MX6 defconfigs in buildroot, and because patches to
"bump" other i.MX6 boards to release 3.10.53 have been kindly submitted by Gary
[1], this defconfig is based on release 3.10.53 for consistency.

To compile properly, this defconfig depends on a "refresh" of an u-boot patch,
posted earlier [2].

Best regards,

V.

[1] http://patchwork.ozlabs.org/patch/476413/ and more
[2] http://patchwork.ozlabs.org/patch/474897/


 board/freescale/imx6sabre/readme.txt      | 63 ++++++++++++++++++++++++-------
 configs/freescale_imx6sxsabresd_defconfig | 35 +++++++++++++++++
 2 files changed, 84 insertions(+), 14 deletions(-)
 create mode 100644 configs/freescale_imx6sxsabresd_defconfig

diff --git a/board/freescale/imx6sabre/readme.txt b/board/freescale/imx6sabre/readme.txt
index 6850885..6c44e22 100644
--- a/board/freescale/imx6sabre/readme.txt
+++ b/board/freescale/imx6sabre/readme.txt
@@ -1,14 +1,19 @@
-*******************************************************
-Freescale i.MX6Q and i.MX6DL SABRESD development boards
-*******************************************************
+********************************************************
+Freescale i.MX6 Q, DL and SoloX SABRE development boards
+********************************************************
 
-This file documents the Buildroot support for the Freescale SABRE Board for
-Smart Devices Based on the i.MX 6 Series (SABRESD), as well as the Freescale
-SABRE Board for Automotive Infotainment.
+This file documents the Buildroot support for the Freescale SABRE Board
+for Smart Devices Based on the i.MX 6 and i.MX 6SoloX Series (SABRESD),
+as well as the Freescale SABRE Board for Automotive Infotainment.
 
-Read the SABRESD Quick Start Guide for an introduction to the board:
+Read the i.MX 6 SABRESD Quick Start Guide for an introduction to the
+board:
 http://cache.freescale.com/files/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.pdf
 
+Read the i.MX 6 SoloX SABRESD Quick Start Guide for an introduction to
+the board:
+http://cache.freescale.com/files/32bit/doc/user_guide/IMX6SOLOXQSG.pdf
+
 Read the SABRE for Automotive Infotainment Quick Start Guide for an
 introduction to the board:
 http://cache.freescale.com/files/32bit/doc/user_guide/IMX6SABREINFOQSG.pdf
@@ -25,6 +30,10 @@ For i.MX6DL SABRE SD board:
 
   make freescale_imx6dlsabresd_defconfig
 
+For i.MX6 SoloX SABRE SD board:
+
+  make freescale_imx6sxsabresd_defconfig
+
 For i.MX6Q SABRE Auto board:
 
   make freescale_imx6qsabreauto_defconfig
@@ -38,12 +47,12 @@ Build all components:
   make
 
 You will find in ./output/images/ the following files:
-  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb or imx6q-sabreauto.dtb or
-    imx6dl-sabreauto.dtb
+  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb or imx6sx-sdb.dtb or
+    imx6q-sabreauto.dtb or imx6dl-sabreauto.dtb
   - rootfs.ext2
   - rootfs.tar
   - u-boot.imx
-  - uImage
+  - uImage, or zImage for i.MX6 SoloX
 
 Create a bootable SD card
 =========================
@@ -63,17 +72,43 @@ and copy the bootloader, kernel, DTBs and root filesystem as needed.
 Boot the SABRE board
 ====================
 
-SABRE SD
---------
+i.MX6 SABRE SD
+--------------
 
-To boot your newly created system on a SABRE SD Board (refer to the SABRE SD
-Quick Start Guide for guidance):
+To boot your newly created system on an i.MX6 SABRE SD Board (refer to
+the i.MX6 SABRE SD Quick Start Guide for guidance):
 - insert the SD card in the SD3 slot of the board;
 - locate the BOOT dip switches (SW6), set dips 2 and 7 to ON, all others to OFF;
 - connect a Micro USB cable to Debug Port and connect using a terminal emulator
   at 115200 bps, 8n1;
 - power on the board.
 
+i.MX6 SoloX SABRE SD
+--------------------
+
+To boot your newly created system on an i.MX6 SoloX SABRE SD Board
+(refer to the i.MX6 SoloX SABRE SD Quick Start Guide for guidance):
+- insert the SD card in the J4-SD4 socket at the bottom of the board;
+- Set the SW10, SW11 and SW12 DIP switches at the top of the board in
+  their default position, to boot from SD card. Reference configuration:
+
+    SW10
+     1   2   3   4   5   6   7   8
+    off off off off off off off off
+
+    SW11
+     1   2  3  4  5   6   7   8
+    off off ON ON ON off off off
+
+    SW12
+     1  2   3   4   5   6   7   8
+    off ON off off off off off off
+
+- connect a Micro USB cable to the J16 Debug Port at the bottom of the
+  board. This is a dual UART debug port; connect to the first tty using
+  a terminal emulator at 115200 bps, 8n1;
+- power on the board with the SW1-PWR switch at the top of the board.
+
 SABRE Auto
 ----------
 
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
new file mode 100644
index 0000000..bd0d6cc
--- /dev/null
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -0,0 +1,35 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
+
+# toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.10.53"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
-- 
2.1.4
