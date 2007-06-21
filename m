From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 21 Jun 2007 15:10:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target
	target/device/x86/i386 toolchain/ etc...
Message-ID: <20070621221013.5864248688@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-21 15:10:12 -0700 (Thu, 21 Jun 2007)
New Revision: 18889

Log:
- bump version to 2.6.21.5


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.config
   trunk/buildroot/target/linux26.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.config
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.config	2007-06-21 22:09:36 UTC (rev 18888)
+++ trunk/buildroot/target/device/x86/i386/linux26.config	2007-06-21 22:10:12 UTC (rev 18889)
@@ -1,15 +1,18 @@
 #
 # Automatically generated make config: don't edit
-# Linux kernel version: 2.6.20.3
-# Wed Mar 14 16:32:35 2007
+# Linux kernel version: 2.6.21.5
+# Thu Jun 21 22:18:37 2007
 #
 CONFIG_X86_32=y
 CONFIG_GENERIC_TIME=y
+CONFIG_CLOCKSOURCE_WATCHDOG=y
+CONFIG_GENERIC_CLOCKEVENTS=y
 CONFIG_LOCKDEP_SUPPORT=y
 CONFIG_STACKTRACE_SUPPORT=y
 CONFIG_SEMAPHORE_SLEEPERS=y
 CONFIG_X86=y
 CONFIG_MMU=y
+CONFIG_ZONE_DMA=y
 CONFIG_GENERIC_ISA_DMA=y
 CONFIG_GENERIC_IOMAP=y
 CONFIG_GENERIC_BUG=y
@@ -33,6 +36,7 @@
 CONFIG_SWAP=y
 CONFIG_SYSVIPC=y
 # CONFIG_IPC_NS is not set
+CONFIG_SYSVIPC_SYSCTL=y
 CONFIG_POSIX_MQUEUE=y
 # CONFIG_BSD_PROCESS_ACCT is not set
 # CONFIG_TASKSTATS is not set
@@ -41,6 +45,7 @@
 # CONFIG_IKCONFIG is not set
 # CONFIG_SYSFS_DEPRECATED is not set
 # CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE=""
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_SYSCTL=y
@@ -98,6 +103,9 @@
 #
 # Processor type and features
 #
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
 # CONFIG_SMP is not set
 CONFIG_X86_PC=y
 # CONFIG_X86_ELAN is not set
@@ -134,7 +142,6 @@
 # CONFIG_MVIAC3_2 is not set
 # CONFIG_X86_GENERIC is not set
 CONFIG_X86_CMPXCHG=y
-CONFIG_X86_XADD=y
 CONFIG_X86_L1_CACHE_SHIFT=5
 CONFIG_RWSEM_XCHGADD_ALGORITHM=y
 # CONFIG_ARCH_HAS_ILOG2_U32 is not set
@@ -191,6 +198,7 @@
 CONFIG_SPARSEMEM_STATIC=y
 CONFIG_SPLIT_PTLOCK_CPUS=4
 # CONFIG_RESOURCES_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=1
 # CONFIG_MATH_EMULATION is not set
 # CONFIG_MTRR is not set
 # CONFIG_EFI is not set
@@ -220,11 +228,10 @@
 #
 CONFIG_ACPI=y
 # CONFIG_ACPI_SLEEP is not set
+# CONFIG_ACPI_PROCFS is not set
 CONFIG_ACPI_AC=m
 CONFIG_ACPI_BATTERY=m
 CONFIG_ACPI_BUTTON=m
-CONFIG_ACPI_VIDEO=m
-# CONFIG_ACPI_HOTKEY is not set
 CONFIG_ACPI_FAN=m
 # CONFIG_ACPI_DOCK is not set
 CONFIG_ACPI_PROCESSOR=m
@@ -256,9 +263,45 @@
 #
 # CPU Frequency scaling
 #
-# CONFIG_CPU_FREQ is not set
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_TABLE=y
+# CONFIG_CPU_FREQ_DEBUG is not set
+CONFIG_CPU_FREQ_STAT=y
+# CONFIG_CPU_FREQ_STAT_DETAILS is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=m
+# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
+# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
 
 #
