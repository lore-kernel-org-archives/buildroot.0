From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue,  1 Apr 2008 17:18:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target:  romfs
Message-ID: <20080402001858.579D33C56C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-04-01 17:18:57 -0700 (Tue, 01 Apr 2008)
New Revision: 21618

Log:
Add romfs target support, courtesy Josh <buildroot@digitalpeer.com>



Added:
   trunk/buildroot/target/romfs/
   trunk/buildroot/target/romfs/Config.in
   trunk/buildroot/target/romfs/romfs.mk

Modified:
   trunk/buildroot/target/Config.in


Changeset:
Modified: trunk/buildroot/target/Config.in
===================================================================
--- trunk/buildroot/target/Config.in	2008-04-01 17:43:03 UTC (rev 21617)
+++ trunk/buildroot/target/Config.in	2008-04-02 00:18:57 UTC (rev 21618)
@@ -11,6 +11,7 @@
 source "target/cpio/Config.in"
 source "target/iso9660/Config.in"
 source "target/initramfs/Config.in"
+source "target/romfs/Config.in"
 
 comment "bootloader for target device"
 

Added: trunk/buildroot/target/romfs/Config.in
===================================================================
--- trunk/buildroot/target/romfs/Config.in	                        (rev 0)
+++ trunk/buildroot/target/romfs/Config.in	2008-04-02 00:18:57 UTC (rev 21618)
@@ -0,0 +1,7 @@
+config BR2_TARGET_ROOTFS_ROMFS
+	bool "romfs root filesystem"
+	default n
+	select BR2_HOST_FAKEROOT
+	help
+	  Build a romfs image of the root filesystem.
+

Added: trunk/buildroot/target/romfs/romfs.mk
===================================================================
--- trunk/buildroot/target/romfs/romfs.mk	                        (rev 0)
+++ trunk/buildroot/target/romfs/romfs.mk	2008-04-02 00:18:57 UTC (rev 21618)
@@ -0,0 +1,79 @@
+#############################################################
+#
+# genromfs to build to target romfs filesystems
+#
+#############################################################
+ROMFS_VERSION=0.5.2
+ROMFS_DIR=$(BUILD_DIR)/genromfs-$(ROMFS_VERSION)
+ROMFS_SOURCE=genromfs-$(ROMFS_VERSION).tar.gz
+ROMFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/romfs
+
+$(DL_DIR)/$(ROMFS_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(ROMFS_SITE)/$(ROMFS_SOURCE)
+
+$(ROMFS_DIR): $(DL_DIR)/$(ROMFS_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(ROMFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
+
+$(ROMFS_DIR)/genromfs: $(ROMFS_DIR)
+	$(MAKE) -C $(ROMFS_DIR)
+	touch -c $@
+
+romfs: $(ROMFS_DIR)/genromfs
+
+romfs-source: $(DL_DIR)/$(ROMFS_SOURCE)
+
+romfs-clean:
+	-$(MAKE) -C $(ROMFS_DIR) clean
+
+romfs-dirclean:
+	rm -rf $(ROMFS_DIR)
+
+#############################################################
+#
+# Build the romfs root filesystem image
+#
+#############################################################
+
+ROMFS_TARGET=$(IMAGE).romfs
+
+romfsroot: host-fakeroot makedevs romfs
+	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	@rm -rf $(TARGET_DIR)/usr/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
+	@rm -rf $(TARGET_DIR)/usr/info
+endif
+	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
+	# Use fakeroot to pretend all target binaries are owned by root
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
+	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+ifneq ($(TARGET_DEVICE_TABLE),)
+	# Use fakeroot to pretend to create all needed device nodes
+	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+endif
+	# Use fakeroot so genromfs believes the previous fakery
+	echo "$(ROMFS_DIR)/genromfs -d $(TARGET_DIR) -f $(ROMFS_TARGET)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+
+romfsroot-source: romfs-source
+
+romfsroot-clean:
+	-$(MAKE) -C $(ROMFS_DIR) clean
+
+romfsroot-dirclean:
+	rm -rf $(ROMFS_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_TARGET_ROOTFS_ROMFS)),y)
+TARGETS+=romfsroot
+endif
