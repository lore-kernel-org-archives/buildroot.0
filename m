From: Steve Calfee <stevecalfee@gmail.com>
Date: Sat, 29 Dec 2012 14:45:39 -0800
Subject: [Buildroot] [PATCH] dockstar bsp
Message-ID: <1356821139-9103-1-git-send-email-stevecalfee@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simple bsp for the Seagate Dockstar.

Builds and runs using buildroot 2012.11

Signed-off-by: Steve Calfee <stevecalfee@gmail.com>
---
 board/sheevaplug/Config.in                         |   13 +
 board/sheevaplug/Makefile.in                       |    4 +
 board/sheevaplug/seagatedockstar/Makefile.in       |    5 +
 board/sheevaplug/seagatedockstar/README            |   62 +++++
 .../dockstar_dev_external_toolchain_defconfig      |   24 ++
 .../dockstar_internal_toolchain_defconfig          |   21 ++
 .../dockstar_toolchain_only_defconfig              |   16 ++
 .../seagatedockstar/linux-3.2plus.config           |  294 ++++++++++++++++++++
 board/sheevaplug/seagatedockstar/patchrootfs.sh    |   14 +
 .../seagatedockstar/skeleton/etc/inittab           |   46 +++
 .../sheevaplug/seagatedockstar/skeleton/etc/shadow |   12 +
 configs/dockstart_defconfig                        |   21 ++
 12 files changed, 532 insertions(+)
 create mode 100644 board/sheevaplug/Config.in
 create mode 100644 board/sheevaplug/Makefile.in
 create mode 100644 board/sheevaplug/seagatedockstar/Makefile.in
 create mode 100644 board/sheevaplug/seagatedockstar/README
 create mode 100644 board/sheevaplug/seagatedockstar/dockstar_dev_external_toolchain_defconfig
 create mode 100644 board/sheevaplug/seagatedockstar/dockstar_internal_toolchain_defconfig
 create mode 100644 board/sheevaplug/seagatedockstar/dockstar_toolchain_only_defconfig
 create mode 100644 board/sheevaplug/seagatedockstar/linux-3.2plus.config
 create mode 100755 board/sheevaplug/seagatedockstar/patchrootfs.sh
 create mode 100644 board/sheevaplug/seagatedockstar/skeleton/etc/inittab
 create mode 100644 board/sheevaplug/seagatedockstar/skeleton/etc/shadow
 create mode 100644 configs/dockstart_defconfig

