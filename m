From: David Lechner <david@lechnology.com>
Date: Sun, 30 Oct 2016 18:32:24 -0500
Subject: [Buildroot] [PATCH 2/4] board/lego/ev3: Create images using genimage
In-Reply-To: <1477870346-4941-1-git-send-email-david@lechnology.com>
References: <1477870346-4941-1-git-send-email-david@lechnology.com>
Message-ID: <1477870346-4941-3-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a script to create SD card and flash images for LEGO MINDSTORMS
EV3 using the genimage tool.

The default kernel config had to be modifed to add support for squashfs
and to add a ram disk.

Signed-off-by: David Lechner <david@lechnology.com>
---
 board/lego/ev3/genimage.cfg    |  57 ++++++++
 board/lego/ev3/linux_defconfig | 291 +++++++++++++++++++++++++++++++++++++++++
 board/lego/ev3/post-image.sh   |  14 ++
 board/lego/ev3/readme.txt      |  80 +++--------
 configs/lego_ev3_defconfig     |   8 +-
 5 files changed, 386 insertions(+), 64 deletions(-)
 create mode 100644 board/lego/ev3/genimage.cfg
 create mode 100644 board/lego/ev3/linux_defconfig
 create mode 100755 board/lego/ev3/post-image.sh

diff --git a/board/lego/ev3/genimage.cfg b/board/lego/ev3/genimage.cfg
new file mode 100644
index 0000000..6b8546c
--- /dev/null
+++ b/board/lego/ev3/genimage.cfg
@@ -0,0 +1,57 @@
+# LEGO MINDSTORMS EV3 can boot from a 16MB flash or from a microSD card.
+# The U-Boot bootloader from the flash is always used, even when booting
+# from a microSD card.
+
+# The Flash image
+
+flash nor-16M-256 {
+	pebsize = 4096
+	numpebs = 4096
+	minimum-io-unit-size = 256
+}
+
+image flash.bin {
+	flash {
+	}
+	flashtype = "nor-16M-256"
+	partition uboot {
+		image = "u-boot.bin"
+		size = 320K
+	}
+	partition uimage {
+		image = "uImage"
+		size = 3M
+		offset = 0x50000
+	}
+	partition rootfs {
+		image = "rootfs.squashfs"
+		size = 9600K
+		offset = 0x350000
+	}
+}
+
+# The SD card image
+
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 4M
+	}
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/lego/ev3/linux_defconfig b/board/lego/ev3/linux_defconfig
new file mode 100644
index 0000000..998e6da
--- /dev/null
+++ b/board/lego/ev3/linux_defconfig
@@ -0,0 +1,291 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_FHANDLE=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_NAMESPACES=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_EMBEDDED=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_DAVINCI=y
+CONFIG_ARCH_DAVINCI_DA850=y
+# CONFIG_MACH_DA8XX_DT is not set
+CONFIG_MACH_DAVINCI_LEGOEV3=y
+CONFIG_LEGOEV3_FIQ=y
+CONFIG_PREEMPT=y
+CONFIG_AEABI=y
+CONFIG_ZSMALLOC=y
+CONFIG_PGTABLE_MAPPING=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CPU_IDLE=y
+# CONFIG_SUSPEND is not set
+CONFIG_PM=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+# CONFIG_IPV6 is not set
+CONFIG_NETFILTER=y
+CONFIG_NF_CONNTRACK=m
+CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
+CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
+CONFIG_NETFILTER_XT_MATCH_NFACCT=m
+CONFIG_NF_CONNTRACK_IPV4=m
+CONFIG_NF_NAT_IPV4=m
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_BRIDGE=m
+CONFIG_BT=y
+CONFIG_BT_RFCOMM=m
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=y
+CONFIG_BT_HIDP=m
+CONFIG_BT_HCIBTUSB=m
+CONFIG_BT_HCIUART=y
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_CFG80211=m
+CONFIG_MAC80211=m
+CONFIG_MAC80211_DEBUGFS=y
+CONFIG_MAC80211_DEBUG_MENU=y
+CONFIG_RFKILL=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=4
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=32768
+CONFIG_EEPROM_AT24=y
+CONFIG_EEPROM_93CX6=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=m
+CONFIG_CHR_DEV_SG=y
+CONFIG_NETDEVICES=y
+# CONFIG_ETHERNET is not set
+CONFIG_USB_PEGASUS=m
+CONFIG_USB_RTL8150=m
+CONFIG_USB_NET_CDC_EEM=m
+# CONFIG_USB_NET_NET1080 is not set
+CONFIG_USB_IPHETH=m
+CONFIG_USB_ZD1201=m
+CONFIG_USB_NET_RNDIS_WLAN=m
+CONFIG_RTL8187=m
+CONFIG_ATH_CARDS=m
+CONFIG_ATH9K_HTC=m
+CONFIG_AR5523=m
+CONFIG_RT2X00=m
+CONFIG_RT2500USB=m
+CONFIG_RT73USB=m
+CONFIG_RT2800USB=m
+CONFIG_RT2800USB_RT3573=y
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_RT2800USB_RT55XX=y
+CONFIG_RT2800USB_UNKNOWN=y
+CONFIG_RTL8192CU=m
+# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_GPIO_POLLED=y
+CONFIG_KEYBOARD_XTKBD=m
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_JOYSTICK=y
+CONFIG_JOYSTICK_XPAD=m
+CONFIG_JOYSTICK_XPAD_FF=y
+CONFIG_JOYSTICK_XPAD_LEDS=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_UINPUT=m
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=3
+CONFIG_SERIAL_8250_RUNTIME_UARTS=3
+CONFIG_SERIAL_SUART_OMAPL_PRU=m
+CONFIG_TTY_PRINTK=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DAVINCI=y
+CONFIG_SPI=y
+CONFIG_SPI_DAVINCI=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_PCA953X=y
+CONFIG_GPIO_PCF857X=m
+CONFIG_HWMON=m
+CONFIG_SENSORS_LM75=m
+CONFIG_SENSORS_PCF8591=m
+CONFIG_WATCHDOG=y
+CONFIG_DAVINCI_WATCHDOG=y
+CONFIG_SSB=m
+CONFIG_TPS6507X=m
+CONFIG_MEDIA_SUPPORT=m
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=m
+CONFIG_USB_STV06XX=m
+CONFIG_USB_GSPCA_SPCA561=m
+CONFIG_FB=y
+CONFIG_FB_ST7586=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_LOGO_LINUX_CLUT224 is not set
+CONFIG_SOUND=m
+CONFIG_SND=m
+CONFIG_SND_SEQUENCER=m
+CONFIG_SND_SEQ_DUMMY=m
+CONFIG_SND_HRTIMER=m
+# CONFIG_SND_VERBOSE_PROCFS is not set
+CONFIG_SND_VIRMIDI=m
+CONFIG_SND_USB_AUDIO=m
+CONFIG_HID_BATTERY_STRENGTH=y
+CONFIG_HIDRAW=y
+CONFIG_HID_SONY=m
+CONFIG_SONY_FF=y
+CONFIG_HID_WIIMOTE=m
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_MON=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_ACM=m
+CONFIG_USB_STORAGE=y
+CONFIG_USBIP_CORE=m
+CONFIG_USBIP_VHCI_HCD=m
+CONFIG_USBIP_HOST=m
+CONFIG_USB_MUSB_HDRC=y
+CONFIG_USB_MUSB_GADGET=y
+CONFIG_USB_MUSB_DA8XX=y
+CONFIG_MUSB_PIO_ONLY=y
+CONFIG_USB_SERIAL=m
+CONFIG_USB_SERIAL_CP210X=m
+CONFIG_USB_SERIAL_FTDI_SIO=m
+CONFIG_USB_SERIAL_PL2303=m
+CONFIG_USB_LEGOTOWER=m
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_CONFIGFS=m
+CONFIG_USB_CONFIGFS_SERIAL=y
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_OBEX=y
+CONFIG_USB_CONFIGFS_NCM=y
+CONFIG_USB_CONFIGFS_ECM=y
+CONFIG_USB_CONFIGFS_ECM_SUBSET=y
+CONFIG_USB_CONFIGFS_RNDIS=y
+CONFIG_USB_CONFIGFS_EEM=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_USB_CONFIGFS_F_FS=y
+CONFIG_USB_CONFIGFS_F_UAC1=y
+CONFIG_USB_CONFIGFS_F_UAC2=y
+CONFIG_USB_CONFIGFS_F_MIDI=y
+CONFIG_USB_CONFIGFS_F_HID=y
+CONFIG_USB_CONFIGFS_F_UVC=y
+CONFIG_USB_CONFIGFS_F_PRINTER=y
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_EEM=y
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+CONFIG_USB_MIDI_GADGET=m
+CONFIG_USB_CDC_COMPOSITE=m
+CONFIG_MMC=y
+CONFIG_MMC_DAVINCI=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PWM=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_LEDS_TRIGGER_TRANSIENT=y
+CONFIG_RTC_CLASS=y
+# CONFIG_RTC_HCTOSYS is not set
+CONFIG_RTC_DRV_DS1307=m
+CONFIG_RTC_DRV_OMAP=y
+CONFIG_DMADEVICES=y
+CONFIG_TI_EDMA=y
+CONFIG_STAGING=y
+CONFIG_R8712U=y
+CONFIG_FB_TFT=y
+CONFIG_FB_TFT_ST7735R=y
+CONFIG_PWM=y
+CONFIG_PWM_GPIO=y
+CONFIG_PWM_TIECAP=y
+CONFIG_PWM_TIEHRPWM=y
+CONFIG_EXT2_FS=m
+CONFIG_EXT3_FS=m
+CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_EXT4_FS=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_FUSE_FS=m
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_CRAMFS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_LZ4=y
+CONFIG_SQUASHFS_LZO=y
+CONFIG_SQUASHFS_XZ=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_ROOT_NFS=y
+CONFIG_NFSD=m
+CONFIG_NFSD_V3_ACL=y
+CONFIG_NFSD_V4=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ASCII=m
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_PREEMPT is not set
+# CONFIG_FTRACE is not set
+# CONFIG_ARM_UNWIND is not set
+CONFIG_CRYPTO_CCM=y
+CONFIG_CRYPTO_CBC=y
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_MICHAEL_MIC=m
+CONFIG_CRYPTO_ARC4=y
+CONFIG_CRYPTO_DES=y
+# CONFIG_CRYPTO_HW is not set
+CONFIG_CRC_CCITT=y
+CONFIG_CRC_T10DIF=m
+CONFIG_CRC_ITU_T=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
+CONFIG_FONT_6x11=y
+CONFIG_FONT_MINI_4x6=y
diff --git a/board/lego/ev3/post-image.sh b/board/lego/ev3/post-image.sh
new file mode 100755
index 0000000..81626dc
--- /dev/null
+++ b/board/lego/ev3/post-image.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
diff --git a/board/lego/ev3/readme.txt b/board/lego/ev3/readme.txt
index 7d9ec4f..878dd2e 100644
--- a/board/lego/ev3/readme.txt
+++ b/board/lego/ev3/readme.txt
@@ -25,9 +25,13 @@ How it works
 Boot process :
 --------------
 
