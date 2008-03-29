From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Mar 2008 07:09:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: scripts
	target/device/Atmel/atngw100 tar etc...
Message-ID: <20080329140922.927033C45E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-29 07:09:22 -0700 (Sat, 29 Mar 2008)
New Revision: 21554

Log:
Add some robustness to linux configuration

Added:
   trunk/buildroot/scripts/get_linux_config.sh

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Added: trunk/buildroot/scripts/get_linux_config.sh
===================================================================
--- trunk/buildroot/scripts/get_linux_config.sh	                        (rev 0)
+++ trunk/buildroot/scripts/get_linux_config.sh	2008-03-29 14:09:22 UTC (rev 21554)
@@ -0,0 +1,14 @@
+#!/bin/bash
+
+# parameter #1	BOARD_PATH
+# parameter #2  LINUX26_DIR
+
+TOPDIR=`pwd`
+BOARD_PATH=$1
+LINUX26_DIR=$2
+
+cd ${TOPDIR}/${BOARD_PATH}
+for i in `ls *linux*.config` ; do
+	echo Copying $i ...
+	cp $i ${LINUX26_DIR}/.config
+done


Property changes on: trunk/buildroot/scripts/get_linux_config.sh
___________________________________________________________________
Name: svn:executable
   + *

Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-03-29 13:10:57 UTC (rev 21553)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-03-29 14:09:22 UTC (rev 21554)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Tue Feb 26 08:57:14 2008
+# Sat Mar 29 09:30:00 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -73,6 +73,10 @@
 # BR2_TARGET_VALKA is not set
 
 #
+# Generic Architecture support
+#
+
+#
 # Generic System Support
 #
 # BR2_TARGET_GENERIC_ACCESS_POINT is not set
@@ -116,12 +120,19 @@
 # BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
+# BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
 # BR2_STRIP_none is not set
+# BR2_OPTIMIZE_0 is not set
+BR2_OPTIMIZE_1=y
+# BR2_OPTIMIZE_2 is not set
+# BR2_OPTIMIZE_3 is not set
+# BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
 # BR2_HAVE_MANPAGES is not set
 # BR2_HAVE_INFOPAGES is not set
+# BR2_HAVE_DEVFILES is not set
 BR2_UPDATE_CONFIG=y
 
 #
@@ -249,10 +260,11 @@
 # BR2_BUSYBOX_VERSION_1_6_1 is not set
 # BR2_BUSYBOX_VERSION_1_7_X is not set
 # BR2_BUSYBOX_VERSION_1_8_X is not set
-BR2_BUSYBOX_VERSION_1_9_X=y
+# BR2_BUSYBOX_VERSION_1_9_X is not set
+BR2_BUSYBOX_VERSION_1_10_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.9.1"
-BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
+BR2_BUSYBOX_VERSION="1.10.0"
+BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
 BR2_PACKAGE_BUSYBOX_SKELETON=y
@@ -277,7 +289,6 @@
 # BR2_PACKAGE_CVS is not set
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
-# BR2_PACKAGE_EXPAT is not set
 # BR2_PACKAGE_FAKEROOT is not set
 BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_GETTEXT is not set
@@ -288,7 +299,6 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_PKGCONFIG is not set
 # BR2_READLINE is not set
-# BR2_PACKAGE_XERCES is not set
 
 #
 # Other stuff
@@ -296,19 +306,14 @@
 # BR2_PACKAGE_AT is not set
 # BR2_PACKAGE_BERKELEYDB is not set
 # BR2_PACKAGE_BSDIFF is not set
+# BR2_PACKAGE_CUPS is not set
 # BR2_PACKAGE_CUSTOMIZE is not set
 # BR2_PACKAGE_DASH is not set
-# BR2_PACKAGE_FCONFIG is not set
 # BR2_PACKAGE_FILE is not set
