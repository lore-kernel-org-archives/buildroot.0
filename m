From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jul 2011 08:53:55 +0200
Subject: [Buildroot] [git commit] package: use libuuid from util-linux
Message-ID: <20110729065701.DAFC588C82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e1fbd63f3c9700ef9d590ea7b4659ca592db5e3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And adjust users.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/Config.in    |   25 ++++---------------------
 package/e2fsprogs/e2fsprogs.mk |   19 +------------------
 package/gdisk/Config.in        |   18 +++++++++++-------
 package/gdisk/gdisk.mk         |    2 +-
 package/xfsprogs/Config.in     |   10 ++++++----
 package/xfsprogs/xfsprogs.mk   |    2 +-
 6 files changed, 24 insertions(+), 52 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 76586d2..91e1670 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -6,16 +6,13 @@ config BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
-	  The EXT2 file system utilities and libraries
+	  The EXT2 file system utilities.
 
-menuconfig BR2_PACKAGE_E2FSPROGS_UTILS
-	bool "e2fsprogs utilities"
-	depends on BR2_PACKAGE_E2FSPROGS
-	help
-	  e2fsprogs utilities selection
+	  http://e2fsprogs.sf.net
 
-if BR2_PACKAGE_E2FSPROGS_UTILS
+if BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_BADBLOCKS
 	bool "badblocks"
@@ -31,7 +28,6 @@ config BR2_PACKAGE_E2FSPROGS_DEBUGFS
 config BR2_PACKAGE_E2FSPROGS_DUMPE2FS
 	bool "dumpe2fs"
 	default y
-	select BR2_PACKAGE_E2FSPROGS_LIBUUID
 
 config BR2_PACKAGE_E2FSPROGS_E2FREEFRAG
 	bool "e2freefrag"
@@ -93,27 +89,14 @@ config BR2_PACKAGE_E2FSPROGS_TUNE2FS
 config BR2_PACKAGE_E2FSPROGS_UUIDGEN
 	bool "uuidgen"
 	default y
-	select BR2_PACKAGE_E2FSPROGS_LIBUUID
 
 config BR2_PACKAGE_E2FSPROGS_UUIDD
 	bool "uuidd"
 	default y
-	select BR2_PACKAGE_E2FSPROGS_LIBUUID
 	help
 	  The uuidd daemon from the e2fsprogs suite
 
 endif
 
-menu "e2fsprogs libraries"
-	depends on BR2_PACKAGE_E2FSPROGS
-
-config BR2_PACKAGE_E2FSPROGS_LIBUUID
-	bool "libuuid"
-	help
-	  The uuid library from the e2fsprogs suite
-
-endmenu
-
 comment "e2fsprogs requires a toolchain with LARGEFILE + WCHAR support"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
-
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 21e65d1..1cfeb01 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -6,7 +6,6 @@
 
 E2FSPROGS_VERSION = 1.41.14
 E2FSPROGS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
-E2FSPROGS_INSTALL_STAGING = YES
 
 E2FSPROGS_CONF_OPT = \
 	--disable-tls \
@@ -16,6 +15,7 @@ E2FSPROGS_CONF_OPT = \
 	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_UUIDD),,--disable-uuidd) \
 	--disable-blkid \
+	--disable-libuuid \
 	--enable-fsck \
 	--disable-e2initrd-helper \
 	--disable-testio-debug
@@ -45,13 +45,6 @@ E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKE2FS) += usr/sbin/mke2fs
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND) += usr/sbin/mklost+found
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UUIDGEN) += usr/bin/uuidgen
 
-# libraries to keep or remove
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LIBUUID) += usr/lib/libuuid.so*
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libcom_err.so*
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libe2p.so*
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libext2fs.so*
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libss.so*
-
 # files to remove
 E2FSPROGS_TXTTARGETS_ = \
 	usr/sbin/mkfs.ext[234] \
