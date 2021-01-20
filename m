From: Filip Skoneczny <fskoneczny@gmail.com>
Date: Wed, 20 Jan 2021 18:28:15 +0100
Subject: [Buildroot] [PATCH 1/1] configs/bananapi_m1_plus_defconfig: new
 defconfig
Message-ID: <20210120172815.3395049-1-fskoneczny@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds support for Sinovoip's Banana Pi
M1+. It is mostly based on bananapro_defconfig
but with appropriate device tree and minor tweaks:

- apply bananapi-m1-plus device tree in linux
- apply bananapi_m1_plus defconfig for uboot
- apply patch for OOB IRQs on new device tree
- update device tree name in boot.cmd, genimage.cfg
- update symlink for BRCM driver in rootfs_overlay
- deconfigure unnecessary /boot creation in target

Tested on BPI-M1+ V1_1.

Signed-off-by: Filip Skoneczny <fskoneczny@gmail.com>
---
 DEVELOPERS                                    |  4 ++
 board/sinovoip/m1-plus/boot.cmd               |  5 ++
 board/sinovoip/m1-plus/genimage.cfg           | 37 +++++++++++
 board/sinovoip/m1-plus/linux-wifi.fragment    | 10 +++
 ...nanapi-m1-plus-Disable-OOB-IRQ-for-b.patch | 37 +++++++++++
 board/sinovoip/m1-plus/post-build.sh          | 12 ++++
 board/sinovoip/m1-plus/post-image.sh          | 16 +++++
 board/sinovoip/m1-plus/readme.txt             | 62 +++++++++++++++++++
 ...rcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt |  1 +
 .../lib/firmware/brcm/brcmfmac43362-sdio.txt  | 56 +++++++++++++++++
 configs/bananapi_m1_plus_defconfig            | 47 ++++++++++++++
 11 files changed, 287 insertions(+)
 create mode 100644 board/sinovoip/m1-plus/boot.cmd
 create mode 100644 board/sinovoip/m1-plus/genimage.cfg
 create mode 100644 board/sinovoip/m1-plus/linux-wifi.fragment
 create mode 100644 board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch
 create mode 100755 board/sinovoip/m1-plus/post-build.sh
 create mode 100755 board/sinovoip/m1-plus/post-image.sh
 create mode 100644 board/sinovoip/m1-plus/readme.txt
 create mode 120000 board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt
 create mode 100644 board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
 create mode 100644 configs/bananapi_m1_plus_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index f815259d2d..3fef0122fd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -892,6 +892,10 @@ F:	configs/freescale_imx6ullevk_defconfig
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
+N:	Filip Skoneczny <fskoneczny@gmail.com>
+F:	board/sinovoip/m1-plus
+F:	configs/bananapi_m1_plus_defconfig
+
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
 F:	package/odhcploc/
