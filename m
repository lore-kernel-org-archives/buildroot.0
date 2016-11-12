From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 12 Nov 2016 10:04:13 +0100
Subject: [Buildroot] [PATCH next] olimex_imx233_olinuxino: split defconfig
	in 2 variants
Message-ID: <1478941453-1904-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                         |  2 ++
 board/olimex/imx233_olinuxino/readme.txt           | 38 +++++++++++++++++++---
 ...nfig => olimex_imx233_olinuxino_maxi_defconfig} | 16 +--------
 ...=> olimex_imx233_olinuxino_mini_wifi_defconfig} |  3 +-
 4 files changed, 37 insertions(+), 22 deletions(-)
 copy configs/{olimex_imx233_olinuxino_defconfig => olimex_imx233_olinuxino_maxi_defconfig} (66%)
 rename configs/{olimex_imx233_olinuxino_defconfig => olimex_imx233_olinuxino_mini_wifi_defconfig} (97%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a9c00d..60dd82c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -496,7 +496,9 @@ F:	package/ser2net/
 
 N:	Francois Perrad <francois.perrad@gadz.org>
 F:	board/olimex/a20_olinuxino
+F:	board/olimex/imx233_olinuxino
 F:	configs/olimex_a20_olinuxino_*
+F:	configs/olimex_ims233_olinuxino_*
 F:	package/4th/
 F:	package/botan/
 F:	package/cosmo/
diff --git a/board/olimex/imx233_olinuxino/readme.txt b/board/olimex/imx233_olinuxino/readme.txt
index 1e676c4..125d82d 100644
--- a/board/olimex/imx233_olinuxino/readme.txt
+++ b/board/olimex/imx233_olinuxino/readme.txt
@@ -1,9 +1,37 @@
-This configuration is intended as a base image.
-It includes kernel and firmware support for the common USB WiFi hardware.
-Packages for WiFi support are up to the user, you'll probably want
-one or more of: hostapd, iw, wireless_tools and/or wpa_supplicant.
+iMX233-OLinuXino
 
-It also pulls up the console on the serial port, not on TV output.
+Intro
+=====
+
+These are open hardware boards, all based on the Freescale (now NXP) i.MX233 SoC.
+
+for more details about the boards see the following pages:
+ - https://www.olimex.com/Products/OLinuXino/iMX233/
+ - https://en.wikipedia.org/wiki/OLinuXino
+
+The following defconfigs are available:
+ - olimex_imx233_olinuxino_maxi_defconfig
+ - olimex_imx233_olinuxino_mini_wifi_defconfig
+
+These configurations are intended as a base image.
+There pull up the console on the serial port, not on TV output.
+There use mainline kernel with device tree and mainline u-boot.
+
+The configuration MINI-WIFI includes kernel and firmware support for
+the common USB WiFi hardware. Packages for WiFi support are up to the user,
+you'll probably want one or more of: hostapd, iw, wireless_tools
+and/or wpa_supplicant.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make <board>_defconfig
+
+Compile everything and build the SD card image:
+
+    $ make
 
 === Output files after building ==============================================
 
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_maxi_defconfig
similarity index 66%
copy from configs/olimex_imx233_olinuxino_defconfig
copy to configs/olimex_imx233_olinuxino_maxi_defconfig
index 37ec4d7..c99bf72 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_maxi_defconfig
@@ -8,33 +8,19 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
-# For automatic firmware loading
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/imx233_olinuxino/linux-wifi.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x42000000"
 
-# Firmware for WiFi
-BR2_PACKAGE_LINUX_FIRMWARE=y
-BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010=y
-BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
-BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
-BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
-BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
-BR2_PACKAGE_ZD1211_FIRMWARE=y
-
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT4=y
-# BR2_TARGET_ROOTFS_TAR is not set
 
 # U-Boot
 BR2_TARGET_UBOOT=y
@@ -43,7 +29,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
 BR2_TARGET_UBOOT_FORMAT_SD=y
- 
+
 # To generate SD Image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_mini_wifi_defconfig
similarity index 97%
rename from configs/olimex_imx233_olinuxino_defconfig
rename to configs/olimex_imx233_olinuxino_mini_wifi_defconfig
index 37ec4d7..8a84fa2 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_mini_wifi_defconfig
@@ -34,7 +34,6 @@ BR2_PACKAGE_ZD1211_FIRMWARE=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT4=y
-# BR2_TARGET_ROOTFS_TAR is not set
 
 # U-Boot
 BR2_TARGET_UBOOT=y
@@ -43,7 +42,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
 BR2_TARGET_UBOOT_FORMAT_SD=y
- 
+
 # To generate SD Image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.7.4