+# CPUFreq processor drivers
+#
+CONFIG_X86_ACPI_CPUFREQ=m
+# CONFIG_X86_POWERNOW_K6 is not set
+# CONFIG_X86_POWERNOW_K7 is not set
+# CONFIG_X86_POWERNOW_K8 is not set
+# CONFIG_X86_GX_SUSPMOD is not set
+CONFIG_X86_SPEEDSTEP_CENTRINO=m
+# CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI is not set
+CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
+# CONFIG_X86_SPEEDSTEP_ICH is not set
+# CONFIG_X86_SPEEDSTEP_SMI is not set
+CONFIG_X86_P4_CLOCKMOD=m
+# CONFIG_X86_CPUFREQ_NFORCE2 is not set
+# CONFIG_X86_LONGRUN is not set
+CONFIG_X86_LONGHAUL=m
+# CONFIG_X86_E_POWERSAVER is not set
+
+#
+# shared options
+#
+# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
+CONFIG_X86_SPEEDSTEP_LIB=m
+
+#
 # Bus options (PCI, PCMCIA, EISA, MCA, ISA)
 #
 CONFIG_PCI=y
@@ -306,7 +349,9 @@
 CONFIG_XFRM=y
 CONFIG_XFRM_USER=m
 # CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
 CONFIG_NET_KEY=m
+# CONFIG_NET_KEY_MIGRATE is not set
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
@@ -377,6 +422,7 @@
 CONFIG_NF_CONNTRACK_IRC=m
 CONFIG_NF_CONNTRACK_NETBIOS_NS=m
 CONFIG_NF_CONNTRACK_PPTP=m
+# CONFIG_NF_CONNTRACK_SANE is not set
 CONFIG_NF_CONNTRACK_SIP=m
 CONFIG_NF_CONNTRACK_TFTP=m
 CONFIG_NF_CT_NETLINK=m
@@ -390,6 +436,7 @@
 CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
 CONFIG_NETFILTER_XT_TARGET_SECMARK=m
 CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
+CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
 CONFIG_NETFILTER_XT_MATCH_COMMENT=m
 CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
 CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
@@ -434,7 +481,6 @@
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_TARGET_LOG=m
 CONFIG_IP_NF_TARGET_ULOG=m
-CONFIG_IP_NF_TARGET_TCPMSS=m
 CONFIG_NF_NAT=m
 CONFIG_NF_NAT_NEEDED=y
 CONFIG_IP_NF_TARGET_MASQUERADE=m
@@ -598,7 +644,7 @@
 CONFIG_KLIPS_ENC_AES=y
 # CONFIG_KLIPS_ENC_NULL is not set
 CONFIG_KLIPS_IPCOMP=y
-CONFIG_KLIPS_DEBUG=y
+# CONFIG_KLIPS_DEBUG is not set
 
 #
 # Device Drivers
@@ -711,7 +757,6 @@
 # NAND Flash Device Drivers
 #
 # CONFIG_MTD_NAND is not set
-# CONFIG_MTD_NAND_CAFE is not set
 
 #
 # OneNAND Flash Device Drivers
@@ -726,9 +771,15 @@
 #
 # Plug and Play support
 #
-# CONFIG_PNP is not set
+CONFIG_PNP=y
+# CONFIG_PNP_DEBUG is not set
 
 #
+# Protocols
+#
+CONFIG_PNPACPI=y
+
+#
 # Block devices
 #
 CONFIG_BLK_DEV_FD=m
@@ -746,7 +797,6 @@
 CONFIG_BLK_DEV_RAM_COUNT=4
 CONFIG_BLK_DEV_RAM_SIZE=16384
 CONFIG_BLK_DEV_RAM_BLOCKSIZE=1024
-CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CDROM_PKTCDVD is not set
 # CONFIG_ATA_OVER_ETH is not set
 
@@ -756,6 +806,7 @@
 # CONFIG_IBM_ASM is not set
 # CONFIG_SGI_IOC4 is not set
 # CONFIG_TIFM_CORE is not set
+# CONFIG_SONY_LAPTOP is not set
 
 #
 # ATA/ATAPI/MFM/RLL support
@@ -774,6 +825,7 @@
 # CONFIG_BLK_DEV_IDECD is not set
 # CONFIG_BLK_DEV_IDETAPE is not set
 # CONFIG_BLK_DEV_IDEFLOPPY is not set
+# CONFIG_BLK_DEV_IDEACPI is not set
 # CONFIG_IDE_TASK_IOCTL is not set
 
 #
