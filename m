From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 17 Jun 2015 12:32:15 +0200
Subject: [Buildroot] [PATCH] board/acmesystems/arietta: new board
Message-ID: <1434537135-32177-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support to the Arietta board from Acmesystems.
This board comes in two memory sizes (128m and 256m) hence the
reason for two different configs.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 board/acmesystems/arietta/acme-arietta.dts | 182 +++++++++++++++++++++++++++++
 board/acmesystems/arietta/linux-4.0.config |  99 ++++++++++++++++
 board/acmesystems/arietta/readme.txt       |  67 +++++++++++
 configs/acme-arietta-128m_defconfig        |  19 +++
 configs/acme-arietta-256m_defconfig        |  19 +++
 5 files changed, 386 insertions(+)
 create mode 100644 board/acmesystems/arietta/acme-arietta.dts
 create mode 100644 board/acmesystems/arietta/linux-4.0.config
 create mode 100644 board/acmesystems/arietta/readme.txt
 create mode 100644 configs/acme-arietta-128m_defconfig
 create mode 100644 configs/acme-arietta-256m_defconfig

diff --git a/board/acmesystems/arietta/acme-arietta.dts b/board/acmesystems/arietta/acme-arietta.dts
new file mode 100644
index 0000000..813f87e
--- /dev/null
+++ b/board/acmesystems/arietta/acme-arietta.dts
@@ -0,0 +1,182 @@
+/*
+ * acme-arietta.dts - Device Tree file for Arietta G25
+ * Copyright (C) 2015 Sergio Tanzilli <sergio@tanzilli.com>
+ *
+ * Licensed under GPLv2 or later. 
+ */
+/dts-v1/;
+#include "at91sam9g25.dtsi"
+/ {
+	model = "Acme Systems Arietta G25";
+	compatible = "acme,ariettag25", "atmel,at91sam9x5ek","atmel,at91sam9x5", "atmel,at91sam9";
+	aliases {
+		serial0 = &dbgu;
+		serial1 = &usart0;
+		serial2 = &usart1;
+		serial3 = &usart2;
+		serial4 = &usart3;
+		serial5 = &uart0;
+		serial6 = &uart1;
+	};
+
+	chosen {
+		bootargs = "mem=128M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait consoleblank=0";
+	};
+
+	memory {
+		reg = <0x20000000 0x8000000>;
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		main_clock: clock at 0 {
+			compatible = "atmel,osc", "fixed-clock";
+			clock-frequency = <12000000>;
+		};
+
+		main_xtal { 
+			clock-frequency = <12000000>; 
+		}; 
+	};
+
+	ahb {
+		apb {
+			mmc0: mmc at f0008000 {
+				pinctrl-0 = <
+				  &pinctrl_mmc0_slot0_clk_cmd_dat0
+				  &pinctrl_mmc0_slot0_dat1_3>;
+				status = "okay";
+				slot at 0 {
+					reg = <0>;
+					bus-width = <4>;
+				};
+			};
+			i2c0: i2c at f8010000 {
+				status ="disabled";
+				wm8731: wm8731 at 1b {
+					compatible = "wm8731";
+					reg = <0x1b>;
+				};
+			};
+			i2c1: i2c at f8014000 {
+				status ="disabled";
+			};
+			usart0: serial at f801c000 {
+				pinctrl-0 = <&pinctrl_usart0>;
+				status ="disabled";
+			};
+			usart1: serial at f8020000 {
+				pinctrl-0 = <&pinctrl_usart1 &pinctrl_usart1_rts &pinctrl_usart1_cts>;
+				status ="disabled";
+			};
+			usart2: serial at f8024000 {
+				pinctrl-0 = <&pinctrl_usart2>;
+				status ="disabled";
+			};
+			spi1: spi at f0004000 {
+				status = "disabled";
+				cs-gpios = <&pioA 8 0>, <&pioA 0 0>, <&pioA 31 0>, <&pioA 30 0>;
+				device at 0 {
+					compatible = "spidev";
+					spi-max-frequency = <50000000>;	    // 50 MHz
+					reg = <0>;
+				};
+				device at 1 {
+					compatible = "spidev";
+					spi-max-frequency = <50000000>;	    // 50 MHz
+					reg = <1>;
+				};
+				device at 2 {
+					compatible = "spidev";
+					spi-max-frequency = <50000000>;	    // 50 MHz
+					reg = <2>;
+				};
+				device at 3 {
+					compatible = "spidev";
+					spi-max-frequency = <50000000>;	    // 50 MHz
+					reg = <3>;
+				};
+			};
+
+			adc0: adc at f804c000 {
+				status = "disabled";
+				atmel,adc-channels-used = <0xf>;
+				atmel,adc-num-channels = <4>;
+				compatible = "atmel,at91sam9x5-adc";
+				atmel,adc-startup-time = <40>;
+				atmel,adc-status-register = <0x1c>;
+				atmel,adc-trigger-register = <0x08>;
+				atmel,adc-use-external;
+				atmel,adc-vref = <3250>;
+				atmel,adc-res = <8 10>;
+				atmel,adc-res-names = "lowres", "highres";
+				atmel,adc-use-res = "highres";
+				trigger at 0 {
+					trigger-name = "continuous";
+					trigger-value = <0x6>;
+				};
+			};
+
+			pinctrl at fffff400 {
+				pwm0 {
+					pinctrl_pwm0: pwm0-0 {
+						atmel,pins =
+						< AT91_PIOB 11 AT91_PERIPH_B AT91_PINCTRL_NONE
+						  AT91_PIOB 12 AT91_PERIPH_B AT91_PINCTRL_NONE
+						  AT91_PIOB 13 AT91_PERIPH_B AT91_PINCTRL_NONE
+						  AT91_PIOB 14 AT91_PERIPH_B AT91_PINCTRL_NONE >;
+					};
+				};
+			};
+			pwm0: pwm at f8034000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_pwm0>;
+				status = "disabled";
+			};
+
+			ssc0: ssc at f0010000 {
+				status = "disabled";
+			};
+			usb2: gadget at f803c000 {
+				status = "okay";
+			};
+			dbgu: serial at fffff200 {
+				status = "okay";
+			};
+			pinctrl at fffff400 {
+			};
+			rtc at fffffeb0 {
+				status = "okay";
+			};
+		};
+		usb0: ohci at 00600000 {
+			status = "okay";
+			num-ports = <3>;
+		};
+		usb1: ehci at 00700000 {
+			status = "okay";
+		};
+	};
+	leds {
+		compatible = "gpio-leds";
+		arietta_led {
+			label = "arietta_led";
+			gpios = <&pioB 8 GPIO_ACTIVE_HIGH>; /* PB8 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+	sound {
+		compatible = "atmel,sam9x5-wm8731-audio";
+		atmel,model = "wm8731 @ AT91SAM9X5EK";
+		atmel,audio-routing =
+		"Headphone Jack", "RHPOUT",
+		"Headphone Jack", "LHPOUT",
+		"LLINEIN", "Line In Jack",
+		"RLINEIN", "Line In Jack";
+		atmel,ssc-controller = <&ssc0>;
+		atmel,audio-codec = <&wm8731>;
+	};
+
+};
diff --git a/board/acmesystems/arietta/linux-4.0.config b/board/acmesystems/arietta/linux-4.0.config
new file mode 100644
index 0000000..22c9631
--- /dev/null
+++ b/board/acmesystems/arietta/linux-4.0.config
@@ -0,0 +1,99 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_USELIB is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_UID16 is not set
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_BUG is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_AIO is not set
+# CONFIG_ADVISE_SYSCALLS is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLOB=y
+CONFIG_MODULES=y
+CONFIG_ARCH_AT91=y
+CONFIG_SOC_AT91SAM9=y
+CONFIG_AT91_TIMER_HZ=128
+# CONFIG_ARM_THUMB is not set
+CONFIG_AEABI=y
+# CONFIG_ATAGS is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+# CONFIG_BINFMT_SCRIPT is not set
+# CONFIG_COREDUMP is not set
+# CONFIG_SUSPEND is not set
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IPV6=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_ATMEL_TCLIB=y
+CONFIG_ATMEL_SSC=y
+# CONFIG_DEVMEM is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_ATMEL=y
+CONFIG_SERIAL_ATMEL_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_AT91=y
+CONFIG_SPI=y
+CONFIG_SPI_ATMEL=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_POWER_RESET=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_AT91SAM9X_WATCHDOG=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_USB=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_ATMELMCI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_CLASS_FLASH=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_AT91RM9200=y
+CONFIG_DMADEVICES=y
+CONFIG_AT_XDMAC=y
+CONFIG_ARM_SMMU=y
+CONFIG_IIO=y
+CONFIG_AT91_ADC=y
+CONFIG_PWM=y
+CONFIG_PWM_ATMEL=y
+CONFIG_PWM_ATMEL_TCB=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+CONFIG_TMPFS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_PRINTK_TIME=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_DEBUG_FS=y
+CONFIG_PANIC_TIMEOUT=10
+CONFIG_STACKTRACE=y
+# CONFIG_FTRACE is not set
+CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRYPTO_DEV_ATMEL_AES=y
+CONFIG_CRYPTO_DEV_ATMEL_TDES=y
+CONFIG_CRYPTO_DEV_ATMEL_SHA=y
diff --git a/board/acmesystems/arietta/readme.txt b/board/acmesystems/arietta/readme.txt
new file mode 100644
index 0000000..f1d68e9
--- /dev/null
+++ b/board/acmesystems/arietta/readme.txt
@@ -0,0 +1,67 @@
+Acmesystems Arietta board
+============================
+
+This document explains how to set up a basic Buildroot system on the
+Acmesystems Arietta board, whose main site is
+http://acmesystems.it/arietta. Additional details can
+also be found on the tutorial section here http://acmesystems.it/tutorials.
+
+Note that the default Buildroot configuration is prepared to boot from
+an SD card: the first stage bootloader, kernel image and root filesystem
+are all located on the SD card.
+This board comes in to memory sizes: 128 MB and 256 MB.
+
+Configuring and building Buildroot for 128 MB version
+-----------------------------------------------------
+
+  make acme-arietta-128m_defconfig
+  make
+
+Configuring and building Buildroot for 256 MB version
+-----------------------------------------------------
+
+  make acme-arietta-256m_defconfig
+  make
+
+Preparing the SD card
+---------------------
+
+The SD card must be partitioned with at least two partitions: one
+FAT16 partition for the bootloader, kernel image and Device Tree
+blob, and one ext4 partition for the root filesystem. To partition the
+SD card:
+
+  SDCARD=/dev/sdX
+  sudo parted -s $SDCARD mkpart primary fat16 0 32
+  sudo parted -s $SDCARD -- mkpart primary ext2 33 -1
+
+This creates a 32 MB partition for the FAT16 filesystem (type 6) and
+uses the rest for the ext4 filesystem used for the root filesystem.
+
+Then, format both partitions:
+
+  sudo mkfs.vfat -n boot ${SDCARD}1
+  sudo mkfs.ext4 -L rootfs -O ^huge_file ${SDCARD}2
+
+Mount both partitions (if not done automatically by your system):
+
+  sudo mount /dev/${SDCARD}1 /media/boot
+  sudo mount /dev/${SDCARD}2 /media/rootfs
+
+Copy the bootloaders, kernel image and Device Tree blob to the first
+partition:
+
+  cp output/images/at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin /media/boot/boot.bin
+  cp output/images/zImage /media/boot/zImage
+  cp output/images/acme-arietta.dtb /media/boot/acme-arietta.dtb
+
+Extract the root filesystem to the second partition:
+
+sudo tar -C /media/rootfs -xf output/images/rootfs.tar
+
+Unmount both partitions:
+
+sudo umount /media/boot
+sudo umount /media/rootfs
+
+Insert your SD card in your Arietta board, and enjoy.
diff --git a/configs/acme-arietta-128m_defconfig b/configs/acme-arietta-128m_defconfig
new file mode 100644
index 0000000..3a8ebf1
--- /dev/null
+++ b/configs/acme-arietta-128m_defconfig
@@ -0,0 +1,19 @@
+BR2_arm=y
+BR2_ARM_INSTRUCTIONS_THUMB=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_HOSTNAME="arietta"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta by Acmesystems http://www.acmesystems.it!"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_ROOT_PASSWD="acmesystems"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/acmesystems/arietta/linux-4.0.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/arietta/acme-arietta.dts"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/tanzilli/at91bootstrap"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="acme"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
diff --git a/configs/acme-arietta-256m_defconfig b/configs/acme-arietta-256m_defconfig
new file mode 100644
index 0000000..9564b77
--- /dev/null
+++ b/configs/acme-arietta-256m_defconfig
@@ -0,0 +1,19 @@
+BR2_arm=y
+BR2_ARM_INSTRUCTIONS_THUMB=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_HOSTNAME="arietta"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta by Acmesystems http://www.acmesystems.it!"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_ROOT_PASSWD="acmesystems"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/acmesystems/arietta/linux-4.0.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/arietta/acme-arietta.dts"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/tanzilli/at91bootstrap"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="acme"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
-- 
1.9.1
