From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:20:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070717002033.8E96D30078@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:20:32 -0700 (Mon, 16 Jul 2007)
New Revision: 19116

Log:
A number of fixes including placing of the final image into the 'binaries' directory. Moved INITRAMFS_TARGET to the correct location as modules from the built kernel were not being installed until after the INITRAMFS had been built. Fixed config options for INITRAMFS to be correct and cleaned up whitespace/tab issues.


Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-07-17 00:18:54 UTC (rev 19115)
+++ trunk/buildroot/target/linux/Makefile.in	2007-07-17 00:20:32 UTC (rev 19116)
@@ -55,7 +55,7 @@
 endif
 
 # File name for the Linux kernel binary
-LINUX26_KERNEL=linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
+LINUX26_KERNEL=$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
 
 # Version of Linux AFTER patches
 LINUX26_DIR=$(PROJECT_BUILD_DIR)/linux-$(LINUX26_VERSION)
@@ -101,7 +101,7 @@
 	touch $@
 endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
-$(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG) $(INITRAMFS_TARGET)
+$(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
 	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
 	$(SED) '/CONFIG_AEABI/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_ARM_EABI),y)
@@ -116,19 +116,18 @@
 	echo "CONFIG_INITRAMFS_SOURCE=\"$(INITRAMFS_TARGET)\"" >> \
 		$(LINUX26_DIR)/.config
 	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
-	echo "INITRAMFS_ROOT_UID=\"0\"" >> $(LINUX26_DIR)/.config
-	echo "INITRAMFS_ROOT_GID=\"0\"" >> $(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
 endif
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
 	touch $@
 
-$(LINUX26_DIR)/.depend_done:  $(LINUX26_DIR)/.configured
+$(LINUX26_DIR)/.depend_done: $(LINUX26_DIR)/.configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
 	touch $@
 
 $(LINUX26_KERNEL): $(LINUX26_DIR)/.depend_done
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(LINUX26_FORMAT)
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
 	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $@
 
@@ -137,9 +136,10 @@
 	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_DIR)/System.map $(TARGET_DIR)/boot/
 	touch -c $@
 
-$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_KERNEL)
+$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.depend_done
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
 		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
@@ -151,7 +151,7 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-linux26: cross-depmod26 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep $(TARGET_DIR)/boot/$(LINUX26_FORMAT)
+linux26: cross-depmod26 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep $(INITRAMFS_TARGET) $(TARGET_DIR)/boot/$(LINUX26_FORMAT)
 
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
 
