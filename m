From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jun 2013 16:54:25 +0200
Subject: [Buildroot] [git commit] dosfstools: bump to version 3.0.18
Message-ID: <20130610151258.A0D779ABA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6e4fcb11ff07e4e1f46e54a0bcffc47739b4a67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And update Config.in & Config.in.legacy entries to reflect upstream
changes to tool naming.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy                  |   25 +++++++++++++++++++++++++
 package/dosfstools/Config.in      |   25 +++++++++++++------------
 package/dosfstools/Config.in.host |    2 +-
 package/dosfstools/dosfstools.mk  |   23 ++++++++++++-----------
 4 files changed, 51 insertions(+), 24 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bb9c4a9..cd23492 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -41,6 +41,31 @@ comment "will fail.                                          "
 endif
 
 #
+# Legacy options since 2013.08
+#
+
+config BR2_PACKAGE_DOSFSTOOLS_DOSFSCK
+	bool "dosfstools dosfsck renamed to fsck.fat"
+	select BR2_LEGACY
+	select BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT
+	help
+	  dosfsck was renamed upstream to fsck.fat for consistency.
+
+config BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL
+	bool "dosfstools dosfslabel renamed to fatlabel"
+	select BR2_LEGACY
+	select BR2_PACKAGE_DOSFSTOOLS_FATLABEL
+	help
+	  doslabel was renamed upstream to fatlabel for consistency.
+
+config BR2_PACKAGE_DOSFSTOOLS_MKDOSFS
+	bool "dosfstools mkdosfs renamed to mkfs.fat"
+	select BR2_LEGACY
+	select BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT
+	help
+	  mkdosfs was renamed upstream to mkfs.fat for consistency.
+
+#
 # Legacy options since 2013.05
 #
 
diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
index 2156a04..ec2f891 100644
--- a/package/dosfstools/Config.in
+++ b/package/dosfstools/Config.in
@@ -8,23 +8,24 @@ config BR2_PACKAGE_DOSFSTOOLS
 
 	  http://www.daniel-baumann.ch/software/dosfstools/
 
-config BR2_PACKAGE_DOSFSTOOLS_MKDOSFS
-	bool "mkdosfs"
-	depends on BR2_PACKAGE_DOSFSTOOLS
+if BR2_PACKAGE_DOSFSTOOLS
+
+config BR2_PACKAGE_DOSFSTOOLS_FATLABEL
+	bool "fatlabel"
 	help
-	  Creates a DOS FAT filesystem on a device.
+	  Get or set the DOS FAT filesystem label.
 
-config BR2_PACKAGE_DOSFSTOOLS_DOSFSCK
-	bool "dosfsck"
-	depends on BR2_PACKAGE_DOSFSTOOLS
+config BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT
+	bool "fsck.fat"
 	help
-	  Checks a DOS FAT filesystem.
+	  Check a DOS FAT filesystem.
 
-config BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL
-	bool "dosfslabel"
-	depends on BR2_PACKAGE_DOSFSTOOLS
+config BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT
+	bool "mkfs.fat"
 	help
-	  Get or set the DOS FAT filesystem label.
+	  Creates a DOS FAT filesystem on a device.
+
+endif
 
 comment "dosfstools requires a toolchain with LARGEFILE and WCHAR support"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/dosfstools/Config.in.host b/package/dosfstools/Config.in.host
index 9f9ceab..6156c5a 100644
--- a/package/dosfstools/Config.in.host
+++ b/package/dosfstools/Config.in.host
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HOST_DOSFSTOOLS
 	bool "host dosfstools"
 	help
 	  Tools for creating and checking DOS FAT filesystems.
-	  
+
 	  http://www.daniel-baumann.ch/software/dosfstools/
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 7482bc8..4664faa 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOSFSTOOLS_VERSION = 3.0.16
+DOSFSTOOLS_VERSION = 3.0.18
 DOSFSTOOLS_SITE = http://daniel-baumann.ch/files/software/dosfstools
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
@@ -18,28 +18,29 @@ DOSFSTOOLS_DEPENDENCIES += libiconv
 DOSFSTOOLS_LDFLAGS += -liconv
 endif
 
-MKDOSFS_BINARY = mkdosfs
-DOSFSCK_BINARY = dosfsck
-DOSFSLABEL_BINARY = dosfslabel
+FATLABEL_BINARY = fatlabel
+FSCK_FAT_BINARY = fsck.fat
+MKFS_FAT_BINARY = mkfs.fat
 
 define DOSFSTOOLS_BUILD_CMDS
 	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" \
 		LDFLAGS="$(DOSFSTOOLS_LDFLAGS)" -C $(@D)
 endef
 
-DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS)+=$(MKDOSFS_BINARY)
-DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_DOSFSCK)+=$(DOSFSCK_BINARY)
-DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL)+=$(DOSFSLABEL_BINARY)
+DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_FATLABEL)+=$(FATLABEL_BINARY)
+DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT)+=$(FSCK_FAT_BINARY)
+DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT)+=$(MKFS_FAT_BINARY)
 
 define DOSFSTOOLS_INSTALL_TARGET_CMDS
 	test -z "$(DOSFSTOOLS_INSTALL_BIN_FILES_y)" || \
-	install -m 755 $(addprefix $(@D)/,$(DOSFSTOOLS_INSTALL_BIN_FILES_y)) $(TARGET_DIR)/sbin/
+	$(INSTALL) -m 755 $(addprefix $(@D)/,$(DOSFSTOOLS_INSTALL_BIN_FILES_y)) \
+		$(TARGET_DIR)/sbin/
 endef
 
 define DOSFSTOOLS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/$(MKDOSFS_BINARY)
-	rm -f $(TARGET_DIR)/sbin/$(DOSFSCK_BINARY)
-	rm -f $(TARGET_DIR)/sbin/$(DOSFSLABEL_BINARY)
+	rm -f $(TARGET_DIR)/sbin/$(FATLABEL_BINARY)
+	rm -f $(TARGET_DIR)/sbin/$(FSCK_FAT_BINARY)
+	rm -f $(TARGET_DIR)/sbin/$(MKFS_FAT_BINARY)
 endef
 
 define DOSFSTOOLS_CLEAN_CMDS
