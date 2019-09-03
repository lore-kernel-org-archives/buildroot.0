From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:36 -0000
Subject: [Buildroot] [git commit] configs/stm32mp157_dk: new defconfig
Message-ID: <20190903133619.62DE68A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bff5ae49ec69efd960f839ff24709f329f08dab8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a minimal defconfig to build a Buildroot system for
the STM32MP157 Discovery Kit, which is the low-cost evaluation
platform for the new STM32MP157 system-on-chip from ST. This
system-on-chip features a single or dual Cortex-A7, a single
Cortex-M4, and a wide variety of peripherals.

This commit includes a custom linux configuration file, because there
is no specific defconfig for this platform in the kernel, only
multi_v7_defconfig supports it, which is really a massive
defconfig. That's why a custom linux configuration file is added.

A small U-Boot config fragment allows to disable the watchdog, so that
userspace by default doesn't need to have a watchdog daemon running.

The vendor U-Boot and Linux trees are used for the moment, but the
platform support is being upstreamed, so switching to upstream
versions will be possible in the relatively near future.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |   1 +
 DEVELOPERS                                         |   2 +
 .../stmicroelectronics/stm32mp157-dk/genimage.cfg  |  24 +++
 .../stmicroelectronics/stm32mp157-dk/linux.config  | 182 +++++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf            |   4 +
 board/stmicroelectronics/stm32mp157-dk/readme.txt  |  38 +++++
 .../stm32mp157-dk/uboot-fragment.config            |   1 +
 configs/stm32mp157_dk_defconfig                    |  30 ++++
 8 files changed, 282 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 28824cc722..7ee6e248b1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -317,6 +317,7 @@ solidrun_macchiatobin_mainline_defconfig: { extends: .defconfig }
 solidrun_macchiatobin_marvell_defconfig: { extends: .defconfig }
 stm32f429_disco_defconfig: { extends: .defconfig }
 stm32f469_disco_defconfig: { extends: .defconfig }
+stm32mp157_dk_defconfig: { extends: .defconfig }
 toradex_apalis_imx6_defconfig: { extends: .defconfig }
 ts4800_defconfig: { extends: .defconfig }
 ts4900_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 040809f6a5..8ad48b95cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2224,9 +2224,11 @@ F:	package/ascii-invaders/
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
+F:	board/stmicroelectronics/stm32mp157-dk/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	boot/gummiboot/
+F:	configs/stm32mp157_dk_defconfig
 F:	package/android-tools/
 F:	package/b43-firmware/
 F:	package/b43-fwcutter/
diff --git a/board/stmicroelectronics/stm32mp157-dk/genimage.cfg b/board/stmicroelectronics/stm32mp157-dk/genimage.cfg
new file mode 100644
index 0000000000..33c418b9a5
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157-dk/genimage.cfg
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
+	partition uboot {
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
diff --git a/board/stmicroelectronics/stm32mp157-dk/linux.config b/board/stmicroelectronics/stm32mp157-dk/linux.config
new file mode 100644
index 0000000000..878a0c39f1
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157-dk/linux.config
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
diff --git a/board/stmicroelectronics/stm32mp157-dk/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp157-dk/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..325f3fc30e
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157-dk/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp15-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp157c-dk2.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/stmicroelectronics/stm32mp157-dk/readme.txt b/board/stmicroelectronics/stm32mp157-dk/readme.txt
new file mode 100644
index 0000000000..ac2061a234
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157-dk/readme.txt
@@ -0,0 +1,38 @@
+STM32MP157 Discovery Kit
+
+Intro
+=====
+
+This configuration supports the STM32MP157 Discovery Kit 2 (DK2)
+platform:
+
+  https://www.st.com/en/evaluation-tools/stm32mp157c-dk2.html
+
+How to build
+============
+
+ $ make stm32mp157_dk_defconfig
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
diff --git a/board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config b/board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config
new file mode 100644
index 0000000000..a278ce9e23
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config
@@ -0,0 +1 @@
+# CONFIG_STM32MP_WATCHDOG is not set
diff --git a/configs/stm32mp157_dk_defconfig b/configs/stm32mp157_dk_defconfig
new file mode 100644
index 0000000000..cb8cfb1693
--- /dev/null
+++ b/configs/stm32mp157_dk_defconfig
@@ -0,0 +1,30 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157-dk/overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157-dk/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,STMicroelectronics,linux,v4.19-stm32mp-r1.5)/linux-v4.19-stm32mp-r1.5.tar.gz"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157-dk/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-dk2"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,STMicroelectronics,u-boot,v2018.11-stm32mp-r2.5)/u-boot-v2018.11-stm32mp-r2.5.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
+BR2_PACKAGE_HOST_GENIMAGE=y
