From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 15 Feb 2007 03:12:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: target
	toolchain/kernel-headers toolchai etc...
Message-ID: <20070215111216.E771248575@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-15 03:12:15 -0800 (Thu, 15 Feb 2007)
New Revision: 17893

Log:
- allow to run linux26-menuconfig and uclibc-menuconfig in a pristine checkout


Modified:
   trunk/buildroot/target/linux26.mk
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/target/linux26.mk
===================================================================
--- trunk/buildroot/target/linux26.mk	2007-02-15 09:59:59 UTC (rev 17892)
+++ trunk/buildroot/target/linux26.mk	2007-02-15 11:12:15 UTC (rev 17893)
@@ -111,7 +111,7 @@
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
 	touch -c $@
 
-linux26-menuconfig: $(LINUX26_DIR)/.patched
+linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
 	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-02-15 09:59:59 UTC (rev 17892)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-02-15 11:12:15 UTC (rev 17893)
@@ -23,6 +23,7 @@
 
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	rm -rf $(LINUX_HEADERS_DIR)
+	[ -d $(BUILD_DIR) ] || $(INSTALL) -d $(BUILD_DIR)
 	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-15 09:59:59 UTC (rev 17892)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-15 11:12:15 UTC (rev 17893)
@@ -81,6 +81,7 @@
 
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
+	[ -d $(TOOL_BUILD_DIR) ] || $(INSTALL) -d $(TOOL_BUILD_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)-\*.patch
 ifneq ($(BR2_ENABLE_LOCALE),)
@@ -253,7 +254,7 @@
 		all
 	touch -c $(UCLIBC_DIR)/lib/libc.a
 
-uclibc-menuconfig: $(UCLIBC_DIR)/.config
+uclibc-menuconfig: $(UCLIBC_DIR)/.config host-sed
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
