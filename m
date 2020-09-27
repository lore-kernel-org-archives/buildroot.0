From: Shlomi Vaknin <shlomi.39sd@gmail.com>
Date: Sun, 27 Sep 2020 09:16:06 +0300
Subject: [Buildroot] [PATCH 1/1] configs/stm32mp157c_dk2_trusted_defconfig:
 new platform
Message-ID: <20200927061606.10239-1-shlomi.39sd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding support for trusted configuration for stm32mp157c-dk2.
In addtion, the following changes made to the original stm32mp157c_dk2_defconfig:
1. Enable gadget support and wifi support in `linux.config`.
2. Create a new dts file that contains the bindings for the wifi module. This was
   copied from the stm32 kernel fork.
3. A txt file for the wifi firmware. This was copied from the yocto bsp layer of st.

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
---
 .../common/stm32mp157-trusted/genimage.cfg    |  23 +++
 .../stm32mp157c-dk2-trusted/linux.config      | 181 ++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |   4 +
 .../brcmfmac43430-sdio.st,stm32mp157c-dk2.txt |  59 ++++++
 .../stm32mp157c-dk2-trusted/readme.txt        |  38 ++++
 .../stm32mp157c-dk2-wifi.dts                  |  32 ++++
 configs/stm32mp157c_dk2_trusted_defconfig     |  40 ++++
 7 files changed, 377 insertions(+)
 create mode 100644 board/stmicroelectronics/common/stm32mp157-trusted/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32mp157c-dk2-trusted/linux.config
 create mode 100644 board/stmicroelectronics/stm32mp157c-dk2-trusted/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/stmicroelectronics/stm32mp157c-dk2-trusted/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt
 create mode 100644 board/stmicroelectronics/stm32mp157c-dk2-trusted/readme.txt
 create mode 100644 board/stmicroelectronics/stm32mp157c-dk2-trusted/stm32mp157c-dk2-wifi.dts
 create mode 100644 configs/stm32mp157c_dk2_trusted_defconfig