@@ -106,15 +99,5 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
 E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FINDFS_SYMLINK
 endif
 
-define E2FSPROGS_STAGING_LIBUUID_INSTALL
-	install -D $(@D)/lib/uuid/uuid.h $(STAGING_DIR)/usr/include/uuid/uuid.h
-	install -D $(@D)/lib/uuid/uuid.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/uuid.pc
-endef
-
-ifeq ($(BR2_PACKAGE_E2FSPROGS_LIBUUID),y)
-E2FSPROGS_POST_INSTALL_STAGING_HOOKS += E2FSPROGS_STAGING_LIBUUID_INSTALL
-endif
-
 $(eval $(call AUTOTARGETS,package,e2fsprogs))
 $(eval $(call AUTOTARGETS,package,e2fsprogs,host))
diff --git a/package/gdisk/Config.in b/package/gdisk/Config.in
index 0daec5d..02bc188 100644
--- a/package/gdisk/Config.in
+++ b/package/gdisk/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_GDISK
 	bool "gdisk"
-	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # util-linux
 	help
 	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
 	  text-mode partitioning tool that works on Globally Unique Identifier
@@ -12,8 +14,9 @@ config BR2_PACKAGE_GDISK
 config BR2_PACKAGE_GDISK_GDISK
 	bool "interactive gdisk"
 	depends on BR2_PACKAGE_GDISK
-	select BR2_PACKAGE_E2FSPROGS
-	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install the interactive GUID partition table (GPT) manipulator
 	  /usr/sbin/gdisk which is modelled after and quite similar in use
@@ -22,13 +25,14 @@ config BR2_PACKAGE_GDISK_GDISK
 config BR2_PACKAGE_GDISK_SGDISK
 	bool "command line sgdisk"
 	depends on BR2_PACKAGE_GDISK
-	select BR2_PACKAGE_E2FSPROGS
-	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_POPT
 	help
 	  Install the command-line GUID partition table (GPT) manipulator
 	  /usr/sbin/sgdisk which is named after the traditional MBR based
 	  sfdisk tool albeit with an entirely different option syntax.
 
-comment "gdisk requires a toolchain with LARGEFILE and C++ support enabled"
-	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP
+comment "gdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled"
+	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
index ef4627d..bc7bc32 100644
--- a/package/gdisk/gdisk.mk
+++ b/package/gdisk/gdisk.mk
@@ -13,7 +13,7 @@ GDISK_TARGETS_$(BR2_PACKAGE_GDISK_SGDISK) += sgdisk
 
 ifneq ($(GDISK_TARGETS_y),)
 
-GDISK_DEPENDENCIES += e2fsprogs
+GDISK_DEPENDENCIES += util-linux
 ifeq ($(BR2_PACKAGE_GDISK_SGDISK),y)
     GDISK_DEPENDENCIES += popt
 endif
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 12bc69e..6c4d547 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -2,14 +2,16 @@
 comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCLIBC_HAS_OBSOLETE_BSD_SIGNAL enabled"
 	depends on BR2_PACKAGE_XFSPROGS
 
-comment "xfsprogs requires a toolchain with LARGEFILE support"
-        depends on !BR2_LARGEFILE
+comment "xfsprogs requires a toolchain with LARGEFILE + WCHAR support"
+        depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_LARGEFILE
-	select BR2_PACKAGE_E2FSPROGS
-	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  The XFS file system utilities and libraries
 
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 866e9b2..204b3cb 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -77,7 +77,7 @@ $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY): $(XFSPROGS_DIR)/$(XFSPROGS_BINARY)
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	touch -c $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
 
-xfsprogs: e2fsprogs $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
+xfsprogs: util-linux $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
 
 xfsprogs-clean:
 	rm -f $(TARGET_DIR)/bin/xfs_* $(TARGET_DIR)/sbin/xfs_* $(TARGET_DIR)/sbin/*.xfs
-- 
1.7.3.4