@@ -781,6 +833,7 @@
 #
 CONFIG_IDE_GENERIC=y
 # CONFIG_BLK_DEV_CMD640 is not set
+# CONFIG_BLK_DEV_IDEPNP is not set
 CONFIG_BLK_DEV_IDEPCI=y
 CONFIG_IDEPCI_SHARE_IRQ=y
 # CONFIG_BLK_DEV_OFFBOARD is not set
@@ -789,7 +842,6 @@
 # CONFIG_BLK_DEV_RZ1000 is not set
 CONFIG_BLK_DEV_IDEDMA_PCI=y
 # CONFIG_BLK_DEV_IDEDMA_FORCED is not set
-CONFIG_IDEDMA_PCI_AUTO=y
 # CONFIG_IDEDMA_ONLYDISK is not set
 # CONFIG_BLK_DEV_AEC62XX is not set
 # CONFIG_BLK_DEV_ALI15X3 is not set
@@ -806,6 +858,7 @@
 # CONFIG_BLK_DEV_JMICRON is not set
 CONFIG_BLK_DEV_SC1200=m
 CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_IT8213=m
 CONFIG_BLK_DEV_IT821X=m
 CONFIG_BLK_DEV_NS87415=m
 # CONFIG_BLK_DEV_PDC202XX_OLD is not set
@@ -816,10 +869,10 @@
 # CONFIG_BLK_DEV_SLC90E66 is not set
 # CONFIG_BLK_DEV_TRM290 is not set
 CONFIG_BLK_DEV_VIA82CXXX=m
+# CONFIG_BLK_DEV_TC86C001 is not set
 # CONFIG_IDE_ARM is not set
 CONFIG_BLK_DEV_IDEDMA=y
 # CONFIG_IDEDMA_IVB is not set
-CONFIG_IDEDMA_AUTO=y
 # CONFIG_BLK_DEV_HD is not set
 
 #
@@ -868,6 +921,7 @@
 CONFIG_BONDING=m
 # CONFIG_EQUALIZER is not set
 CONFIG_TUN=m
+# CONFIG_NET_SB1000 is not set
 
 #
 # ARCnet devices
@@ -948,6 +1002,7 @@
 CONFIG_VIA_RHINE=m
 # CONFIG_VIA_RHINE_MMIO is not set
 # CONFIG_VIA_RHINE_NAPI is not set
+# CONFIG_SC92031 is not set
 
 #
 # Ethernet (1000 Mbit)
@@ -971,11 +1026,13 @@
 CONFIG_TIGON3=m
 CONFIG_BNX2=m
 # CONFIG_QLA3XXX is not set
+# CONFIG_ATL1 is not set
 
 #
 # Ethernet (10000 Mbit)
 #
 # CONFIG_CHELSIO_T1 is not set
+# CONFIG_CHELSIO_T3 is not set
 # CONFIG_IXGB is not set
 # CONFIG_S2IO is not set
 # CONFIG_MYRI10GE is not set
@@ -1063,6 +1120,7 @@
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_PCSPKR=m
 # CONFIG_INPUT_WISTRON_BTNS is not set
+# CONFIG_INPUT_ATLAS_BTNS is not set
 CONFIG_INPUT_UINPUT=m
 
 #
@@ -1092,6 +1150,7 @@
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_PCI=y
+# CONFIG_SERIAL_8250_PNP is not set
 CONFIG_SERIAL_8250_NR_UARTS=4
 CONFIG_SERIAL_8250_RUNTIME_UARTS=4
 # CONFIG_SERIAL_8250_EXTENDED is not set
@@ -1269,6 +1328,7 @@
 CONFIG_SENSORS_ADM1021=m
 CONFIG_SENSORS_ADM1025=m
 CONFIG_SENSORS_ADM1026=m
+CONFIG_SENSORS_ADM1029=m
 CONFIG_SENSORS_ADM1031=m
 CONFIG_SENSORS_ADM9240=m
 # CONFIG_SENSORS_K8TEMP is not set
@@ -1280,7 +1340,6 @@
 CONFIG_SENSORS_FSCPOS=m
 CONFIG_SENSORS_GL518SM=m
 CONFIG_SENSORS_GL520SM=m
-CONFIG_SENSORS_IPMI=m
 CONFIG_SENSORS_IT87=m
 CONFIG_SENSORS_LM63=m
 CONFIG_SENSORS_LM75=m