diff --git a/board/stmicroelectronics/common/stm32mp157-trusted/genimage.cfg b/board/stmicroelectronics/common/stm32mp157-trusted/genimage.cfg
new file mode 100644
index 0000000000..3b709f756d
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32mp157-trusted/genimage.cfg
@@ -0,0 +1,23 @@
+image sdcard.img {
+	hdimage {
+		gpt = "true"
+	}
+
+	partition fsbl1 {
+		image = "tf-a-stm32mp157c-dk2.stm32"
+	}
+
+	partition fsbl2 {
+		image = "tf-a-stm32mp157c-dk2.stm32"
+	}
+
+	partition ssbl {
+		image = "u-boot.stm32"
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		partition-type = 0x83
+		bootable = "yes"
+	}
+}
diff --git a/board/stmicroelectronics/stm32mp157c-dk2-trusted/linux.config b/board/stmicroelectronics/stm32mp157c-dk2-trusted/linux.config
new file mode 100644
index 0000000000..5f53e48236
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157c-dk2-trusted/linux.config
@@ -0,0 +1,181 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_USELIB=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_ARCH_STM32=y
+CONFIG_ARM_THUMBEE=y
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_ERRATA_430973=y
+CONFIG_ARM_ERRATA_720789=y
+CONFIG_ARM_ERRATA_754322=y
+CONFIG_ARM_ERRATA_754327=y
+CONFIG_ARM_ERRATA_764369=y
+CONFIG_ARM_ERRATA_775420=y
+CONFIG_ARM_ERRATA_798181=y
+CONFIG_SMP=y
+CONFIG_MCPM=y
+CONFIG_HIGHMEM=y
+CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_SECCOMP=y
+# CONFIG_ATAGS is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_ARM_CRYPTO=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_CMDLINE_PARTITION=y
+CONFIG_CMA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_CAN=y
+CONFIG_CAN_M_CAN=y
+CONFIG_CFG80211=m
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_SIMPLE_PM_BUS=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_SRAM=y
+CONFIG_EEPROM_AT24=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_KS8851=y
+CONFIG_SMSC911X=y
+CONFIG_STMMAC_ETH=y
+CONFIG_DWMAC_DWC_QOS_ETH=y
+CONFIG_MDIO_BITBANG=y
+CONFIG_BRCMFMAC=m
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_STPMIC1_ONKEY=y
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_STM32F7=y
+CONFIG_SPI=y
+CONFIG_SPI_STM32=y
+CONFIG_SPI_STM32_QSPI=y
+CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_STMFX=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_SYSCON_REBOOT_MODE=y
+CONFIG_WATCHDOG=y
+CONFIG_STPMIC1_WATCHDOG=y
+CONFIG_MFD_STM32_LPTIMER=y
+CONFIG_MFD_STPMIC1=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_STM32_VREFBUF=y
+CONFIG_REGULATOR_STM32_PWR=y
+CONFIG_REGULATOR_STPMIC1=y
+CONFIG_DRM=y
+CONFIG_DRM_STM=y
+CONFIG_DRM_STM_DSI=y
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
+CONFIG_DRM_SII902X=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_DYNAMIC_MINORS=y
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_ISP1760=y
+CONFIG_USB_ISP1760_HOST_ROLE=y
+CONFIG_USB_HSIC_USB3503=y
+CONFIG_USB_GPIO_VBUS=y
+CONFIG_USB_ISP1301=y
+CONFIG_USB_ULPI=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_CONFIGFS=m
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_ECM=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_TYPEC=y
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK_MINORS=16
+CONFIG_MMC_ARMMMCI=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_DW=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PWM=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_STM32=y
+CONFIG_DMADEVICES=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_STM32_IPCC=y
+CONFIG_REMOTEPROC=y
+CONFIG_STM32_RPROC=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_IIO=y
+CONFIG_IIO_SW_TRIGGER=y
+CONFIG_SD_ADC_MODULATOR=y
+CONFIG_STM32_ADC_CORE=y
+CONFIG_STM32_ADC=y
+CONFIG_STM32_DFSDM_ADC=y
+CONFIG_STM32_DAC=y
+CONFIG_IIO_HRTIMER_TRIGGER=y
+CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
+CONFIG_PWM=y
+CONFIG_PWM_STM32=y
+CONFIG_PWM_STM32_LP=y
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_NVMEM_STM32_ROMEM=y
+CONFIG_EXT4_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_CRYPTO_SHA256=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=128
+CONFIG_PRINTK_TIME=y
diff --git a/board/stmicroelectronics/stm32mp157c-dk2-trusted/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp157c-dk2-trusted/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..a6595971a8
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157c-dk2-trusted/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp157c-dk2-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp157c-dk2-wifi.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/stmicroelectronics/stm32mp157c-dk2-trusted/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt b/board/stmicroelectronics/stm32mp157c-dk2-trusted/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt
new file mode 100644
index 0000000000..b36de8837f
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157c-dk2-trusted/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt
@@ -0,0 +1,59 @@
+# NVRAM file for BCM943430WLSELG
+# 2.4 GHz, 20 MHz BW mode
+
+# The following parameter values are just placeholders, need to be updated.
+manfid=0x2d0
+prodid=0x0726
+vendid=0x14e4
+devid=0x43e2
+boardtype=0x0726
+boardrev=0x1202
+boardnum=22
+macaddr=00:90:4c:c5:12:38
+sromrev=11
+boardflags=0x00404201
+boardflags3=0x08000000
+xtalfreq=37400
+#xtalfreq=19200
+nocrc=1
+ag0=255
+aa2g=1
+ccode=ALL
+
+pa0itssit=0x20
+extpagain2g=0
+
+#PA parameters for 2.4GHz, measured at CHIP OUTPUT
+pa2ga0=-168,7161,-820
+AvVmid_c0=0x0,0xc8
+cckpwroffset0=5
+
+# PPR params
+maxp2ga0=84
+txpwrbckof=6
+cckbw202gpo=0
+legofdmbw202gpo=0x66111111
+mcsbw202gpo=0x77711111
+propbw202gpo=0xdd
+
+# OFDM IIR :
+ofdmdigfilttype=18
+ofdmdigfilttypebe=18
+# PAPD mode:
+papdmode=1
+papdvalidtest=1
+pacalidx2g=32
+papdepsoffset=-36
+papdendidx=61
+
+il0macaddr=00:90:4c:c5:12:38
+wl0id=0x431b
+
+deadman_to=0xffffffff
+# muxenab: 0x1 for UART enable, 0x2 for GPIOs, 0x8 for JTAG
+muxenab=0x1
+# CLDO PWM voltage settings - 0x4 - 1.1 volt
+#cldo_pwm=0x4
+
+#VCO freq 326.4MHz
+spurconfig=0x3
diff --git a/board/stmicroelectronics/stm32mp157c-dk2-trusted/readme.txt b/board/stmicroelectronics/stm32mp157c-dk2-trusted/readme.txt
new file mode 100644
index 0000000000..dabf2f018a
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157c-dk2-trusted/readme.txt
@@ -0,0 +1,38 @@
+STM32MP157C Discovery Kit v2
+
+Intro
+=====
+
+This configuration supports the STM32MP157C Discovery Kit 2 (DK2)
+platform:
+
+  https://www.st.com/en/evaluation-tools/stm32mp157c-dk2.html
+
+How to build
+============
+
+ $ make stm32mp157c_dk2_trusted_defconfig
+ $ make
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an microSD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Boot the board
+==============
+
+ (1) Insert the microSD card in connector CN15
+
+ (2) Plug a micro-USB cable in connector CN11 and run your serial
+     communication program on /dev/ttyACM0.
+
+ (3) Plug a USB-C cable in CN6 to power-up the board.
+
+ (4) The system will start, with the console on UART, but also visible
+     on the screen.
diff --git a/board/stmicroelectronics/stm32mp157c-dk2-trusted/stm32mp157c-dk2-wifi.dts b/board/stmicroelectronics/stm32mp157c-dk2-trusted/stm32mp157c-dk2-wifi.dts
new file mode 100644
index 0000000000..89747d2b5f
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157c-dk2-trusted/stm32mp157c-dk2-wifi.dts
@@ -0,0 +1,32 @@
+/dts-v1/;
+
+#include "stm32mp157c-dk2.dts"
+
+/ {
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpioh 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
+/* Wifi */
+&sdmmc2 {
+	arm,primecell-periphid = <0x10153180>;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
+	non-removable;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	brcmf: bcrmf at 1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/configs/stm32mp157c_dk2_trusted_defconfig b/configs/stm32mp157c_dk2_trusted_defconfig
new file mode 100644
index 0000000000..e5cf8909da
--- /dev/null
+++ b/configs/stm32mp157c_dk2_trusted_defconfig
@@ -0,0 +1,40 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2-trusted/overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/common/stm32mp157-trusted/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.10"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2-trusted/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-dk2"
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/stmicroelectronics/stm32mp157c-dk2-trusted/stm32mp157c-dk2-wifi.dts"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
+BR2_PACKAGE_WIRELESS_REGDB=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-dk2.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.stm32"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1
