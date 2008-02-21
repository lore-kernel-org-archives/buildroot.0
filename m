From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 21 Feb 2008 12:38:27 +1100
Subject: [Buildroot] patch to allow selection of e2fsprogs tools
	to	install
In-Reply-To: <007d01c8738a$903f7ca0$f4031a0a@atmel.com>
References: <20080220061811.GA8033@cloud.net.au>
	<007d01c8738a$903f7ca0$f4031a0a@atmel.com>
Message-ID: <20080221013827.GA27859@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 20, 2008 at 07:28:55AM +0100, Ulf Samuelsson wrote:
> ----- Original Message ----- 
> From: "Hamish Moffatt" <hamish@cloud.net.au>
> > I wish there were a better way to write the makefile other than a ton of
> > ifneq/endif lines. I suspect some sort of macro and $(call ..) could do
> > it.
> 
> Something similar to:
> 
> EF2FS_RM-$(strip $(BR2_PACKAGE_E2FSPROGS_BADBLOCKS)) += ${TARGET_DIR}/sbin/badblocks
> 
> for all configs should create a list of files to remove and another list of files to keep.
> 
> The "rm -rf" all files in the list 

Thanks, that's much better. Here's my updated patch. Unless there are
any objections I'll commit it tomorrow.

Hamish


Index: package/e2fsprogs/e2fsprogs.mk
===================================================================
--- package/e2fsprogs/e2fsprogs.mk	(revision 3559)
+++ package/e2fsprogs/e2fsprogs.mk	(working copy)
@@ -68,6 +68,20 @@
 	#$(STRIPCMD) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
 	touch -c $@
 
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_BADBLOCKS)) += ${TARGET_DIR}/sbin/badblocks
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_BLKID)) += ${TARGET_DIR}/sbin/blkid
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_CHATTR)) += ${TARGET_DIR}/bin/chattr
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_DUMPE2FS)) += ${TARGET_DIR}/sbin/dumpe2fs
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_E2LABEL)) += ${TARGET_DIR}/sbin/e2label
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_E2FSCK)) += ${TARGET_DIR}/sbin/e2fsck
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_FILEFRAG)) += ${TARGET_DIR}/sbin/filefrag
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_FSCK)) += ${TARGET_DIR}/sbin/fsck
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_LOGSAVE)) += ${TARGET_DIR}/sbin/logsave
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_LSATTR)) += ${TARGET_DIR}/bin/lsattr
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_MKE2FS)) += ${TARGET_DIR}/sbin/mke2fs
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND)) += ${TARGET_DIR}/sbin/mklost+found
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_UUIDGEN)) += ${TARGET_DIR}/bin/uuidgen
+
 $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) LDCONFIG=true \
 		-C $(E2FSPROGS_DIR) install
@@ -75,12 +89,23 @@
 		${TARGET_DIR}/sbin/fsck.ext[23] \
 		${TARGET_DIR}/sbin/findfs \
 		${TARGET_DIR}/sbin/tune2fs
+ifneq ($(strip $(E2FSPROGS_RM)),)
+	rm -rf $(E2FSPROGS_RM)
+endif
+ifeq ($(strip $(BR2_PACKAGE_E2FSPROGS_MKE2FS)),y)
 	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext2
 	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext3
+endif
+ifeq ($(strip $(BR2_PACKAGE_E2FSPROGS_E2FSCK)),y)
 	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext2
 	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext3
+endif
+ifeq ($(strip $(BR2_PACKAGE_E2FSPROGS_TUNE2FS)),y)
 	ln -sf e2label ${TARGET_DIR}/sbin/tune2fs
+endif
+ifeq ($(strip $(BR2_PACKAGE_E2FSPROGS_FINDFS)),y)
 	ln -sf e2label ${TARGET_DIR}/sbin/findfs
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
