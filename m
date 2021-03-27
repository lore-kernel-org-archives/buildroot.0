From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Mar 2021 14:23:16 +0100
Subject: [Buildroot] [git commit] configs/freescale_imx8mpevk: new defconfig
Message-ID: <20210327125840.BC3D4889B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8e173da6fb02b2fd4c1960757df958b4a3230bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for the NXP i.MX 8M Plus EVK board [1].

The final boot image is created from uboot and firmware binaries in post
image script board/freescale/common/imx/imx8-bootloader-prepare.sh.

This first support is based on NXP's 5.4.70_2.3.0 BSP.

[1] https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/evaluation-kit-for-the-i-mx-8m-plus-applications-processor:8MPLUSLPD4-EVK

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                            |  2 +
 board/freescale/imx8mpevk/readme.txt  | 71 +++++++++++++++++++++++++++++++++++
 configs/freescale_imx8mpevk_defconfig | 42 +++++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4289fa477c..ab05b352e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2457,7 +2457,9 @@ F:	package/mtdev/
 
 N:	Stephane Viau <stephane.viau@oss.nxp.com>
 F:	board/freescale/imx8mnevk/
+F:	board/freescale/imx8mpevk/
 F:	configs/freescale_imx8mnevk_defconfig
+F:	configs/freescale_imx8mpevk_defconfig
 
 N:	Steve Calfee <stevecalfee@gmail.com>
 F:	package/python-pymysql/
diff --git a/board/freescale/imx8mpevk/readme.txt b/board/freescale/imx8mpevk/readme.txt
new file mode 100644
index 0000000000..dfc95af3ea
--- /dev/null
+++ b/board/freescale/imx8mpevk/readme.txt
@@ -0,0 +1,71 @@
+*********************
+NXP i.MX8MP EVK board
+*********************
+
+This file documents the Buildroot support for the i.MX 8M Plus EVK board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX 8M Plus EVK board:
+
+  make freescale_imx8mpevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl31.bin
+  - boot.vfat
+  - ddr_fw.bin
+  - Image
+  - imx8-boot-sd.bin
+  - imx8mp-evk.dtb
+  - lpddr4_pmu_train_fw.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.bin
+  - u-boot.itb
+  - u-boot-nodtb.bin
+  - u-boot-spl.bin
+  - u-boot-spl-ddr.bin
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
+board/freescale/common/imx/genimage.cfg.template_imx8.
+
+Boot the i.MX 8M Plus EVK board
+===============================
+
+To boot your newly created system (refer to the i.MX 8M Plus EVK Documentation
+[1] for guidance):
+- insert the SD card in the SD slot of the board;
+- Configure the switches as follows (X = "don't care"):
+SW4:	0011 SW4[1-4]
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+[1] https://www.nxp.com/document/guide/get-started-with-the-i-mx-8m-plus-evk:GS-iMX-8M-Plus-EVK
diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
new file mode 100644
index 0000000000..b2369fecd0
--- /dev/null
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -0,0 +1,42 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mp-evk.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
