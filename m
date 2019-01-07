From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon,  7 Jan 2019 19:14:38 +0100
Subject: [Buildroot] [PATCH v2 6/6] configs/freescale_imx8qxpmek: New
 defconfig
In-Reply-To: <20190107181438.23857-1-nerv@dawncrow.de>
References: <20190107181438.23857-1-nerv@dawncrow.de>
Message-ID: <20190107181438.23857-7-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 .gitlab-ci.yml                         |  1 +
 board/freescale/imx8qxpmek/readme.txt  | 67 ++++++++++++++++++++++++++
 configs/freescale_imx8qxpmek_defconfig | 40 +++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 board/freescale/imx8qxpmek/readme.txt
 create mode 100644 configs/freescale_imx8qxpmek_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 79daebf160..6f456122a5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -143,6 +143,7 @@ freescale_imx6qsabresd_defconfig: *defconfig
 freescale_imx6sxsabresd_defconfig: *defconfig
 freescale_imx7dsabresd_defconfig: *defconfig
 freescale_imx8mqevk_defconfig: *defconfig
+freescale_imx8mqxpmek_defconfig: *defconfig
 freescale_p1025twr_defconfig: *defconfig
 freescale_t1040d4rdb_defconfig: *defconfig
 friendlyarm_nanopi_a64_defconfig: *defconfig
diff --git a/board/freescale/imx8qxpmek/readme.txt b/board/freescale/imx8qxpmek/readme.txt
new file mode 100644
index 0000000000..45f7915fe4
--- /dev/null
+++ b/board/freescale/imx8qxpmek/readme.txt
@@ -0,0 +1,67 @@
+***************************
+Freescale i.MX8QXP MEK board
+***************************
+
+This file documents the Buildroot support for the Freescale i.MX8QXP
+MEK board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX8QXP MEK board:
+
+  make freescale_imx8qxpmek_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - ahab-container.img
+  - bl31.bin
+  - boot.vfat
+  - fsl-imx8qxp-mek.dtb
+  - Image
+  - imx8-boot-sd.bin
+  - mkimg.commit
+  - mx8qx-mek-scfw-tcm.bin
+  - mx8qx-val-scfw-tcm.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot-atf.bin
+  - u-boot.bin
+  - u-boot-hash.bin
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
+Boot the i.MX8QXP MEK board
+==========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the boot switch as follows:
+SW2:	ON	ON	OFF	OFF
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/freescale_imx8qxpmek_defconfig b/configs/freescale_imx8qxpmek_defconfig
new file mode 100644
index 0000000000..33e2a50dd7
--- /dev/null
+++ b/configs/freescale_imx8qxpmek_defconfig
@@ -0,0 +1,40 @@
+BR2_aarch64=y
+BR2_cortex_a35=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8qxp-mek.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8qxp-mek"
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_IMX_SC_FIRMWARE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8qxp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8qxp_mek"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.17.1
