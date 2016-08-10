From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 10 Aug 2016 13:06:03 +0200
Subject: [Buildroot] [PATCH 07/11] Add Linux Kernel stable v4.4.16 patch
	file for Aria G25
In-Reply-To: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1470827167-9426-9-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 .../aria-g25/patches/linux/linux-4.4.16-aria.patch | 388 +++++++++++++++++++++
 1 file changed, 388 insertions(+)
 create mode 100644 board/acmesystems/aria-g25/patches/linux/linux-4.4.16-aria.patch

diff --git a/board/acmesystems/aria-g25/patches/linux/linux-4.4.16-aria.patch b/board/acmesystems/aria-g25/patches/linux/linux-4.4.16-aria.patch
new file mode 100644
index 0000000..0e2f80a
--- /dev/null
+++ b/board/acmesystems/aria-g25/patches/linux/linux-4.4.16-aria.patch
@@ -0,0 +1,388 @@
+ arch/arm/boot/dts/Makefile           |   1 +
+ arch/arm/boot/dts/acme-aria.dts      | 145 ++++++++++++++++++++++++
+ arch/arm/configs/acme-aria_defconfig | 212 +++++++++++++++++++++++++++++++++++
+ 3 files changed, 358 insertions(+)
+  32.2% arch/arm/boot/dts/
+  67.7% arch/arm/configs/
+
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index 30bbc37..96243e9 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -31,6 +31,7 @@ dtb-$(CONFIG_SOC_SAM_V4_V5) += \
+ 	at91sam9n12ek.dtb \
+ 	at91sam9rlek.dtb \
+ 	at91-ariag25.dtb \
++	acme-aria.dtb \
+ 	at91-ariettag25.dtb \
+ 	at91-cosino_mega2560.dtb \
+ 	at91-kizboxmini.dtb \
+diff --git a/arch/arm/boot/dts/acme-aria.dts b/arch/arm/boot/dts/acme-aria.dts
+new file mode 100644
+index 0000000..a7743b5
+--- /dev/null
++++ b/arch/arm/boot/dts/acme-aria.dts
+@@ -0,0 +1,145 @@
++/*
++ * acme-aria.dts - Device Tree file for Aria G25
++ *
++ */
++ 
++/dts-v1/;
++#include "at91sam9g25.dtsi"
++
++/ {
++	model = "Acme Systems Aria G25";
++	compatible = "acme,aria-g25", "atmel,at91sam9x5", "atmel,at91sam9g25", "atmel,at91sam9";
++
++	aliases {
++		serial0 = &dbgu;
++	};
++
++	chosen {
++		stdout-path = "serial0:115200n8";
++	};
++
++	memory {
++		reg = <0x20000000 0x8000000>;
++	};
++
++	clocks {
++		slow_xtal {
++			clock-frequency = <32768>;
++		};
++		main_xtal {
++			clock-frequency = <12000000>;
++		};
++	};
++
++	ahb {
++		apb {
++			mmc0: mmc at f0008000 {
++				pinctrl-0 = <
++					&pinctrl_mmc0_slot0_clk_cmd_dat0
++					&pinctrl_mmc0_slot0_dat1_3>;
++				status = "okay";
++				slot at 0 {
++					reg = <0>;
++					bus-width = <4>;
++				};
++			};
++
++			i2c0: i2c at f8010000 {
++				status = "okay";
++			};
++
++			i2c1: i2c at f8014000 {
++				status = "okay";
++			};
++
++			usart0: serial at f801c000 {
++				pinctrl-0 = <&pinctrl_usart0
++					     &pinctrl_usart0_rts
++					     &pinctrl_usart0_cts>;
++				status = "okay";
++			};
++
++			usart1: serial at f8020000 {
++				pinctrl-0 = <&pinctrl_usart1>;
++				status = "okay";
++			};
++
++			usart2: serial at f8024000 {
++				pinctrl-0 = <&pinctrl_usart2>;
++				status = "okay";
++			};
++
++			usart3: serial at f8028000 {
++				compatible = "atmel,at91sam9260-usart";
++				reg = <0xf8028000 0x200>;
++				interrupts = <8 4 5>;
++				pinctrl-names = "default";
++				pinctrl-0 = <&pinctrl_usart3>;
++				status = "okay";
++			};
++
++			macb0: ethernet at f802c000 {
++				phy-mode = "rmii";
++				local-mac-address = [00 00 00 00 00 00];
++				status = "okay";
++			};
++
++			uart0: serial at f8040000 {
++				status = "disabled";
++			};
++
++			uart1: serial at f8044000 {
++				status = "disabled";
++			};
++
++			adc0: adc at f804c000 {
++				status = "okay";
++				atmel,adc-channels-used = <0xf>;
++			};
++
++			dbgu: serial at fffff200 {
++				status = "okay";
++			};
++
++			pinctrl at fffff400 {
++				w1_0 {
++					pinctrl_w1_0: w1_0-0 {
++						atmel,pins = <0 21 0x0 0x1>; /* PA21 PIO, pull-up */
++					};
++				};
++			};
++
++			rtc at fffffeb0 {
++				status = "okay";
++			};
++		};
++
++		usb0: ohci at 00600000 {
++			status = "okay";
++			num-ports = <3>;
++		};
++
++		usb1: ehci at 00700000 {
++			status = "okay";
++		};
++	};
++
++	leds {
++		compatible = "gpio-leds";
++
++		/* little green LED in middle of Aria G25 module */
++		aria_led {
++			label = "aria_led";
++			gpios = <&pioB 8 GPIO_ACTIVE_HIGH>; /* PB8 */
++			linux,default-trigger = "heartbeat";
++		};
++
++	};
++
++	onewire at 0 {
++		compatible = "w1-gpio";
++		gpios = <&pioA 21 GPIO_ACTIVE_LOW>;
++		pinctrl-names = "default";
++		pinctrl-0 = <&pinctrl_w1_0>;
++	};
++};
+diff --git a/arch/arm/configs/acme-aria_defconfig b/arch/arm/configs/acme-aria_defconfig
+new file mode 100644
+index 0000000..3928abc
+--- /dev/null
++++ b/arch/arm/configs/acme-aria_defconfig
+@@ -0,0 +1,212 @@
++# CONFIG_LOCALVERSION_AUTO is not set
++# CONFIG_SWAP is not set
++CONFIG_SYSVIPC=y
++CONFIG_FHANDLE=y
++CONFIG_HIGH_RES_TIMERS=y
++CONFIG_IKCONFIG=y
++CONFIG_IKCONFIG_PROC=y
++CONFIG_LOG_BUF_SHIFT=14
++CONFIG_CGROUPS=y
++CONFIG_BLK_DEV_INITRD=y
++CONFIG_CC_OPTIMIZE_FOR_SIZE=y
++CONFIG_KALLSYMS_ALL=y
++CONFIG_EMBEDDED=y
++CONFIG_SLAB=y
++CONFIG_MODULES=y
++CONFIG_MODULE_UNLOAD=y
++# CONFIG_BLK_DEV_BSG is not set
++# CONFIG_IOSCHED_DEADLINE is not set
++# CONFIG_IOSCHED_CFQ is not set
++CONFIG_ARCH_MULTI_V4T=y
++CONFIG_ARCH_MULTI_V5=y
++# CONFIG_ARCH_MULTI_V7 is not set
++CONFIG_ARCH_AT91=y
++CONFIG_SOC_AT91RM9200=y
++CONFIG_SOC_AT91SAM9=y
++CONFIG_AEABI=y
++CONFIG_UACCESS_WITH_MEMCPY=y
++CONFIG_ZBOOT_ROM_TEXT=0x0
++CONFIG_ZBOOT_ROM_BSS=0x0
++CONFIG_ARM_APPENDED_DTB=y
++CONFIG_ARM_ATAG_DTB_COMPAT=y
++CONFIG_CMDLINE=""
++CONFIG_KEXEC=y
++# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
++CONFIG_NET=y
++CONFIG_PACKET=y
++CONFIG_UNIX=y
++CONFIG_INET=y
++CONFIG_IP_MULTICAST=y
++CONFIG_IP_PNP=y
++CONFIG_IP_PNP_DHCP=y
++CONFIG_IP_PNP_BOOTP=y
++CONFIG_IP_PNP_RARP=y
++# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
++# CONFIG_INET_XFRM_MODE_TUNNEL is not set
++# CONFIG_INET_XFRM_MODE_BEET is not set
++# CONFIG_INET_DIAG is not set
++CONFIG_IPV6=y
++# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
++# CONFIG_INET6_XFRM_MODE_TUNNEL is not set
++# CONFIG_INET6_XFRM_MODE_BEET is not set
++CONFIG_IPV6_SIT_6RD=y
++CONFIG_CFG80211=y
++CONFIG_MAC80211=y
++CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
++CONFIG_DEVTMPFS=y
++CONFIG_DEVTMPFS_MOUNT=y
++# CONFIG_STANDALONE is not set
++# CONFIG_PREVENT_FIRMWARE_BUILD is not set
++CONFIG_MTD=y
++CONFIG_MTD_CMDLINE_PARTS=y
++CONFIG_MTD_BLOCK=y
++CONFIG_MTD_DATAFLASH=y
++CONFIG_MTD_NAND=y
++CONFIG_MTD_NAND_ATMEL=y
++CONFIG_MTD_UBI=y
++CONFIG_MTD_UBI_GLUEBI=y
++CONFIG_BLK_DEV_LOOP=y
++CONFIG_BLK_DEV_RAM=y
++CONFIG_BLK_DEV_RAM_COUNT=4
++CONFIG_BLK_DEV_RAM_SIZE=8192
++CONFIG_ATMEL_TCLIB=y
++CONFIG_ATMEL_SSC=y
++CONFIG_EEPROM_93CX6=y
++CONFIG_SCSI=y
++CONFIG_BLK_DEV_SD=y
++# CONFIG_SCSI_LOWLEVEL is not set
++CONFIG_NETDEVICES=y
++CONFIG_MACB=y
++# CONFIG_NET_VENDOR_BROADCOM is not set
++CONFIG_DM9000=y
++# CONFIG_NET_VENDOR_FARADAY is not set
++# CONFIG_NET_VENDOR_INTEL is not set
++# CONFIG_NET_VENDOR_MARVELL is not set
++# CONFIG_NET_VENDOR_MICREL is not set
++# CONFIG_NET_VENDOR_NATSEMI is not set
++# CONFIG_NET_VENDOR_SEEQ is not set
++# CONFIG_NET_VENDOR_SMSC is not set
++# CONFIG_NET_VENDOR_STMICRO is not set
++CONFIG_DAVICOM_PHY=y
++CONFIG_MICREL_PHY=y
++CONFIG_RT2X00=y
++CONFIG_RT2500USB=y
++CONFIG_RT73USB=y
++CONFIG_RT2800USB=y
++CONFIG_RT2800USB_RT53XX=y
++CONFIG_RT2800USB_RT55XX=y
++CONFIG_RT2800USB_UNKNOWN=y
++# CONFIG_RTL_CARDS is not set
++CONFIG_INPUT_POLLDEV=y
++# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
++CONFIG_INPUT_MOUSEDEV_SCREEN_X=480
++CONFIG_INPUT_MOUSEDEV_SCREEN_Y=272
++CONFIG_INPUT_JOYDEV=y
++CONFIG_INPUT_EVDEV=y
++# CONFIG_KEYBOARD_ATKBD is not set
++CONFIG_KEYBOARD_QT1070=y
++CONFIG_KEYBOARD_GPIO=y
++# CONFIG_INPUT_MOUSE is not set
++CONFIG_INPUT_TOUCHSCREEN=y
++CONFIG_TOUCHSCREEN_ADS7846=y
++# CONFIG_SERIO is not set
++CONFIG_LEGACY_PTY_COUNT=4
++CONFIG_SERIAL_ATMEL=y
++CONFIG_SERIAL_ATMEL_CONSOLE=y
++CONFIG_HW_RANDOM=y
++CONFIG_I2C=y
++CONFIG_I2C_CHARDEV=y
++CONFIG_I2C_AT91=y
++CONFIG_I2C_GPIO=y
++CONFIG_SPI=y
++CONFIG_SPI_ATMEL=y
++CONFIG_SPI_GPIO=y
++CONFIG_SPI_SPIDEV=y
++CONFIG_GPIO_SYSFS=y
++CONFIG_W1=y
++CONFIG_W1_MASTER_GPIO=y
++CONFIG_POWER_SUPPLY=y
++CONFIG_POWER_RESET=y
++# CONFIG_HWMON is not set
++CONFIG_WATCHDOG=y
++CONFIG_AT91SAM9X_WATCHDOG=y
++CONFIG_REGULATOR=y
++CONFIG_REGULATOR_FIXED_VOLTAGE=y
++CONFIG_FB=y
++CONFIG_FB_ATMEL=y
++# CONFIG_LCD_CLASS_DEVICE is not set
++# CONFIG_BACKLIGHT_GENERIC is not set
++CONFIG_FRAMEBUFFER_CONSOLE=y
++CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
++CONFIG_SOUND=y
++CONFIG_SND=y
++CONFIG_SND_SOC=y
++CONFIG_SND_ATMEL_SOC=y
++CONFIG_SND_AT91_SOC_SAM9G20_WM8731=y
++CONFIG_SND_ATMEL_SOC_WM8904=y
++CONFIG_SND_AT91_SOC_SAM9X5_WM8731=y
++CONFIG_USB=y
++CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
++CONFIG_USB_EHCI_HCD=y
++CONFIG_USB_OHCI_HCD=y
++CONFIG_USB_ACM=y
++CONFIG_USB_STORAGE=y
++CONFIG_USB_SERIAL=y
++CONFIG_USB_SERIAL_GENERIC=y
++CONFIG_USB_SERIAL_FTDI_SIO=y
++CONFIG_USB_SERIAL_PL2303=y
++CONFIG_USB_GADGET=y
++CONFIG_USB_AT91=y
++CONFIG_USB_ATMEL_USBA=y
++CONFIG_USB_ETH=y
++CONFIG_MMC=y
++CONFIG_MMC_ATMELMCI=y
++CONFIG_MMC_SPI=y
++CONFIG_NEW_LEDS=y
++CONFIG_LEDS_CLASS=y
++CONFIG_LEDS_GPIO=y
++CONFIG_LEDS_PWM=y
++CONFIG_LEDS_TRIGGERS=y
++CONFIG_LEDS_TRIGGER_TIMER=y
++CONFIG_LEDS_TRIGGER_HEARTBEAT=y
++CONFIG_LEDS_TRIGGER_GPIO=y
++CONFIG_RTC_CLASS=y
++CONFIG_RTC_DRV_RV3029C2=y
++CONFIG_RTC_DRV_AT91RM9200=y
++CONFIG_RTC_DRV_AT91SAM9=y
++CONFIG_DMADEVICES=y
++CONFIG_AT_HDMAC=y
++# CONFIG_IOMMU_SUPPORT is not set
++CONFIG_IIO=y
++CONFIG_AT91_ADC=y
++CONFIG_PWM=y
++CONFIG_PWM_ATMEL=y
++CONFIG_PWM_ATMEL_TCB=y
++CONFIG_EXT4_FS=y
++CONFIG_FANOTIFY=y
++CONFIG_AUTOFS4_FS=y
++CONFIG_VFAT_FS=y
++CONFIG_TMPFS=y
++CONFIG_UBIFS_FS=y
++CONFIG_UBIFS_FS_ADVANCED_COMPR=y
++CONFIG_NFS_FS=y
++CONFIG_ROOT_NFS=y
++CONFIG_NLS_CODEPAGE_437=y
++CONFIG_NLS_CODEPAGE_850=y
++CONFIG_NLS_ISO8859_1=y
++CONFIG_NLS_UTF8=y
++CONFIG_STRIP_ASM_SYMS=y
++CONFIG_DEBUG_FS=y
++# CONFIG_SCHED_DEBUG is not set
++# CONFIG_DEBUG_BUGVERBOSE is not set
++# CONFIG_FTRACE is not set
++CONFIG_DEBUG_USER=y
++CONFIG_CRYPTO_ECHAINIV=y
++CONFIG_CRYPTO_ECB=y
++CONFIG_CRYPTO_USER_API_HASH=y
++CONFIG_CRYPTO_USER_API_SKCIPHER=y
++# CONFIG_CRYPTO_HW is not set
++CONFIG_FONTS=y
++CONFIG_FONT_8x8=y
++CONFIG_FONT_ACORN_8x8=y
++CONFIG_FONT_MINI_4x6=y
-- 
2.7.4
