From: Michael Roth <mroth@nessie.de>
Date: Thu, 26 Mar 2009 22:34:35 +0100
Subject: [Buildroot] [PATCH 1/5] mtd-utils: Prepare for version dump
In-Reply-To: <1238103279-8040-1-git-send-email-mroth@nessie.de>
References: <1238103279-8040-1-git-send-email-mroth@nessie.de>
Message-ID: <1238103279-8040-2-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prepared for new mtd-utils version and some cleanup and
clarification on configure options.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/mtd/1.1.0/mtd-utils-1.1.0-all-acl.patch    |   48 ++++++++
 .../mtd-utils-1.1.0-all-flashcp-npow2-erase.patch  |   23 ++++
 ...ils-1.1.0-all-mkfs.jffs2-device_table-fix.patch |   23 ++++
 .../mtd/1.1.0/mtd-utils-1.1.0-all-targets.patch    |   34 +++++
 package/mtd/1.1.0/mtd.mk                           |  128 ++++++++++++++++++++
 package/mtd/Config.in                              |   46 ++++---
 .../mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch    |   48 --------
 .../mtd-utils-1.1.0-all-flashcp-npow2-erase.patch  |   23 ----
 ...ils-1.1.0-all-mkfs.jffs2-device_table-fix.patch |   23 ----
 .../mtd-utils/mtd-utils-1.1.0-all-targets.patch    |   34 -----
 package/mtd/mtd-utils/mtd.mk                       |  128 --------------------
 package/mtd/mtd.mk                                 |    8 +-
 12 files changed, 285 insertions(+), 281 deletions(-)
 create mode 100644 package/mtd/1.1.0/mtd-utils-1.1.0-all-acl.patch
 create mode 100644 package/mtd/1.1.0/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch
 create mode 100644 package/mtd/1.1.0/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch
 create mode 100644 package/mtd/1.1.0/mtd-utils-1.1.0-all-targets.patch
 create mode 100644 package/mtd/1.1.0/mtd.mk
 delete mode 100644 package/mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch
 delete mode 100644 package/mtd/mtd-utils/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch
 delete mode 100644 package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch
 delete mode 100644 package/mtd/mtd-utils/mtd-utils-1.1.0-all-targets.patch
 delete mode 100644 package/mtd/mtd-utils/mtd.mk

