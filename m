From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  2 Sep 2007 07:56:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070902145639.C1EBFA6575@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-02 07:56:39 -0700 (Sun, 02 Sep 2007)
New Revision: 19761

Log:
- improve configury


Modified:
   trunk/buildroot/package/busybox/initramfs.mk


Changeset:
Modified: trunk/buildroot/package/busybox/initramfs.mk
===================================================================
--- trunk/buildroot/package/busybox/initramfs.mk	2007-09-02 14:51:54 UTC (rev 19760)
+++ trunk/buildroot/package/busybox/initramfs.mk	2007-09-02 14:56:39 UTC (rev 19761)
@@ -5,6 +5,7 @@
 #############################################################
 
 BUSYBOX_INITRAMFS_DIR:=$(BUSYBOX_DIR)-initramfs
+BR2_INITRAMFS_DIR:=$(PROJECT_BUILD_DIR)/initramfs
 
 $(BUSYBOX_INITRAMFS_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
 	rm -rf $(BUILD_DIR)/tmp $(BUSYBOX_INITRAMFS_DIR)
@@ -17,8 +18,16 @@
 endif
 	touch $@
 
-$(BUSYBOX_INITRAMFS_DIR)/.configured: $(BUSYBOX_INITRAMFS_DIR)/.unpacked
-	(echo CONFIG_CAT=y; \
+$(BUSYBOX_INITRAMFS_DIR)/.config $(BUSYBOX_INITRAMFS_DIR)/.configured: $(BUSYBOX_INITRAMFS_DIR)/.unpacked
+	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+                CROSS="$(TARGET_CROSS)" -C $(BUSYBOX_INITRAMFS_DIR) \
+		allnoconfig
+	mv $(BUSYBOX_INITRAMFS_DIR)/.config $(BUSYBOX_INITRAMFS_DIR)/.config.no
+	(echo CONFIG_PREFIX=\"$(BR2_INITRAMFS_DIR)\"; \
+	 echo CONFIG_NITPICK=y; \
+	 echo CONFIG_FEATURE_BUFFERS_USE_MALLOC=y; \
+	 echo CONFIG_INCLUDE_SUSv2=n; \
+	 echo CONFIG_CAT=y; \
 	 echo CONFIG_CHROOT=y; \
 	 echo CONFIG_DD=y; \
 	 echo CONFIG_FEATURE_DD_IBS_OBS=y; \
@@ -28,7 +37,6 @@
 	 echo CONFIG_INSMOD=y; \
 	 echo CONFIG_KILL=y; \
 	 echo CONFIG_LN=y; \
-	 echo CONFIG_PS=y; \
 	 echo CONFIG_MDEV=y; \
 	 echo CONFIG_MKDIR=y; \
 	 echo CONFIG_MKFIFO=y; \
@@ -39,25 +47,34 @@
 	 echo CONFIG_FEATURE_CHECK_TAINTED_MODULE=n; \
 	 echo CONFIG_FEATURE_2_4_MODULES=n; \
 	 echo CONFIG_MOUNT=y; \
-	 echo CONFIG_SWITCH_ROOT=y; \
+	 echo CONFIG_MSH=y; \
+	 echo CONFIG_FEATURE_SH_IS_MSH=y; \
+	 echo CONFIG_PS=y; \
 	 echo CONFIG_READLINK=y; \
 	 echo CONFIG_RMMOD=y; \
-	 echo CONFIG_MSH=y; \
-	 echo CONFIG_FEATURE_SH_IS_MSH=y; \
 	 echo CONFIG_SLEEP=y; \
 	 echo CONFIG_STATIC=y; \
+	 echo CONFIG_SWITCH_ROOT=y; \
 	 echo CONFIG_TRUE=y; \
 	 echo CONFIG_UMOUNT=y; \
 	 echo CONFIG_FEATURE_UMOUNT_ALL=y; \
 	 echo CONFIG_UNAME=y; \
-	) > $(BUSYBOX_INITRAMFS_DIR)/.config 
+	) > $(BUSYBOX_INITRAMFS_DIR)/.config
+	cp -f $(BUSYBOX_INITRAMFS_DIR)/.config \
+		$(BUSYBOX_INITRAMFS_DIR)/.config.prune
+	$(SED) 's|\([^=]*\)=.*|/\1[^_]*/d|g' \
+		$(BUSYBOX_INITRAMFS_DIR)/.config.prune
+	$(SED) '' -f $(BUSYBOX_INITRAMFS_DIR)/.config.prune \
+		$(BUSYBOX_INITRAMFS_DIR)/.config.no
+	cat $(BUSYBOX_INITRAMFS_DIR)/.config.no >> \
+		$(BUSYBOX_INITRAMFS_DIR)/.config
 	yes "" | $(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
-		CROSS="$(TARGET_CROSS)" -C $(BUSYBOX_INITRAMFS_DIR) oldconfig
+		CROSS="$(TARGET_CROSS)" -C $(BUSYBOX_INITRAMFS_DIR) \
+		oldconfig
 	touch $@
 
 
-$(BUSYBOX_INITRAMFS_DIR)/inst/busybox: $(BUSYBOX_INITRAMFS_DIR)/.configured
-	-mkdir $(@D)
+$(BUSYBOX_INITRAMFS_DIR)/busybox: $(BUSYBOX_INITRAMFS_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
@@ -71,21 +88,31 @@
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_INITRAMFS_DIR) \
 		-f scripts/Makefile.IMA
 endif
-	cp -f $(BUSYBOX_INITRAMFS_DIR)/busybox $@
+
+$(BR2_INITRAMFS_DIR)/bin/busybox: $(BUSYBOX_INITRAMFS_DIR)/busybox
+	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+		CROSS="$(TARGET_CROSS)" \
+		ARCH=$(KERNEL_ARCH) STRIP="$(STRIP)" \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_INITRAMFS_DIR) \
+		install
 	$(STRIP) $(STRIP_STRIP_ALL) $@
 
-busybox-initramfs: uclibc $(BUSYBOX_INITRAMFS_DIR)/inst/busybox
+$(PROJECT_BUILD_DIR)/.initramfs_done: $(BR2_INITRAMFS_DIR)/bin/busybox
+	touch $@
 
+busybox-initramfs: uclibc $(PROJECT_BUILD_DIR)/.initramfs_done
+
 busybox-initramfs-menuconfig: host-sed $(BUILD_DIR) busybox-source $(BUSYBOX_INITRAMFS_DIR)/.configured
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_INITRAMFS_DIR) menuconfig
 
 busybox-initramfs-clean:
-	rm -f $(BUSYBOX_INITRAMFS_DIR)/busybox \
-		$(BUSYBOX_INITRAMFS_DIR)/inst/busybox
+	rm -f $(BUSYBOX_INITRAMFS_DIR)/busybox $(PROJECT_BUILD_DIR)/.initramfs_*
+	rm -rf $(BR2_INITRAMFS_DIR)
 	-$(MAKE) -C $(BUSYBOX_INITRAMFS_DIR) clean
 
 busybox-initramfs-dirclean:
-	rm -rf $(BUSYBOX_INITRAMFS_DIR)
+	rm -rf $(BUSYBOX_INITRAMFS_DIR) $(BR2_INITRAMFS_DIR) \
+		$(PROJECT_BUILD_DIR)/.initramfs_*
 #############################################################
 #
 # Toplevel Makefile options
