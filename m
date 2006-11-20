From: Goetz Bock <bock@blacknet.de>
Date: Mon, 20 Nov 2006 16:44:23 +0100
Subject: [Buildroot] patch: target/cpio
Message-ID: <20061120154423.GG3065@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear list,

this patch adds a simple cpio target, to be used with an initramfs

Index: target/Config.in
===================================================================
--- target/Config.in    (revision 16570)
+++ target/Config.in    (working copy)
@@ -8,6 +8,7 @@
 source "target/jffs2/Config.in"
 source "target/squashfs/Config.in"
 source "target/tar/Config.in"
+source "target/cpio/Config.in"
 source "target/iso9660/Config.in"
 
 comment "bootloader for target device"
diff -urN target/cpio/Config.in target/cpio/Config.in
--- target/cpio/Config.in       1970-01-01 00:00:00.000000000 +0000
+++ target/cpio/Config.in       2006-11-20 11:16:13.000000000 +0000
@@ -0,0 +1,6 @@
+config BR2_TARGET_ROOTFS_CPIO
+       bool "cpio the root filesystem"
+       default n
+       help
+         Build a cpio archive of the root filesystem
+
diff -urN target/cpio/cpioroot.mk target/cpio/cpioroot.mk
--- target/cpio/cpioroot.mk     1970-01-01 00:00:00.000000000 +0000
+++ target/cpio/cpioroot.mk     2006-11-20 12:42:00.000000000 +0000
@@ -0,0 +1,45 @@
+#############################################################
+#
+# cpio to archive target filesystem
+#
+#############################################################
+
+CPIO_TARGET:=$(IMAGE).cpio
+
+cpioroot-init:
+       ln -s sbin/init $(TARGET_DIR)/init
+
+cpioroot: host-fakeroot makedevs cpioroot-init
+       - at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+       @rm -rf $(TARGET_DIR)/usr/man
+       @rm -rf $(TARGET_DIR)/usr/info
+       -/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
+       # Use fakeroot to pretend all target binaries are owned by root
+       rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+       touch $(STAGING_DIR)/.fakeroot.00000
+       cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+       echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+       # Use fakeroot to pretend to create all needed device nodes
+       echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+               >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+       # Use fakeroot so tar believes the previous fakery
+       echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_TARGET)" \
+               >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+       chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+       $(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+       #- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+
+cpioroot-source:
+
+cpioroot-clean:
+
+cpioroot-dirclean:
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_TARGET_ROOTFS_CPIO)),y)
+TARGETS+=cpioroot
+endif


-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