diff --git a/package/mtd/1.1.0/mtd-utils-1.1.0-all-acl.patch b/package/mtd/1.1.0/mtd-utils-1.1.0-all-acl.patch
new file mode 100644
index 0000000..953786e
--- /dev/null
+++ b/package/mtd/1.1.0/mtd-utils-1.1.0-all-acl.patch
@@ -0,0 +1,48 @@
+Author:	Ulf Samuelsson
+Date:	2007-01-25
+
+Log:
+Patch adding "sys/acl.h" needed to compile mtd.
+
+Modified:
+	package/mtd/mtd_acl.patch
+
+Changeset
+	package/mtd/mtd_acl.patch
+
+diff -urN mtd_orig-0rig/include/sys/acl.h mtd_orig/include/sys/acl.h
+--- mtd_orig-0rig/include/sys/acl.h	1970-01-01 01:00:00.000000000 +0100
++++ mtd_orig/include/sys/acl.h	2007-01-17 20:11:22.000000000 +0100
+@@ -0,0 +1,32 @@
++/*
++  File: linux/posix_acl.h
++
++  (C) 2002 Andreas Gruenbacher, <a.gruenbacher@computer.org>
++*/
++
++
++#ifndef __LINUX_POSIX_ACL_H
++#define __LINUX_POSIX_ACL_H
++
++#define ACL_UNDEFINED_ID	(-1)
++
++/* a_type field in acl_user_posix_entry_t */
++#define ACL_TYPE_ACCESS		(0x8000)
++#define ACL_TYPE_DEFAULT	(0x4000)
++
++/* e_tag entry in struct posix_acl_entry */
++#define ACL_USER_OBJ		(0x01)
++#define ACL_USER		(0x02)
++#define ACL_GROUP_OBJ		(0x04)
++#define ACL_GROUP		(0x08)
++#define ACL_MASK		(0x10)
++#define ACL_OTHER		(0x20)
++
++/* permissions in the e_perm field */
++#define ACL_READ		(0x04)
++#define ACL_WRITE		(0x02)
++#define ACL_EXECUTE		(0x01)
++//#define ACL_ADD		(0x08)
++//#define ACL_DELETE		(0x10)
++
++#endif  /* __LINUX_POSIX_ACL_H */
diff --git a/package/mtd/1.1.0/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch b/package/mtd/1.1.0/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch
new file mode 100644
index 0000000..b9a0a60
--- /dev/null
+++ b/package/mtd/1.1.0/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch
@@ -0,0 +1,23 @@
+flashcp: handle non-power-of-2 erase size (E.G. for dataflash)
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ flashcp.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: mtd-utils-1.1.0/flashcp.c
+===================================================================
+--- mtd-utils-1.1.0.orig/flashcp.c	2007-08-03 15:55:51.000000000 +0200
++++ mtd-utils-1.1.0/flashcp.c	2009-02-17 14:02:09.000000000 +0100
+@@ -255,8 +255,9 @@
+ #warning "Check for smaller erase regions"
+ 
+ 	erase.start = 0;
+-	erase.length = filestat.st_size & ~(mtd.erasesize - 1);
+-	if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;
++	erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
++	erase.length *= mtd.erasesize;
++
+ 	if (flags & FLAG_VERBOSE)
+ 	{
+ 		/* if the user wants verbose output, erase 1 block at a time and show him/her what's going on */
diff --git a/package/mtd/1.1.0/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch b/package/mtd/1.1.0/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch
new file mode 100644
index 0000000..1fe23c8
--- /dev/null
+++ b/package/mtd/1.1.0/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch
@@ -0,0 +1,23 @@
+mkfs.jffs2.c: fix device_table handling
+
+find_filesystem_entry would ignore device_table entries for existing elements
+if the device type / permissions weren't exactly the same, effectively
+rendering device_table useless.
+---
+ mkfs.jffs2.c |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+Index: mtd-utils-1.1.0/mkfs.jffs2.c
+===================================================================
+--- mtd-utils-1.1.0.orig/mkfs.jffs2.c
++++ mtd-utils-1.1.0/mkfs.jffs2.c
+@@ -246,8 +246,7 @@
+ 		e = dir->files;
+ 	}
+ 	while (e) {
+-		/* Only bother to do the expensive strcmp on matching file types */
+-		if (type == (e->sb.st_mode & S_IFMT)) {
++		if (1) {
+ 			if (S_ISDIR(e->sb.st_mode)) {
+ 				int len = strlen(e->fullname);
+ 
diff --git a/package/mtd/1.1.0/mtd-utils-1.1.0-all-targets.patch b/package/mtd/1.1.0/mtd-utils-1.1.0-all-targets.patch
new file mode 100644
index 0000000..e887118
--- /dev/null
+++ b/package/mtd/1.1.0/mtd-utils-1.1.0-all-targets.patch
@@ -0,0 +1,34 @@
+diff -urN mtd-utils-1.1.0-0rig/Makefile mtd-utils-1.1.0/Makefile
+--- mtd-utils-1.1.0-0rig/Makefile	2007-08-03 15:55:51.000000000 +0200
++++ mtd-utils-1.1.0/Makefile	2007-09-27 08:20:55.000000000 +0200
+@@ -72,6 +72,30 @@
+ $(BUILDDIR)/sumtool: $(BUILDDIR)/sumtool.o $(BUILDDIR)/crc32.o
+ 	$(CC) $(LDFLAGS) -o $@ $^
+ 
++ftl_format:	$(BUILDDIR)/ftl_format
++flash_erase:	$(BUILDDIR)/flash_erase
++flash_eraseall:	$(BUILDDIR)/flash_eraseall
++nanddump:	$(BUILDDIR)/nanddump
++doc_loadbios:	$(BUILDDIR)/doc_loadbios
++mkfs.jffs:	$(BUILDDIR)/mkfs.jffs
++ftl_check:	$(BUILDDIR)/ftl_check
++mkfs.jffs2:	$(BUILDDIR)/mkfs.jffs2
++flash_lock:	$(BUILDDIR)/flash_lock
++flash_unlock:	$(BUILDDIR)/flash_unlock
++flash_info:	$(BUILDDIR)/flash_info
++flash_otp_info:	$(BUILDDIR)/flash_otp_info
++flash_otp_dump:	$(BUILDDIR)/flash_otp_dump
++mtd_debug:	$(BUILDDIR)/mtd_debug
++flashcp:	$(BUILDDIR)/flashcp
++nandwrite:	$(BUILDDIR)/nandwrite
++jffs2dump:	$(BUILDDIR)/jffs2dump
++nftldump:	$(BUILDDIR)/nftldump
++nftl_format:	$(BUILDDIR)/nftl_format
++docfdisk:	$(BUILDDIR)/docfdisk
++rfddump:	$(BUILDDIR)/rfddump
++rfdformat:	$(BUILDDIR)/rfdformat
++sumtool:	$(BUILDDIR)/sumtool
++
+ install: ${TARGETS}
+ 	mkdir -p ${DESTDIR}/${SBINDIR}
+ 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
diff --git a/package/mtd/1.1.0/mtd.mk b/package/mtd/1.1.0/mtd.mk
new file mode 100644
index 0000000..e89e9ce
--- /dev/null
+++ b/package/mtd/1.1.0/mtd.mk
@@ -0,0 +1,128 @@
+#############################################################
+#
+# mtd provides jffs2 utilities
+#
+#############################################################
+MTD_VERSION:=1.1.0
+MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
+MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
+MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd_orig
+MTD_DIR:=$(BUILD_DIR)/mtd_orig
+MTD_CAT:=$(BZCAT)
+MTD_NAME:=mtd-utils-$(MTD_VERSION)
+
+#############################################################
+#
+# Build mkfs.jffs2 and sumtool for use on the local host system if
+# needed by target/jffs2root.
+#
+#############################################################
+MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
+SUMTOOL := $(MTD_HOST_DIR)/sumtool
+
+$(DL_DIR)/$(MTD_SOURCE):
+	$(call DOWNLOAD,$(MTD_SITE),$(MTD_SOURCE))
+
+$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	rm -rf $(MTD_HOST_DIR)
+	mv $(TOOL_BUILD_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+		package/mtd/1.1.0 mtd-utils-$(MTD_VERSION)-all\*.patch
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+		package/mtd/1.1.0 mtd-utils-$(MTD_VERSION)-host\*.patch
+	touch $@
+
+
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) LINUXDIR=$(LINUX_DIR) \
+		BUILDDIR=$(MTD_HOST_DIR) \
+		-C $(MTD_HOST_DIR) mkfs.jffs2
+
+$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) LINUXDIR=$(LINUX_DIR) \
+		BUILDDIR=$(MTD_HOST_DIR) \
+		-C $(MTD_HOST_DIR) sumtool
+
+mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+
+mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
+
+mtd-host-clean:
+	-$(MAKE) -C $(MTD_HOST_DIR) clean
+
+mtd-host-dirclean:
+	rm -rf $(MTD_HOST_DIR)
+
+#############################################################
+#
+# build mtd for use on the target system
+#
+#############################################################
+$(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	mv $(BUILD_DIR)/$(MTD_NAME) $(MTD_DIR)
+	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/1.1.0 mtd-utils-$(MTD_VERSION)-all\*.patch
+	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/1.1.0 mtd-utils-$(MTD_VERSION)-target\*.patch
+	touch $@
+
+MTD_TARGETS_n :=
+MTD_TARGETS_y :=
+
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL) += flash_eraseall
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO) += flash_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS) += mkfs.jffs
+MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
+#MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS3DUMP) += jffs3dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
+
+MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
+
+$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
+	mkdir -p $(TARGET_DIR)/usr/sbin
+	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		BUILDDIR=$(MTD_DIR) \
+		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
+
+MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
+
+$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
+	cp -f $< $@
+	$(STRIPCMD) $@
+
+mtd: zlib $(MTD_TARGETS)
+
+mtd-source: $(DL_DIR)/$(MTD_SOURCE)
+
+mtd-clean:
+	-$(MAKE) -C $(MTD_DIR) clean
+
+mtd-dirclean:
+	rm -rf $(MTD_DIR)
+
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_MTD),y)
+TARGETS+=mtd
+endif
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 2dd41be..2be02ee 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -6,29 +6,33 @@ menuconfig BR2_PACKAGE_MTD
 
 if BR2_PACKAGE_MTD
 choice