-The u-boot on-board the EV3 brick has provision to boot a Linux kernel from the
-external ?SD card. It will try to load a uImage from the first ?SD card
-partition, which must be formatted with a FAT filesystem.
+The EV3 boots from an EEPROM. This loads whatever is on the built-in 16MB flash
+(usually U-Boot) and runs it. The U-Boot from the official LEGO firmware and
+mainline U-Boot will attempt to boot a Linux kernel from the external ?SD card.
+It will try to load a uImage (and optional boot.scr) from the first ?SD card
+partition, which must be formatted with a FAT filesystem. If no ?SD is found or
+it does not contain a uImage file, then the EV3 will boot the uImage from from
+the built-in 16MB flash.
 
 How to build it
 ===============
@@ -54,74 +58,26 @@ Result of the build
 After building, you should obtain this tree:
 
     output/images/
+    ??? boot.vfat
+    ??? flash.bin
     ??? rootfs.ext2
     ??? rootfs.ext3 -> rootfs.ext2
+    ??? rootfs.squashfs
+    ??? sdcard.img
+    ??? u-boot.bin
     ??? uImage
 
-Prepare your SDcard
-===================
-
-The following ?SD card layout is recommended:
-
-- First partition formatted with a FAT filesystem, containing the uImage.
-- Second partition formatted as ext2 or ext3, containing the root filesystem.
-
-Create the SDcard partition table
-----------------------------------
-
-Determine the device associated to the SD card :
-
-  $ cat /proc/partitions
-
-Let's assume it is /dev/mmcblk0 :
-
-  $ sudo fdisk /dev/mmcblk0
-
-Delete all previous partitions by creating a new disklabel with 'o', then
-create the new partition table, using these options, pressing enter after each
-one:
-
-  * n p 1 2048 +10M t c
-  * n p 2 22528 +256M
-
-Using the 'p' option, the SD card's partition must look like this :
-
-Device          Boot  Start     End  Blocks  Id System
-/dev/mmcblk0p1         2048   22527   10240   c  W95 FAT32 (LBA)
-/dev/mmcblk0p2        22528  546815  262144  83  Linux
-
-Then write the partition table using 'w' and exit.
-
-Make partition one a DOS partition :
-
-  $ sudo mkfs.vfat /dev/mmcblk0p1
-
-Install the binaries to the SDcard
-----------------------------------
-
-Remember your binaries are located in output/images/, go inside that directory :
-
-  $ cd output/images
-
-Copy the Linux kernel:
-
-  $ sudo mkdir /mnt/sdcard
-  $ sudo mount /dev/mmcblk0p1 /mnt/sdcard
-  $ sudo cp uImage /mnt/sdcard
-  $ sudo umount /mnt/sdcard
-
-Copy the rootfs :
-
-  $ sudo dd if=rootfs.ext3 of=/dev/mmcblk0p2 bs=1M
-  $ sync
+Installation
+============
 
-It's Done!
+You can use either flash.bin or the sdcard.img. To load flash.bin, use the
+official Lego Mindstorms EV3 programming software firmware update tool to load
+the image. To use sdcard.img, use a disk writing tool such as Etcher or dd to
+write the image to the ?SD card.
 
 Finish
 ======
 
-Eject your ?SD card, insert it in your Lego EV3, and power it up.
-
 To have a serial console, you will need a proper USB to Lego serial port
 adapter plugged into the EV3 sensors port 1.
 See:
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index bf425f1..e96a689 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -8,7 +8,7 @@ BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
-
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
 # Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
@@ -17,15 +17,19 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/ev3dev/ev3dev-kernel.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.4.19-15-ev3dev-ev3_1"
-BR2_LINUX_KERNEL_DEFCONFIG="ev3dev"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/lego/ev3/linux_defconfig"
 BR2_LINUX_KERNEL_UIMAGE=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_3=y
+BR2_TARGET_ROOTFS_SQUASHFS=y
+BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # U-Boot
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.7.4
