From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@gmail.com>
Date: Tue,  1 Aug 2017 22:10:13 +0200
Subject: [Buildroot] [PATCH 1/1] New board - EVB SoCrates based on Altera
	Cyclone 5
Message-ID: <20170801201013.27685-1-michal.lyszczek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Micha? ?yszczek <michal.lyszczek@bofc.pl>

Configuration contains:
  - binary uboot SPL
  - building uboot from altera's github
  - booting from SD card
  - working ethernet, serial, spi, i2c, fpga_manager, gpio
  - minimal rootfs with busybox (~3.5Mb)
  - ready to flash SD card image

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

---
Changes v1 -> v2:
  - removed binary SPL (all compiled from source now)

 board/altera/socrates_cyclone5/boot-env.txt     |   3 +
 board/altera/socrates_cyclone5/boot.txt         |   7 +
 board/altera/socrates_cyclone5/create_sdcard.sh |  43 +++++
 board/altera/socrates_cyclone5/genimage.cfg     |  39 +++++
 board/altera/socrates_cyclone5/linux-4.1.config | 218 ++++++++++++++++++++++++
 board/altera/socrates_cyclone5/linux.dts        |  92 ++++++++++
 board/altera/socrates_cyclone5/readme.txt       |  52 ++++++
 configs/socrates_cyclone5_defconfig             |  37 ++++
 8 files changed, 491 insertions(+)
 create mode 100644 board/altera/socrates_cyclone5/boot-env.txt
 create mode 100644 board/altera/socrates_cyclone5/boot.txt
 create mode 100755 board/altera/socrates_cyclone5/create_sdcard.sh
 create mode 100644 board/altera/socrates_cyclone5/genimage.cfg
 create mode 100644 board/altera/socrates_cyclone5/linux-4.1.config
 create mode 100644 board/altera/socrates_cyclone5/linux.dts
 create mode 100644 board/altera/socrates_cyclone5/readme.txt
 create mode 100644 configs/socrates_cyclone5_defconfig