-	prompt "Source package selection"
-	default BR2_PACKAGE_MTD_UTILS
+	prompt "MTD-utils Version"
+	default BR2_PACKAGE_MTD_UTILS_1_1_0
 
-config BR2_PACKAGE_MTD_UTILS
-	bool "Use MTD-utils release"
-	select BR2_PACKAGE_LZO
+config BR2_PACKAGE_MTD_UTILS_20050122
+	bool "mtd-utils 20050122"
+	depends on BR2_DEPRECATED
 	help
-	  Build mtd/jffs utilities with Dataflash support
+	  MTD snapshot from 20050122.
 
-config BR2_PACKAGE_MTD_20061007
-	bool "Use MTD snapshot from 20061007"
-	depends on BR2_DEPRECATED || BR2_RECENT
+config BR2_PACKAGE_MTD_UTILS_20061007
+	bool "mtd-utils 20061007"
+	depends on BR2_DEPRECATED
 	help
-	  Build mtd/jffs utilities with Dataflash support
+	  MTD snapshot from 20061007.
 
-config BR2_PACKAGE_MTD_20050122
-	bool "Use MTD snapshot from 20050122"
-	depends on BR2_DEPRECATED
+	  Build mtd/jffs utilities with Dataflash support.
+
+config BR2_PACKAGE_MTD_UTILS_1_1_0
+	bool "mtd-utils 1.1.0"
+	select BR2_PACKAGE_LZO
 	help
