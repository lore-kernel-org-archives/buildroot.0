From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 27 Oct 2019 15:33:03 +0100
Subject: [Buildroot] [PATCH] configs/stm32mp157a_dk1: new defconfig
Message-ID: <20191027143303.30083-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The board support package includes the following components:
 - U-Boot 2019.10
 - Linux 5.3.7

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 .gitlab-ci.yml                                |   1 +
 DEVELOPERS                                    |   2 +
 .../stm32mp157a-dk1/genimage.cfg              |  24 +++
 .../stm32mp157a-dk1/linux.config              | 182 ++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |   4 +
 ...-fix-checking-the-presence-of-an-env.patch |  37 ++++
 .../stm32mp157a-dk1/readme.txt                |  38 ++++
 .../stm32mp157a-dk1/uboot-fragment.config     |   1 +
 configs/stm32mp157a_dk1_defconfig             |  32 +++
 9 files changed, 321 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/linux.config
 create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
 create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/readme.txt
 create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config
 create mode 100644 configs/stm32mp157a_dk1_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5466c4096d..f68f453585 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -316,6 +316,7 @@ solidrun_macchiatobin_marvell_defconfig: { extends: .defconfig }
 stm32f429_disco_defconfig: { extends: .defconfig }
 stm32f469_disco_defconfig: { extends: .defconfig }
 stm32mp157c_dk2_defconfig: { extends: .defconfig }
+stm32mp157a_dk1_defconfig: { extends: .defconfig }
 toradex_apalis_imx6_defconfig: { extends: .defconfig }
 ts4900_defconfig: { extends: .defconfig }
 ts5500_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 39f238751e..35db726cd7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -258,6 +258,8 @@ F:	package/orbit/
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	package/qt5/qt5scxml/
 F:	package/qt5/qt5webview/
+F:	board/stmicroelectronics/stm32mp157a-dk1/
+F:	configs/stm32mp157a_dk1_defconfig
 
 N:	Bartosz Golaszewski <brgl@bgdev.pl>
 F:	package/autoconf-archive/
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/genimage.cfg b/board/stmicroelectronics/stm32mp157a-dk1/genimage.cfg
new file mode 100644
index 0000000000..2b9e832dc9
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/genimage.cfg
@@ -0,0 +1,24 @@
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
+		partition-type = 0x83
+		bootable = "yes"
+		size = 256M
+	}
+}
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/linux.config b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
new file mode 100644
index 0000000000..95c834e431
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
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
+# CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
+# CONFIG_DRM_SII902X is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+# CONFIG_LCD_CLASS_DEVICE is not set
+# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
+# CONFIG_BACKLIGHT_GENERIC is not set
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
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
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..437e80fdeb
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp157a-dk1-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp157a-dk1.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
new file mode 100644
index 0000000000..695c8bbc42
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
@@ -0,0 +1,37 @@
+From a7204e5ae1e5f87ad449c7425cf7614205e60734 Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <bartosz.bilas@hotmail.com>
+Date: Sun, 27 Oct 2019 09:01:12 +0100
+Subject: [PATCH] stm32mp1: configs: fix checking the presence of an
+ environment
+
+Execute env check command within extra env settings section instead of
+bootcmd whereby we are able to mount rootfs partition from sd card properly.
+
+Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
+---
+ include/configs/stm32mp1.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
+index 988992b336..cadc0358fd 100644
+--- a/include/configs/stm32mp1.h
++++ b/include/configs/stm32mp1.h
+@@ -115,7 +115,6 @@
+ 	"if test ${boot_device} = serial || test ${boot_device} = usb;" \
+ 	"then stm32prog ${boot_device} ${boot_instance}; " \
+ 	"else " \
+-		"run env_check;" \
+ 		"if test ${boot_device} = mmc;" \
+ 		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
+ 		"if test ${boot_device} = nand;" \
+@@ -160,6 +159,7 @@
+ 	"initrd_high=0xffffffff\0" \
+ 	"altbootcmd=run bootcmd\0" \
+ 	"env_default=1\0" \
++	"run env_check;" \
+ 	"env_check=if test $env_default -eq 1;"\
+ 		" then env set env_default 0;env save;fi\0" \
+ 	STM32MP_BOOTCMD \
+-- 
+2.23.0
+
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/readme.txt b/board/stmicroelectronics/stm32mp157a-dk1/readme.txt
new file mode 100644
index 0000000000..060f71d5dc
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/readme.txt
@@ -0,0 +1,38 @@
+STM32MP157A Discovery Kit v1
+
+Intro
+=====
+
+This configuration supports the STM32MP157 Discovery Kit 1 (DK1)
+platform:
+
+  https://www.st.com/en/evaluation-tools/stm32mp157a-dk1.html
+
+How to build
+============
+
+ $ make stm32mp157a_dk1_defconfig
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
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config b/board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config
new file mode 100644
index 0000000000..a278ce9e23
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config
@@ -0,0 +1 @@
+# CONFIG_STM32MP_WATCHDOG is not set
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
new file mode 100644
index 0000000000..68140c9571
--- /dev/null
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -0,0 +1,32 @@
+
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157a-dk1/patches"
+BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157a-dk1/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.7"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dk1"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.23.0
