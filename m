From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Tue, 20 Oct 2015 16:48:04 +0000
Subject: [Buildroot] [PATCH v7] board: add support for Intel Galileo Gen 2
Message-ID: <1445359684.18938.6.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Delta's from v6:-
 * Changed spaces for tabs in efi-part, genimage, grub & S09modload 

Board support package includes:-
 * Toplevel build root configuration
 * Github based 3.8.7 Kernel
  * Upstream 3.8.7
  * Linux 3.8.7 Kernel Driver Patches
 * Linux 3.8.7 configuration
 * Grub configuration
 * Init Script to load modules
 * genimage config to create sdcard image. 

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 board/intel/galileo/efi-part.cfg                   |   9 +
 board/intel/galileo/genimage.cfg                   |  15 +
 board/intel/galileo/grub.cfg                       |  11 +
 board/intel/galileo/linux-3.8.config               | 310 +++++++++++++++++++++
 board/intel/galileo/post-build.sh                  |   2 +
 board/intel/galileo/post-image.sh                  |  26 ++
 .../galileo/rootfs_overlay/etc/init.d/S09modload   |  35 +++
 .../etc/modules-load.galileo/galileo.conf          |   6 +
 .../etc/modules-load.galileo/galileo_gen2.conf     |   7 +
 configs/galileo_defconfig                          |  25 ++
 10 files changed, 446 insertions(+)
 create mode 100644 board/intel/galileo/efi-part.cfg
 create mode 100644 board/intel/galileo/genimage.cfg
 create mode 100644 board/intel/galileo/grub.cfg
 create mode 100644 board/intel/galileo/linux-3.8.config
 create mode 100755 board/intel/galileo/post-build.sh
 create mode 100755 board/intel/galileo/post-image.sh
 create mode 100755 board/intel/galileo/rootfs_overlay/etc/init.d/S09modload
 create mode 100644 board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo.conf
 create mode 100644 board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo_gen2.conf
 create mode 100644 configs/galileo_defconfig