-	  Use the stable release.
+	  MTD Utils release 1.1.0.
+
+	  Build mtd/jffs utilities with Dataflash support.
 
 config BR2_PACKAGE_MTD_UTILS_GIT
-	bool "Use MTD-utils from GIT"
+	bool "mtd-utils (almost) latest GIT"
 	help
 	  Use the latest from GIT or a particular revision.
 	  You should probably say NO except for specific purpose.
@@ -46,7 +50,7 @@ config BR2_PACKAGE_MTD_DOC_LOADBIOS
 config BR2_PACKAGE_MTD_ERASE
 	bool "erase"
 	default y
-	depends on BR2_PACKAGE_MTD_20050122
+	depends on BR2_PACKAGE_MTD_UTILS_20050122
 
 config BR2_PACKAGE_MTD_FLASHCP
 	bool "flashcp"
@@ -87,16 +91,16 @@ config BR2_PACKAGE_MTD_JFFS2DUMP
 config BR2_PACKAGE_MTD_JFFS3DUMP
 	bool "jffs3dump"
 	default y
-	depends on BR2_PACKAGE_MTD_20050122
+	depends on BR2_PACKAGE_MTD_UTILS_20050122
+
+config BR2_PACKAGE_MTD_MKFSJFFS
+	bool "mkfs.jffs"
+	depends on BR2_PACKAGE_MTD_UTILS_20050122 || BR2_PACKAGE_MTD_UTILS_20061007 || BR2_PACKAGE_MTD_UTILS_1_1_0
 
 config BR2_PACKAGE_MTD_MKFSJFFS2
 	bool "mkfs.jffs2"
 	default y
 
-config BR2_PACKAGE_MTD_MKFSJFFS
-	bool "mkfs.jffs"
-	depends on BR2_PACKAGE_MTD_20050122 || BR2_PACKAGE_MTD_20061007 || BR2_PACKAGE_MTD_UTILS
-
 config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
 	default y
