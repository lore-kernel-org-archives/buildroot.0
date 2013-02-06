From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed,  6 Feb 2013 19:13:28 +0100
Subject: [Buildroot] [PATCH] Add Gnublin board support
Message-ID: <1360174408-18232-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 board/gnublin/README                |   51 +++++++++++++
 board/gnublin/gnublin_kernel_config |  139 +++++++++++++++++++++++++++++++++++
 configs/gnublin_defconfig           |   25 +++++++
 3 files changed, 215 insertions(+)
 create mode 100644 board/gnublin/README
 create mode 100644 board/gnublin/gnublin_kernel_config
 create mode 100644 configs/gnublin_defconfig

diff --git a/board/gnublin/README b/board/gnublin/README
new file mode 100644
index 0000000..2d94161
--- /dev/null
+++ b/board/gnublin/README
@@ -0,0 +1,51 @@
+This the Buildroot support for the Gnublin board (see here:
+http://en.gnublin.org/) and to the Elektor Linux board
+(http://www.elektor.com/news/elektor-presents-embedded-linux-made-easy.2147294.
+lynkx)
+
+Unfortunately currently the AD and the pwm modules are not supported, i'm about
+to add also those drivers as well to the current kernel later.
+
+Base kernel version: 3.7.0 (available here:
+https://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin/commits/gnublin-
+support)
+
+U-boot version: 2009.11 (available here:
+https://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support)
+
+
+Steps to create a bootable SD card:
+
+1.Config buildroot with the gnublin_defconfig:
+
+$ make gnublin_defconfig
+
+2.Tweak the config for your needs:
+
+$ make menuconfig
+
+3.Build:
+
+$ make
+
+4.Create two partitions on your SD card, one with type of BootIt (fdisk ID: df),
+the size should be around 1M, and another partition with all of the left space
+on the card, and with the type of normal DOS partition.
+
+5.From the output/images directory dump the u-boot image to the BootIt partition
+(probably you have to modify the output /dev files according to your system):
+
+$ dd if=output/images/u-boot.bin of=/dev/sdc1
+
+6.Dump the root fs image as well:
+
+$ dd if=output/images/rootfs.ext2 of=/dev/sdc2
+
+7.Insert the SD card into the board's slot, and your board should boot up with
+your newly created system.
+
+Any feedback/report is welcome on the mr.zoltan.gyarmati[at]gmail.com 
+
+
+
+
diff --git a/board/gnublin/gnublin_kernel_config b/board/gnublin/gnublin_kernel_config
new file mode 100644
index 0000000..3397506
--- /dev/null
+++ b/board/gnublin/gnublin_kernel_config
@@ -0,0 +1,139 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_NAMESPACES=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_EMBEDDED=y
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_LPC31XX=y
+CONFIG_MACH_GNUBLIN=y
+CONFIG_AEABI=y
+# CONFIG_COMPACTION is not set
+CONFIG_UACCESS_WITH_MEMCPY=y
+CONFIG_USE_OF=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=ttyS0,115200n8 root=/dev/ram0 rw"
+CONFIG_CPU_IDLE=y
+CONFIG_FPE_NWFPE=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_ARPD=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+CONFIG_IEEE802154=y
+CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+# CONFIG_MTD_OF_PARTS is not set
+CONFIG_MTD_CHAR=y
+CONFIG_PROC_DEVICETREE=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_BLK_DEV_XIP=y
+CONFIG_SCSI=y
+# CONFIG_SCSI_PROC_FS is not set
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_USB_USBNET=y
+# CONFIG_USB_NET_AX8817X is not set
+# CONFIG_USB_NET_CDCETHER is not set
+CONFIG_USB_NET_CDC_EEM=y
+# CONFIG_USB_NET_CDC_NCM is not set
+CONFIG_USB_NET_DM9601=y
+# CONFIG_USB_NET_NET1080 is not set
+# CONFIG_USB_NET_CDC_SUBSET is not set
+# CONFIG_USB_NET_ZAURUS is not set
+# CONFIG_WLAN is not set
+# CONFIG_IEEE802154_DRIVERS is not set
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=1
+CONFIG_SERIAL_8250_RUNTIME_UARTS=1
+CONFIG_LPC31XX_SERIAL_DMA_SUPPORT=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_PNX=y
+CONFIG_DEBUG_GPIO=y
+CONFIG_GPIO_SYSFS=y
+# CONFIG_HWMON is not set
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_LPC=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_STORAGE_DEBUG=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_DEBUG=y
+CONFIG_USB_FSL_USB2=y
+CONFIG_MMC=y
+CONFIG_MMC_LPC31XX=y
+CONFIG_UIO=y
+CONFIG_STAGING=y
+CONFIG_ANDROID=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_CRAMFS=y
+CONFIG_ROMFS_FS=y
+CONFIG_NFS_FS=y
+# CONFIG_NFS_V3 is not set
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=7
+CONFIG_DEBUG_FS=y
+CONFIG_DETECT_HUNG_TASK=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_FTRACE is not set
+CONFIG_CRC_CCITT=y
+CONFIG_CRC_ITU_T=y
diff --git a/configs/gnublin_defconfig b/configs/gnublin_defconfig
new file mode 100644
index 0000000..3664b96
--- /dev/null
+++ b/configs/gnublin_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Gnublin"
+BR2_TARGET_GENERIC_PASSWD_SHA256=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
+BR2_PACKAGE_LIBFFI=y
+BR2_PACKAGE_NCURSES=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=512000
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="GNUBLIN"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="2009.11_gnublin_support_v2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="gnublin_support_v1"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/gnublin/gnublin_kernel_config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
1.7.9.5