-# BR2_PACKAGE_FIS is not set
-# BR2_PACKAGE_KEXEC is not set
+# BR2_PACKAGE_GAMIN is not set
 # BR2_PACKAGE_ICU is not set
 # BR2_PACKAGE_IPKG is not set
-# BR2_PACKAGE_CUPS is not set
-# BR2_PACKAGE_NG_SPICE_REWORK is not set
-# BR2_PACKAGE_GAMIN is not set
-# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
-# BR2_PACKAGE_CLASSPATH is not set
+# BR2_PACKAGE_KEXEC is not set
 BR2_PACKAGE_LIBDAEMON=y
 # BR2_PACKAGE_LIBELF is not set
 # BR2_PACKAGE_LIBEVENT is not set
@@ -317,18 +322,15 @@
 # BR2_PACKAGE_LIBGPG_ERROR is not set
 # BR2_PACKAGE_LIBLOCKFILE is not set
 # BR2_PACKAGE_LIBSYSFS is not set
-# BR2_PACKAGE_LIBXML2 is not set
-
-#
-# libxslt	- disabled (requires pkgconfig)
-#
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
 # BR2_PACKAGE_LTRACE is not set
 # BR2_PACKAGE_LTT is not set
+# BR2_PACKAGE_NG_SPICE_REWORK is not set
 # BR2_PACKAGE_PORTAGE is not set
 # BR2_PACKAGE_SQLITE is not set
+# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 BR2_PACKAGE_STRACE=y
 # BR2_PACKAGE_SUDO is not set
 BR2_NETWORK_SUPPORT=y
@@ -352,12 +354,13 @@
 # BR2_PACKAGE_CURL is not set
 # BR2_PACKAGE_LIBCURL is not set
 BR2_PACKAGE_DNSMASQ=y
+BR2_PACKAGE_DNSMASQ_TFTP=y
 BR2_PACKAGE_DROPBEAR=y
 # BR2_PACKAGE_ETHTOOL is not set
 BR2_PACKAGE_HASERL=y
 # BR2_PACKAGE_HASERL_VERSION_0_8_0 is not set
-BR2_PACKAGE_HASERL_VERSION_0_9_21=y
-BR2_PACKAGE_HASERL_VERSION="0.9.21"
+BR2_PACKAGE_HASERL_VERSION_0_9_22=y
+BR2_PACKAGE_HASERL_VERSION="0.9.22"
 # BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
@@ -457,6 +460,7 @@
 # BR2_PACKAGE_TFTPD is not set
 # BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TTCP is not set
+# BR2_PACKAGE_UDPCAST is not set
 
 #
 # vpnc		- disabled (requires libgcrypt and libgpg_error)
@@ -471,6 +475,8 @@
 # BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
 # BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_FCONFIG is not set
+# BR2_PACKAGE_FIS is not set
 # BR2_PACKAGE_LIBFUSE is not set
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
@@ -488,32 +494,30 @@
 BR2_PACKAGE_MTD_UTILS=y
 # BR2_PACKAGE_MTD_20061007 is not set
 # BR2_PACKAGE_MTD_20050122 is not set
-# BR2_PACKAGE_MTD_SNAPSHOT is not set
+# BR2_PACKAGE_MTD_UTILS_GIT is not set
 
 #
 # MTD tools selection
 #
+# BR2_PACKAGE_MTD_DOCFDISK is not set
+# BR2_PACKAGE_MTD_DOC_LOADBIOS is not set
+BR2_PACKAGE_MTD_FLASHCP=y
 BR2_PACKAGE_MTD_FLASH_ERASE=y
 BR2_PACKAGE_MTD_FLASH_ERASEALL=y
 BR2_PACKAGE_MTD_FLASH_INFO=y
 # BR2_PACKAGE_MTD_FLASH_LOCK is not set
 # BR2_PACKAGE_MTD_FLASH_UNLOCK is not set
