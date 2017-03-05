From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 23:36:41 +0100
Subject: [Buildroot] [git commit] board: add support for Banana Pro
Message-ID: <20170305223656.37F8680770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ad1067db5d43107ec56a74b79c92e436c7fb59e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The board support package includes the following components:
 - U-Boot 2016.11
 - Linux 4.9.3
 - packages:
   - alsa-utils for basic audio usage of the on-board headphone jack
     and microphone
   - iw and wpa_supplicant for managing the wireless interface

Two Linux patches are necessary to enable audio and wifi support. Both
patches are fetched from the Linux next branch and are probably mainlined in
Linux 4.11.

A Linux configuration fragment enables the wireless device driver, which
is not enabled by default in the mainline defconfig of the board.

The wifi chip needs a NVRAM configuration file which is provided in the
rootfs overlay.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas: remove e2fsprogs from the target packages, add entry in
DEVELOPERS file, remove C++ support.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  2 +
 board/lemaker/bananapro/boot.cmd                   |  5 ++
 board/lemaker/bananapro/genimage.cfg               | 37 ++++++++++
 board/lemaker/bananapro/linux-wifi.fragment        | 23 ++++++
 ...ts-sun7i-Enable-audio-codec-on-Banana-Pro.patch | 35 +++++++++
 ...-dts-sun7i-Add-wifi-dt-node-on-Banana-Pro.patch | 85 ++++++++++++++++++++++
 board/lemaker/bananapro/post-build.sh              | 12 +++
 board/lemaker/bananapro/post-image.sh              | 16 ++++
 board/lemaker/bananapro/readme.txt                 | 62 ++++++++++++++++
 .../lib/firmware/brcm/brcmfmac43362-sdio.txt       | 56 ++++++++++++++
 configs/bananapro_defconfig                        | 75 +++++++++++++++++++
 12 files changed, 409 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4cfe9df..560b540 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -77,6 +77,7 @@ atmel_sama5d4_xplained_defconfig: *defconfig
 atmel_sama5d4_xplained_dev_defconfig: *defconfig
 atmel_sama5d4_xplained_mmc_defconfig: *defconfig
 atmel_sama5d4_xplained_mmc_dev_defconfig: *defconfig
+bananapro_defconfig: *defconfig
 beagleboardx15_defconfig: *defconfig
 beaglebone_defconfig: *defconfig
 beaglebone_qt5_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 03d849d..ff72ca1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -901,6 +901,8 @@ F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
 N:	J??rg Krause <joerg.krause@embedded.rocks>
+F:	board/lemaker/bananapro/
+F:	configs/bananapro_defconfig
 F:	package/bctoolbox/
 F:	package/libshout/
 F:	package/libupnpp/
