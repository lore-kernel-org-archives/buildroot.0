From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  2 Sep 2007 14:50:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/busybox
	target/linux
Message-ID: <20070902215038.20719A680F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-02 14:50:37 -0700 (Sun, 02 Sep 2007)
New Revision: 19766

Log:
- build and use the list of the small initramfs
  Overriding the use of the whole system (as does the initramfs target) is done
  on purpose.


Modified:
   trunk/buildroot/package/busybox/initramfs.mk
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/package/busybox/initramfs.mk
===================================================================
--- trunk/buildroot/package/busybox/initramfs.mk	2007-09-02 20:58:51 UTC (rev 19765)
+++ trunk/buildroot/package/busybox/initramfs.mk	2007-09-02 21:50:37 UTC (rev 19766)
@@ -3,9 +3,11 @@
 # busybox image for initramfs
 #
 #############################################################
+ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_INITRAMFS)),y)
 
 BUSYBOX_INITRAMFS_DIR:=$(BUSYBOX_DIR)-initramfs
 BR2_INITRAMFS_DIR:=$(PROJECT_BUILD_DIR)/initramfs
+BB_INITRAMFS_TARGET:=$(IMAGE).initramfs_lst
 
 $(BUSYBOX_INITRAMFS_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
 	rm -rf $(BUILD_DIR)/tmp $(BUSYBOX_INITRAMFS_DIR)
@@ -34,6 +36,7 @@
 	 echo CONFIG_FALSE=y; \
 	 echo CONFIG_GUNZIP=y; \
 	 echo CONFIG_HALT=y; \
+	 echo CONFIG_INIT=y; \
 	 echo CONFIG_INSMOD=y; \
 	 echo CONFIG_KILL=y; \
 	 echo CONFIG_LN=y; \
@@ -47,8 +50,8 @@
 	 echo CONFIG_FEATURE_CHECK_TAINTED_MODULE=n; \
 	 echo CONFIG_FEATURE_2_4_MODULES=n; \
 	 echo CONFIG_MOUNT=y; \
-	 echo CONFIG_MSH=y; \
-	 echo CONFIG_FEATURE_SH_IS_MSH=y; \
+	 echo CONFIG_ASH=y; \
+	 echo CONFIG_FEATURE_SH_IS_ASH=y; \
 	 echo CONFIG_PS=y; \
 	 echo CONFIG_READLINK=y; \
 	 echo CONFIG_RMMOD=y; \
@@ -97,7 +100,25 @@
 		install
 	$(STRIP) $(STRIP_STRIP_ALL) $@
 
-$(PROJECT_BUILD_DIR)/.initramfs_done: $(BR2_INITRAMFS_DIR)/bin/busybox
+
+$(BB_INITRAMFS_TARGET): $(BR2_INITRAMFS_DIR)/bin/busybox
+	ln -fs bin/busybox $(PROJECT_BUILD_DIR)/initramfs/init
+	mkdir -p $(PROJECT_BUILD_DIR)/initramfs/etc
+	cat target/generic/target_busybox_skeleton/etc/inittab > \
+		$(PROJECT_BUILD_DIR)/initramfs/etc/inittab
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
+	(echo "chown -R 0:0 $(PROJECT_BUILD_DIR)/initramfs"; \
+	 echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(PROJECT_BUILD_DIR)/initramfs"; \
+	 echo "$(CONFIG_SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(PROJECT_BUILD_DIR)/initramfs > $(BB_INITRAMFS_TARGET)"; \
+	) > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
+	chmod +x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- \
+		$(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
+	touch -c $@
+
+$(PROJECT_BUILD_DIR)/.initramfs_done: $(BR2_INITRAMFS_DIR)/bin/busybox \
+					$(BB_INITRAMFS_TARGET)
 	touch $@
 
 busybox-initramfs: uclibc $(PROJECT_BUILD_DIR)/.initramfs_done
@@ -107,12 +128,13 @@
 
 busybox-initramfs-clean:
 	rm -f $(BUSYBOX_INITRAMFS_DIR)/busybox $(PROJECT_BUILD_DIR)/.initramfs_*
-	rm -rf $(BR2_INITRAMFS_DIR)
+	rm -rf $(BR2_INITRAMFS_DIR) $(BB_INITRAMFS_TARGET)
 	-$(MAKE) -C $(BUSYBOX_INITRAMFS_DIR) clean
 
 busybox-initramfs-dirclean:
 	rm -rf $(BUSYBOX_INITRAMFS_DIR) $(BR2_INITRAMFS_DIR) \
 		$(PROJECT_BUILD_DIR)/.initramfs_*
+endif
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-02 20:58:51 UTC (rev 19765)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-02 21:50:37 UTC (rev 19766)
@@ -160,6 +160,14 @@
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
 endif
+ifeq ($(BR2_PACKAGE_BUSYBOX_INITRAMFS),y)
+	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_SOURCE=\"$(BB_INITRAMFS_TARGET)\"" >> \
+		$(LINUX26_DIR)/.config
+	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
+endif
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
 	touch $@
 
@@ -167,7 +175,8 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
 	touch $@
 
-$(LINUX26_KERNEL): $(LINUX26_DIR)/.depend_done
+$(LINUX26_KERNEL): $(INITRAMFS_TARGET) $(BB_INITRAMFS_TARGET) \
+		$(LINUX26_DIR)/.depend_done
 	$(MAKE) $(LINUX26_MAKE_FLAGS) LZMA="$(LZMA)" \
 		-C $(LINUX26_DIR) $(LINUX26_FORMAT)
 	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
@@ -190,7 +199,7 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-linux26: $(INITRAMFS_TARGET) $(LINUX26_KERNEL)
+linux26: $(LINUX26_KERNEL)
 
 $(LINUX26_DIR)/.modules_installed: $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
 	touch $@
