From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jul 2009 17:55:34 +0200
Subject: [Buildroot] [git commit] package: replace mkdosfs with dosfstools
Message-ID: <20090727155612.46A25777EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f26acf61ebf73ad0bfe276fcc9396fd26bb0aad6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #451

Move from old unmaintained dosfstools-2.11 (packaged as mkdosfs) to
now maintained dosfstools-3.0.3.

Allow each binary to be installed independently.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Tested-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    1 +
 package/Config.in                |    2 +-
 package/dosfstools/Config.in     |   24 ++++++++++++
 package/dosfstools/dosfstools.mk |   73 ++++++++++++++++++++++++++++++++++++++
 package/mkdosfs/Config.in        |    6 ---
 package/mkdosfs/mkdosfs.mk       |   48 -------------------------
 6 files changed, 99 insertions(+), 55 deletions(-)
 create mode 100644 package/dosfstools/Config.in
 create mode 100644 package/dosfstools/dosfstools.mk
 delete mode 100644 package/mkdosfs/Config.in
 delete mode 100644 package/mkdosfs/mkdosfs.mk

diff --git a/CHANGES b/CHANGES
index c83725b..0d6ac97 100644
--- a/CHANGES
+++ b/CHANGES
@@ -39,6 +39,7 @@
 	#417: New package spawn-fcgi
 	#419: Bump lighttpd package to 1.4.23
 	#421: toolchain: Clean up toolchain locale support menu
+	#451: Upgrade from unmaintained dosfstools-2.11 to dosfstools-3.0.3
 	#467: DirectFB 1.4.1
 	#473: memstat_0.5.tar.gz has install with -D and that fails "make"
 
diff --git a/package/Config.in b/package/Config.in
index ba3418f..6cc825d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -236,6 +236,7 @@ source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
 source "package/devmem2/Config.in"
 source "package/dmraid/Config.in"
+source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
 source "package/eeprog/Config.in"
 source "package/fconfig/Config.in"
@@ -258,7 +259,6 @@ source "package/lm-sensors/Config.in"
 source "package/lvm2/Config.in"
 source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
