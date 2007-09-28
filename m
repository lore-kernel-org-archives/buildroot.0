From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 28 Sep 2007 09:18:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/linux
	toolchain/uClibc
Message-ID: <20070928161816.E75B7A6889@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-28 09:18:16 -0700 (Fri, 28 Sep 2007)
New Revision: 20085

Log:
Add administration for linux,uclibc and main

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-28 13:41:41 UTC (rev 20084)
+++ trunk/buildroot/Makefile	2007-09-28 16:18:16 UTC (rev 20085)
@@ -422,6 +422,10 @@
 	cp $(shell find ./target/ -name $@) .config
 	-@$(MAKE) oldconfig
 
+configured: dirs host-sed kernel-headers uclibc-configured busybox-config linux26-config
+
+cross: $(BASE_TARGETS)
+
 help:
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete temporary files created by build'

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-28 13:41:41 UTC (rev 20084)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-28 16:18:16 UTC (rev 20085)
@@ -168,6 +168,8 @@
 		$(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
+else
+	echo "CONFIG_INITRAMFS_SOURCE=\"\"" >> $(LINUX26_DIR)/.config
 endif
 ifeq ($(BR2_PACKAGE_BUSYBOX_INITRAMFS),y)
 	# precedence for a small initramfs
@@ -225,7 +227,7 @@
 
 linux26-unpacked: $(LINUX26_DIR)/.patched
 
-linux26-config:	$(LINUX26_DIR)/.configured
+linux26-config:	host-sed $(LINUX26_DIR)/.configured
 
 linux26-update:
 	cp -dpf $(LINUX26_DIR)/.config $(LINUX26_KCONFIG)

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-28 13:41:41 UTC (rev 20084)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-28 16:18:16 UTC (rev 20085)
@@ -108,8 +108,7 @@
 UCLIBC_LOCALE_DATA=
 endif
 
-uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
-$(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
+$(UCLIBC_DIR)/.unpacked: dirs kernel-headers host-sed $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
 	mkdir -p $(TOOL_BUILD_DIR)
 	rm -rf $(UCLIBC_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
@@ -442,14 +441,16 @@
 
 uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
 
-uclibc-config: host-sed $(UCLIBC_DIR)/.config
+uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
 
-uclibc-oldconfig: host-sed $(UCLIBC_DIR)/.oldconfig
+uclibc-config: $(UCLIBC_DIR)/.config
 
-uclibc-update:
+uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
+
+uclibc-update: uclibc-config
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
-uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
+uclibc-configured: $(UCLIBC_DIR)/.configured
 
 uclibc-configured-source: uclibc-source
 
