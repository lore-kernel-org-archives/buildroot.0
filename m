From: Davide Viti <zinosat@gmail.com>
Date: Sun, 27 Oct 2019 20:50:46 +0100
Subject: [Buildroot] [PATCH 1/1] configs/nanopi_r1: new defconfig
Message-ID: <20191027195046.13111-1-zinosat@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for Nanopi R1 board with below features:

  - U-Boot 2019.01
  - Linux 5.0
  - Default packages from buildroot

Configuration files taken from Armbian:

  https://github.com/armbian/build/blob/master/patch

Signed-off-by: Davide Viti <zinosat@gmail.com>
---
 board/friendlyarm/nanopi-r1/boot.cmd          |   8 +
 board/friendlyarm/nanopi-r1/genimage.cfg      |  36 ++++
 .../nanopi-r1/kernel/linux-extras.config      |   2 +
 .../nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts   | 170 ++++++++++++++++++
 .../friendlyarm/nanopi-r1/nanopi_r1_defconfig |  22 +++
 board/friendlyarm/nanopi-r1/readme.txt        |  29 +++
 .../nanopi-r1/sun8i-h3-nanopi-r1.dts          | 102 +++++++++++
 configs/nanopi_r1_defconfig                   |  49 +++++
 8 files changed, 418 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-r1/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-r1/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-r1/kernel/linux-extras.config
 create mode 100644 board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts
 create mode 100644 board/friendlyarm/nanopi-r1/nanopi_r1_defconfig
 create mode 100644 board/friendlyarm/nanopi-r1/readme.txt
 create mode 100644 board/friendlyarm/nanopi-r1/sun8i-h3-nanopi-r1.dts
 create mode 100644 configs/nanopi_r1_defconfig

