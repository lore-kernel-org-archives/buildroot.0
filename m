From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 22 Nov 2017 11:21:12 -0200
Subject: [Buildroot] [PATCH] configs/imx6sx-sdb: Add new defconfig
Message-ID: <1511356872-8417-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Add support for imx6sx-sdb_defconfig that allows booting a mainline
kernel and mainline U-Boot.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 .gitlab-ci.yml                       |  1 +
 DEVELOPERS                           |  1 +
 board/freescale/imx6sxsdb/readme.txt | 14 ++++++++++++++
 configs/imx6sx-sdb_defconfig         | 26 ++++++++++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 board/freescale/imx6sxsdb/readme.txt
 create mode 100644 configs/imx6sx-sdb_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5f859fa..a7a4865 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -127,6 +127,7 @@ imx6-sabreauto_defconfig: *defconfig
 imx6-sabresd_defconfig: *defconfig
 imx6-sabresd_qt5_defconfig: *defconfig
 imx6slevk_defconfig: *defconfig
+imx6sxsdb_defconfig: *defconfig
 imx6ulpico_defconfig: *defconfig
 imx7dpico_defconfig: *defconfig
 lego_ev3_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index ad481f2..df61a01 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -578,6 +578,7 @@ F:	board/warp7/
 F:	configs/freescale_imx*
 F:	configs/imx6-sabresd*
 F:	configs/imx6slevk_defconfig
+F:	configs/imx6sxsdb_defconfig
 F:	configs/imx6ulpico_defconfig
 F:	configs/mx6cubox_defconfig
 F:	configs/mx6sx_udoo_neo_defconfig
diff --git a/board/freescale/imx6sxsdb/readme.txt b/board/freescale/imx6sxsdb/readme.txt
new file mode 100644
index 0000000..2779075
--- /dev/null
+++ b/board/freescale/imx6sxsdb/readme.txt
@@ -0,0 +1,14 @@
+NXP i.MX6SX SDB board
+---------------------
+
+To build a minimal support for this board:
+
+$ make imx6sx-sdb_defconfig
+$ make
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be flashed into the SD card:
+
+$ sudo dd if=output/images/sdcard.img of=/dev/<sd-card-device>; sync
+
+Then insert the SD card into the SD4 boot slot and boot the board.
diff --git a/configs/imx6sx-sdb_defconfig b/configs/imx6sx-sdb_defconfig
new file mode 100644
index 0000000..baead34
--- /dev/null
+++ b/configs/imx6sx-sdb_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb imx6sx-sdb-reva"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
