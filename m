From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  4 Feb 2007 08:30:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070204163008.723B648606@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-04 08:30:07 -0800 (Sun, 04 Feb 2007)
New Revision: 17762

Log:
- propagate BR2_ARM_EABI setting down to LINUX26_KCONFIG


Modified:
   trunk/buildroot/target/linux26.mk


Changeset:
Modified: trunk/buildroot/target/linux26.mk
===================================================================
--- trunk/buildroot/target/linux26.mk	2007-02-04 16:11:51 UTC (rev 17761)
+++ trunk/buildroot/target/linux26.mk	2007-02-04 16:30:07 UTC (rev 17762)
@@ -67,38 +67,40 @@
 	# Rename the dir from the downloaded version to the AFTER patch version
 	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(BUILD_DIR)/linux-$(LINUX26_VERSION)
 endif
-	touch $(LINUX26_DIR)/.unpacked
+	touch $@
 
 $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
-	touch $(LINUX26_DIR)/.patched
-
+	touch $@
 endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
 $(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG)
-	-cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
-	$(SED) 's,^CONFIG_EABI.*,# CONFIG_EABI is not set,g' \
-		$(LINUX26_DIR)/.config
+	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
+	$(SED) '/CONFIG_AEABI/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_ARM_EABI),y)
-	echo "CONFIG_EABI=y" >> $(LINUX26_DIR)/.config
+	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
+	$(SED) '/CONFIG_OABI_COMPAT/d' $(LINUX26_DIR)/.config
+	echo "# CONFIG_OABI_COMPAT is not set" >> $(LINUX26_DIR)/.config
+else
+	echo "# CONFIG_AEABI is not set" >> $(LINUX26_DIR)/.config
 endif
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
-	touch $(LINUX26_DIR)/.configured
+	touch $@
 
 $(LINUX26_DIR)/.depend_done:  $(LINUX26_DIR)/.configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
-	touch $(LINUX26_DIR)/.depend_done
+	touch $@
 
 $(LINUX26_KERNEL): $(LINUX26_DIR)/.depend_done
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(LINUX26_FORMAT)
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
-	cp -fa $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
-	touch -c $(LINUX26_KERNEL)
+	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
+	touch -c $@
 
 $(TARGET_DIR)/boot/$(LINUX26_BINLOC): $(LINUX26_KERNEL)
 	[ -d $(TARGET_DIR)/boot/ ] || mkdir $(TARGET_DIR)/boot
 	cp -a $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_DIR)/System.map $(TARGET_DIR)/boot/
-	touch -c $(TARGET_DIR)/boot/$(LINUX26_BINLOC)
+	touch -c $@
 
 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_KERNEL)
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
@@ -107,7 +109,7 @@
 		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
-	touch -c $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
+	touch -c $@
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched
 	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
