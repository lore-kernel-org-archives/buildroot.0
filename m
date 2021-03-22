From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Mon, 22 Mar 2021 18:14:24 +0100
Subject: [Buildroot] [PATCH 1/1] board: add support for Acme Systems Acqua A5
Message-ID: <6c4a7d31-8de0-4ead-9d49-11c2d8c674aa@grenoble.cnrs.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Acqua A5 is a system on module based on the Microchip SAMA5D31 SoC:

    https://www.acmesystems.it/acqua

It is available in both 256 MiB and 512 MiB versions, hence the two
defconfig files. These configs build microSD card images with:

    - AT91Bootstrap 3
    - Linux 5.4.107
    - default buildroot packages (uClibc, Busybox)

The device tree blob comes from Acme Systems:

    https://github.com/AcmeSystems/dts-archive

It is licensed under GPLv2 or later.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 .../acqua-a5/at91-sama5d3_acqua.dts           | 301 ++++++++++++++++++
 board/acmesystems/acqua-a5/genimage.cfg       |  28 ++
 board/acmesystems/acqua-a5/readme.txt         |  44 +++
 configs/acmesystems_acqua_a5_256mb_defconfig  |  20 ++
 configs/acmesystems_acqua_a5_512mb_defconfig  |  20 ++
 5 files changed, 413 insertions(+)
 create mode 100644 board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
 create mode 100644 board/acmesystems/acqua-a5/genimage.cfg
 create mode 100644 board/acmesystems/acqua-a5/readme.txt
 create mode 100644 configs/acmesystems_acqua_a5_256mb_defconfig
 create mode 100644 configs/acmesystems_acqua_a5_512mb_defconfig

diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
new file mode 100644
index 0000000000..264af29809
--- /dev/null
+++ b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
@@ -0,0 +1,301 @@
+/*
+ * acme-acqua.dts - Device Tree file for Acqua A5 Board
+ *
+ *  Copyright (C) 2014 Atmel,
+ *		  2014 Nicolas Ferre <nicolas.ferre@atmel.com>
+ * 
+ *	2020 Sergio Tanzilli <tanzilli@acmesystems.it>
+ *
+ * Licensed under GPLv2 or later.
+ */
+/dts-v1/;
+#include "sama5d31.dtsi"
+
+/ {
+	model = "Acme Systems Acqua SOM";
+	compatible = "acme,acqua", "atmel,sama5d3", "atmel,sama5";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		bootargs = "mem=256M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait consoleblank=0";
+	};
+
+	memory {
+		reg = <0x20000000 0x10000000>;
+	};
+
+	clocks {
+		slow_xtal {
+			clock-frequency = <32768>;
+		};
+
+		main_xtal {
+			clock-frequency = <12000000>;
+		};
+	};
+
+	ahb {
+		apb {
+			hlcdc: hlcdc at f0030000 {
+				status = "disabled";
+				hlcdc-display-controller {
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb888_alt>;
+					port at 0 {
+						hlcdc_panel_output: endpoint at 0 {
+							remote-endpoint = <&panel_input>;
+						};
+					};
+				};
+			};
+		
+			/* MicroSD mounted on the SOM */
+		
+			mmc0: mmc at f0000000 {
+				pinctrl-0 = <&pinctrl_mmc0_clk_cmd_dat0 &pinctrl_mmc0_dat1_3 &pinctrl_mmc0_cd>;
+				status = "okay";
+				slot at 0 {
+					reg = <0>;
+					bus-width = <4>;
+				};
+			};
+  
+  			/* Optional MicroSD to mount on the carrier board */
+  
+			mmc1: mmc at f8000000 {
+				pinctrl-0 = <&pinctrl_mmc1_clk_cmd_dat0 &pinctrl_mmc1_dat1_3 &pinctrl_mmc1_cd>;
+				status = "disabled";
+				slot at 0 {
+					reg = <0>;
+					bus-width = <4>;
+					cd-gpios = <&pioE 1 GPIO_ACTIVE_LOW>;
+				};
+			};
+
+			spi0: spi at f0004000 {
+				cs-gpios = <&pioD 13 0>, <0>, <0>, <&pioD 16 0>;
+				status = "disabled";
+			};
+
+			can0: can at f000c000 {
+				status = "disabled";
+			};
+
+			tcb0: timer at f0010000 {
+				timer0: timer at 0 {
+					compatible = "atmel,tcb-timer";
+					reg = <0>;
+				};
+
+				timer1: timer at 1 {
+					compatible = "atmel,tcb-timer";
+					reg = <1>;
+				};
+			};
+
+			i2c0: i2c at f0014000 {
+				pinctrl-0 = <&pinctrl_i2c0_pu>;
+				status = "disabled";
+			};
+
+			i2c1: i2c at f0018000 {
+				status = "disabled";
+			};
+
+			macb1: ethernet at f802c000 {
+				compatible = "atmel,sama5d3-macb", "cdns,at91sam9260-macb", "cdns,macb";
+				
+				status = "okay";
+				phy-mode = "rmii";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				nvmem-cells = <&eth0_addr>;
+				nvmem-cell-names = "mac-address";
+
+                phy0: ethernet-phy at 1 {
+                    interrupt-parent = <&pioE>;
+                    interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
+                    reg = <1>;
+                };
+
+				/*ethernet-phy at 1 {
+					reg = <0x1>;
+				};*/
+			};
+
+			/* Bit banging internal I2C to manage the AT24MAC402 chip */
+
+			i2c3@ {
+				compatible = "i2c-gpio";
+				gpios = <&pioE 1 0 /* SDA */
+						 &pioE 2 0 /* SCK */
+						>;
+				i2c-gpio,delay-us = <4>;    /* ~178 kHz */
+				#address-cells = <1>;
+				#size-cells = <0>;
+			
+				/* EEPROM contains the eth0 MAC address */
+				 
+				eeprom at 58 {
+					compatible = "atmel,24mac402";
+					pagesize = <256>;
+					read-only;
+					reg = <0x58>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					eth0_addr: eth-mac-addr at 9A {
+						reg = <0x0 0x06>;
+					};
+				};
+			};
+
+			pwm0: pwm at f002c000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_pwm0_pwmh0_0 &pinctrl_pwm0_pwmh1_0>;
+				status = "disabled";
+			};
+
+			usart0: serial at f001c000 {
+				status = "okay";
+			};
+
+			usart1: serial at f0020000 {
+				pinctrl-0 = <&pinctrl_usart1 &pinctrl_usart1_rts_cts>;
+				status = "disabled";
+			};
+
+			uart0: serial at f0024000 {
+				status = "disabled";
+			};
+
+
+			spi1: spi at f8008000 {
+				cs-gpios = <&pioC 25 0>;
+				status = "disabled";
+			};
+
+			adc0: adc at f8018000 {
+				atmel,adc-vref = <3300>;
+				atmel,adc-channels-used = <0xfe>;
+				pinctrl-0 = <
+					&pinctrl_adc0_adtrg
+					&pinctrl_adc0_ad1
+					&pinctrl_adc0_ad2
+					&pinctrl_adc0_ad3
+					&pinctrl_adc0_ad4
+					&pinctrl_adc0_ad5
+					&pinctrl_adc0_ad6
+					&pinctrl_adc0_ad7
+					>;
+				status = "disabled";
+			};
+
+			i2c2: i2c at f801c000 {
+				dmas = <0>, <0>;	/* Do not use DMA for i2c2 */
+				pinctrl-0 = <&pinctrl_i2c2_pu>;
+				status = "disabled";
+			};
+
+
+			dbgu: serial at ffffee00 {
+				status = "okay";
+			};
+
+			pinctrl at fffff200 {
+				board {
+					pinctrl_i2c0_pu: i2c0_pu {
+						atmel,pins =
+							<AT91_PIOA 30 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>,
+							<AT91_PIOA 31 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
+					};
+
+					pinctrl_i2c2_pu: i2c2_pu {
+						atmel,pins =
+							<AT91_PIOA 18 AT91_PERIPH_B AT91_PINCTRL_PULL_UP>,
+							<AT91_PIOA 19 AT91_PERIPH_B AT91_PINCTRL_PULL_UP>;
+					};
+
+					pinctrl_key_gpio: key_gpio_0 {
+						atmel,pins =
+							<AT91_PIOE 29 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
+					};
+
+					pinctrl_mmc0_cd: mmc0_cd {
+						atmel,pins =
+							<AT91_PIOE 0 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
+					};
+
+					pinctrl_mmc1_cd: mmc1_cd {
+						atmel,pins =
+							<AT91_PIOE 1 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
+					};
+
+					pinctrl_usba_vbus: usba_vbus {
+						atmel,pins =
+							<AT91_PIOE 9 AT91_PERIPH_GPIO AT91_PINCTRL_DEGLITCH>;	/* PE9, conflicts with A9 */
+					};
+				};
+			};
+		};
+
+        usb0: gadget at 500000 {
+            status = "okay";
+        };
+
+        usb1: ohci at 600000 {
+            status = "okay";
+        };
+
+        usb2: ehci at 700000 {
+            status = "okay";
+        };
+		
+	};
+
+
+	panel: panel {
+		/* compatible = "acme,43inch", "simple-panel"; */
+		compatible = "acme,50inch", "simple-panel";
+		/* compatible = "acme,70inch", "simple-panel"; */
+		
+		status = "disable";
+
+		port at 0 {
+			panel_input: endpoint at 0 {
+				remote-endpoint = <&hlcdc_panel_output>;
+			};
+		};
+	};
+
+ 
+	leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			label = "led0";
+			gpios = <&pioE 3 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led1 {
+			label = "led1";
+			gpios = <&pioE 4 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led2 {
+			label = "led2";
+			gpios = <&pioE 5 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led3 {
+			label = "led3";
+			gpios = <&pioE 6 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "mmc0";
+			default-state = "off";
+		};
+	};		
+};
diff --git a/board/acmesystems/acqua-a5/genimage.cfg b/board/acmesystems/acqua-a5/genimage.cfg
new file mode 100644
index 0000000000..63b003f378
--- /dev/null
+++ b/board/acmesystems/acqua-a5/genimage.cfg
@@ -0,0 +1,28 @@
+# Minimal SD card image for the Acme Systems Acqua A5
+
+image boot.vfat {
+	vfat {
+		files = {
+			"boot.bin",
+			"zImage",
+			"at91-sama5d3_acqua.dtb"
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
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/acmesystems/acqua-a5/readme.txt b/board/acmesystems/acqua-a5/readme.txt
new file mode 100644
index 0000000000..9b5d34b0ed
--- /dev/null
+++ b/board/acmesystems/acqua-a5/readme.txt
@@ -0,0 +1,44 @@
+Acme Systems Acqua A5
+
+Intro
+=====
+
+The Acqua A5 is a system on module based on the Microchip SAMA5D31 SoC:
+
+    https://www.acmesystems.it/acqua
+
+The files here support configurations that build a microSD image for a
+minimal system that can be accessed through the serial console. You will
+need an USB-to-serial interface in order to access that console from
+your computer:
+
+    https://www.acmesystems.it/DPI
+
+How to build the image
+======================
+
+If you have an Acqua module with 256 MiB of RAM, type:
+
+$ make acmesystems_acqua_a5_256mb_defconfig
+
+If you have the 512 MiB version, type instead:
+
+$ make acmesystems_acqua_a5_512mb_defconfig
+
+You can optionally tweak the configuration and add packages by typing:
+
+$ make menuconfig
+
+Then, proceed with the build:
+
+$ make
+
+How to write the microSD card
+=============================
+
+The system image is the file "sdcard.img" in the "output/images"
+directory. Write it to the card by invoking:
+
+$ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+where `sdX' is the block device representing the microSD card.
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
new file mode 100644
index 0000000000..30ce933928
--- /dev/null
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -0,0 +1,20 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.107"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
+BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
new file mode 100644
index 0000000000..a48ae9072f
--- /dev/null
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -0,0 +1,20 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.107"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1