-source "package/mkdosfs/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/pciutils/Config.in"
diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
new file mode 100644
index 0000000..4906fff
--- /dev/null
+++ b/package/dosfstools/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_DOSFSTOOLS
+	bool "dosfstools"
+	help
+	  Tools for creating and checking DOS FAT filesystems.
+
+	  http://www.daniel-baumann.ch/software/dosfstools/
+
+config BR2_PACKAGE_DOSFSTOOLS_MKDOSFS
+	bool "mkdosfs"
+	depends on BR2_PACKAGE_DOSFSTOOLS
+	help
+	  Creates a DOS FAT filesystem on a device.
+
+config BR2_PACKAGE_DOSFSTOOLS_DOSFSCK
+	bool "dosfsck"
+	depends on BR2_PACKAGE_DOSFSTOOLS
+	help
+	  Checks a DOS FAT filesystem.
+
+config BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL
+	bool "dosfslabel"
+	depends on BR2_PACKAGE_DOSFSTOOLS
+	help
+	  Get or set the DOS FAT filesystem label.
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
new file mode 100644
index 0000000..a88ab3d
--- /dev/null
+++ b/package/dosfstools/dosfstools.mk
@@ -0,0 +1,73 @@
+#############################################################
+#
+# dosfstools
+#
+#############################################################
+DOSFSTOOLS_VERSION:=3.0.3
+DOSFSTOOLS_SOURCE:=dosfstools-$(DOSFSTOOLS_VERSION).tar.gz
+DOSFSTOOLS_SITE:=http://www.daniel-baumann.ch/software/dosfstools
+DOSFSTOOLS_DIR:=$(BUILD_DIR)/dosfstools-$(DOSFSTOOLS_VERSION)
+DOSFSTOOLS_CAT:=$(ZCAT)
+MKDOSFS_BINARY:=mkdosfs
+MKDOSFS_TARGET_BINARY:=sbin/mkdosfs
+DOSFSCK_BINARY:=dosfsck
+DOSFSCK_TARGET_BINARY:=sbin/dosfsck
+DOSFSLABEL_BINARY:=dosfslabel
+DOSFSLABEL_TARGET_BINARY:=sbin/dosfslabel
+
+$(DL_DIR)/$(DOSFSTOOLS_SOURCE):
+	 $(call DOWNLOAD,$(DOSFSTOOLS_SITE),$(DOSFSTOOLS_SOURCE))
+
+dosfstools-source: $(DL_DIR)/$(DOSFSTOOLS_SOURCE)
+
+$(DOSFSTOOLS_DIR)/.unpacked: $(DL_DIR)/$(DOSFSTOOLS_SOURCE) $(wildcard local/dosfstools/dosfstools*.patch)
+	$(DOSFSTOOLS_CAT) $(DL_DIR)/$(DOSFSTOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(DOSFSTOOLS_DIR) package/dosfstools/ dosfstools\*.patch
+	touch $(DOSFSTOOLS_DIR)/.unpacked
+
+$(DOSFSTOOLS_DIR)/.built : $(DOSFSTOOLS_DIR)/.unpacked
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(DOSFSTOOLS_DIR)
+	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(MKDOSFS_BINARY)
+	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(DOSFSCK_BINARY)
+	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(DOSFSLABEL_BINARY)
+	touch $@
+
+$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
+	cp -a $(DOSFSTOOLS_DIR)/$(MKDOSFS_BINARY) $@
+	touch -c $@
+
+$(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
+	cp -a $(DOSFSTOOLS_DIR)/$(DOSFSCK_BINARY) $@
+	touch -c $@
+
+$(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
+	cp -a $(DOSFSTOOLS_DIR)/$(DOSFSLABEL_BINARY) $@
+	touch -c $@
+
+dosfstools: uclibc $(TARGET_DIR)/$(DOSFSTOOLS_TARGET_BINARY) $(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY)
+
+dosfstools-clean:
+	rm -f $(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY)
+	-$(MAKE) -C $(DOSFSTOOLS_DIR) clean
+
+dosfstools-dirclean:
+	rm -rf $(DOSFSTOOLS_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS),y)
+TARGETS+=$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
+endif
+
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_DOSFSCK),y)
+TARGETS+=$(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY)
+endif
+
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL),y)
+TARGETS+=$(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY)
+endif
diff --git a/package/mkdosfs/Config.in b/package/mkdosfs/Config.in
deleted file mode 100644
index dbd903d..0000000
--- a/package/mkdosfs/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_MKDOSFS
-	bool "mkdosfs"
-	help
-	  Creates a DOS FAT filesystem on a device.
-
-	  ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/
diff --git a/package/mkdosfs/mkdosfs.mk b/package/mkdosfs/mkdosfs.mk
deleted file mode 100644
index e147da6..0000000
--- a/package/mkdosfs/mkdosfs.mk
+++ /dev/null
@@ -1,48 +0,0 @@
-#############################################################
-#
-# mkdosfs
-#
-#############################################################
-MKDOSFS_VERSION:=2.11
-MKDOSFS_SOURCE:=dosfstools-$(MKDOSFS_VERSION).src.tar.gz
-MKDOSFS_SITE:=http://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools
-MKDOSFS_DIR:=$(BUILD_DIR)/dosfstools-$(MKDOSFS_VERSION)
-MKDOSFS_CAT:=$(ZCAT)
-MKDOSFS_BINARY:=mkdosfs/mkdosfs
-MKDOSFS_TARGET_BINARY:=sbin/mkdosfs
-
-$(DL_DIR)/$(MKDOSFS_SOURCE):
-	 $(call DOWNLOAD,$(MKDOSFS_SITE),$(MKDOSFS_SOURCE))
-
-mkdosfs-source: $(DL_DIR)/$(MKDOSFS_SOURCE)
-
-$(MKDOSFS_DIR)/.unpacked: $(DL_DIR)/$(MKDOSFS_SOURCE)
-	$(MKDOSFS_CAT) $(DL_DIR)/$(MKDOSFS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(MKDOSFS_DIR)/.unpacked
-
-$(MKDOSFS_DIR)/$(MKDOSFS_BINARY): $(MKDOSFS_DIR)/.unpacked
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(MKDOSFS_DIR)
-	$(STRIPCMD) $(MKDOSFS_DIR)/mkdosfs/mkdosfs
-	touch -c $(MKDOSFS_DIR)/mkdosfs/mkdosfs
-
-$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): $(MKDOSFS_DIR)/$(MKDOSFS_BINARY)
-	cp -a $(MKDOSFS_DIR)/$(MKDOSFS_BINARY) $@
-	touch -c $@
-
-mkdosfs: uclibc $(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
-
-mkdosfs-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(MKDOSFS_DIR) uninstall
-	-$(MAKE) -C $(MKDOSFS_DIR) clean
-
-mkdosfs-dirclean:
-	rm -rf $(MKDOSFS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MKDOSFS),y)
-TARGETS+=mkdosfs
-endif
-- 
1.6.3.3
