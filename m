From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:16:44 +0100
Subject: [Buildroot] [git commit] configs/freescale_imx8qmmek: new defconfig
Message-ID: <20200309140909.4E94C80426@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ded657da113c13e36d1d9e6ac0314a5f290b9a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch documents the Buildroot support for the NXP i.MX8QM MEK board.

You will find a reference to the board on nxp.com:
https://www.nxp.com/design/development-boards/i.mx-evaluation-and-development-boards/i.mx-8quadmax-multisensory-enablement-kit-mek:MCIMX8QM-CPU

You can also find the get started guide here:
https://www.nxp.com/document/guide/get-started-with-the-i.mx-8quadmax-mek:GS-iMX-8QM-MEK

Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Tested-by: Julien Olivain <julien.olivain@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                        |  1 +
 DEVELOPERS                            |  4 ++
 board/freescale/imx8qmmek/readme.txt  | 76 +++++++++++++++++++++++++++++++++++
 configs/freescale_imx8qmmek_defconfig | 38 ++++++++++++++++++
 4 files changed, 119 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a6436a8417..9f74ac8ced 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -180,6 +180,7 @@ freescale_imx6sxsabresd_defconfig: { extends: .defconfig }
 freescale_imx7dsabresd_defconfig: { extends: .defconfig }
 freescale_imx8mmevk_defconfig: { extends: .defconfig }
 freescale_imx8mqevk_defconfig: { extends: .defconfig }
+freescale_imx8qmmek_defconfig: { extends: .defconfig }
 freescale_imx8qxpmek_defconfig: { extends: .defconfig }
 freescale_p1025twr_defconfig: { extends: .defconfig }
 freescale_t1040d4rdb_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index dbc14f114a..8085cfb83d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1513,6 +1513,10 @@ F:	package/python-simplejson/
 F:	package/python-versiontools/
 F:	package/wilc1000-firmware/
 
+N:	Maeva Manuel <maeva.manuel@oss.nxp.com>
+F:	board/freescale/imx8qmmek/
+F:	configs/freescale_imx8qmmek_defconfig
+
 N:	Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
 F:	package/ffmpeg/
 F:	package/mpv/
diff --git a/board/freescale/imx8qmmek/readme.txt b/board/freescale/imx8qmmek/readme.txt
new file mode 100644
index 0000000000..b6bb3c4765
--- /dev/null
+++ b/board/freescale/imx8qmmek/readme.txt
@@ -0,0 +1,76 @@
+***************************
+Freescale i.MX8QM MEK board
+***************************
+
+This file documents the Buildroot support for the NXP i.MX8QM MEK board.
+
+You will find a reference to the board on nxp.com:
+https://www.nxp.com/design/development-boards/i.mx-evaluation-and-development-boards/i.mx-8quadmax-multisensory-enablement-kit-mek:MCIMX8QM-CPU
+
+You can also find the get started guide here:
+https://www.nxp.com/document/guide/get-started-with-the-i.mx-8quadmax-mek:GS-iMX-8QM-MEK
+
+Build
+=====
+
+First, configure Buildroot for the i.MX8QM MEK board:
+
+$ make freescale_imx8qmmek_defconfig
+
+Build all components:
+
+$ make
+
+You will find in output/images/ the following files:
+  - ahab-container.img
+  - bl31.bin
+  - boot.vfat
+  - fsl-imx8qm-mek.dtb
+  - Image
+  - imx8-boot-sd.bin
+  - mkimg.commit
+  - mx8qm-mek-scfw-tcm.bin
+  - mx8qm-val-scfw-tcm.bin
+  - mx8qm-a0-ddr4-scfw-tcm.bin
+  - mx8qm-a0-mek-scfw-tcm.bin
+  - mx8qm-a0-val-scfw-tcm.bin
+  - mx8qm-ddr4-scfw-tcm.bin
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
+Boot the i.MX8QM MEK board
+==========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the boot switch as follows:
+SW2:	OFF	OFF	ON	ON	OFF	OFF
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/freescale_imx8qmmek_defconfig b/configs/freescale_imx8qmmek_defconfig
new file mode 100644
index 0000000000..ddc4767e08
--- /dev/null
+++ b/configs/freescale_imx8qmmek_defconfig
@@ -0,0 +1,38 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8qm-mek.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8qm-mek"
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_IMX_SC_FIRMWARE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8qm"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8qm_mek"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