diff --git a/board/altera/socrates_cyclone5/boot-env.txt b/board/altera/socrates_cyclone5/boot-env.txt
new file mode 100644
index 0000000..30c55a1
--- /dev/null
+++ b/board/altera/socrates_cyclone5/boot-env.txt
@@ -0,0 +1,3 @@
+source_env=fatload mmc 0:1 0x2000000 boot.scr; source 0x2000000
+bootcmd=run source_env; run start
+bootdelay=1
diff --git a/board/altera/socrates_cyclone5/boot.txt b/board/altera/socrates_cyclone5/boot.txt
new file mode 100644
index 0000000..0a70ff3
--- /dev/null
+++ b/board/altera/socrates_cyclone5/boot.txt
@@ -0,0 +1,7 @@
+setenv linux_load_address 0x100000
+setenv linux_dtb_load_address 0x100
+setenv linux_load 'mmc rescan; fatload mmc 0:1 ${linux_load_address} zImage; fatload mmc 0:1 ${linux_dtb_load_address} linux.dtb'
+
+setenv bootargs 'console=ttyS0,115200 root=/dev/mmcblk0p3 rw rootwait'
+
+setenv start 'run linux_load; bootz ${linux_load_address} - ${linux_dtb_load_address}'
diff --git a/board/altera/socrates_cyclone5/create_sdcard.sh b/board/altera/socrates_cyclone5/create_sdcard.sh
new file mode 100755
index 0000000..70ca865
--- /dev/null
+++ b/board/altera/socrates_cyclone5/create_sdcard.sh
@@ -0,0 +1,43 @@
+#!/bin/bash
+#
+# Script generates sdcard image for altera cyclone5 (socrates board)
+
+# $1 - image directory (output/images)
+
+BOARD_DIR="$(dirname $0)"
+IMAGES_DIR="$1"
+GENIMAGE_CFG="$BOARD_DIR/genimage.cfg"
+GENIMAGE_TMP="$BUILD_DIR/genimage.tmp"
+
+###
+# create preloader image that consists of 4 64k images
+#
+
+truncate -s64k "$IMAGES_DIR/u-boot-spl.bin.crc"
+dd if="$IMAGES_DIR/u-boot-spl.bin.crc" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=0
+dd if="$IMAGES_DIR/u-boot-spl.bin.crc" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=1
+dd if="$IMAGES_DIR/u-boot-spl.bin.crc" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=2
+dd if="$IMAGES_DIR/u-boot-spl.bin.crc" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=3
+
+###
+# append real uboot at the end of preloader to create complete uboot
+# image
+#
+
+cat "$IMAGES_DIR/preloader.bin" "$IMAGES_DIR/u-boot.img" > \
+    "$IMAGES_DIR/boot_partition.img"
+
+###
+# create sdcard image according to genimage.cfg
+#
+
+rm -fr "$GENIMAGE_TMP"
+
+genimage                     \
+--rootpath   "$TARGET_DIR"   \
+--tmppath    "$GENIMAGE_TMP" \
+--inputpath  "$BINARIES_DIR" \
+--outputpath "$BINARIES_DIR" \
+--config     "$GENIMAGE_CFG"
+
+exit 0
diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
new file mode 100644
index 0000000..6c77017
--- /dev/null
+++ b/board/altera/socrates_cyclone5/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"linux.dtb",
+			"boot.scr"
+		}
+	}
+	size = 10321920
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition uboot-env {
+		in-partition-table = "no"
+		image = "uboot-env.bin"
+		offset = 17408 # 512 * 34 -> just after gpt
+	}
+
+	partition boot {
+		partition-type = 0xc
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition preboot {
+		partition-type = 0xa2
+		image = "boot_partition.img"
+		size = 1M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 500M
+	}
+}
diff --git a/board/altera/socrates_cyclone5/linux-4.1.config b/board/altera/socrates_cyclone5/linux-4.1.config
new file mode 100644
index 0000000..295bdb8
--- /dev/null
+++ b/board/altera/socrates_cyclone5/linux-4.1.config
@@ -0,0 +1,218 @@
+CONFIG_DEFAULT_HOSTNAME="hdp"
+CONFIG_SYSVIPC=y
+CONFIG_FHANDLE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_CPUSETS=y
+CONFIG_NAMESPACES=y
+CONFIG_EMBEDDED=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=y
+CONFIG_JUMP_LABEL=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_SOCFPGA=y
+CONFIG_SOCFPGA_SUSPEND=y
+CONFIG_ARM_THUMBEE=y
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCIE_ALTERA=y
+CONFIG_PCIE_ALTERA_MSI=y
+CONFIG_SMP=y
+CONFIG_SCHED_MC=y
+CONFIG_SCHED_SMT=y
+CONFIG_NR_CPUS=2
+CONFIG_AEABI=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_NET_KEY=y
+CONFIG_NET_KEY_MIGRATE=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_IPV6=y
+CONFIG_NETWORK_PHY_TIMESTAMPING=y
+CONFIG_VLAN_8021Q=y
+CONFIG_VLAN_8021Q_GVRP=y
+CONFIG_CAN=y
+CONFIG_CAN_C_CAN=y
+CONFIG_CAN_C_CAN_PLATFORM=y
+CONFIG_CAN_DEBUG_DEVICES=y
+# CONFIG_WIRELESS is not set
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_DENALI=y
+CONFIG_MTD_NAND_DENALI_DT=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_SPI_CADENCE_QUADSPI=y
+CONFIG_OF_CONFIGFS=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=2
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_SRAM=y
+CONFIG_ALTERA_HWMUTEX=y
+CONFIG_ALTERA_SYSID=y
+CONFIG_EEPROM_AT24=y
+CONFIG_EEPROM_93CX6=m
+CONFIG_ALTERA_STAPL=y
+CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_AGERE is not set
+# CONFIG_NET_VENDOR_ALTEON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ATHEROS is not set
+# CONFIG_NET_CADENCE is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_EXAR is not set
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_HISILICON is not set
+# CONFIG_NET_VENDOR_HP is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_PACKET_ENGINE is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_REALTEK is not set
+# CONFIG_NET_VENDOR_RDC is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+CONFIG_STMMAC_ETH=y
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
+# CONFIG_NET_VENDOR_TI is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_STE10XP=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_SERIO_LIBPS2=y
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+CONFIG_SERIAL_8250_DW=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_SPI=y
+CONFIG_SPI_ALTERA=y
+CONFIG_SPI_DESIGNWARE=y
+CONFIG_SPI_DW_MMIO=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_ALTERA=y
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_A10SYCON=y
+CONFIG_SENSORS_A10SYCON=y
+CONFIG_SENSORS_MAX1619=y
+CONFIG_PMBUS=y
+CONFIG_SENSORS_LTC2978=y
+CONFIG_SENSORS_LTC2978_REGULATOR=y
+CONFIG_WATCHDOG=y
+CONFIG_DW_WATCHDOG=y
+CONFIG_SSB=m
+CONFIG_SSB_DRIVER_PCICORE=y
+CONFIG_MFD_A10SYCON=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+# CONFIG_VGA_ARB is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_IDMAC=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_RTC_CLASS=y
+# CONFIG_RTC_HCTOSYS is not set
+CONFIG_RTC_DRV_DS1307=y
+CONFIG_DMADEVICES=y
+CONFIG_PL330_DMA=y
+CONFIG_UIO=m
+CONFIG_MAILBOX=y
+CONFIG_ALTERA_MBOX=y
+CONFIG_ARM_SMMU=y
+CONFIG_A10SYCON_RESET=y
+CONFIG_FPGA=y
+CONFIG_FPGA_REGION=y
+CONFIG_FPGA_MGR_SOCFPGA=y
+CONFIG_FPGA_MGR_SOCFPGA_A10=y
+CONFIG_FPGA_BRIDGE=y
+CONFIG_SOCFPGA_FPGA_BRIDGE=y
+CONFIG_ALTERA_FREEZE_BRIDGE=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_VFAT_FS=m
+CONFIG_TMPFS=y
+CONFIG_JFFS2_FS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=m
+CONFIG_NLS_ISO8859_1=m
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_FS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_FTRACE is not set
+# CONFIG_ARM_UNWIND is not set
+CONFIG_CRC_CCITT=m
+CONFIG_LIBCRC32C=m
+CONFIG_XZ_DEC=y
diff --git a/board/altera/socrates_cyclone5/linux.dts b/board/altera/socrates_cyclone5/linux.dts
new file mode 100644
index 0000000..f915f44
--- /dev/null
+++ b/board/altera/socrates_cyclone5/linux.dts
@@ -0,0 +1,92 @@
+/*
+ * Copyright Altera Corporation (C) 2012,2014. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "EBC SOCrates";
+	compatible = "ebv,socrates", "altr,socfpga_cyclone5", "altr,socfpga";
+
+	chosen {
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x40000000>; /* 1GB */
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		hps0 {
+			label = "hps_led0";
+			gpios = <&portb 28 1>;
+		};
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+
+	rxd0-skew-ps = <0>;
+	rxd1-skew-ps = <0>;
+	rxd2-skew-ps = <0>;
+	rxd3-skew-ps = <0>;
+	txen-skew-ps = <0>;
+	txc-skew-ps = <2600>;
+	rxdv-skew-ps = <0>;
+	rxc-skew-ps = <2000>;
+	max-frame-size = <3800>;
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&mmc0 {
+	cd-gpios = <&portb 18 0>;
+};
+
+&spi0 {
+	status = "okay";
+
+	spidev at 0 {
+		/* spidev causes a WARN_ON() so spoof with DAC compat */
+		compatible = "rohm,dh2228fv";
+		reg = <0>;	/* chip select */
+		spi-max-frequency = <1000000>;
+		enable-dma = <1>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
diff --git a/board/altera/socrates_cyclone5/readme.txt b/board/altera/socrates_cyclone5/readme.txt
new file mode 100644
index 0000000..8630be1
--- /dev/null
+++ b/board/altera/socrates_cyclone5/readme.txt
@@ -0,0 +1,52 @@
+EBV SoCrates Evaluation Board
+
+Intro
+=====
+
+More information about board can be found here:
+https://rocketboards.org/foswiki/Documentation/EBVSoCratesEvaluationBoard
+
+Build
+=====
+
+First, load socrates config for buildroot
+
+    make socrates_cyclone5_defconfig
+
+Build everything
+
+    make
+
+Following files will be generated in output/images
+
+.
+??? boot.scr
+??? boot.vfat
+??? boot_partition.img
+??? linux.dtb
+??? preloader.bin
+??? rootfs.ext2
+??? rootfs.ext4 -> rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? u-boot.bin
+??? u-boot.img
+??? uboot-env.bin
+??? zImage
+
+
+Creating bootable SD card
+=========================
+
+Simply invoke
+
+dd if=output/images/sdcard.img of=/dev/sdX
+
+Where X is your SD card device (not partition)
+
+Booting
+=======
+
+Pins 6:8 on P18 selector is used to determine boot device. To boot socrates from
+sdcard set these pins to value 0x5 (101b). Rest pins are used to determine how
+to configure FPGA and are not associate with booting into Linux kernel.
diff --git a/configs/socrates_cyclone5_defconfig b/configs/socrates_cyclone5_defconfig
new file mode 100644
index 0000000..1225b27
--- /dev/null
+++ b/configs/socrates_cyclone5_defconfig
@@ -0,0 +1,37 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_KERNEL_HEADERS_4_1=y
+BR2_GCC_VERSION_5_X=y
+BR2_GCC_ENABLE_LTO=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/socrates_cyclone5/create_sdcard.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-opensource/linux-socfpga.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-4.1.33-ltsi_17.07.02_pr"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/altera/socrates_cyclone5/linux-4.1.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/altera/socrates_cyclone5/linux.dts"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="10M"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2017.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="socfpga_socrates"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC=y
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/altera/socrates_cyclone5/boot-env.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="8192"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/altera/socrates_cyclone5/boot.txt"
+BR2_PACKAGE_HOST_GENIMAGE=y
--
2.10.2
