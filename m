From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 29 Jan 2017 18:10:17 -0200
Subject: [Buildroot] [PATCH] configs/imx6q-sabresd: Add new defconfig
Message-ID: <1485720617-23089-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add imx6q-sabresd_defconfig which supports imx6q-sabresd board using
mainline U-Boot and mainline kernel.

Keep freescale_imx6qsabresd_defconfig for those who want to run U-Boot and
kernel versions from NXP.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx6q-sabresd/readme.txt | 57 ++++++++++++++++++++++++++++++++
 configs/imx6q-sabresd_defconfig          | 36 ++++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 board/freescale/imx6q-sabresd/readme.txt
 create mode 100644 configs/imx6q-sabresd_defconfig

diff --git a/board/freescale/imx6q-sabresd/readme.txt b/board/freescale/imx6q-sabresd/readme.txt
new file mode 100644
index 0000000..10e973c
--- /dev/null
+++ b/board/freescale/imx6q-sabresd/readme.txt
@@ -0,0 +1,57 @@
+*******************************
+Freescale i.MX6Q Sabre SD board
+*******************************
+
+This file documents the Buildroot support for the Freescale i.MX6Q Sabre SD
+board.
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX6Q Sabre SD board:
+
+  make imx6q-sabresd_defconfig
+
+Build all components:
+
+  make
+
+You will find the following files in output/images/ :
+  - imx6q-sabresd.dtb
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
+board/freescale/common/imx/genimage.cfg.template.
+
+Boot the i.MX6Q Sabre SD board
+==============================
+
+To boot your newly created system:
+- insert the SD card in the SD3 slot of the board (close to the HDMI connector);
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/imx6q-sabresd_defconfig b/configs/imx6q-sabresd_defconfig
new file mode 100644
index 0000000..1491668
--- /dev/null
+++ b/configs/imx6q-sabresd_defconfig
@@ -0,0 +1,36 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
-- 
2.7.4
