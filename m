From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Mon, 30 Mar 2015 14:50:22 +0200
Subject: [Buildroot] [PATCH v2 2/2] configs: add Freescale SABRE Auto board
	support
In-Reply-To: <1427719822-12367-1-git-send-email-vincent.stehle@freescale.com>
References: <550D9052.2000204@mind.be>
 <1427719822-12367-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <1427719822-12367-2-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SABRE Board for Automotive Infotainment (SABRE Auto, a.k.a. SABRE-AI) is
Freescale's evaluation board based on the i.MX 6 ARM Cortex-A9 applications
processor.

Those defconfigs are an adaptation of freescale_imx6{q,dl}sabresd_defconfig for
SABRE Auto, and are thus based on Freescale "official" git repo on
git.freescale.com and SW release 3.10.17_1.0.0_ga.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gary Bisson <bisson.gary@gmail.com>

---

Changes since v1:

- Move erroneous mention of Sabre Auto from previous patch into this
  one.

- Add a "SABRE AUTO" section in the doc paragraph "Boot the SABRE
  board". Add a mention of the DB9 connector for the Sabre Auto debug
  UART.

 board/freescale/imx6sabre/readme.txt               | 45 +++++++++++++++++++++-
 ...fconfig => freescale_imx6dlsabreauto_defconfig} |  6 +--
 ...efconfig => freescale_imx6qsabreauto_defconfig} |  6 +--
 3 files changed, 49 insertions(+), 8 deletions(-)
 copy configs/{freescale_imx6qsabresd_defconfig => freescale_imx6dlsabreauto_defconfig} (85%)
 copy configs/{freescale_imx6qsabresd_defconfig => freescale_imx6qsabreauto_defconfig} (86%)

diff --git a/board/freescale/imx6sabre/readme.txt b/board/freescale/imx6sabre/readme.txt
index 6c1a5b5..6850885 100644
--- a/board/freescale/imx6sabre/readme.txt
+++ b/board/freescale/imx6sabre/readme.txt
@@ -3,11 +3,16 @@ Freescale i.MX6Q and i.MX6DL SABRESD development boards
 *******************************************************
 
 This file documents the Buildroot support for the Freescale SABRE Board for
-Smart Devices Based on the i.MX 6 Series (SABRESD).
+Smart Devices Based on the i.MX 6 Series (SABRESD), as well as the Freescale
+SABRE Board for Automotive Infotainment.
 
 Read the SABRESD Quick Start Guide for an introduction to the board:
 http://cache.freescale.com/files/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.pdf
 
+Read the SABRE for Automotive Infotainment Quick Start Guide for an
+introduction to the board:
+http://cache.freescale.com/files/32bit/doc/user_guide/IMX6SABREINFOQSG.pdf
+
 Build
 =====
 
@@ -20,12 +25,21 @@ For i.MX6DL SABRE SD board:
 
   make freescale_imx6dlsabresd_defconfig
 
+For i.MX6Q SABRE Auto board:
+
+  make freescale_imx6qsabreauto_defconfig
+
+For i.MX6DL SABRE Auto board:
+
+  make freescale_imx6dlsabreauto_defconfig
+
 Build all components:
 
   make
 
 You will find in ./output/images/ the following files:
-  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb
+  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb or imx6q-sabreauto.dtb or
+    imx6dl-sabreauto.dtb
   - rootfs.ext2
   - rootfs.tar
   - u-boot.imx
@@ -60,6 +74,33 @@ Quick Start Guide for guidance):
   at 115200 bps, 8n1;
 - power on the board.
 
+SABRE Auto
+----------
+
+To boot your newly created system on a SABRE Auto Board (refer to the SABRE for
+Automotive Infotainment Quick Start Guide for guidance):
+- insert the SD card in the CPU card SD card socket J14;
+- Set the S1, S2 and S3 DIP switches and J3 jumper to boot from SD on CPU card.
+  Reference configuration:
+
+    S1
+     1  2   3   4  5   6   7   8   9  10
+    off ON off off ON off off off off off
+
+    S2
+     1   2  3   4
+    off off ON off
+
+    S3
+     1   2  3  4
+    off off ON ON
+
+    J3: 1-2
+
+- connect an RS-232 UART cable to CPU card debug port J18 UART DB9 and
+  connect using a terminal emulator at 115200 bps, 8n1;
+- power on the board.
+
 Enjoy!
 
 References
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
similarity index 85%
copy from configs/freescale_imx6qsabresd_defconfig
copy to configs/freescale_imx6dlsabreauto_defconfig
index 95f29d7..f4fc48a 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -11,7 +11,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.10.17"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # system
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 
 # kernel
 BR2_LINUX_KERNEL=y
@@ -21,14 +21,14 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
+BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabreauto_defconfig
similarity index 86%
copy from configs/freescale_imx6qsabresd_defconfig
copy to configs/freescale_imx6qsabreauto_defconfig
index 95f29d7..0831d24 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -11,7 +11,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.10.17"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # system
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 
 # kernel
 BR2_LINUX_KERNEL=y
@@ -21,14 +21,14 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
+BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-- 
2.1.4
