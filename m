From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 23 Nov 2017 12:38:42 -0200
Subject: [Buildroot] [PATCH] configs/imx6ulevk: Add new defconfig
Message-ID: <1511447922-12017-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for imx6ulevk_defconfig that allows booting a mainline
kernel and mainline U-Boot.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 .gitlab-ci.yml                       |  1 +
 DEVELOPERS                           |  1 +
 board/freescale/imx6ulevk/readme.txt | 10 ++++++++++
 configs/imx6ulevk_defconfig          | 37 ++++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 configs/imx6ulevk_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a7a4865..747977d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -128,6 +128,7 @@ imx6-sabresd_defconfig: *defconfig
 imx6-sabresd_qt5_defconfig: *defconfig
 imx6slevk_defconfig: *defconfig
 imx6sxsdb_defconfig: *defconfig
+imx6ulevk_defconfig: *defconfig
 imx6ulpico_defconfig: *defconfig
 imx7dpico_defconfig: *defconfig
 lego_ev3_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index df61a01..f73d7f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -579,6 +579,7 @@ F:	configs/freescale_imx*
 F:	configs/imx6-sabresd*
 F:	configs/imx6slevk_defconfig
 F:	configs/imx6sxsdb_defconfig
+F:	configs/imx6ulevk_defconfig
 F:	configs/imx6ulpico_defconfig
 F:	configs/mx6cubox_defconfig
 F:	configs/mx6sx_udoo_neo_defconfig
diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
index 25b95fe..90355f3 100644
--- a/board/freescale/imx6ulevk/readme.txt
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -12,8 +12,18 @@ Build
 
 First, configure Buildroot for your i.MX6UL EVK board:
 
+In order to to do so there are two supported options:
+
   make freescale_imx6ulevk_defconfig
 
+if you plan to use NXP provided U-Boot and kernel.
+
+or
+
+  make imx6ulevk_defconfig
+
+if you plan to use mainline U-Boot and mainline kernel.
+
 Build all components:
 
   make
diff --git a/configs/imx6ulevk_defconfig b/configs/imx6ulevk_defconfig
new file mode 100644
index 0000000..0ae6b53
--- /dev/null
+++ b/configs/imx6ulevk_defconfig
@@ -0,0 +1,37 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# filesystem / image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.7.4