diff --git a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch b/package/mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch
deleted file mode 100644
index 953786e..0000000
--- a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Author:	Ulf Samuelsson
-Date:	2007-01-25
-
-Log:
-Patch adding "sys/acl.h" needed to compile mtd.
-
-Modified:
-	package/mtd/mtd_acl.patch
-
-Changeset
-	package/mtd/mtd_acl.patch
-
-diff -urN mtd_orig-0rig/include/sys/acl.h mtd_orig/include/sys/acl.h
---- mtd_orig-0rig/include/sys/acl.h	1970-01-01 01:00:00.000000000 +0100
-+++ mtd_orig/include/sys/acl.h	2007-01-17 20:11:22.000000000 +0100
-@@ -0,0 +1,32 @@
-+/*
-+  File: linux/posix_acl.h
-+
-+  (C) 2002 Andreas Gruenbacher, <a.gruenbacher@computer.org>
-+*/
-+
-+
-+#ifndef __LINUX_POSIX_ACL_H
-+#define __LINUX_POSIX_ACL_H
-+
-+#define ACL_UNDEFINED_ID	(-1)
-+
-+/* a_type field in acl_user_posix_entry_t */
-+#define ACL_TYPE_ACCESS		(0x8000)
-+#define ACL_TYPE_DEFAULT	(0x4000)
-+
-+/* e_tag entry in struct posix_acl_entry */
-+#define ACL_USER_OBJ		(0x01)
-+#define ACL_USER		(0x02)
-+#define ACL_GROUP_OBJ		(0x04)
-+#define ACL_GROUP		(0x08)
-+#define ACL_MASK		(0x10)
-+#define ACL_OTHER		(0x20)
-+
-+/* permissions in the e_perm field */
-+#define ACL_READ		(0x04)
-+#define ACL_WRITE		(0x02)
-+#define ACL_EXECUTE		(0x01)
-+//#define ACL_ADD		(0x08)
-+//#define ACL_DELETE		(0x10)
-+
-+#endif  /* __LINUX_POSIX_ACL_H */
diff --git a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch b/package/mtd/mtd-utils/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch
deleted file mode 100644
index b9a0a60..0000000
--- a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-flashcp: handle non-power-of-2 erase size (E.G. for dataflash)
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- flashcp.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: mtd-utils-1.1.0/flashcp.c
-===================================================================
---- mtd-utils-1.1.0.orig/flashcp.c	2007-08-03 15:55:51.000000000 +0200
-+++ mtd-utils-1.1.0/flashcp.c	2009-02-17 14:02:09.000000000 +0100
-@@ -255,8 +255,9 @@
- #warning "Check for smaller erase regions"
- 
- 	erase.start = 0;
--	erase.length = filestat.st_size & ~(mtd.erasesize - 1);
--	if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;
-+	erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
-+	erase.length *= mtd.erasesize;
-+
- 	if (flags & FLAG_VERBOSE)
- 	{
- 		/* if the user wants verbose output, erase 1 block at a time and show him/her what's going on */
diff --git a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch b/package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch
deleted file mode 100644
index 1fe23c8..0000000
--- a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-mkfs.jffs2.c: fix device_table handling
-
-find_filesystem_entry would ignore device_table entries for existing elements
-if the device type / permissions weren't exactly the same, effectively
-rendering device_table useless.
----
- mkfs.jffs2.c |    3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-Index: mtd-utils-1.1.0/mkfs.jffs2.c
-===================================================================
---- mtd-utils-1.1.0.orig/mkfs.jffs2.c
-+++ mtd-utils-1.1.0/mkfs.jffs2.c
-@@ -246,8 +246,7 @@
- 		e = dir->files;
- 	}
- 	while (e) {
--		/* Only bother to do the expensive strcmp on matching file types */
--		if (type == (e->sb.st_mode & S_IFMT)) {
-+		if (1) {
- 			if (S_ISDIR(e->sb.st_mode)) {
- 				int len = strlen(e->fullname);
- 
diff --git a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-targets.patch b/package/mtd/mtd-utils/mtd-utils-1.1.0-all-targets.patch
deleted file mode 100644
index e887118..0000000
--- a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-targets.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-diff -urN mtd-utils-1.1.0-0rig/Makefile mtd-utils-1.1.0/Makefile
---- mtd-utils-1.1.0-0rig/Makefile	2007-08-03 15:55:51.000000000 +0200
-+++ mtd-utils-1.1.0/Makefile	2007-09-27 08:20:55.000000000 +0200
-@@ -72,6 +72,30 @@
- $(BUILDDIR)/sumtool: $(BUILDDIR)/sumtool.o $(BUILDDIR)/crc32.o
- 	$(CC) $(LDFLAGS) -o $@ $^
- 
-+ftl_format:	$(BUILDDIR)/ftl_format
-+flash_erase:	$(BUILDDIR)/flash_erase
-+flash_eraseall:	$(BUILDDIR)/flash_eraseall
-+nanddump:	$(BUILDDIR)/nanddump
-+doc_loadbios:	$(BUILDDIR)/doc_loadbios
-+mkfs.jffs:	$(BUILDDIR)/mkfs.jffs
-+ftl_check:	$(BUILDDIR)/ftl_check
-+mkfs.jffs2:	$(BUILDDIR)/mkfs.jffs2
-+flash_lock:	$(BUILDDIR)/flash_lock
-+flash_unlock:	$(BUILDDIR)/flash_unlock
-+flash_info:	$(BUILDDIR)/flash_info
-+flash_otp_info:	$(BUILDDIR)/flash_otp_info
-+flash_otp_dump:	$(BUILDDIR)/flash_otp_dump
-+mtd_debug:	$(BUILDDIR)/mtd_debug
-+flashcp:	$(BUILDDIR)/flashcp
-+nandwrite:	$(BUILDDIR)/nandwrite
-+jffs2dump:	$(BUILDDIR)/jffs2dump
-+nftldump:	$(BUILDDIR)/nftldump
-+nftl_format:	$(BUILDDIR)/nftl_format
-+docfdisk:	$(BUILDDIR)/docfdisk
-+rfddump:	$(BUILDDIR)/rfddump
-+rfdformat:	$(BUILDDIR)/rfdformat
-+sumtool:	$(BUILDDIR)/sumtool
-+
- install: ${TARGETS}
- 	mkdir -p ${DESTDIR}/${SBINDIR}
- 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
deleted file mode 100644
index f6b67da..0000000
--- a/package/mtd/mtd-utils/mtd.mk
+++ /dev/null
@@ -1,128 +0,0 @@
-#############################################################
-#
-# mtd provides jffs2 utilities
-#
-#############################################################
-MTD_VERSION:=1.1.0
-MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
-MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
-MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd_orig
-MTD_DIR:=$(BUILD_DIR)/mtd_orig
-MTD_CAT:=$(BZCAT)
-MTD_NAME:=mtd-utils-$(MTD_VERSION)
-
-#############################################################
-#
-# Build mkfs.jffs2 and sumtool for use on the local host system if
-# needed by target/jffs2root.
-#
-#############################################################
-MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
-SUMTOOL := $(MTD_HOST_DIR)/sumtool
-
-$(DL_DIR)/$(MTD_SOURCE):
-	$(call DOWNLOAD,$(MTD_SITE),$(MTD_SOURCE))
-
-$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	rm -rf $(MTD_HOST_DIR)
-	mv $(TOOL_BUILD_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-		package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-all\*.patch
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-		package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-host\*.patch
-	touch $@
-
-
-$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
-		$(MAKE) LINUXDIR=$(LINUX_DIR) \
-		BUILDDIR=$(MTD_HOST_DIR) \
-		-C $(MTD_HOST_DIR) mkfs.jffs2
-
-$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
-		$(MAKE) LINUXDIR=$(LINUX_DIR) \
-		BUILDDIR=$(MTD_HOST_DIR) \
-		-C $(MTD_HOST_DIR) sumtool
-
-mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
-
-mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
-
-mtd-host-clean:
-	-$(MAKE) -C $(MTD_HOST_DIR) clean
-
-mtd-host-dirclean:
-	rm -rf $(MTD_HOST_DIR)
-
-#############################################################
-#
-# build mtd for use on the target system
-#
-#############################################################
-$(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	mv $(BUILD_DIR)/$(MTD_NAME) $(MTD_DIR)
-	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-all\*.patch
-	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-target\*.patch
-	touch $@
-
-MTD_TARGETS_n :=
-MTD_TARGETS_y :=
-
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL) += flash_eraseall
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO) += flash_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS) += mkfs.jffs
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
-#MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS3DUMP) += jffs3dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
-
-MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
-
-$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		BUILDDIR=$(MTD_DIR) \
-		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
-
-MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
-
-$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
-	cp -f $< $@
-	$(STRIPCMD) $@
-
-mtd: zlib $(MTD_TARGETS)
-
-mtd-source: $(DL_DIR)/$(MTD_SOURCE)
-
-mtd-clean:
-	-$(MAKE) -C $(MTD_DIR) clean
-
-mtd-dirclean:
-	rm -rf $(MTD_DIR)
-
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MTD),y)
-TARGETS+=mtd
-endif
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index c7774fd..9d66698 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -1,10 +1,10 @@
-ifeq ($(BR2_PACKAGE_MTD_UTILS),y)
-include package/mtd/mtd-utils/mtd.mk
+ifeq ($(BR2_PACKAGE_MTD_UTILS_1_1_0),y)
+include package/mtd/1.1.0/mtd.mk
 endif
-ifeq ($(BR2_PACKAGE_MTD_20061007),y)
+ifeq ($(BR2_PACKAGE_MTD_UTILS_20061007),y)
 include package/mtd/20061007/mtd.mk
 endif
-ifeq ($(BR2_PACKAGE_MTD_20050122),y)
+ifeq ($(BR2_PACKAGE_MTD_UTILS_20050122),y)
 include package/mtd/20050122/mtd.mk
 endif
 ifeq ($(BR2_PACKAGE_MTD_UTILS_GIT),y)
-- 
1.6.0.6
