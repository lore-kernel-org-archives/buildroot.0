From: Eugen Hristev <eugen.hristev@microchip.com>
Date: Tue, 24 Nov 2020 13:19:34 +0200
Subject: [Buildroot] [PATCH] configs/microchip_sam9x60ek: new defconfigs
Message-ID: <20201124111934.83357-1-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the new SAM9X60 Evaluation Kit with linux4sam_2020.04
components.  Update README file with new defconfigs.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 DEVELOPERS                                    |  1 +
 board/atmel/readme.txt                        |  2 +
 board/microchip/sam9x60ek_mmc/genimage.cfg    | 31 ++++++++
 configs/microchip_sam9x60ek_mmc_defconfig     | 27 +++++++
 configs/microchip_sam9x60ek_mmc_dev_defconfig | 77 +++++++++++++++++++
 5 files changed, 138 insertions(+)
 create mode 100644 board/microchip/sam9x60ek_mmc/genimage.cfg
 create mode 100644 configs/microchip_sam9x60ek_mmc_defconfig
 create mode 100644 configs/microchip_sam9x60ek_mmc_dev_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 43cc1b55ae..e214dd68b7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1548,6 +1548,7 @@ F:	configs/olpc_xo175_defconfig
 
 N:	Ludovic Desroches <ludovic.desroches@microchip.com>
 F:	board/atmel/
+F:	board/microchip/
 F:	configs/at91*
 F:	configs/atmel_*
 F:	configs/microchip_*
diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
index 7ebb5e830e..1f21dd15e4 100644
--- a/board/atmel/readme.txt
+++ b/board/atmel/readme.txt
@@ -21,6 +21,8 @@ This guide covers the following configurations:
  - atmel_sama5d2_xplained_mmc_dev_defconfig
  - microchip_sama5d27_wlsom1_ek_mmc_defconfig
  - microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
+ - microchip_sam9x60ek_mmc_defconfig
+ - microchip_sam9x60ek_mmc_dev_defconfig
 
 These configurations will use AT91Bootstrap, u-boot and a linux kernel from
 the git trees maintained by Atmel.
diff --git a/board/microchip/sam9x60ek_mmc/genimage.cfg b/board/microchip/sam9x60ek_mmc/genimage.cfg
new file mode 100644
index 0000000000..c41581091e
--- /dev/null
+++ b/board/microchip/sam9x60ek_mmc/genimage.cfg
@@ -0,0 +1,31 @@
+# Image for SD card boot on Microchip SAM9X60-EK
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91-sam9x60ek.dtb",
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
diff --git a/configs/microchip_sam9x60ek_mmc_defconfig b/configs/microchip_sam9x60ek_mmc_defconfig
new file mode 100644
index 0000000000..b389320e42
--- /dev/null
+++ b/configs/microchip_sam9x60ek_mmc_defconfig
@@ -0,0 +1,27 @@
+BR2_arm=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam-2020.04)/linux-linux4sam-2020.04.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sam9x60ek"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.0)/at91bootstrap-v3.10.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sam9x60eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam-2020.04)/u-boot-at91-linux4sam-2020.04.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sam9x60ek_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
new file mode 100644
index 0000000000..6c3fcc6b3f
--- /dev/null
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -0,0 +1,77 @@
+BR2_arm=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam-2020.04)/linux-linux4sam-2020.04.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sam9x60ek"
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
+BR2_PACKAGE_BLUEZ5_UTILS=y
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
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.0)/at91bootstrap-v3.10.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sam9x60eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam-2020.04)/u-boot-at91-linux4sam-2020.04.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sam9x60ek_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1
