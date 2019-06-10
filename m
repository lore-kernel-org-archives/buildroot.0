From: Julien Olivain <juju@cotds.org>
Date: Mon, 10 Jun 2019 12:19:24 +0200
Subject: [Buildroot] [PATCH 5/5] configs/imx8mmpico: new defconfig
In-Reply-To: <20190610101924.9124-1-juju@cotds.org>
References: <20190610101924.9124-1-juju@cotds.org>
Message-ID: <20190610101924.9124-6-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 .gitlab-ci.yml                         |  1 +
 DEVELOPERS                             |  2 +
 board/technexion/imx8mmpico/readme.txt | 96 ++++++++++++++++++++++++++
 configs/imx8mmpico_defconfig           | 39 +++++++++++
 4 files changed, 138 insertions(+)
 create mode 100644 board/technexion/imx8mmpico/readme.txt
 create mode 100644 configs/imx8mmpico_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 836944faf5..2557ce16b1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -196,6 +196,7 @@ imx6ulevk_defconfig: { extends: .defconfig }
 imx6ulpico_defconfig: { extends: .defconfig }
 imx7d-sdb_defconfig: { extends: .defconfig }
 imx7dpico_defconfig: { extends: .defconfig }
+imx8mmpico_defconfig: { extends: .defconfig }
 imx8mpico_defconfig: { extends: .defconfig }
 lego_ev3_defconfig: { extends: .defconfig }
 licheepi_zero_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 7025ac69ef..e745197380 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1259,7 +1259,9 @@ N:	Julien Grossholtz <julien.grossholtz@openest.io>
 F:	package/paho-mqtt-c
 
 N:	Julien Olivain <juju@cotds.org>
+F:	board/technexion/imx8mmpico/
 F:	board/technexion/imx8mpico/
+F:	configs/imx8mmpico_defconfig
 F:	configs/imx8mpico_defconfig
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/board/technexion/imx8mmpico/readme.txt b/board/technexion/imx8mmpico/readme.txt
new file mode 100644
index 0000000000..3095d67b2c
--- /dev/null
+++ b/board/technexion/imx8mmpico/readme.txt
@@ -0,0 +1,96 @@
+*********************************
+Technexion i.MX8M Mini Pico board
+*********************************
+
+This file documents the Buildroot support for the Technexion i.MX8M
+Mini Pico board. The Pico i.MX8M Mini system-on-module [1] is present
+in development kits like the Pico Pi i.MX8M Mini [2].
+
+Build
+=====
+
+First, configure Buildroot for the i.MX8M Mini Pico board:
+
+  make imx8mmpico_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl31.bin
+  - boot.vfat
+  - Image
+  - imx8-boot-sd.bin
+  - imx8mm-pico-pi.dtb
+  - imx8mm-pico-pi-ili9881c.dtb
+  - imx8mm-pico-pi-sn65dsi84-hj070na.dtb
+  - lpddr4_pmu_train_fw.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - sdcard.img
+  - u-boot.imx
+
+Flashing sdcard.img on the eMMC
+===============================
+
+i.MX8M Mini Pico board does not have a SD card slot. The storage is an
+eMMC. An easy way to flash the eMMC is to use the u-boot ums
+command. The boards are sold pre-flashed with such a u-boot. It is
+assumed here that the board has already a working u-boot on eMMC and
+jumpers are set to boot on eMMC. See [3].
+
+Jumper configuration for eMMC boot:
+J1: jumper on pins 4 and 6.
+J2: jumper on pins 2 and 4.
+
+In case the board was flashed with a wrong u-boot, or the eMMC is
+erased, u-boot can be loaded by USB Serial Download boot mode, using
+imx-usb-loader. See [3] and [4].
+
+For flashing:
+- Plug the micro USB cable from the Debug USB Port, to your computer
+- Plug the USB Type C to your computer, this will power up the board
+
+In the U-Boot prompt launch:
+
+=> ums 0 mmc 1
+
+This will mount the eMMC content in the host PC as a mass storage device.
+
+To determine the device associated to the eMMC card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+If your system automatically mount some device partitions, make sure
+to unmount them.
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on the eMMC. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the eMMC content. Use with care! ***
+
+This operation can take several minutes, depending on the image
+size. When tested, a 2MB/s transfer rate was observed.
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template.
+
+Boot the i.MX8M Mini Pico board
+===============================
+
+To boot your newly created system:
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board, with USB Type C connector.
+
+Enjoy!
+
+[1]. https://www.technexion.com/products/system-on-modules/pico/pico-compute-modules/detail/PICO-IMX8M-MINI
+[2]. https://www.technexion.com/products/pico-evaluation-kits/detail/PICOPIIMX8MM1GDEV
+[3]. https://www.technexion.com/support/knowledgebase/boot-configuration-settings-for-pico-baseboards/
+[4]. https://www.technexion.com/support/knowledgebase/loading-bootable-software-images-onto-the-emmc-of-picosom-on-pico-pi/
diff --git a/configs/imx8mmpico_defconfig b/configs/imx8mmpico_defconfig
new file mode 100644
index 0000000000..d30dc0672a
--- /dev/null
+++ b/configs/imx8mmpico_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-pico-pi.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux,7ff5de3f5d79c77ab7ecaa6e346ad0e7fb7f0570)/linux-7ff5de3f5d79c77ab7ecaa6e346ad0e7fb7f0570.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="tn_imx8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-pico-pi freescale/imx8mm-pico-pi-ili9881c freescale/imx8mm-pico-pi-sn65dsi84-hj070na"
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-edm,d3391226ba25b1cc6cba7e6c15a2a7e09319b969)/u-boot-edm-d3391226ba25b1cc6cba7e6c15a2a7e09319b969.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mm"
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
-- 
2.21.0
