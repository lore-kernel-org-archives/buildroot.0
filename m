From: Simon Doppler <dopsi@dopsi.ch>
Date: Fri, 30 Apr 2021 10:56:53 +0000
Subject: [Buildroot] [PATCH 1/1] board: Add support for Seeed
 STM32MP157C-Odyssey
Message-ID: <20210430105647.1702322-1-dopsi@dopsi.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

STM32MP157C-Odyssey reference:
https://wiki.seeedstudio.com/ODYSSEY-STM32MP157C/

Signed-off-by: Simon Doppler <dopsi@dopsi.ch>
---
 board/seeed/stm32mp157c-odyssey/genimage.cfg  |  22 +++
 board/seeed/stm32mp157c-odyssey/linux.config  | 182 ++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |   4 +
 .../linux/5.10.1/0001-sdmmc1-broken-cd.patch  |  13 ++
 board/seeed/stm32mp157c-odyssey/post-image.sh |  12 ++
 .../stm32mp157c-odyssey/uboot-fragment.config |   1 +
 configs/stm32mp157c_odyssey_defconfig         |  31 +++
 7 files changed, 265 insertions(+)
 create mode 100644 board/seeed/stm32mp157c-odyssey/genimage.cfg
 create mode 100644 board/seeed/stm32mp157c-odyssey/linux.config
 create mode 100644 board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch
 create mode 100755 board/seeed/stm32mp157c-odyssey/post-image.sh
 create mode 100644 board/seeed/stm32mp157c-odyssey/uboot-fragment.config
 create mode 100644 configs/stm32mp157c_odyssey_defconfig

diff --git a/board/seeed/stm32mp157c-odyssey/genimage.cfg b/board/seeed/stm32mp157c-odyssey/genimage.cfg
new file mode 100644
index 0000000000..227fbb600c
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/genimage.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+	hdimage {
+		gpt = "true"
+	}
+
+	partition fsbl1 {
+		image = "u-boot-spl.stm32"
+	}
+
+	partition fsbl2 {
+		image = "u-boot-spl.stm32"
+	}
+
+	partition ssbl {
+		image = "u-boot.img"
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		bootable = "yes"
+	}
+}
diff --git a/board/seeed/stm32mp157c-odyssey/linux.config b/board/seeed/stm32mp157c-odyssey/linux.config
new file mode 100644
index 0000000000..878a0c39f1
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/linux.config
@@ -0,0 +1,182 @@
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
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=128
+CONFIG_SIMPLE_PM_BUS=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_STM32_FMC2=y
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
+CONFIG_I2C_MUX=y
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
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
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
+CONFIG_USB_HSIC_USB3503=y
+CONFIG_USB_GPIO_VBUS=y
+CONFIG_USB_ISP1301=y
+CONFIG_USB_ULPI=y
+CONFIG_TYPEC=y
+CONFIG_TYPEC_STUSB=y
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
+CONFIG_RPMSG_TTY=y
+CONFIG_IIO=y
+CONFIG_IIO_SW_TRIGGER=y
+CONFIG_SD_ADC_MODULATOR=y
+CONFIG_STM32_ADC_CORE=y
+CONFIG_STM32_ADC=y
+CONFIG_STM32_ADC_TEMP=y
+CONFIG_STM32_DFSDM_ADC=y
+CONFIG_STM32_LPTIMER_CNT=y
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
+CONFIG_PRINTK_TIME=y
diff --git a/board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf b/board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..b5795415eb
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp157c-odyssey-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp157c-odyssey.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch b/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch
new file mode 100644
index 0000000000..f15a096d91
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch
@@ -0,0 +1,13 @@
+Index: linux-5.10.1/arch/arm/boot/dts/stm32mp157c-odyssey.dts
+===================================================================
+--- linux-5.10.1.orig/arch/arm/boot/dts/stm32mp157c-odyssey.dts
++++ linux-5.10.1/arch/arm/boot/dts/stm32mp157c-odyssey.dts
+@@ -64,7 +64,7 @@
+ 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+ 	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+ 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+-	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
++	broken-cd;
+ 	disable-wp;
+ 	st,neg-edge;
+ 	bus-width = <4>;
diff --git a/board/seeed/stm32mp157c-odyssey/post-image.sh b/board/seeed/stm32mp157c-odyssey/post-image.sh
new file mode 100755
index 0000000000..aeb501e2e7
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/post-image.sh
@@ -0,0 +1,12 @@
+#!/usr/bin/env bash
+
+main()
+{
+	local GENIMAGE_CFG="board/seeed/stm32mp157-odyssey/genimage.cfg"
+
+	support/scripts/genimage.sh -c ${GENIMAGE_CFG}
+
+	exit $?
+}
+
+main $@
diff --git a/board/seeed/stm32mp157c-odyssey/uboot-fragment.config b/board/seeed/stm32mp157c-odyssey/uboot-fragment.config
new file mode 100644
index 0000000000..a278ce9e23
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/uboot-fragment.config
@@ -0,0 +1 @@
+# CONFIG_STM32MP_WATCHDOG is not set
diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
new file mode 100644
index 0000000000..b001757bf5
--- /dev/null
+++ b/configs/stm32mp157c_odyssey_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_CCACHE=y
+BR2_GLOBAL_PATCH_DIR="$(TOPDIR)/board/seeed/stm32mp157c-odyssey/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_ROOTFS_OVERLAY="board/seeed/stm32mp157c-odyssey/overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/seeed/stm32mp157c-odyssey/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.1"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/seeed/stm32mp157c-odyssey/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-odyssey"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/seeed/stm32mp157c-odyssey/uboot-fragment.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-odyssey"
+BR2_PACKAGE_HOST_GENEXT2FS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
--
2.25.1
