From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:34:17 +0200
Subject: [Buildroot] [git commit] configs: add Freescale SABRE Auto board
	support
Message-ID: <20150401213451.40C057FD5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aacbdd131b5723b8e090ee8b2dad1843046b3ffe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SABRE Board for Automotive Infotainment (SABRE Auto, a.k.a. SABRE-AI) is
Freescale's evaluation board based on the i.MX 6 ARM Cortex-A9 applications
processor.

Those defconfigs are an adaptation of freescale_imx6{q,dl}sabresd_defconfig for
SABRE Auto, and are thus based on Freescale "official" git repo on
git.freescale.com and SW release 3.10.17_1.0.0_ga.

Signed-off-by: Vincent Stehl?? <vincent.stehle@freescale.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/imx6sabre/readme.txt        |   45 +++++++++++++++++++++++++-
 configs/freescale_imx6dlsabreauto_defconfig |   35 +++++++++++++++++++++
 configs/freescale_imx6qsabreauto_defconfig  |   35 +++++++++++++++++++++
 3 files changed, 113 insertions(+), 2 deletions(-)

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
diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
new file mode 100644
index 0000000..f4fc48a
--- /dev/null
+++ b/configs/freescale_imx6dlsabreauto_defconfig
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
+BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
new file mode 100644
index 0000000..0831d24
--- /dev/null
+++ b/configs/freescale_imx6qsabreauto_defconfig
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
+BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