diff --git a/board/sheevaplug/Config.in b/board/sheevaplug/Config.in
new file mode 100644
index 0000000..4744591
--- /dev/null
+++ b/board/sheevaplug/Config.in
@@ -0,0 +1,13 @@
+menuconfig BR2_TARGET_SHEEVAPLUG
+bool "Currently inserted for SeagateDockstar based on PogoPlug which is based on SheevaPlug "
+
+
+if BR2_TARGET_SHEEVAPLUG
+
+config BR2_TARGET_SHEEVAPLUG_PROJECT_SEAGATEDOCKSTAR
+bool "Support for user defined project DockStar"
+help
+This option enables support for project DockStar
+
+endif
+
diff --git a/board/sheevaplug/Makefile.in b/board/sheevaplug/Makefile.in
new file mode 100644
index 0000000..0850d4b
--- /dev/null
+++ b/board/sheevaplug/Makefile.in
@@ -0,0 +1,4 @@
+ifeq ($(BR2_TARGET_SHEEVAPLUG_PROJECT_SEAGATEDOCKSTAR),y)
+include target/device/sheevaplug/SeagateDockStar/Makefile.in
+endif
+
diff --git a/board/sheevaplug/seagatedockstar/Makefile.in b/board/sheevaplug/seagatedockstar/Makefile.in
new file mode 100644
index 0000000..8ebdfb7
--- /dev/null
+++ b/board/sheevaplug/seagatedockstar/Makefile.in
@@ -0,0 +1,5 @@
+MYNAS             = ../mynas
+BOARD_PATH        = target/device/sheevaplug/SeagateDockStar
+TARGET_SKELETON = target_skeleton
+BOARD_NAME = DockStar
+
diff --git a/board/sheevaplug/seagatedockstar/README b/board/sheevaplug/seagatedockstar/README
new file mode 100644
index 0000000..2e0fb11
--- /dev/null
+++ b/board/sheevaplug/seagatedockstar/README
@@ -0,0 +1,62 @@
+README for dockstar
+
+All this started with a Seagate Dockstar buildroot contribution by Marcus
+Osdoba. He got the original patches set up etc. The buildroot maintainers
+want a minimal configuration so other uses can bring up a buildroot
+distribution and add their own packages. I left a few that are essential to
+using a dockstar without opening up the case.  So I configured the kernel
+to allow booting from from either nfs or usb or the internal nand flash.
+This was after installing Jeff Doozan's uboot which also could handle this.
+
+The differences needed in the target's file system skeleton are minor, but
+important.  So locally, in this device directory, I put a skeleton
+filesystem that you want to overlay the default system in fs/skeleton. For
+a minimal system only etc/inittab and a password etc/shadow is changed.
+
+All files will be added by the patchscript on every build. So change here,
+for your personal configuration, not in the fs/skeleton.
+
+Note that I added a password to etc/shadow for user "root" which is
+password "root" so ssh connections to the target are possible.  But this
+also affects the serial connection, so the password will need to be used
+there too.
+
+While developing and testing, prevent annoying edits of the host ~/.ssh/...
+file to change the keys, copy the target's /etc/dropbear/ directory into
+the skeleton/etc here and it will be reapplied after every build and so the
+keys won't change on the target. If you don't do this dropbear will
+regenerate the keys on the first startup. I provide Marcus' initial
+dropbear keys here, just copy the dropbear dir to the local
+board/sheevaplug/SeagateDockStar/skeleton/etc/ directory and then
+you will only need to type "yes" the first time to ssh.
+
+Cleaning up the target filesystem is a problem in Buildroot (and clean is
+painfully slow, actually the rebuild after clean takes about an hour if you
+are doing the toolchain too). However everything put in the skeleton dir
+here (board/sheevaplug/SeagateDockStar/skeleton) will be installed
+every build.
+
+Similarly it is a pain to try and do everything in one buildroot source
+tree.  The clean or distclean targets require the rebuild of everything,
+compiler, uclibc library, busybox, buildroot, and the target packages. To
+avoid this:
+
+STEP ONE: Check out a complete tree and build it using
+dockstar_toolchain_only_defconfig. 
+
+STEP TWO: Check out another complete tree. In the new tree copy the
+board/sheevaplug/SeagateDockStar/dockstar_external_toolchain_defconfig
+config to the configs directory. You will have to edit the toolchain path
+in that config (use make menuconfig) to point to your previously build
+toolchain in the other buildroot tree.
+
+STEP THREE: In the new tree do a "make dockstar_dev_external_toolchain_defconfig". and use
+the just made toolchain and libraries as external toolchains. It saves at
+least half the build time.
+
+U-boot - I have not tried to use Marcus' build patches for u-boot. I have
+successfully downloaded and installed Jeff Doozan's dockstar uboot and use
+it with dockstar.  It is dangerous changing the bootstrap - if it is messed
+up it means possibly "bricking" the dockstar and forcing either a jtag
+recovery, or figuring out how to recover with a xmodem terminal, or setting
+up an attractive plastic paperweight.
diff --git a/board/sheevaplug/seagatedockstar/dockstar_dev_external_toolchain_defconfig b/board/sheevaplug/seagatedockstar/dockstar_dev_external_toolchain_defconfig
new file mode 100644
index 0000000..9c1c8bc
--- /dev/null
+++ b/board/sheevaplug/seagatedockstar/dockstar_dev_external_toolchain_defconfig
@@ -0,0 +1,24 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_JLEVEL=4
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_PATH="$(TOPDIR)/../tools/output/host/usr"
+BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
+BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_PACKAGE_GDB=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_TARGET_GENERIC_HOSTNAME="dockstar"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Dockstar and Buildroot"
+BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/board/sheevaplug/seagatedockstar/patchrootfs.sh"
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB=y
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(topdir)board/sheevaplug/seagatedockstar/linux-3.2plus.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/board/sheevaplug/seagatedockstar/dockstar_internal_toolchain_defconfig b/board/sheevaplug/seagatedockstar/dockstar_internal_toolchain_defconfig
new file mode 100644
index 0000000..4b19aa0
--- /dev/null
+++ b/board/sheevaplug/seagatedockstar/dockstar_internal_toolchain_defconfig
@@ -0,0 +1,21 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_JLEVEL=4
+BR2_PACKAGE_GDB=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_HOSTNAME="dockstar"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Dockstar and Buildroot"
+BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/board/sheevaplug/seagatedockstar/patchrootfs.sh"
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB=y
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(topdir)board/sheevaplug/seagatedockstar/linux-3.2plus.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/board/sheevaplug/seagatedockstar/dockstar_toolchain_only_defconfig b/board/sheevaplug/seagatedockstar/dockstar_toolchain_only_defconfig
new file mode 100644
index 0000000..8e4a771
--- /dev/null
+++ b/board/sheevaplug/seagatedockstar/dockstar_toolchain_only_defconfig
@@ -0,0 +1,16 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_JLEVEL=4
+BR2_STRIP_sstrip=y
+BR2_GCC_VERSION_4_4_X=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_GDB_SERVER=y
+BR2_PACKAGE_GDB_HOST=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+# BR2_PACKAGE_BUSYBOX is not set
diff --git a/board/sheevaplug/seagatedockstar/linux-3.2plus.config b/board/sheevaplug/seagatedockstar/linux-3.2plus.config
new file mode 100644
index 0000000..81a2303
--- /dev/null
+++ b/board/sheevaplug/seagatedockstar/linux-3.2plus.config
@@ -0,0 +1,294 @@
+# CONFIG_ARM_PATCH_PHYS_VIRT is not set
+CONFIG_PHYS_OFFSET=0x00000000
+CONFIG_EXPERIMENTAL=y
+CONFIG_LOCALVERSION="-bhteam"
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=19
+CONFIG_EMBEDDED=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_ARCH_KIRKWOOD=y
+CONFIG_MACH_DOCKSTAR=y
+# CONFIG_CPU_FEROCEON_OLD_ID is not set
+CONFIG_PREEMPT=y
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CPU_IDLE=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+# CONFIG_IPV6 is not set
+CONFIG_NETFILTER=y
+CONFIG_NF_CONNTRACK=y
+CONFIG_NF_CONNTRACK_EVENTS=y
+CONFIG_NF_CONNTRACK_TIMESTAMP=y
+CONFIG_NF_CT_PROTO_DCCP=y
+CONFIG_NF_CT_PROTO_SCTP=y
+CONFIG_NF_CT_PROTO_UDPLITE=y
+CONFIG_NF_CONNTRACK_AMANDA=y
+CONFIG_NF_CONNTRACK_FTP=y
+CONFIG_NF_CONNTRACK_H323=y
+CONFIG_NF_CONNTRACK_IRC=y
+CONFIG_NF_CONNTRACK_NETBIOS_NS=y
+CONFIG_NF_CONNTRACK_SNMP=y
+CONFIG_NF_CONNTRACK_PPTP=y
+CONFIG_NF_CONNTRACK_SANE=y
+CONFIG_NF_CONNTRACK_SIP=y
+CONFIG_NF_CONNTRACK_TFTP=y
+CONFIG_NF_CT_NETLINK=y
+CONFIG_NETFILTER_XT_TARGET_CLASSIFY=y
+CONFIG_NETFILTER_XT_TARGET_CONNMARK=y
+CONFIG_NETFILTER_XT_TARGET_IDLETIMER=y
+CONFIG_NETFILTER_XT_TARGET_LED=y
+CONFIG_NETFILTER_XT_TARGET_MARK=y
+CONFIG_NETFILTER_XT_TARGET_NFLOG=y
+CONFIG_NETFILTER_XT_TARGET_NFQUEUE=y
+CONFIG_NETFILTER_XT_TARGET_TEE=y
+CONFIG_NETFILTER_XT_TARGET_TCPMSS=y
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
+CONFIG_NETFILTER_XT_MATCH_CLUSTER=y
+CONFIG_NETFILTER_XT_MATCH_COMMENT=y
+CONFIG_NETFILTER_XT_MATCH_CONNBYTES=y
+CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=y
+CONFIG_NETFILTER_XT_MATCH_CONNMARK=y
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
+CONFIG_NETFILTER_XT_MATCH_CPU=y
+CONFIG_NETFILTER_XT_MATCH_DCCP=y
+CONFIG_NETFILTER_XT_MATCH_DEVGROUP=y
+CONFIG_NETFILTER_XT_MATCH_DSCP=y
+CONFIG_NETFILTER_XT_MATCH_ESP=y
+CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=y
+CONFIG_NETFILTER_XT_MATCH_HELPER=y
+CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
+CONFIG_NETFILTER_XT_MATCH_LENGTH=y
+CONFIG_NETFILTER_XT_MATCH_LIMIT=y
+CONFIG_NETFILTER_XT_MATCH_MAC=y
+CONFIG_NETFILTER_XT_MATCH_MARK=y
+CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
+CONFIG_NETFILTER_XT_MATCH_OSF=y
+CONFIG_NETFILTER_XT_MATCH_OWNER=y
+CONFIG_NETFILTER_XT_MATCH_POLICY=y
+CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
+CONFIG_NETFILTER_XT_MATCH_QUOTA=y
+CONFIG_NETFILTER_XT_MATCH_RATEEST=y
+CONFIG_NETFILTER_XT_MATCH_REALM=y
+CONFIG_NETFILTER_XT_MATCH_RECENT=y
+CONFIG_NETFILTER_XT_MATCH_SCTP=y
+CONFIG_NETFILTER_XT_MATCH_STATE=y
+CONFIG_NETFILTER_XT_MATCH_STATISTIC=y
+CONFIG_NETFILTER_XT_MATCH_STRING=y
+CONFIG_NETFILTER_XT_MATCH_TCPMSS=y
+CONFIG_NETFILTER_XT_MATCH_TIME=y
+CONFIG_NETFILTER_XT_MATCH_U32=y
+CONFIG_NF_CONNTRACK_IPV4=y
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_MATCH_AH=y
+CONFIG_IP_NF_MATCH_ECN=y
+CONFIG_IP_NF_MATCH_TTL=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_IP_NF_TARGET_REJECT=y
+CONFIG_IP_NF_TARGET_ULOG=y
+CONFIG_NF_NAT=y
+CONFIG_IP_NF_TARGET_MASQUERADE=y
+CONFIG_IP_NF_TARGET_NETMAP=y
+CONFIG_IP_NF_TARGET_REDIRECT=y
+CONFIG_IP_NF_MANGLE=y
+CONFIG_IP_NF_TARGET_CLUSTERIP=y
+CONFIG_IP_NF_TARGET_ECN=y
+CONFIG_IP_NF_TARGET_TTL=y
+CONFIG_IP_NF_RAW=y
+CONFIG_IP_NF_ARPTABLES=y
+CONFIG_IP_NF_ARPFILTER=y
+CONFIG_IP_NF_ARP_MANGLE=y
+CONFIG_NET_DSA=y
+CONFIG_NET_PKTGEN=y
+CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_JEDECPROBE=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_GEOMETRY=y
+# CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_CFI_STAA=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_ORION=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_BEB_RESERVE=1
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_SCSI_PROC_FS is not set
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI=y
+CONFIG_SATA_MV=y
+CONFIG_NETDEVICES=y
+CONFIG_MII=y
+CONFIG_NETCONSOLE=y
+CONFIG_NET_DSA_MV88E6123_61_65=y
+CONFIG_MV643XX_ETH=y
+# CONFIG_NET_PACKET_ENGINE is not set
+CONFIG_MARVELL_PHY=y
+CONFIG_LIBERTAS=y
+CONFIG_LIBERTAS_SDIO=y
+CONFIG_RT2X00=y
+CONFIG_RT73USB=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_LEGACY_PTY_COUNT=16
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MV64XXX=y
+CONFIG_SPI=y
+CONFIG_SPI_ORION=y
+CONFIG_GPIO_SYSFS=y
+# CONFIG_HWMON is not set
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+CONFIG_USB_PRINTER=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_STORAGE_DATAFAB=y
+CONFIG_USB_STORAGE_FREECOM=y
+CONFIG_USB_STORAGE_SDDR09=y
+CONFIG_USB_STORAGE_SDDR55=y
+CONFIG_USB_STORAGE_JUMPSHOT=y
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_CONSOLE=y
+CONFIG_USB_SERIAL_GENERIC=y
+CONFIG_USB_SERIAL_AIRCABLE=y
+CONFIG_USB_SERIAL_ARK3116=y
+CONFIG_USB_SERIAL_BELKIN=y
+CONFIG_USB_SERIAL_CH341=y
+CONFIG_USB_SERIAL_WHITEHEAT=y
+CONFIG_USB_SERIAL_DIGI_ACCELEPORT=y
+CONFIG_USB_SERIAL_CP210X=y
+CONFIG_USB_SERIAL_CYPRESS_M8=y
+CONFIG_USB_SERIAL_EMPEG=y
+CONFIG_USB_SERIAL_FTDI_SIO=y
+CONFIG_USB_SERIAL_FUNSOFT=y
+CONFIG_USB_SERIAL_VISOR=y
+CONFIG_USB_SERIAL_IPAQ=y
+CONFIG_USB_SERIAL_IR=y
+CONFIG_USB_SERIAL_EDGEPORT=y
+CONFIG_USB_SERIAL_EDGEPORT_TI=y
+CONFIG_USB_SERIAL_GARMIN=y
+CONFIG_USB_SERIAL_IPW=y
+CONFIG_USB_SERIAL_IUU=y
+CONFIG_USB_SERIAL_KEYSPAN_PDA=y
+CONFIG_USB_SERIAL_KEYSPAN=y
+CONFIG_USB_SERIAL_KEYSPAN_MPR=y
+CONFIG_USB_SERIAL_KEYSPAN_USA28=y
+CONFIG_USB_SERIAL_KEYSPAN_USA28X=y
+CONFIG_USB_SERIAL_KEYSPAN_USA28XA=y
+CONFIG_USB_SERIAL_KEYSPAN_USA28XB=y
+CONFIG_USB_SERIAL_KEYSPAN_USA19=y
+CONFIG_USB_SERIAL_KEYSPAN_USA18X=y
+CONFIG_USB_SERIAL_KEYSPAN_USA19W=y
+CONFIG_USB_SERIAL_KEYSPAN_USA19QW=y
+CONFIG_USB_SERIAL_KEYSPAN_USA19QI=y
+CONFIG_USB_SERIAL_KEYSPAN_USA49W=y
+CONFIG_USB_SERIAL_KEYSPAN_USA49WLC=y
+CONFIG_USB_SERIAL_KLSI=y
+CONFIG_USB_SERIAL_KOBIL_SCT=y
+CONFIG_USB_SERIAL_MCT_U232=y
+CONFIG_USB_SERIAL_MOS7720=y
+CONFIG_USB_SERIAL_MOS7840=y
+CONFIG_USB_SERIAL_MOTOROLA=y
+CONFIG_USB_SERIAL_NAVMAN=y
+CONFIG_USB_SERIAL_PL2303=y
+CONFIG_USB_SERIAL_OTI6858=y
+CONFIG_USB_SERIAL_QCAUX=y
+CONFIG_USB_SERIAL_QUALCOMM=y
+CONFIG_USB_SERIAL_SPCP8X5=y
+CONFIG_USB_SERIAL_HP4X=y
+CONFIG_USB_SERIAL_SAFE=y
+CONFIG_USB_SERIAL_SAFE_PADDED=y
+CONFIG_USB_SERIAL_SIEMENS_MPI=y
+CONFIG_USB_SERIAL_SIERRAWIRELESS=y
+CONFIG_USB_SERIAL_SYMBOL=y
+CONFIG_USB_SERIAL_TI=y
+CONFIG_USB_SERIAL_CYBERJACK=y
+CONFIG_USB_SERIAL_XIRCOM=y
+CONFIG_USB_SERIAL_OPTION=y
+CONFIG_USB_SERIAL_OMNINET=y
+CONFIG_USB_SERIAL_OPTICON=y
+CONFIG_USB_SERIAL_VIVOPAY_SERIAL=y
+CONFIG_USB_SERIAL_ZIO=y
+CONFIG_USB_SERIAL_SSU100=y
+CONFIG_USB_SEVSEG=y
+CONFIG_USB_RIO500=y
+CONFIG_USB_LEGOTOWER=y
+CONFIG_USB_LCD=y
+CONFIG_USB_LED=y
+CONFIG_MMC=y
+CONFIG_SDIO_UART=y
+CONFIG_MMC_MVSDIO=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_S35390A=y
+CONFIG_RTC_DRV_MV=y
+CONFIG_DMADEVICES=y
+CONFIG_MV_XOR=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_JFFS2_FS=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_CRAMFS=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_2=y
+CONFIG_NLS_UTF8=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_PREEMPT is not set
+CONFIG_DEBUG_INFO=y
+# CONFIG_FTRACE is not set
+CONFIG_DEBUG_USER=y
+CONFIG_DEBUG_LL=y
+CONFIG_CRYPTO_CBC=y
+CONFIG_CRYPTO_PCBC=y
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_DEV_MV_CESA=y
+CONFIG_CRC_CCITT=y
diff --git a/board/sheevaplug/seagatedockstar/patchrootfs.sh b/board/sheevaplug/seagatedockstar/patchrootfs.sh
new file mode 100755
index 0000000..dc5a308
--- /dev/null
+++ b/board/sheevaplug/seagatedockstar/patchrootfs.sh
@@ -0,0 +1,14 @@
+#!/bin/bash
+#
+# script which runs before creating rootfs
+#
+#
+MAINDIR=${1}/../../
+SRCDIR=${MAINDIR}"board/sheevaplug/seagatedockstar/skeleton/*"
+DESTDIR=${1}
+echo "patching some stuff in " ${DESTDIR} from ${SRCDIR}
+#echo "DESTDIR " ${DESTDIR}
+#echo "SRCDIR " ${SRCDIR}
+#ls -l ${SRCDIR} ${SRCDIR}"/etc"
+cp -rv ${SRCDIR} ${DESTDIR}
+echo "end of userdefined script before packing rootfs"
diff --git a/board/sheevaplug/seagatedockstar/skeleton/etc/inittab b/board/sheevaplug/seagatedockstar/skeleton/etc/inittab
new file mode 100644
index 0000000..2111d5d
--- /dev/null
+++ b/board/sheevaplug/seagatedockstar/skeleton/etc/inittab
@@ -0,0 +1,46 @@
+# /etc/inittab
+#
+# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
+#
+# Note: BusyBox init doesn't support runlevels.  The runlevels field is
+# completely ignored by BusyBox init. If you want runlevels, use
+# sysvinit.
+#
+# Format for each entry: <id>:<runlevels>:<action>:<process>
+#
+# id        == tty to run on, or empty for /dev/console
+# runlevels == ignored
+# action    == one of sysinit, respawn, askfirst, wait, and once
+# process   == program to run
+
+# Startup the system
+#null::sysinit:/bin/mount -o remount,rw /
+null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mkdir -p /dev/pts
+null::sysinit:/bin/mount -a
+null::sysinit:/bin/hostname -F /etc/hostname
+# now run any rc scripts
+::sysinit:/etc/init.d/rcS
+
+# Set up a couple of getty's
+#tty1::respawn:/sbin/getty 38400 tty1
+#tty2::respawn:/sbin/getty 38400 tty2
+
+# Put a getty on the serial port
+ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
+
+# Logging junk
+null::sysinit:/bin/touch /var/log/messages
+null::respawn:/sbin/syslogd -n -m 0
+null::respawn:/sbin/klogd -n
+tty3::respawn:/usr/bin/tail -f /var/log/messages
+
+# Stuff to do for the 3-finger salute
+::ctrlaltdel:/sbin/reboot
+
+# Stuff to do before rebooting
+null::shutdown:/usr/bin/killall klogd
+null::shutdown:/usr/bin/killall syslogd
+null::shutdown:/bin/umount -a -r
+null::shutdown:/sbin/swapoff -a
+
diff --git a/board/sheevaplug/seagatedockstar/skeleton/etc/shadow b/board/sheevaplug/seagatedockstar/skeleton/etc/shadow
new file mode 100644
index 0000000..ff29c40
--- /dev/null
+++ b/board/sheevaplug/seagatedockstar/skeleton/etc/shadow
@@ -0,0 +1,12 @@
+root:$1$LqBi5GdU$mYosovzQVc9h8Szv7dtX0/:0:0:99999:7:::
+bin:*:10933:0:99999:7:::
+daemon:*:10933:0:99999:7:::
+adm:*:10933:0:99999:7:::
+lp:*:10933:0:99999:7:::
+sync:*:10933:0:99999:7:::
+shutdown:*:10933:0:99999:7:::
+halt:*:10933:0:99999:7:::
+uucp:*:10933:0:99999:7:::
+operator:*:10933:0:99999:7:::
+nobody:*:10933:0:99999:7:::
+default::10933:0:99999:7:::
diff --git a/configs/dockstart_defconfig b/configs/dockstart_defconfig
new file mode 100644
index 0000000..4b19aa0
--- /dev/null
+++ b/configs/dockstart_defconfig
@@ -0,0 +1,21 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_JLEVEL=4
+BR2_PACKAGE_GDB=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_HOSTNAME="dockstar"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Dockstar and Buildroot"
+BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/board/sheevaplug/seagatedockstar/patchrootfs.sh"
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB=y
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(topdir)board/sheevaplug/seagatedockstar/linux-3.2plus.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
1.7.9.5
