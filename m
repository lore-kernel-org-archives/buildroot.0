From: Jeffrey Kinross <jeffrey.kinross@i3pd.com>
Date: Thu, 26 Sep 2019 13:14:20 -0500
Subject: [Buildroot] [PATCH v2] configs/imx6ullevk: new defconfig
 board/freescale/imx6ullevk/readme.txt: new readme for the imx6ullevk board.
 DEVELOPERS: Add myself as the maintainer of imx6ullevk.
In-Reply-To: <20190521204534.27569-1-jeffrey.kinross@i3pd.com>
References: <20190521204534.27569-1-jeffrey.kinross@i3pd.com>
Message-ID: <20190926181419.18710-1-jeffrey.kinross@i3pd.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes v1 -> v2:
 - DEVELOPERS - Add myself as maintainer of configs/imx6ullevk (suggested by Gilles Talis)
 - configs/imx6ullevk - Use the FSL kernel and uboot. Pin the kernel and uboot version (suggested by Thomas Petazzoni)

configs/imx6ullevk: new defconfig
board/freescale/imx6ullevk/readme.txt: new readme for the imx6ullevk board.
DEVELOPERS: Add myself as the maintainer of imx6ullevk.

Add support for imx6ullevk board, using the kernel and uboot from the FSL Community BSP.

Signed-off-by: Jeffrey Kinross <jeffrey.kinross@i3pd.com>
---
 DEVELOPERS                            |  4 ++
 board/freescale/imx6ullevk/readme.txt | 64 +++++++++++++++++++++++++++
 configs/imx6ullevk_defconfig          | 41 +++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 board/freescale/imx6ullevk/readme.txt
 create mode 100644 configs/imx6ullevk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 69d2ed6272..5fa55f506f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1334,6 +1334,10 @@ F:	package/ramsmp/
 N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
 
+N:	Kinross Jeffrey <jeffrey.kinross@i3pd.com>
+F:	board/freescale/imx6ulevk/
+F:	configs/imx6ullevk_defconfig
+
 N:	Koen Martens <gmc@sonologic.nl>
 F:	package/capnproto/
 F:	package/linuxconsoletools/
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
index 0000000000..d38ca9fb9c
--- /dev/null
+++ b/configs/imx6ullevk_defconfig
@@ -0,0 +1,41 @@
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
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Freescale/linux-fslc.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.14-2.0.x-imx"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="imx_v2018.03_4.14.98_2.1.0"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6ull_14x14_evk"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_IMX=y
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
