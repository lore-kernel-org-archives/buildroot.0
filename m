From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 21:22:47 +0200
Subject: [Buildroot] [git commit] configs/freescale_imx8mmevk: new defconfig
Message-ID: <20190617192312.196438F680@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb7065fbf98cf3d4478a48335938c438978ced26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                        |  1 +
 DEVELOPERS                            |  2 +
 board/freescale/imx8mmevk/readme.txt  | 71 +++++++++++++++++++++++++++++++++++
 configs/freescale_imx8mmevk_defconfig | 42 +++++++++++++++++++++
 4 files changed, 116 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2557ce16b1..087bfa7602 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -176,6 +176,7 @@ freescale_imx6qsabreauto_defconfig: { extends: .defconfig }
 freescale_imx6qsabresd_defconfig: { extends: .defconfig }
 freescale_imx6sxsabresd_defconfig: { extends: .defconfig }
 freescale_imx7dsabresd_defconfig: { extends: .defconfig }
+freescale_imx8mmevk_defconfig: { extends: .defconfig }
 freescale_imx8mqevk_defconfig: { extends: .defconfig }
 freescale_imx8qxpmek_defconfig: { extends: .defconfig }
 freescale_p1025twr_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index b64f8b8a94..62aacc1fd0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -925,6 +925,8 @@ F:	package/python-pycli/
 F:	package/python-pyyaml/
 
 N:	Gilles Talis <gilles.talis@gmail.com>
+F:	board/freescale/imx8mmevk/
+F:	configs/freescale_imx8mmevk_defconfig
 F:	package/fdk-aac/
 F:	package/httping/
 F:	package/iozone/
diff --git a/board/freescale/imx8mmevk/readme.txt b/board/freescale/imx8mmevk/readme.txt
new file mode 100644
index 0000000000..7b69405d30
--- /dev/null
+++ b/board/freescale/imx8mmevk/readme.txt
@@ -0,0 +1,71 @@
+***************************
+Freescale i.MX8MM EVK board
+***************************
+
+This file documents the Buildroot support for the Freescale i.MX8MM
+EVK board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX8MM EVK board:
+
+  make freescale_imx8mmevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl31.bin
+  - boot.vfat
+  - fsl-imx8mm-evk.dtb
+  - Image
+  - imx8-boot-sd.bin
+  - lpddr4_pmu_train_fw.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.bin
+  - u-boot.imx
+  - u-boot-nodtb.bin
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
+Boot the i.MX8MM EVK board
+==========================
+
+To boot your newly created system (refer to the i.MX8MMini EVK Quick Start Guide
+[1] for guidance):
+- insert the SD card in the SD slot of the board;
+- Configure the switches as follows:
+SW1101:	0110110010 [D1-D10]
+SW1102:	0001101000 [D1-D10]
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+[1] https://www.nxp.com/document/guide/Get-Started-with-the-i.MX-8M-Mini-EVK:GS-iMX-8M-Mini-EVK
diff --git a/configs/freescale_imx8mmevk_defconfig b/configs/freescale_imx8mmevk_defconfig
new file mode 100644
index 0000000000..1acb3a694b
--- /dev/null
+++ b/configs/freescale_imx8mmevk_defconfig
@@ -0,0 +1,42 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8mm-evk.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8mm-evk"
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
