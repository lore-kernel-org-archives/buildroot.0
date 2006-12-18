From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 18 Dec 2006 05:30:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device/x86/i386
	toolchain/kernel- etc...
Message-ID: <20061218133005.E13BA485B1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-18 05:30:05 -0800 (Mon, 18 Dec 2006)
New Revision: 16989

Log:
- put the full kernel's sources into build_/, install them into toolchain_build_. Saves quite some disk-space on the compile-host.
- Avoid overriding the linux26 target's rules if the kernel headers's and the target's kernel are the same. Avoids a warning.


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.config
   trunk/buildroot/target/device/x86/i386/linux26.mk
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.config
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.config	2006-12-17 20:56:01 UTC (rev 16988)
+++ trunk/buildroot/target/device/x86/i386/linux26.config	2006-12-18 13:30:05 UTC (rev 16989)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Linux kernel version: 2.6.19
-# Thu Nov 30 14:49:21 2006
+# Linux kernel version: 2.6.19.1
+# Mon Dec 18 12:06:30 2006
 #
 CONFIG_X86_32=y
 CONFIG_GENERIC_TIME=y
@@ -52,7 +52,7 @@
 CONFIG_PRINTK=y
 CONFIG_BUG=y
 CONFIG_ELF_CORE=y
-CONFIG_BASE_FULL=y
+# CONFIG_BASE_FULL is not set
 CONFIG_FUTEX=y
 CONFIG_EPOLL=y
 CONFIG_SHMEM=y
@@ -60,7 +60,7 @@
 CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_RT_MUTEXES=y
 # CONFIG_TINY_SHMEM is not set
-CONFIG_BASE_SMALL=0
+CONFIG_BASE_SMALL=1
 # CONFIG_SLOB is not set
 
 #
@@ -315,6 +315,7 @@
 CONFIG_IP_PIMSM_V2=y
 # CONFIG_ARPD is not set
 CONFIG_SYN_COOKIES=y
+CONFIG_IPSEC_NAT_TRAVERSAL=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
 CONFIG_INET_IPCOMP=m
@@ -561,8 +562,24 @@
 # CONFIG_IEEE80211_SOFTMAC_DEBUG is not set
 CONFIG_WIRELESS_EXT=y
 CONFIG_FIB_RULES=y
+CONFIG_KLIPS=m
 
 #
+# KLIPS options
+#
+CONFIG_KLIPS_ESP=y
+CONFIG_KLIPS_AH=y
+CONFIG_KLIPS_AUTH_HMAC_MD5=y
+CONFIG_KLIPS_AUTH_HMAC_SHA1=y
+CONFIG_KLIPS_ENC_CRYPTOAPI=y
+CONFIG_KLIPS_ENC_1DES=y
+CONFIG_KLIPS_ENC_3DES=y
+CONFIG_KLIPS_ENC_AES=y
+# CONFIG_KLIPS_ENC_NULL is not set
+CONFIG_KLIPS_IPCOMP=y
+CONFIG_KLIPS_DEBUG=y
+
+#
 # Device Drivers
 #
 
@@ -850,7 +867,7 @@
 CONFIG_NET_ETHERNET=y
 CONFIG_MII=y
 # CONFIG_HAPPYMEAL is not set
-# CONFIG_SUNGEM is not set
+CONFIG_SUNGEM=m
 # CONFIG_CASSINI is not set
 CONFIG_NET_VENDOR_3COM=y
 CONFIG_VORTEX=m
@@ -1253,7 +1270,7 @@
 CONFIG_SENSORS_SMSC47M192=m
 CONFIG_SENSORS_SMSC47B397=m
 CONFIG_SENSORS_VIA686A=m
-# CONFIG_SENSORS_VT1211 is not set
+CONFIG_SENSORS_VT1211=m
 CONFIG_SENSORS_VT8231=m
 CONFIG_SENSORS_W83781D=m
 CONFIG_SENSORS_W83791D=m
@@ -1608,7 +1625,10 @@
 #
 # CD-ROM/DVD Filesystems
 #
-# CONFIG_ISO9660_FS is not set
+CONFIG_ISO9660_FS=m
+CONFIG_JOLIET=y
+CONFIG_ZISOFS=y
+CONFIG_ZISOFS_FS=m
 # CONFIG_UDF_FS is not set
 
 #
@@ -1738,7 +1758,7 @@
 CONFIG_NLS_ISO8859_15=m
 # CONFIG_NLS_KOI8_R is not set
 # CONFIG_NLS_KOI8_U is not set
-CONFIG_NLS_UTF8=m
+CONFIG_NLS_UTF8=y
 
 #
 # Instrumentation Support

Modified: trunk/buildroot/target/device/x86/i386/linux26.mk
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.mk	2006-12-17 20:56:01 UTC (rev 16988)
+++ trunk/buildroot/target/device/x86/i386/linux26.mk	2006-12-18 13:30:05 UTC (rev 16989)
@@ -14,6 +14,7 @@
 
 
 LINUX26_SOURCE=linux-$(DOWNLOAD_LINUX26_VERSION).tar.bz2
+LINUX26_BZCAT:=$(BZCAT)
 LINUX26_SITE=http://ftp.kernel.org/pub/linux/kernel/v2.6
 
 #LINUX26_FORMAT=vmlinux
@@ -37,32 +38,30 @@
 	PATH=$(TARGET_PATH) INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE=$(KERNEL_CROSS)
 
+$(LINUX26_KCONFIG):
+	@if [ ! -f "$(LINUX26_KCONFIG)" ] ; then \
+		echo ""; \
+		echo "You should create a .config for your kernel"; \
+		echo "and install it as $(LINUX26_KCONFIG)"; \
+		echo ""; \
+		sleep 5; \
+	fi;
 
-
-
+ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
 $(DL_DIR)/$(LINUX26_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
 
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
 	rm -rf $(LINUX26_DIR)
-	bzcat $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) -xvf -
+	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
 	# Rename the dir from the downloaded version to the AFTER patch version
 	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(BUILD_DIR)/linux-$(LINUX26_VERSION)
 endif
 	touch $(LINUX26_DIR)/.unpacked
 
-$(LINUX26_KCONFIG):
-	@if [ ! -f "$(LINUX26_KCONFIG)" ] ; then \
-		echo ""; \
-		echo "You should create a .config for your kernel"; \
-		echo "and install it as $(LINUX26_KCONFIG)"; \
-		echo ""; \
-		sleep 5; \
-	fi;
-
 $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
-	#toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
+	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
 	touch $(LINUX26_DIR)/.patched
 
 $(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG)
@@ -70,10 +69,7 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
 	touch $(LINUX26_DIR)/.configured
 
-linux26-menuconfig: $(LINUX26_DIR)/.patched
-	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
-	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
+endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
 $(LINUX26_DIR)/.depend_done:  $(LINUX26_DIR)/.configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
@@ -99,6 +95,11 @@
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
 	touch -c $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
 
+linux26-menuconfig: $(LINUX26_DIR)/.patched
+	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
+	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
+
 linux26: cross-depmod26 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
 
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2006-12-17 20:56:01 UTC (rev 16988)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2006-12-18 13:30:05 UTC (rev 16989)
@@ -15,7 +15,7 @@
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_UNPACK_DIR:=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_IS_KERNEL=y
 endif
@@ -24,7 +24,7 @@
 
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	rm -rf $(LINUX_HEADERS_DIR)
-	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
 
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