diff --git a/board/intel/galileo/efi-part.cfg b/board/intel/galileo/efi-part.cfg
new file mode 100644
index 0000000..c7f6e71
--- /dev/null
+++ b/board/intel/galileo/efi-part.cfg
@@ -0,0 +1,9 @@
+image efi-part.vfat {
+	vfat {
+		files = {
+			"startup.nsh",
+			"EFI",
+		}
+	}
+	size=512K
+}
diff --git a/board/intel/galileo/genimage.cfg b/board/intel/galileo/genimage.cfg
new file mode 100644
index 0000000..b1db6f7
--- /dev/null
+++ b/board/intel/galileo/genimage.cfg
@@ -0,0 +1,15 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		image = "efi-part.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 512M
+	}
+}
diff --git a/board/intel/galileo/grub.cfg b/board/intel/galileo/grub.cfg
new file mode 100644
index 0000000..e23dcb5
--- /dev/null
+++ b/board/intel/galileo/grub.cfg
@@ -0,0 +1,11 @@
+set default="0"
+set timeout="0"
+
+menuentry "Buildroot" {
+	# Grub2 supports ext2, load the kernel from the Linux rootfs partition
+	# Set root tells grub to search the 2nd partition for the bzImage
+	set root=(hd0,msdos2)
+
+	# Set Linux to boot from the 2nd partition, SD/MMC support is baked into the kernel
+	linux /boot/bzImage root=/dev/mmcblk0p2 rootwait console=ttyS1,115200n8 reboot=efi,warm apic=debug rw
+}
diff --git a/board/intel/galileo/linux-3.8.config b/board/intel/galileo/linux-3.8.config
new file mode 100644
index 0000000..9d724fe
--- /dev/null
+++ b/board/intel/galileo/linux-3.8.config
@@ -0,0 +1,310 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=18
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_RESOURCE_COUNTERS=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_NAMESPACES=y
+CONFIG_RELAY=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS_ALL=y
+# CONFIG_PCSPKR_PLATFORM is not set
+CONFIG_EMBEDDED=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_JUMP_LABEL=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_LBDAF is not set
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_BSD_DISKLABEL=y
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_ZONE_DMA is not set
+CONFIG_INTEL_QUARK_X1000_SOC=y
+CONFIG_M586TSC=y
+CONFIG_X86_GENERIC=y
+CONFIG_HPET_TIMER=y
+CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_X86_UP_APIC=y
+CONFIG_X86_UP_IOAPIC=y
+# CONFIG_X86_MCE_AMD is not set
+CONFIG_X86_REBOOTFIXUPS=y
+CONFIG_MICROCODE=y
+CONFIG_X86_MSR=y
+CONFIG_X86_CPUID=y
+CONFIG_HIGHMEM64G=y
+# CONFIG_COMPACTION is not set
+# CONFIG_MTRR is not set
+# CONFIG_ARCH_RANDOM is not set
+CONFIG_EFI=y
+CONFIG_EFI_STUB=y
+CONFIG_EFI_CAPSULE=m
+CONFIG_HZ_100=y
+CONFIG_KEXEC=y
+CONFIG_PHYSICAL_START=0x400000
+# CONFIG_RELOCATABLE is not set
+# CONFIG_COMPAT_VDSO is not set
+CONFIG_PM_RUNTIME=y
+CONFIG_PM_DEBUG=y
+CONFIG_PM_TRACE_RTC=y
+CONFIG_ACPI_PROCFS=y
+CONFIG_ACPI_PROCFS_POWER=y
+CONFIG_ACPI_EC_DEBUGFS=y
+# CONFIG_ACPI_PROC_EVENT is not set
+# CONFIG_ACPI_BATTERY is not set
+# CONFIG_ACPI_FAN is not set
+CONFIG_ACPI_DEBUG=y
+CONFIG_ACPI_PCI_SLOT=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_MSI=y
+CONFIG_PCI_DEBUG=y
+CONFIG_PCI_IOAPIC=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_SYN_COOKIES=y
+# CONFIG_IPV6_SIT is not set
+CONFIG_VLAN_8021Q=m
+CONFIG_VLAN_8021Q_GVRP=y
+CONFIG_CAN=m
+CONFIG_CAN_RAW=m
+CONFIG_CAN_BCM=m
+CONFIG_CAN_J1939=m
+CONFIG_CAN_VCAN=m
+CONFIG_CAN_SLCAN=m
+# CONFIG_CAN_DEV is not set
+CONFIG_BT=m
+CONFIG_BT_RFCOMM=m
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=m
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=m
+CONFIG_BT_HCIBTUSB=m
+CONFIG_BT_HCIVHCI=m
+CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=m
+CONFIG_RFKILL=m
+CONFIG_RFKILL_INPUT=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_DEBUG_DEVRES=y
+CONFIG_MTD=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_M25P80=y
+# CONFIG_PNP_DEBUG_MESSAGES is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=2
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=81920
+CONFIG_EEPROM_AT24=m
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_CONSTANTS=y
+CONFIG_SCSI_SPI_ATTRS=y
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_NETDEVICES=y
+CONFIG_MII=y
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_ALTEON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_ATHEROS is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_EXAR is not set
+# CONFIG_NET_VENDOR_HP is not set
+CONFIG_E1000=m
+# CONFIG_NET_VENDOR_I825XX is not set
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
+# CONFIG_NET_VENDOR_REALTEK is not set
+# CONFIG_NET_VENDOR_RDC is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+CONFIG_STMMAC_ETH=m
+# CONFIG_STMMAC_PLATFORM is not set
+CONFIG_STMMAC_PCI=y
+CONFIG_STMMAC_DA=y
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
+# CONFIG_NET_VENDOR_TI is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_PHYLIB=y
+CONFIG_PPP=m
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPP_ASYNC=m
+CONFIG_IWLWIFI=m
+# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_INPUT_EVDEV=m
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_LEGACY_PTY_COUNT=32
+CONFIG_SERIAL_NONSTANDARD=y
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_PNP is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_SERIAL_8250_PCI is not set
+CONFIG_SERIAL_8250_NR_UARTS=8
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DETECT_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+CONFIG_SERIAL_8250_DW=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_HPET=y
+# CONFIG_HPET_MMAP is not set
+CONFIG_SPI_DEBUG=y
+CONFIG_SPI_GPIO=y
+CONFIG_SPI_PXA2XX=y
+CONFIG_SPI_PXA2XX_PCI=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_PTP_1588_CLOCK_PCH=m
+CONFIG_GPIO_SCH=m
+CONFIG_GPIO_PCA953X=m
+CONFIG_GPIO_PCA953X_IRQ=y
+# CONFIG_HWMON is not set
+CONFIG_MFD_INTEL_QUARK_HSUART_DMA=y
+CONFIG_CY8C9540A=m
+CONFIG_MFD_PCA9685=m
+CONFIG_INTEL_QRK_GIP=m
+CONFIG_INTEL_QRK_GIP_TEST=m
+CONFIG_LPC_SCH=y
+CONFIG_MEDIA_SUPPORT=m
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=m
+# CONFIG_USB_GSPCA is not set
+# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
+# CONFIG_DVB_AU8522_V4L is not set
+# CONFIG_DVB_TUNER_DIB0070 is not set
+# CONFIG_DVB_TUNER_DIB0090 is not set
+# CONFIG_VGA_ARB is not set
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_SOUND=m
+CONFIG_SND=m
+CONFIG_SND_USB_AUDIO=m
+CONFIG_USB=m
+CONFIG_USB_EHCI_HCD=m
+CONFIG_USB_OHCI_HCD=m
+CONFIG_USB_UHCI_HCD=m
+CONFIG_USB_ACM=m
+CONFIG_USB_STORAGE=m
+CONFIG_USB_SERIAL=m
+CONFIG_USB_SERIAL_GENERIC=y
+CONFIG_USB_SERIAL_PL2303=m
+CONFIG_USB_GADGET=m
+CONFIG_USB_EG20T=m
+CONFIG_USB_ZERO=m
+CONFIG_USB_ETH=m
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+CONFIG_USB_G_ACM_MS=m
+CONFIG_MMC=y
+CONFIG_MMC_UNSAFE_RESUME=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PCI=y
+CONFIG_MMC_SDHCI_ACPI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_RTC_CLASS=y
+CONFIG_DMADEVICES=y
+CONFIG_DW_DMAC=y
+CONFIG_UIO=m
+CONFIG_STAGING=y
+CONFIG_MAX78M6610_LMU=m
+CONFIG_IIO_SYSFS_TRIGGER=m
+CONFIG_IIO_HRTIMER_TRIGGER=m
+# CONFIG_NET_VENDOR_SILICOM is not set
+CONFIG_INTEL_QRK_ESRAM=y
+CONFIG_INTEL_QRK_THERMAL=y
+CONFIG_INTEL_QRK_AUDIO_CTRL=m
+CONFIG_INTEL_QRK_J1708=m
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_IIO=m
+CONFIG_IIO_BUFFER_CB=y
+CONFIG_IIO_LIS331DLH_INTEL_QRK=m
+CONFIG_AD7298=m
+CONFIG_ADC1x8S102=m
+CONFIG_PWM=y
+CONFIG_EFI_VARS=m
+CONFIG_DMI_SYSFS=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_EXT3_FS_SECURITY=y
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NLS_DEFAULT="utf8"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_PRINTK_TIME=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_HEADERS_CHECK=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_TIMER_STATS=y
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_FTRACE is not set
+CONFIG_DEBUG_STACKOVERFLOW=y
+CONFIG_X86_PTDUMP=y
+# CONFIG_DEBUG_RODATA_TEST is not set
+CONFIG_DEBUG_SET_MODULE_RONX=y
+# CONFIG_DOUBLEFAULT is not set
+CONFIG_DEBUG_BOOT_PARAMS=y
+CONFIG_OPTIMIZE_INLINING=y
+CONFIG_KEYS=y
+CONFIG_KEYS_DEBUG_PROC_KEYS=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_NETWORK=y
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_VIRTUALIZATION is not set
+CONFIG_CRC_T10DIF=y
diff --git a/board/intel/galileo/post-build.sh b/board/intel/galileo/post-build.sh
new file mode 100755
index 0000000..490fb4d
--- /dev/null
+++ b/board/intel/galileo/post-build.sh
@@ -0,0 +1,2 @@
+#!/bin/sh
+cp board/intel/galileo/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
diff --git a/board/intel/galileo/post-image.sh b/board/intel/galileo/post-image.sh
new file mode 100755
index 0000000..f2aa43e
--- /dev/null
+++ b/board/intel/galileo/post-image.sh
@@ -0,0 +1,26 @@
+#!/bin/bash
+
+EFI_IMAGE_CFG="board/intel/galileo/efi-part.cfg"
+GENIMAGE_CFG="board/intel/galileo/genimage.cfg"
+EFI_PART_DIR="${BINARIES_DIR}/efi-part"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+mkimage () {
+	rm -rf "${GENIMAGE_TMP}"
+
+	genimage \
+		--rootpath "${TARGET_DIR}" \
+		--tmppath "${GENIMAGE_TMP}" \
+		--inputpath "$1" \
+		--outputpath "${BINARIES_DIR}" \
+		--config "$2"
+}
+
+# Create the EFI Partition
+mkimage "${EFI_PART_DIR}" "${EFI_IMAGE_CFG}"
+
+# Create the SD Card Image
+mkimage "${BINARIES_DIR}" "${GENIMAGE_CFG}"
+
+RET=${?}
+exit ${RET}
diff --git a/board/intel/galileo/rootfs_overlay/etc/init.d/S09modload b/board/intel/galileo/rootfs_overlay/etc/init.d/S09modload
new file mode 100755
index 0000000..427bddb
--- /dev/null
+++ b/board/intel/galileo/rootfs_overlay/etc/init.d/S09modload
@@ -0,0 +1,35 @@
+#!/bin/sh
+#
+
+load_drivers()
+{
+	while IFS= read -r line; do
+	  	modprobe $line
+	done < "/etc/modules-load.galileo/$1.conf"
+}
+
+do_board()
+{
+	board=$(cat /sys/devices/virtual/dmi/id/board_name)
+	case "$board" in
+		*"GalileoGen2" )
+			load_drivers "galileo_gen2" ;;
+		*"Galileo" )
+			load_drivers "galileo" ;;
+	esac
+}
+
+case "$1" in
+	start)
+		do_board
+		;;
+	stop)
+		;;
+	restart|reload)
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo.conf b/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo.conf
new file mode 100644
index 0000000..762aa2d
--- /dev/null
+++ b/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo.conf
@@ -0,0 +1,6 @@
+intel_qrk_gip
+cy8c9540a
+i2c_dev
+industrialio
+ad7298
+stmmac
diff --git a/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo_gen2.conf b/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo_gen2.conf
new file mode 100644
index 0000000..e8081e0
--- /dev/null
+++ b/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo_gen2.conf
@@ -0,0 +1,7 @@
+intel_qrk_gip
+gpio-pca953x
+pca9685
+i2c_dev
+industrialio
+adc1x8s102
+stmmac
diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
new file mode 100644
index 0000000..9bd3745
--- /dev/null
+++ b/configs/galileo_defconfig
@@ -0,0 +1,25 @@
+BR2_x86_x1000=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.8"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
+BR2_BINUTILS_VERSION_2_25_X=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_OVERLAY="board/intel/galileo/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/galileo/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/galileo/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mdr78/Linux-x1000.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d1a51d55dc67022be6c2d15163ce6dd28540042f"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.8.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_2r1=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs.ext2"
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_I386_EFI=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.1.0
