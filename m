From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Thu, 18 Mar 2021 14:53:35 +0100
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx8mpevk: new defconfig
Message-ID: <20210318135335.31898-1-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the NXP i.MX 8MPlus EVK board [1].

The final boot image is created from uboot and firmware binaries in post
image script board/freescale/common/imx/imx8-bootloader-prepare.sh

This first support is based on NXP's 5.4.70_2.3.0 BSP.

[1] https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/evaluation-kit-for-the-i-mx-8m-plus-applications-processor:8MPLUSLPD4-EVK

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 DEVELOPERS                                    |  2 +
 .../common/imx/imx8-bootloader-prepare.sh     |  7 ++
 board/freescale/common/imx/post-image.sh      |  2 +
 board/freescale/imx8mpevk/readme.txt          | 71 +++++++++++++++++++
 configs/freescale_imx8mpevk_defconfig         | 42 +++++++++++
 package/freescale-imx/Config.in               |  8 ++-
 package/freescale-imx/firmware-imx/Config.in  |  2 +
 .../freescale-imx/imx-vpu-hantro/Config.in    |  2 +-
 package/imx-mkimage/imx-mkimage.mk            |  2 +-
 9 files changed, 135 insertions(+), 3 deletions(-)
 create mode 100644 board/freescale/imx8mpevk/readme.txt
 create mode 100644 configs/freescale_imx8mpevk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 6a7e88039e..e1b2fb6c81 100644
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
diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index cb7c37bfcd..56f65e3126 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -29,6 +29,13 @@ main ()
 		rm -f ${BINARIES_DIR}/u-boot.its
 
 		${HOST_DIR}/bin/mkimage_imx8 -v v2 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x912000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP=y$" ${BR2_CONFIG}; then
+		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00970000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
+		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
+		rm -f ${BINARIES_DIR}/u-boot.its
+
+		${HOST_DIR}/bin/mkimage_imx8 -v v2 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x920000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 	else
 		${HOST_DIR}/bin/mkimage_imx8 -commit > ${BINARIES_DIR}/mkimg.commit
 		cat ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/mkimg.commit > ${BINARIES_DIR}/u-boot-hash.bin
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 06ccaac3a4..0c2ef53dc6 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -40,6 +40,8 @@ genimage_type()
 		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP=y$" ${BR2_CONFIG}; then
+		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" ${BR2_CONFIG}; then
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
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b0c7de8436..bedd05a471 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -52,6 +52,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	bool "imx8mn"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	bool "imx8mp"
+
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
 endchoice
@@ -72,6 +75,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX8MQ" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default "IMX8MN" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+	default "IMX8MP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	bool
@@ -83,7 +87,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	bool
@@ -94,6 +99,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 8810779799..0bd8000b50 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 config BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME
 	string
@@ -48,6 +49,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 
diff --git a/package/freescale-imx/imx-vpu-hantro/Config.in b/package/freescale-imx/imx-vpu-hantro/Config.in
index 25ce50ffd7..45295940dc 100644
--- a/package/freescale-imx/imx-vpu-hantro/Config.in
+++ b/package/freescale-imx/imx-vpu-hantro/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_IMX_VPU_HANTRO
 	help
 	  Library of userspace helpers specific for the NXP i.MX SoC
 	  integrating a Hantro Video Processing Unit (VPU) such as the
-	  i.MX8MQ/i.MX8MM.
+	  i.MX8MQ/i.MX8MM/i.MX8MP.
 	  It requires a kernel that includes the i.MX specific headers
 	  to be built.
 
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 626e3d873f..17ba3596f7 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -11,7 +11,7 @@ IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = COPYING
 HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib
 
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)
 # i.MX8M needs a different binary
 define HOST_IMX_MKIMAGE_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
-- 
2.29.2