@@ -1313,6 +1372,11 @@
 # CONFIG_HWMON_DEBUG_CHIP is not set
 
 #
+# Multifunction device drivers
+#
+CONFIG_MFD_SM501=m
+
+#
 # Multimedia devices
 #
 # CONFIG_VIDEO_DEV is not set
@@ -1326,7 +1390,7 @@
 #
 # Graphics support
 #
-CONFIG_FIRMWARE_EDID=y
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
 # CONFIG_FB is not set
 
 #
@@ -1336,7 +1400,6 @@
 # CONFIG_VGACON_SOFT_SCROLLBACK is not set
 CONFIG_VIDEO_SELECT=y
 CONFIG_DUMMY_CONSOLE=y
-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
 
 #
 # Sound
@@ -1347,6 +1410,7 @@
 # HID Devices
 #
 CONFIG_HID=y
+# CONFIG_HID_DEBUG is not set
 
 #
 # USB support
@@ -1361,7 +1425,6 @@
 # Miscellaneous USB options
 #
 CONFIG_USB_DEVICEFS=y
-# CONFIG_USB_BANDWIDTH is not set
 # CONFIG_USB_DYNAMIC_MINORS is not set
 # CONFIG_USB_SUSPEND is not set
 # CONFIG_USB_OTG is not set
@@ -1373,9 +1436,11 @@
 # CONFIG_USB_EHCI_SPLIT_ISO is not set
 # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
 # CONFIG_USB_EHCI_TT_NEWSCHED is not set
+# CONFIG_USB_EHCI_BIG_ENDIAN_MMIO is not set
 # CONFIG_USB_ISP116X_HCD is not set
 CONFIG_USB_OHCI_HCD=m
-# CONFIG_USB_OHCI_BIG_ENDIAN is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
 CONFIG_USB_OHCI_LITTLE_ENDIAN=y
 CONFIG_USB_UHCI_HCD=m
 # CONFIG_USB_SL811_HCD is not set
@@ -1420,6 +1485,7 @@
 # CONFIG_USB_ATI_REMOTE2 is not set
 # CONFIG_USB_KEYSPAN_REMOTE is not set
 # CONFIG_USB_APPLETOUCH is not set
+# CONFIG_USB_GTCO is not set
 
 #
 # USB Imaging devices
@@ -1507,6 +1573,7 @@
 # CONFIG_USB_RIO500 is not set
 # CONFIG_USB_LEGOTOWER is not set
 # CONFIG_USB_LCD is not set
+# CONFIG_USB_BERRY_CHARGE is not set
 # CONFIG_USB_LED is not set
 # CONFIG_USB_CYPRESS_CY7C63 is not set
 # CONFIG_USB_CYTHERM is not set
@@ -1517,6 +1584,7 @@
 # CONFIG_USB_SISUSBVGA is not set
 # CONFIG_USB_LD is not set
 # CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
 # CONFIG_USB_TEST is not set
 
 #
@@ -1585,6 +1653,7 @@
 #
 # RTC drivers
 #
+CONFIG_RTC_DRV_CMOS=m
 CONFIG_RTC_DRV_X1205=m
 CONFIG_RTC_DRV_DS1307=m
 CONFIG_RTC_DRV_DS1553=m
@@ -1592,7 +1661,6 @@
 CONFIG_RTC_DRV_DS1672=m
 CONFIG_RTC_DRV_DS1742=m
 CONFIG_RTC_DRV_PCF8563=m
-CONFIG_RTC_DRV_PCF8583=m
 CONFIG_RTC_DRV_RS5C372=m
 CONFIG_RTC_DRV_M48T86=m
 # CONFIG_RTC_DRV_TEST is not set
@@ -1612,6 +1680,10 @@
 #
 
 #
+# Auxiliary Display support
+#
+
+#
 # Virtualization
 #
 # CONFIG_KVM is not set
@@ -1663,7 +1735,6 @@
 CONFIG_ISO9660_FS=m
 CONFIG_JOLIET=y
 CONFIG_ZISOFS=y
-CONFIG_ZISOFS_FS=m
 # CONFIG_UDF_FS is not set
 
 #
@@ -1685,7 +1756,7 @@
 CONFIG_HUGETLBFS=y
 CONFIG_HUGETLB_PAGE=y
 CONFIG_RAMFS=y
