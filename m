From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 20 Feb 2008 17:18:11 +1100
Subject: [Buildroot] patch to allow selection of e2fsprogs tools to install
Message-ID: <20080220061811.GA8033@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Any objection to the following patch, which allows choice of which
e2fsprogs tools to install (a la package/mtd and others)?

I wish there were a better way to write the makefile other than a ton of
ifneq/endif lines. I suspect some sort of macro and $(call ..) could do
it.

I only omit tools at install time, not build time. This allows you to
build multiple projects with different tool selections if you wanted.
Plus, e2fsprogs does not support disabling most tools at build time.

Hamish

Index: package/e2fsprogs/e2fsprogs.mk
===================================================================
--- package/e2fsprogs/e2fsprogs.mk	(revision 3559)
+++ package/e2fsprogs/e2fsprogs.mk	(working copy)
@@ -75,12 +75,57 @@
 		${TARGET_DIR}/sbin/fsck.ext[23] \
 		${TARGET_DIR}/sbin/findfs \
 		${TARGET_DIR}/sbin/tune2fs
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_BADBLOCKS)),y)
+	rm -rf ${TARGET_DIR}/sbin/badblocks
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_BLKID)),y)
+	rm -rf ${TARGET_DIR}/sbin/blkid
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_CHATTR)),y)
+	rm -rf ${TARGET_DIR}/bin/chattr
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_DUMPE2FS)),y)
+	rm -rf ${TARGET_DIR}/sbin/dumpe2fs
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_E2LABEL)),y)
+	rm -rf ${TARGET_DIR}/sbin/e2label
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_E2FSCK)),y)
+	rm -rf ${TARGET_DIR}/sbin/e2fsck
+else
+	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext2
+	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext3
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_FILEFRAG)),y)
+	rm -rf ${TARGET_DIR}/sbin/filefrag
+endif
+ifeq ($(strip $(BR2_PACKAGE_E2FSPROGS_FINDFS)),y)
+	ln -sf e2label ${TARGET_DIR}/sbin/findfs
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_FSCK)),y)
+	rm -rf ${TARGET_DIR}/sbin/fsck
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_LOGSAVE)),y)
+	rm -rf ${TARGET_DIR}/sbin/logsave
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_LSATTR)),y)
+	rm -rf ${TARGET_DIR}/bin/lsattr
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_MKE2FS)),y)
+	rm -rf ${TARGET_DIR}/sbin/mke2fs
+else
 	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext2
 	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext3
-	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext2
-	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext3
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND)),y)
+	rm -rf ${TARGET_DIR}/sbin/mklost+found
+endif
+ifeq ($(strip $(BR2_PACKAGE_E2FSPROGS_TUNE2FS)),y)
 	ln -sf e2label ${TARGET_DIR}/sbin/tune2fs
-	ln -sf e2label ${TARGET_DIR}/sbin/findfs
+endif
+ifneq ($(strip $(BR2_PACKAGE_E2FSPROGS_UUIDGEN)),y)
+	rm -rf ${TARGET_DIR}/bin/uuidgen
+endif
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/info
 endif
Index: package/e2fsprogs/Config.in
===================================================================
--- package/e2fsprogs/Config.in	(revision 3559)
+++ package/e2fsprogs/Config.in	(working copy)
@@ -3,3 +3,81 @@
 	default n
 	help
 	  The EXT2 file system utilities and libraries
+
+config BR2_PACKAGE_E2FSPROGS_BADBLOCKS
+	bool "badblocks"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_BLKID
+	bool "blkid"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_CHATTR
+	bool "chattr"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_DUMPE2FS
+	bool "dumpe2fs"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_E2FSCK
+	bool "e2fsck"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_E2LABEL
+	bool "e2label"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_FILEFRAG
+	bool "filefrag"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_FINDFS
+	bool "findfs"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_E2LABEL
+
+config BR2_PACKAGE_E2FSPROGS_FSCK
+	bool "fsck"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_LOGSAVE
+	bool "logsave"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_LSATTR
+	bool "chattr"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_MKE2FS
+	bool "mke2fs"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND
+	bool "mklost+found"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_TUNE2FS
+	bool "tune2fs"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_E2LABEL
+
+config BR2_PACKAGE_E2FSPROGS_UUIDGEN
+	bool "uuidgen"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
