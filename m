From: Julien Olivain <juju@cotds.org>
Date: Sun, 10 Mar 2019 17:30:42 +0100
Subject: [Buildroot] [PATCH 1/1] configs/imx8mpico: new defconfig
Message-ID: <20190310163043.4217-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 .gitlab-ci.yml                        |  1 +
 DEVELOPERS                            |  4 ++
 board/technexion/imx8mpico/readme.txt | 95 +++++++++++++++++++++++++++
 configs/imx8mpico_defconfig           | 39 +++++++++++
 4 files changed, 139 insertions(+)
 create mode 100644 board/technexion/imx8mpico/readme.txt
 create mode 100644 configs/imx8mpico_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0bec55c19f..ef2f3d82bd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -162,6 +162,7 @@ imx6ulevk_defconfig: { extends: .defconfig }
 imx6ulpico_defconfig: { extends: .defconfig }
 imx7d-sdb_defconfig: { extends: .defconfig }
 imx7dpico_defconfig: { extends: .defconfig }
+imx8mpico_defconfig: { extends: .defconfig }
 lego_ev3_defconfig: { extends: .defconfig }
 linksprite_pcduino_defconfig: { extends: .defconfig }
 minnowboard_max-graphical_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index bff5a58a5b..07c4daf832 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1229,6 +1229,10 @@ F:	package/lldpd/
 N:	Julien Grossholtz <julien.grossholtz@openest.io>
 F:	package/paho-mqtt-c
 
+N:	Julien Olivain <juju@cotds.org>
+F:	board/technexion/imx8mpico/
+F:	configs/imx8mpico_defconfig
+
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
 F:	package/easy-rsa/
diff --git a/board/technexion/imx8mpico/readme.txt b/board/technexion/imx8mpico/readme.txt
new file mode 100644
index 0000000000..1a04e44572
--- /dev/null
+++ b/board/technexion/imx8mpico/readme.txt
@@ -0,0 +1,95 @@
+****************************
+Technexion i.MX8M Pico board
+****************************
+
+This file documents the Buildroot support for the Technexion i.MX8M
+Pico board. The Pico i.MX8M system-on-module [1] is present in
+development kits like the Pico Pi i.MX8M [2].
+
+Build
+=====
+
+First, configure Buildroot for the i.MX8M Pico board:
+
+  make imx8mpico_defconfig
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
+  - lpddr4_pmu_train_fw.bin
+  - pico-8m-dcss-ili9881c.dtb
+  - pico-8m.dtb
+  - rootfs.ext4
+  - sdcard.img
+  - signed_hdmi_imx8m.bin
+  - u-boot.imx
+
+Flashing sdcard.img on the eMMC
+===============================
+
+i.MX8M Pico board does not have a SD card slot. The storage is an
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
+=> ums 0 mmc 0
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
+Boot the i.MX8M Pico board
+==========================
+
+To boot your newly created system:
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board, with USB Type C connector.
+
+Enjoy!
+
+[1]. https://www.technexion.com/products/system-on-modules/pico/pico-compute-modules/detail/PICO-IMX8M
+[2]. https://www.technexion.com/products/system-on-modules/pico-evaluation-kits/detail/PICO-PI-IMX8M-BASIC
+[3]. https://www.technexion.com/support/knowledgebase/boot-configuration-settings-for-pico-baseboards/
+[4]. https://www.technexion.com/support/knowledgebase/loading-bootable-software-images-onto-the-emmc-of-picosom-on-pico-pi/
diff --git a/configs/imx8mpico_defconfig b/configs/imx8mpico_defconfig
new file mode 100644
index 0000000000..f22fad0730
--- /dev/null
+++ b/configs/imx8mpico_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/pico-8m.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux,d69606b85de50b01e7c028ea2188308ab6612c80)/linux-d69606b85de50b01e7c028ea2188308ab6612c80.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="tn_imx8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/pico-8m freescale/pico-8m-dcss-ili9881c"
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.9.88_2.2.0_8qxp_beta2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-edm,2fb0ee63229919807737b83d49f5813f594939ac)/u-boot-edm-2fb0ee63229919807737b83d49f5813f594939ac.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-8m"
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
2.20.1