diff --git a/board/sinovoip/m1-plus/boot.cmd b/board/sinovoip/m1-plus/boot.cmd
new file mode 100644
index 0000000000..4829996474
--- /dev/null
+++ b/board/sinovoip/m1-plus/boot.cmd
@@ -0,0 +1,5 @@
+setenv fdt_high ffffffff
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun7i-a20-bananapi-m1-plus.dtb
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/sinovoip/m1-plus/genimage.cfg b/board/sinovoip/m1-plus/genimage.cfg
new file mode 100644
index 0000000000..3cba774c6f
--- /dev/null
+++ b/board/sinovoip/m1-plus/genimage.cfg
@@ -0,0 +1,37 @@
+# Minimal SD card image for the Banana Pi M1+
+# Based on the Banana Pro genimage.cfg
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun7i-a20-bananapi-m1-plus.dtb",
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
diff --git a/board/sinovoip/m1-plus/linux-wifi.fragment b/board/sinovoip/m1-plus/linux-wifi.fragment
new file mode 100644
index 0000000000..5576d738ad
--- /dev/null
+++ b/board/sinovoip/m1-plus/linux-wifi.fragment
@@ -0,0 +1,10 @@
+# Networking support
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_RFKILL=y
+
+# Network device support
+CONFIG_WLAN=y
+CONFIG_WLAN_VENDOR_BROADCOM=y
+CONFIG_BRCMFMAC=m
diff --git a/board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch b/board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch
new file mode 100644
index 0000000000..75a86f0357
--- /dev/null
+++ b/board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch
@@ -0,0 +1,37 @@
+From 58bae4096a7bf8d5d3bfbddb82cb37dd0561c938 Mon Sep 17 00:00:00 2001
+From: Filip Skoneczny <fskoneczny@gmail.com>
+Date: Sun, 10 Jan 2021 19:07:14 +0100
+Subject: [PATCH] ARM: dts: sun7i: bananapi-m1-plus: Disable OOB IRQ for brcm
+ wifi module
+
+    Based on 23bc805.
+    BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=908438
+---
+ arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
+index 32d5d45a35c0..97f9987f51d7 100644
+--- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
++++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
+@@ -193,9 +193,14 @@ &mmc3 {
+ 	brcmf: wifi at 1 {
+ 		reg = <1>;
+ 		compatible = "brcm,bcm4329-fmac";
+-		interrupt-parent = <&pio>;
+-		interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
+-		interrupt-names = "host-wake";
++		/*
++		 * OOB interrupt support is broken ATM, drv probe failing with:
++		 * ieee80211 phy0: brcmf_attach: dongle is not responding: err=-110
++		 *
++		 * interrupt-parent = <&pio>;
++		 * interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
++		 * interrupt-names = "host-wake";
++		 */
+ 	};
+ };
+ 
+-- 
+2.25.1
+
diff --git a/board/sinovoip/m1-plus/post-build.sh b/board/sinovoip/m1-plus/post-build.sh
new file mode 100755
index 0000000000..a335310dbc
--- /dev/null
+++ b/board/sinovoip/m1-plus/post-build.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+# Remove all but the brcmfmac43362 firmware files
+find $TARGET_DIR/lib/firmware/brcm -type f -not -name "brcmfmac43362*" -delete
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+# U-Boot script
+$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/sinovoip/m1-plus/post-image.sh b/board/sinovoip/m1-plus/post-image.sh
new file mode 100755
index 0000000000..9cca1b1789
--- /dev/null
+++ b/board/sinovoip/m1-plus/post-image.sh
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
diff --git a/board/sinovoip/m1-plus/readme.txt b/board/sinovoip/m1-plus/readme.txt
new file mode 100644
index 0000000000..17c7bb97d6
--- /dev/null
+++ b/board/sinovoip/m1-plus/readme.txt
@@ -0,0 +1,62 @@
+Banana Pi M1+
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+Buildroot environment for the Banana Pi M1+. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+  $ make bananapi_m1_plus_defconfig
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
+Insert the micro SD card in your Banana Pi M1+ and power it up. The console
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
+Connect a headphone to the 3.5mm jack (TRRS). Note, that the Banana Pi M1+
+has an on-board microphone, too.
+
+  # amixer cset name='Power Amplifier DAC Playback Switch' on
+  # amixer cset name='Power Amplifier Mute Switch' on
+  # amixer cset name='Power Amplifier Volume' 42
diff --git a/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt b/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt
new file mode 120000
index 0000000000..93947975ee
--- /dev/null
+++ b/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt
@@ -0,0 +1 @@
+brcmfmac43362-sdio.txt
\ No newline at end of file
diff --git a/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt b/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
new file mode 100644
index 0000000000..14a554fdd8
--- /dev/null
+++ b/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
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
diff --git a/configs/bananapi_m1_plus_defconfig b/configs/bananapi_m1_plus_defconfig
new file mode 100644
index 0000000000..cdc3e96515
--- /dev/null
+++ b/configs/bananapi_m1_plus_defconfig
@@ -0,0 +1,47 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_GLOBAL_PATCH_DIR="board/sinovoip/m1-plus/patches"
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TARGET_GENERIC_HOSTNAME="bananapi"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Banana Pi!"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_OVERLAY="board/sinovoip/m1-plus/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/sinovoip/m1-plus/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sinovoip/m1-plus/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.3"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sinovoip/m1-plus/linux-wifi.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapi-m1-plus"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_ALSA_UTILS=y
+# BR2_PACKAGE_ALSA_UTILS_ALSAMIXER is not set
+BR2_PACKAGE_ALSA_UTILS_AMIXER=y
+BR2_PACKAGE_ALSA_UTILS_APLAY=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m1_plus"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MKPASSWD=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.25.1
