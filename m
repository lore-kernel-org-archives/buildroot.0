From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu, 30 Oct 2008 07:02:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081030140206.411543C2BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-30 07:02:05 -0700 (Thu, 30 Oct 2008)
New Revision: 23858

Log:
linux: add probing for kernel version when installing modules

This patch will ask the kernel for the specific version before doing
modules_install, that way Buildroot will know which directories to remove and
what parameters to use for depmod. Needed when compiling a kernel grabbed from
GIT or vendor specific releases.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-30 08:05:36 UTC (rev 23857)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-30 14:02:05 UTC (rev 23858)
@@ -42,6 +42,9 @@
 endif
 endif
 
+# Ask the kernel what version number it will use when installing modules
+LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) -s kernelrelease`
+
 ifeq ($(BOARD_PATH),)
 BOARD_PATH:=$(strip $(subst ",,$(BR2_BOARD_PATH)))
 #"))
@@ -388,16 +391,16 @@
 	touch -c $@
 
 # -----------------------------------------------------------------------------
-$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.configured
-	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
+$(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed: $(LINUX26_DIR)/.configured
+	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
 		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
-	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
-	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/source
-	$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX26_VERSION)	#$(LINUX_HEADERS_VERSION)
+	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build
+	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source
+	$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX26_VERSION_PROBED)
 	touch -c $@
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
@@ -440,11 +443,8 @@
 
 linux26: $(LINUX26_TARGETS)
 
-$(LINUX26_DIR)/.modules_installed: $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
-	touch $@
+linux26-modules: cross-depmod26 $(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed
 
-linux26-modules: cross-depmod26 $(LINUX26_DIR)/.modules_installed
-
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
 
 linux26-unpacked: $(LINUX26_DIR)/.patched
@@ -460,6 +460,7 @@
 
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
 linux26clean:
+	rm -f $(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed
 	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
 	-$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX26_DIR) clean
 