diff --git a/board/lemaker/bananapro/boot.cmd b/board/lemaker/bananapro/boot.cmd
new file mode 100644
index 0000000..439f5b1
--- /dev/null
+++ b/board/lemaker/bananapro/boot.cmd
@@ -0,0 +1,5 @@
+setenv fdt_high ffffffff
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun7i-a20-bananapro.dtb
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/lemaker/bananapro/genimage.cfg b/board/lemaker/bananapro/genimage.cfg
new file mode 100644
index 0000000..190a4b1
--- /dev/null
+++ b/board/lemaker/bananapro/genimage.cfg
@@ -0,0 +1,37 @@
+# Minimal SD card image for the Banana Pro
+# Based in the Orange Pi genimage.cfg
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun7i-a20-bananapro.dtb",
+			"boot.scr"
+		}
+	}
+	size = 10M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+		size = 1040384 # 1MB - 8192
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/lemaker/bananapro/linux-wifi.fragment b/board/lemaker/bananapro/linux-wifi.fragment
new file mode 100644
index 0000000..8e4bd5c
--- /dev/null
+++ b/board/lemaker/bananapro/linux-wifi.fragment
@@ -0,0 +1,23 @@
+# Networking support
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
+
+# Network device support
+CONFIG_WLAN=y
+CONFIG_WLAN_VENDOR_BROADCOM=y
+CONFIG_BRCMFMAC=m
+# CONFIG_WLAN_VENDOR_ADMTEK is not set
+# CONFIG_WLAN_VENDOR_ATH is not set
+# CONFIG_WLAN_VENDOR_ATMEL is not set
+# CONFIG_WLAN_VENDOR_CISCO is not set
+# CONFIG_WLAN_VENDOR_INTEL is not set
+# CONFIG_WLAN_VENDOR_INTERSIL is not set
+# CONFIG_WLAN_VENDOR_MARVELL is not set
+# CONFIG_WLAN_VENDOR_MEDIATEK is not set
+# CONFIG_WLAN_VENDOR_RALINK is not set
+# CONFIG_WLAN_VENDOR_REALTEK is not set
+# CONFIG_WLAN_VENDOR_RSI is not set
+# CONFIG_WLAN_VENDOR_ST is not set
+# CONFIG_WLAN_VENDOR_TI is not set
+# CONFIG_WLAN_VENDOR_ZYDAS is not set
diff --git a/board/lemaker/bananapro/patches/linux/0001-ARM-dts-sun7i-Enable-audio-codec-on-Banana-Pro.patch b/board/lemaker/bananapro/patches/linux/0001-ARM-dts-sun7i-Enable-audio-codec-on-Banana-Pro.patch
new file mode 100644
index 0000000..8552daa
--- /dev/null
+++ b/board/lemaker/bananapro/patches/linux/0001-ARM-dts-sun7i-Enable-audio-codec-on-Banana-Pro.patch
@@ -0,0 +1,35 @@
+From 1647fe31882a105cef4c99770e4ec8ea47c5c653 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Wed, 4 Jan 2017 15:22:50 +0100
+Subject: [PATCH 1/1] ARM: dts: sun7i: Enable audio codec on Banana Pro
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit enables the on-chip audio codec present on the A20 SoC
+on the Banana Pro board.
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ arch/arm/boot/dts/sun7i-a20-bananapro.dts | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
+index 19d63d4049de..03799c647e13 100644
+--- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
++++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
+@@ -104,6 +104,10 @@
+ 	status = "okay";
+ };
+ 
++&codec {
++	status = "okay";
++};
++
+ &ehci0 {
+ 	status = "okay";
+ };
+-- 
+2.11.0
+
diff --git a/board/lemaker/bananapro/patches/linux/0002-ARM-dts-sun7i-Add-wifi-dt-node-on-Banana-Pro.patch b/board/lemaker/bananapro/patches/linux/0002-ARM-dts-sun7i-Add-wifi-dt-node-on-Banana-Pro.patch
new file mode 100644
index 0000000..7d514a8
--- /dev/null
+++ b/board/lemaker/bananapro/patches/linux/0002-ARM-dts-sun7i-Add-wifi-dt-node-on-Banana-Pro.patch
@@ -0,0 +1,85 @@
+From f2cb904f074bc7e90be475488872a82270e9bae7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 9 Jan 2017 21:36:38 +0100
+Subject: [PATCH 2/2] ARM: dts: sun7i: Add wifi dt node on Banana Pro
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The Banana Pro has an AMPAK AP6181 WiFi+Bluetooth module. The WiFi part
+is a BCM43362 IC connected to MMC3 of the A20 SoC via SDIO. The IC also
+takes a power enable signal via GPIO.
+
+This commit adds a device-tree node to power it up, so the mmc subsys
+can scan it, and enables the mmc controller which is connected to it.
+
+As the wifi enable pin of the AP6181 module is not really a regulator,
+switch the mmc3 node to the mmc-pwrseq framework for controlling it.
+This more accurately reflectes how the hardware actually works.
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ arch/arm/boot/dts/sun7i-a20-bananapro.dts | 29 +++++++++++++++++------------
+ 1 file changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
+index 03799c647e13..83516bc81225 100644
+--- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
++++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
+@@ -76,6 +76,13 @@
+ 		};
+ 	};
+ 
++	wifi_pwrseq: wifi-pwrseq {
++		compatible = "mmc-pwrseq-simple";
++		pinctrl-names = "default";
++		pinctrl-0 = <&vmmc3_pin_bananapro>;
++		reset-gpios = <&pio 7 22 GPIO_ACTIVE_LOW>;
++	};
++
+ 	reg_gmac_3v3: gmac-3v3 {
+ 		compatible = "regulator-fixed";
+ 		pinctrl-names = "default";
+@@ -87,17 +94,6 @@
+ 		enable-active-high;
+ 		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>;
+ 	};
+-
+-	reg_vmmc3: vmmc3 {
+-		compatible = "regulator-fixed";
+-		pinctrl-names = "default";
+-		pinctrl-0 = <&vmmc3_pin_bananapro>;
+-		regulator-name = "vmmc3";
+-		regulator-min-microvolt = <3300000>;
+-		regulator-max-microvolt = <3300000>;
+-		enable-active-high;
+-		gpio = <&pio 7 22 GPIO_ACTIVE_HIGH>;
+-	};
+ };
+ 
+ &ahci {
+@@ -170,10 +166,19 @@
+ &mmc3 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&mmc3_pins_a>;
+-	vmmc-supply = <&reg_vmmc3>;
++	vmmc-supply = <&reg_vcc3v3>;
++	mmc-pwrseq = <&wifi_pwrseq>;
+ 	bus-width = <4>;
+ 	non-removable;
+ 	status = "okay";
++
++	brcmf: bcrmf at 1 {
++		reg = <1>;
++		compatible = "brcm,bcm4329-fmac";
++		interrupt-parent = <&pio>;
++		interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
++		interrupt-names = "host-wake";
++	};
+ };
+ 
+ &ohci0 {
+-- 
+2.11.0
+
diff --git a/board/lemaker/bananapro/post-build.sh b/board/lemaker/bananapro/post-build.sh
new file mode 100755
index 0000000..fb4b6e9
--- /dev/null
+++ b/board/lemaker/bananapro/post-build.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+# Remove all but the brcmfmac43362 firmware files
+find $TARGET_DIR/lib/firmware/brcm -type f -not -name "brcmfmac43362*" -delete
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+# U-Boot script
+$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/lemaker/bananapro/post-image.sh b/board/lemaker/bananapro/post-image.sh
new file mode 100755
index 0000000..9cca1b1
--- /dev/null
+++ b/board/lemaker/bananapro/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/lemaker/bananapro/readme.txt b/board/lemaker/bananapro/readme.txt
new file mode 100644
index 0000000..27b922e
--- /dev/null
+++ b/board/lemaker/bananapro/readme.txt
@@ -0,0 +1,62 @@
+Banana Pro
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+Buildroot environment for the Banana Pro. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+  $ make bananapro_defconfig
+
+Compile everything and build the SD card image:
+
+  $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ dd if=output/images/sdcard.img of=/dev/sdX
+
+Notes:
+  - replace 'sdX' with the actual device with your micro SD card
+  - you may need to be root to do that (use 'sudo')
+
+Insert the micro SD card in your Banana Pro and power it up. The console
+is on the debug TTL UART, 115200 8N1.
+
+Ethernet
+==========
+
+  # udhcpc -i eth0
+
+Wifi
+==========
+
+  # wpa_passphrase YOUR_SSID >> /etc/wpa_supplicant.conf
+  (enter the wifi password and press enter)
+  # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
+  # udhcpc -i wlan0
+
+Note:
+  - replace 'YOUR_SSID' with the actual SSID from your access point
+
+Audio
+==========
+
+Connect a headphone to the 3.5mm jack (TRRS). Note, that the Banana Pro
+has an on-board microphone, too.
+
+  # amixer cset name='Power Amplifier DAC Playback Switch' on
+  # amixer cset name='Power Amplifier Mute Switch' on
+  # amixer cset name='Power Amplifier Volume' 42
diff --git a/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt b/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
new file mode 100644
index 0000000..14a554f
--- /dev/null
+++ b/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
@@ -0,0 +1,56 @@
+#AP6210_NVRAM_V1.2_03192013
+manfid=0x2d0
+prodid=0x492
+vendid=0x14e4
+devid=0x4343
+boardtype=0x0598
+
+# Board Revision is P307, same nvram file can be used for P304, P305, P306 and P307 as the tssi pa params used are same
+#Please force the automatic RX PER data to the respective board directory if not using P307 board, for e.g. for P305 boards force the data into the following directory /projects/BCM43362/a1_labdata/boardtests/results/sdg_rev0305
+boardrev=0x1307
+boardnum=777
+xtalfreq=26000
+boardflags=0x80201
+boardflags2=0x80
+sromrev=3
+wl0id=0x431b
+macaddr=00:90:4c:07:71:12
+aa2g=1
+ag0=2
+maxp2ga0=74
+cck2gpo=0x2222
+ofdm2gpo=0x44444444
+mcs2gpo0=0x6666
+mcs2gpo1=0x6666
+pa0maxpwr=56
+
+#P207 PA params
+#pa0b0=5447
+#pa0b1=-658
+#pa0b2=-175
+
+#Same PA params for P304,P305, P306, P307
+
+pa0b0=5447
+pa0b1=-607
+pa0b2=-160
+pa0itssit=62
+pa1itssit=62
+
+
+cckPwrOffset=5
+ccode=0
+rssismf2g=0xa
+rssismc2g=0x3
+rssisav2g=0x7
+triso2g=0
+noise_cal_enable_2g=0
+noise_cal_po_2g=0
+swctrlmap_2g=0x04040404,0x02020202,0x02020202,0x010101,0x1ff
+temp_add=29767
+temp_mult=425
+
+btc_flags=0x6
+btc_params0=5000
+btc_params1=1000
+btc_params6=63
diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
new file mode 100644
index 0000000..fdd3ca0
--- /dev/null
+++ b/configs/bananapro_defconfig
@@ -0,0 +1,75 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
+# Build options
+BR2_GLOBAL_PATCH_DIR="board/lemaker/bananapro/patches"
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="bananapro"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Banana Pro!"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_OVERLAY="board/lemaker/bananapro/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/lemaker/bananapro/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lemaker/bananapro/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.3"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lemaker/bananapro/linux-wifi.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapro"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapro"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Wifi firmware for brcm43362
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
+
+# Audio
+BR2_PACKAGE_ALSA_UTILS=y
+# BR2_PACKAGE_ALSA_UTILS_ALSAMIXER is not set
+BR2_PACKAGE_ALSA_UTILS_AMIXER=y
+BR2_PACKAGE_ALSA_UTILS_APLAY=y
+
+# For automatic firmware loading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
+# Wireless packages
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+
+# Host tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
