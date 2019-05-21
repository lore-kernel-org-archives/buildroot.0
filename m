From: jeffrey.kinross at i3pd.com <jeffrey.kinross@i3pd.com>
Date: Tue, 21 May 2019 15:45:34 -0500
Subject: [Buildroot] [PATCH 1/1] configs/imx6ullevk: add imx6ullevk support
Message-ID: <20190521204534.27569-1-jeffrey.kinross@i3pd.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jeffrey Kinross <jeffrey.kinross@i3pd.com>

Signed-off-by: Jeffrey Kinross <jeffrey.kinross@i3pd.com>
---
 board/freescale/imx6ullevk/readme.txt | 64 +++++++++++++++++++++++++++
 configs/imx6ullevk_defconfig          | 38 ++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 board/freescale/imx6ullevk/readme.txt
 create mode 100644 configs/imx6ullevk_defconfig

diff --git a/board/freescale/imx6ullevk/readme.txt b/board/freescale/imx6ullevk/readme.txt
new file mode 100644
index 0000000000..1b10f90621
--- /dev/null
+++ b/board/freescale/imx6ullevk/readme.txt
@@ -0,0 +1,64 @@
+***************************
+Freescale i.MX6ULL EVK board
+***************************
+
+This file documents the Buildroot support for the Freescale i.MX6ULL EVK board.
+
+Please read the i.MX6ULL Evaluation Kit Quick Start Guide [1] for an
+introduction to the board.
+
+Build
+=====
+
+First, configure Buildroot for your i.MX6ULL EVK board:
+
+make imx6ullevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in ./output/images/ the following files:
+  - imx6ull-14x14-evk.dtb
+  - rootfs.ext4
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
+board/freescale/common/imx/genimage.cfg.template.
+
+Boot the i.MX6ULL EVK board
+=========================
+
+To boot your newly created system (refer to the i.MX6ULL EVK Quick Start Guide
+[1] for guidance):
+- insert the microSD card in the microSD slot of the board;
+- verify that your i.MX6ULL EVK board jumpers and switches are set as mentioned
+  in the i.MX6ULL EVK Quick Start Guide [1];
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+[1] https://www.nxp.com/files-static/32bit/doc/brochure/IMX6ULLQSG.pdf
diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
new file mode 100644
index 0000000000..85e0f4fe8b
--- /dev/null
+++ b/configs/imx6ullevk_defconfig
@@ -0,0 +1,38 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.44"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6ullevk"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_USE_DEFCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6ull_14x14_evk"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_DTC=y
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
2.20.1