diff --git a/board/friendlyarm/nanopi-r1/boot.cmd b/board/friendlyarm/nanopi-r1/boot.cmd
new file mode 100644
index 0000000000..9f0cdbfe51
--- /dev/null
+++ b/board/friendlyarm/nanopi-r1/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-r1.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-r1/genimage.cfg b/board/friendlyarm/nanopi-r1/genimage.cfg
new file mode 100644
index 0000000000..6f5f35dcd5
--- /dev/null
+++ b/board/friendlyarm/nanopi-r1/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the NanoPi M1
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-nanopi-r1.dtb",
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
diff --git a/board/friendlyarm/nanopi-r1/kernel/linux-extras.config b/board/friendlyarm/nanopi-r1/kernel/linux-extras.config
new file mode 100644
index 0000000000..206b3810a7
--- /dev/null
+++ b/board/friendlyarm/nanopi-r1/kernel/linux-extras.config
@@ -0,0 +1,2 @@
+# USB ethernet
+CONFIG_USB_RTL8152=y
diff --git a/board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts b/board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts
new file mode 100644
index 0000000000..ca15a57bee
--- /dev/null
+++ b/board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts
@@ -0,0 +1,170 @@
+/*
+ * Copyright (C) 2019 Igor Pecovnik <igor@armbian.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "sun8i-h3-nanopi.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi-R1";
+	compatible = "friendlyarm,nanopi-r1", "allwinner,sun8i-h3";
+
+	aliases {
+		serial1 = &uart3;
+		ethernet0 = &emac;
+		ethernet1 = &emac;
+		ethernet2 = &sdio_wifi;
+	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
+	};
+
+	reg_gmac_3v3: gmac-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "gmac-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <100000>;
+		enable-active-high;
+		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
+	};
+
+	leds {
+		/delete-node/ status;
+		/delete-node/ pwr;
+		led1 {
+			label = "LED1";
+			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led2 {
+			label = "LED2";
+			gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			linux,default-trigger = "netdev";
+		};
+
+		led3 {
+			label = "LED3";
+			gpios = <&pio 0 9 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			linux,default-trigger = "netdev";
+		};
+	};
+
+	r_gpio_keys {
+		compatible = "gpio-keys";
+		input-name = "k1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&sw_r_npi>;
+
+		/delete-node/ k1;
+		reset {
+			label = "reset";
+			linux,code = <BTN_1>;
+			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&emac_rgmii_pins>;
+	phy-supply = <&reg_gmac_3v3>;
+	phy-handle = <&ext_rgmii_phy>;
+	phy-mode = "rgmii";
+
+	status = "okay";
+};
+
+&external_mdio {
+	ext_rgmii_phy: ethernet-phy at 1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+	};
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	sdio_wifi: sdio_wifi at 1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&pio>;
+		interrupts = <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 / EINT10 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_8bit_pins>;
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
diff --git a/board/friendlyarm/nanopi-r1/nanopi_r1_defconfig b/board/friendlyarm/nanopi-r1/nanopi_r1_defconfig
new file mode 100644
index 0000000000..e028b41a46
--- /dev/null
+++ b/board/friendlyarm/nanopi-r1/nanopi_r1_defconfig
@@ -0,0 +1,22 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_SPL=y
+CONFIG_MACH_SUN8I_H3=y
+CONFIG_DRAM_CLK=408
+CONFIG_DRAM_ZQ=3881979
+CONFIG_DRAM_ODT_EN=y
+CONFIG_MACPWR="PD6"
+# CONFIG_VIDEO_DE2 is not set
+CONFIG_NR_DRAM_BANKS=1
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_CONSOLE_MUX=y
+CONFIG_SYS_CLK_FREQ=480000000
+# CONFIG_CMD_FLASH is not set
+# CONFIG_SPL_DOS_PARTITION is not set
+# CONFIG_SPL_EFI_PARTITION is not set
+CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-nanopi-r1"
+CONFIG_SUN8I_EMAC=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
+CONFIG_MMC_SUNXI_SLOT_EXTRA=2
diff --git a/board/friendlyarm/nanopi-r1/readme.txt b/board/friendlyarm/nanopi-r1/readme.txt
new file mode 100644
index 0000000000..0ff63df3c7
--- /dev/null
+++ b/board/friendlyarm/nanopi-r1/readme.txt
@@ -0,0 +1,29 @@
+NanoPi R1
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the NanoPi R1. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make nanopi_r1_defconfig
+
+Compile everything and build the SD card image:
+
+    $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/board/friendlyarm/nanopi-r1/sun8i-h3-nanopi-r1.dts b/board/friendlyarm/nanopi-r1/sun8i-h3-nanopi-r1.dts
new file mode 100644
index 0000000000..9c3c574e0f
--- /dev/null
+++ b/board/friendlyarm/nanopi-r1/sun8i-h3-nanopi-r1.dts
@@ -0,0 +1,102 @@
+/*
+ * Copyright (C) 2019 Igor Pecovnik <igor@armbian.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "sun8i-h3-nanopi.dtsi"
+
+/ {
+	model = "FriendlyARM NanoPi R1";
+	compatible = "friendlyarm,nanopi-neo", "allwinner,sun8i-h3";
+
+	reg_gmac_3v3: gmac-3v3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		regulator-name = "gmac-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <100000>;
+		enable-active-high;
+		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
+	};
+
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&pio {
+	gmac_power_pin_nanopi: gmac_power_pin at 0 {
+		pins = "PD6";
+		function = "gpio_out";
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_8bit_pins>;
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	status = "okay";
+};
+
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&emac_rgmii_pins>;
+	phy-supply = <&reg_gmac_3v3>;
+	phy-handle = <&ext_rgmii_phy>;
+	phy-mode = "rgmii";
+
+	status = "okay";
+};
+
+&external_mdio {
+	ext_rgmii_phy: ethernet-phy at 1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+	};
+};
diff --git a/configs/nanopi_r1_defconfig b/configs/nanopi_r1_defconfig
new file mode 100644
index 0000000000..7cb567f2e7
--- /dev/null
+++ b/configs/nanopi_r1_defconfig
@@ -0,0 +1,49 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-r1"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi R1"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_r1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="board/friendlyarm/nanopi-r1/sun8i-h3-nanopi-r1.dts"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="board/friendlyarm/nanopi-r1/nanopi_r1_defconfig"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/friendlyarm/nanopi-r1/kernel/linux-extras.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-r1"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-r1/boot.cmd"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-r1/genimage.cfg"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Additional tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.20.1