-CONFIG_CONFIGFS_FS=y
+CONFIG_CONFIGFS_FS=m
 
 #
 # Miscellaneous filesystems
@@ -1829,8 +1900,8 @@
 CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_SECURITY_NETWORK_XFRM=y
-CONFIG_SECURITY_CAPABILITIES=y
-# CONFIG_SECURITY_ROOTPLUG is not set
+CONFIG_SECURITY_CAPABILITIES=m
+CONFIG_SECURITY_ROOTPLUG=m
 
 #
 # Cryptographic options
@@ -1844,7 +1915,7 @@
 CONFIG_CRYPTO_XCBC=m
 # CONFIG_CRYPTO_NULL is not set
 # CONFIG_CRYPTO_MD4 is not set
-CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SHA256=m
 CONFIG_CRYPTO_SHA512=m
@@ -1853,8 +1924,10 @@
 CONFIG_CRYPTO_GF128MUL=m
 CONFIG_CRYPTO_ECB=m
 CONFIG_CRYPTO_CBC=m
+CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_DES=y
+CONFIG_CRYPTO_DES=m
+CONFIG_CRYPTO_FCRYPT=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_TWOFISH_COMMON=m
@@ -1871,6 +1944,7 @@
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_CRC32C=m
+CONFIG_CRYPTO_CAMELLIA=m
 # CONFIG_CRYPTO_TEST is not set
 
 #
@@ -1896,7 +1970,8 @@
 CONFIG_TEXTSEARCH_BM=m
 CONFIG_TEXTSEARCH_FSM=m
 CONFIG_PLIST=y
-CONFIG_IOMAP_COPY=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
 CONFIG_GENERIC_HARDIRQS=y
 CONFIG_GENERIC_IRQ_PROBE=y
 CONFIG_X86_BIOS_REBOOT=y

Modified: trunk/buildroot/target/linux26.mk
===================================================================
--- trunk/buildroot/target/linux26.mk	2007-06-21 22:09:36 UTC (rev 18888)
+++ trunk/buildroot/target/linux26.mk	2007-06-21 22:10:12 UTC (rev 18889)
@@ -49,8 +49,10 @@
 # kernel patches
 LINUX26_PATCH_DIR=$(BR2_BOARD_PATH)/kernel-patches/
 
-LINUX26_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS) ARCH=$(KERNEL_ARCH) \
-	PATH=$(TARGET_PATH) INSTALL_MOD_PATH=$(TARGET_DIR) \
+LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS=$(HOSTCFLAGS) \
+	ARCH=$(KERNEL_ARCH) \
+	CFLAGS_KERNEL="$(TARGET_CFLAGS)" \
+	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE=$(KERNEL_CROSS)
 
 $(LINUX26_KCONFIG):

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-06-21 22:09:36 UTC (rev 18888)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-06-21 22:10:12 UTC (rev 18889)
@@ -295,7 +295,7 @@
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	-cp -dpf $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
+	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/lib/

Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-06-21 22:09:36 UTC (rev 18888)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-06-21 22:10:12 UTC (rev 18889)
@@ -6,7 +6,7 @@
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_20
+	default BR2_KERNEL_HEADERS_2_6_21
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -45,9 +45,13 @@
 		bool "Linux 2.6.19.2 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_20
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.20 kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_21
+		depends !BR2_nios2
+		bool "Linux 2.6.21.x kernel headers"
+
 endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
@@ -61,3 +65,4 @@
 	default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
 	default "2.6.19.2"  if BR2_KERNEL_HEADERS_2_6_19_2
 	default "2.6.20.4"  if BR2_KERNEL_HEADERS_2_6_20
+	default "2.6.21.5"  if BR2_KERNEL_HEADERS_2_6_21

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-06-21 22:09:36 UTC (rev 18888)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-06-21 22:10:12 UTC (rev 18889)
@@ -3,6 +3,20 @@
 # full kernel tarballs >= 2.6.19.1
 #
 #############################################################
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.21.5")
+VERSION:=2
+PATCHLEVEL:=6
+SUBLEVEL:=21
+EXTRAVERSION:=.5
+LOCALVERSION:=
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
+LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_UNPACK_DIR:=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_IS_KERNEL=y
+endif
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.20.4")
 VERSION:=2
