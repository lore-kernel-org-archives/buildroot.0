From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 23:47:58 +0200
Subject: [Buildroot] [git commit] configs/microchip_sama5d27_wlsom1_ek: new
 defconfigs
Message-ID: <20200714214452.284E386E5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f90c0aee2f5a9ac5413ef2991ef378cd7400030
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the new SAMA5D27 WLSOM1 Evaluation Kit with linux4sam_6.2
components.  Update README file with new defconfigs and new
packages/website.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 +
 DEVELOPERS                                         |  1 +
 board/atmel/readme.txt                             | 30 ++++----
 board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg    | 31 ++++++++
 configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig | 30 ++++++++
 .../microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 85 ++++++++++++++++++++++
 6 files changed, 165 insertions(+), 14 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f65549f4dc..d60a50f5c5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -217,6 +217,8 @@ lafrite_defconfig: { extends: .defconfig }
 lego_ev3_defconfig: { extends: .defconfig }
 licheepi_zero_defconfig: { extends: .defconfig }
 linksprite_pcduino_defconfig: { extends: .defconfig }
+microchip_sama5d27_wlsom1_ek_mmc_defconfig: { extends: .defconfig }
+microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig: { extends: .defconfig }
 minnowboard_max-graphical_defconfig: { extends: .defconfig }
 minnowboard_max_defconfig: { extends: .defconfig }
 mx25pdk_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index efbb676b48..e9cab3c6a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1539,6 +1539,7 @@ N:	Ludovic Desroches <ludovic.desroches@microchip.com>
 F:	board/atmel/
 F:	configs/at91*
 F:	configs/atmel_*
+F:	configs/microchip_*
 F:	package/fb-test-app/
 F:	package/python-json-schema-validator/
 F:	package/python-keyring/
diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
index 4f90e4b4cc..7ebb5e830e 100644
--- a/board/atmel/readme.txt
+++ b/board/atmel/readme.txt
@@ -1,6 +1,6 @@
-This document explains how to set up a basic Buildroot system on various
-Atmel boards. Additional details can also be found on the Linux4SAM website:
-http://www.at91.com/linux4sam/bin/view/Linux4SAM/
+This document explains how to set up a basic Buildroot system on
+various Atmel/Microchip boards. Additional details can also be found
+on the Linux4SAM website: http://www.linux4sam.org
 
 This guide covers the following configurations:
  - at91sam9g45m10ek_defconfig
@@ -19,6 +19,8 @@ This guide covers the following configurations:
  - atmel_sama5d4_xplained_mmc_dev_defconfig
  - atmel_sama5d2_xplained_mmc_defconfig
  - atmel_sama5d2_xplained_mmc_dev_defconfig
+ - microchip_sama5d27_wlsom1_ek_mmc_defconfig
+ - microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
 
 These configurations will use AT91Bootstrap, u-boot and a linux kernel from
 the git trees maintained by Atmel.
@@ -29,23 +31,23 @@ tests the features of the SoC:
 - FFMPEG to record video from the ISI/ISC
 - I2C, SPI, CAN, etc. tools
 - modetest for LCD screens, HDMI
-- Wilc1000 firmware for the Atmel Wireless sdio module
+- Wilc1000/Wilc3000 firmware for the Atmel Wireless sdio module
 - SSH for convenience
 - GDB/GDB server for debug
 
 Configuring and building Buildroot
 ==================================
 
-For most configurations listed above, the Buildroot configuration
-assumes the system will be flashed on NAND. In this case, after
-building Buildroot, follow the instructions in the "Flashing the NAND
-using SAM-BA" section below.
-
-For the Xplained boards, an alternative Buildroot configuration is
+For the Xplained/Evaluation Kit boards, the Buildroot configuration is
 provided to boot from an SD card. Those configurations are labeled as
 'mmc'. In this case, after building Buildroot, follow the instructions
 in the "Preparing the SD card" section.
 
+For the other configurations listed above, the Buildroot configuration
+assumes the system will be flashed on NAND. In this case, after
+building Buildroot, follow the instructions in the "Flashing the NAND
+using SAM-BA" section below.
+
 To configure and build Buildroot, run:
 
   make <board>_defconfig
@@ -144,10 +146,10 @@ lost. To copy the image on the SD card:
 
 dd if=output/images/sdcard.img of=/dev/mmcblk0
 
-Insert your SD card in your Xplained board, and enjoy. The default
-U-Boot environment will load properly the kernel and Device Tree blob
-from the first partition of the SD card, so everything works
-automatically.
+Insert your SD card in your Xplained/Evaluation Kit board, and
+enjoy. The default U-Boot environment will load properly the kernel
+and Device Tree blob from the first partition of the SD card, so
+everything works automatically.
 
 By default a 16MB FAT partition is created. It contains at91bootstrap,
 u-boot, the kernel image and all dtb variants for your board. The dtb
diff --git a/board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg b/board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg
new file mode 100644
index 0000000000..dce32524e9
--- /dev/null
+++ b/board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg
@@ -0,0 +1,31 @@
+# Image for SD card boot on Microchip SAMA5D27 WLSOM1 EK
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91-sama5d27_wlsom1_ek.dtb",
+			"boot.bin",
+			"u-boot.bin"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 1M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
new file mode 100644
index 0000000000..3bba4f6e3a
--- /dev/null
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
@@ -0,0 +1,30 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_wlsom1_ek"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_wlsom1_eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d27_wlsom1_ek_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
new file mode 100644
index 0000000000..200b365353
--- /dev/null
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
@@ -0,0 +1,85 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_PTHREAD_DEBUG=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_wlsom1_ek"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_ALSA_UTILS=y
+BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
+BR2_PACKAGE_ALSA_UTILS_APLAY=y
+BR2_PACKAGE_FFMPEG=y
+BR2_PACKAGE_FFMPEG_GPL=y
+BR2_PACKAGE_FFMPEG_SWSCALE=y
+BR2_PACKAGE_MPG123=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_GZIP=y
+BR2_PACKAGE_UNZIP=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_ZIP=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_LMBENCH=y
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_DOSFSTOOLS_FATLABEL=y
+BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT=y
+BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
+BR2_PACKAGE_MMC_UTILS=y
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_EVTEST=y
+BR2_PACKAGE_I2C_TOOLS=y
+BR2_PACKAGE_SETSERIAL=y
+BR2_PACKAGE_SPI_TOOLS=y
+BR2_PACKAGE_USBUTILS=y
+BR2_PACKAGE_LIBSYSFS=y
+BR2_PACKAGE_LIBDRM=y
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+BR2_PACKAGE_DTC=y
+BR2_PACKAGE_DTC_PROGRAMS=y
+BR2_PACKAGE_ARGP_STANDALONE=y
+BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BRIDGE_UTILS=y
+BR2_PACKAGE_CAN_UTILS=y
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_IPERF=y
+BR2_PACKAGE_IPROUTE2=y
+BR2_PACKAGE_IPTABLES=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_LRZSZ=y
+BR2_PACKAGE_MII_DIAG=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_WGET=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_BASH=y
+BR2_PACKAGE_HTOP=y
+BR2_PACKAGE_VIM=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_wlsom1_eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d27_wlsom1_ek_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