-BR2_PACKAGE_MTD_FLASHCP=y
-# BR2_PACKAGE_MTD_ERASE is not set
-# BR2_PACKAGE_MTD_JFFS2DUMP is not set
-# BR2_PACKAGE_MTD_JFFS3DUMP is not set
-# BR2_PACKAGE_MTD_SUMTOOL is not set
 # BR2_PACKAGE_MTD_FTL_CHECK is not set
 # BR2_PACKAGE_MTD_FTL_FORMAT is not set
-# BR2_PACKAGE_MTD_NFTL_FORMAT is not set
-# BR2_PACKAGE_MTD_NFTLDUMP is not set
+# BR2_PACKAGE_MTD_JFFS2DUMP is not set
 # BR2_PACKAGE_MTD_MKFSJFFS2 is not set
 # BR2_PACKAGE_MTD_MKFSJFFS is not set
+BR2_PACKAGE_MTD_MTD_DEBUG=y
 # BR2_PACKAGE_MTD_NANDDUMP is not set
 # BR2_PACKAGE_MTD_NANDWRITE is not set
-BR2_PACKAGE_MTD_MTD_DEBUG=y
-# BR2_PACKAGE_MTD_DOCFDISK is not set
-# BR2_PACKAGE_MTD_DOC_LOADBIOS is not set
+# BR2_PACKAGE_MTD_NFTL_FORMAT is not set
+# BR2_PACKAGE_MTD_NFTLDUMP is not set
+# BR2_PACKAGE_MTD_SUMTOOL is not set
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
 # BR2_PACKAGE_PCMCIA is not set
@@ -533,12 +537,18 @@
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
 # BR2_SCRIPTING_SUPPORT is not set
-# BR2_GAMES is not set
+BR2_XML_SUPPORT=y
+# BR2_PACKAGE_EXPAT is not set
+# BR2_PACKAGE_EZXML is not set
+# BR2_PACKAGE_LIBXML2 is not set
 
 #
-# Editors
+# libxslt	- disabled (requires pkgconfig)
 #
-# BR2_PACKAGE_VIM is not set
+# BR2_PACKAGE_XERCES is not set
+BR2_JAVA_SUPPORT=y
+# BR2_PACKAGE_CLASSPATH is not set
+# BR2_GAMES is not set
 
 #
 # Target filesystem options
@@ -581,15 +591,16 @@
 #
 # bootloader for target device
 #
-BR2_TARGET_U_BOOT=y
-BR2_TARGET_U_BOOT_CONFIG_HEADER_FILE=""
-BR2_TARGET_U_BOOT_CONFIG_BOARD="$(BR2_BOARD_NAME)_config"
-BR2_TARGET_U_BOOT_SERVERIP=""
-BR2_TARGET_U_BOOT_IPADDR=""
-BR2_TARGET_U_BOOT_ETH0ADDR=""
-BR2_TARGET_U_BOOT_ETH1ADDR=""
-BR2_TARGET_U_BOOT_BOOTARGS="console=ttyS0 root=/dev/mtdblock1 rootfstype=jffs2"
-BR2_TARGET_U_BOOT_BOOTCMD="fsload 0x90300000 /boot/uImage; bootm"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="atngw100"
+BR2_TARGET_UBOOT_CUSTOM_PATCH=""
+BR2_TARGET_UBOOT_SERVERIP="10.175.196.221"
+BR2_TARGET_UBOOT_IPADDR="10.175.196.18"
+BR2_TARGET_UBOOT_GATEWAY="10.175.196.1"
+BR2_TARGET_UBOOT_NETMASK="255.255.255.0"
+BR2_TARGET_UBOOT_ETHADDR="04:25:fe:ed:00:18"
+BR2_TARGET_UBOOT_ETH1ADDR=""
+# BR2_TARGET_UBOOT_SILENT is not set
 
 #
 # Kernel
