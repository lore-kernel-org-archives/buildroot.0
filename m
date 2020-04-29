From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Wed, 29 Apr 2020 11:12:25 +0200
Subject: [Buildroot] [PATCH v2 5/5] configs/freescale_imx8mnevk: new
 defconfig
In-Reply-To: <1588151545-9346-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1588151545-9346-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1588151545-9346-6-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the i.MX8M Nano EVK Board [1].

The final boot image is created from uboot and firmware binaries in post
image script board/freescale/common/imx/imx8-bootloader-prepare.sh

Note that this config is based on 4.19.35_1.1.0 ; hence, the kernel
configuration needs host-openssl to build.

[1] https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/evaluation-kit-for-the-i-mx-8m-nano-applications-processor:8MNANOD4-EVK

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
---
v2:
  - reword commit title about uboot.imx generation: sentence removed (Gary)
  - replace link which was confusing because mentioning LPD4 when DDR4
    EVK is actually available (suggested by Gary)

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 .gitlab-ci.yml                        |  1 +
 DEVELOPERS                            |  4 ++
 board/freescale/imx8mnevk/readme.txt  | 74 +++++++++++++++++++++++++++++++++++
 configs/freescale_imx8mnevk_defconfig | 43 ++++++++++++++++++++
 4 files changed, 122 insertions(+)
 create mode 100644 board/freescale/imx8mnevk/readme.txt
 create mode 100644 configs/freescale_imx8mnevk_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fa8e077..0bf8a73 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -190,6 +190,7 @@ freescale_imx8mmevk_defconfig: { extends: .defconfig }
 freescale_imx8mqevk_defconfig: { extends: .defconfig }
 freescale_imx8qmmek_defconfig: { extends: .defconfig }
 freescale_imx8qxpmek_defconfig: { extends: .defconfig }
+freescale_imx8mnevk_defconfig: { extends: .defconfig }
 freescale_p1025twr_defconfig: { extends: .defconfig }
 freescale_t1040d4rdb_defconfig: { extends: .defconfig }
 freescale_t2080_qds_rdb_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index cc72b28..6fb2d84 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2402,6 +2402,10 @@ F:	package/mtdev2tuio/
 N:	Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
 F:	package/libhttpserver/
 
+N:	Stephane Viau <stephane.viau@oss.nxp.com>
+F:	board/freescale/imx8mnevk/
+F:	configs/freescale_imx8mnevk_defconfig
+
 N:	Steve Calfee <stevecalfee@gmail.com>
 F:	package/python-pymysql/
 F:	package/python-pyratemp/
diff --git a/board/freescale/imx8mnevk/readme.txt b/board/freescale/imx8mnevk/readme.txt
new file mode 100644
index 0000000..379d851
--- /dev/null
+++ b/board/freescale/imx8mnevk/readme.txt
@@ -0,0 +1,74 @@
+***************************
+Freescale i.MX8MN EVK board
+***************************
+
+This file documents the Buildroot support for the i.MX8M Nano EVK board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX8MN EVK board:
+
+  make freescale_imx8mnevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl31.bin
+  - boot.vfat
+  - ddr4_201810_fw.bin
+  - ddr_fw.bin
+  - fsl-imx8mn-ddr4-evk.dtb
+  - Image
+  - imx8-boot-sd.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - signed_hdmi_imx8m.bin
+  - u-boot.bin
+  - u-boot.imx
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
+Boot the i.MX8MN EVK board
+==========================
+
+To boot your newly created system (refer to the i.MX8MNano EVK Quick Start Guide
+[1] for guidance):
+- insert the SD card in the SD slot of the board;
+- Configure the switches as follows (X = "don't care"):
+SW1101:	1100XXXXXX [D1-D10]
+SW1102:	XXXXXXXXXX [D1-D10]
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+[1] https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/evaluation-kit-for-the-i-mx-8m-nano-applications-processor:8MNANOD4-EVK
diff --git a/configs/freescale_imx8mnevk_defconfig b/configs/freescale_imx8mnevk_defconfig
new file mode 100644
index 0000000..a859d1c
--- /dev/null
+++ b/configs/freescale_imx8mnevk_defconfig
@@ -0,0 +1,43 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8mn-ddr4-evk.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8mn-ddr4-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_FIRMWARE_DDRFW_DDR4=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_ddr4_evk"
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
-- 
2.7.4