@@ -601,13 +612,12 @@
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.22.5.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.24"
-BR2_KERNEL_THIS_VERSION="2.6.24"
+BR2_KERNEL_CURRENT_VERSION="2.6.24.3"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
 BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
 BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
-# BR2_LINUX_2_6_STABLE is not set
-BR2_LINUX_2_6_24=y
+BR2_LINUX_2_6_STABLE=y
+# BR2_LINUX_2_6_24 is not set
 # BR2_LINUX_2_6_23 is not set
 # BR2_LINUX_2_6_22_10 is not set
 # BR2_LINUX_2_6_22_1 is not set
@@ -616,6 +626,7 @@
 # BR2_LINUX_2_6_21_5 is not set
 # BR2_LINUX_2_6_21 is not set
 # BR2_LINUX_2_6_20 is not set
+# BR2_LINUX_2_6_25 is not set
 # BR2_LINUX26_CUSTOM is not set
 
 #
@@ -633,10 +644,10 @@
 # BR2_KERNEL_ADD_PATCH is not set
 BR2_LINUX_BSP_PATCH=""
 # BR2_KERNEL_PREPATCHED is not set
-BR2_KERNEL_BASE=y
+# BR2_KERNEL_BASE is not set
 # BR2_KERNEL_LATEST is not set
-BR2_DOWNLOAD_LINUX26_VERSION="$(BR2_KERNEL_THIS_VERSION)"
-BR2_LINUX26_VERSION="$(BR2_KERNEL_THIS_VERSION)"
+BR2_DOWNLOAD_LINUX26_VERSION="$(BR2_KERNEL_CURRENT_VERSION)"
+BR2_LINUX26_VERSION="$(BR2_KERNEL_CURRENT_VERSION)"
 
 #
 # Linux Kernel Configuration

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-29 13:10:57 UTC (rev 21553)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-29 14:09:22 UTC (rev 21554)
@@ -188,16 +188,6 @@
 	LZMA="$(LZMA)" 
 
 # =============================================================================
-
-$(LINUX26_KCONFIG):
-	@if [ ! -f "$(LINUX26_KCONFIG)" ] ; then \
-		echo ""; \
-		echo "You should create a .config for your kernel"; \
-		echo "and install it as $(LINUX26_KCONFIG)"; \
-		echo ""; \
-		sleep 5; \
-	fi
-# =============================================================================
 ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
 $(DL_DIR)/$(LINUX26_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
@@ -284,9 +274,9 @@
 	fi
 endif
 	touch $@
+# =============================================================================
 
-# -----------------------------------------------------------------------------
-$(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
+$(LINUX26_DIR)/.config:	$(LINUX26_DIR)/.patched
 ifeq ($(BR2_PACKAGE_LINUX_USE_DEFCONFIG),y)
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(BOARD_NAME)_defconfig 
 endif
@@ -294,8 +284,33 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig 
 endif
 ifeq ($(BR2_PACKAGE_LINUX_USE_KCONFIG),y)
-	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
+	# Try user defined config
+	if [ -f "$(LINUX26_KCONFIG)" ] ; then \
+		cp -dpf $(LINUX26_KCONFIG) $@ ; \
+	fi
+	# Try to get a config for this linux version in the board directory
+	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
+	    if [ -f "$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config" ] ; then \
+		cp -dpf $(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config $@ ; \
+	    fi ; \
+	fi
+	# Try to get a config for latest linux version in the board directory
+	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
+		scripts/get_linux_config.sh $(BOARD_PATH) $(LINUX26_DIR) ; \
+	fi
+	# Use a board config defined in the linux source.
+	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
+		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(BOARD_NAME)_defconfig || \
+			echo "$(BOARD_NAME)_defconfig failed..." ; \
+	fi
+	# let the user create his/her own config
+	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
+		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig ; \
+	fi
 endif
+
+# -----------------------------------------------------------------------------
+$(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.config
 	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_ARM_EABI),y)
 	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
