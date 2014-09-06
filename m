From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  6 Sep 2014 23:59:01 +0200
Subject: [Buildroot] [PATCH] package/mtd: install libubi.a and libmtd.a to
	staging
Message-ID: <1410040741-14656-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile's install rule deploy mtd's binaries but also static libraries
(libubi.a libmtd.a).

Since mtd's binaries are manualy installed to target, static
libraries are left in the build directory.

Others tools linked with -lubi or -lmtd fail to build.

Unconditionally build these libraries even if no mdt tool are enabled
and manually install them to staging by setting MTD_INSTALL_STAGING_CMDS

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/mtd/mtd.mk | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 80928b6..a9154a5 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -10,6 +10,8 @@ MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPLv2
 MTD_LICENSE_FILES = COPYING
 
+MTD_INSTALL_STAGING = YES
+
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
 MTD_DEPENDENCIES = zlib lzo
 endif
@@ -36,6 +38,8 @@ endef
 MKFS_JFFS2 = $(HOST_DIR)/usr/sbin/mkfs.jffs2
 SUMTOOL = $(HOST_DIR)/usr/sbin/sumtool
 
+MTD_STAGING_y					+= lib/libmtd.a
+MTD_STAGING_y					+= ubi-utils/libubi.a
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)		+= flashcp
@@ -79,16 +83,17 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIBLOCK)	+= ubiblock
 MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs/mkfs.ubifs
 
-# only call make if atleast a single tool is enabled
-ifneq ($(MTD_TARGETS_y),)
-
 define MTD_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
 		BUILDDIR=$(@D) WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 -C $(@D) \
-		$(addprefix $(@D)/,$(MTD_TARGETS_y))
+		$(addprefix $(@D)/,$(MTD_TARGETS_y)) \
+		$(addprefix $(@D)/,$(MTD_STAGING_y))
 endef
 
-endif
+define MTD_INSTALL_STAGING_CMDS
+     $(INSTALL) -D -m 0755 $(@D)/lib/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
+     $(INSTALL) -D -m 0755 $(@D)/ubi-utils/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
+endef
 
 define MTD_INSTALL_TARGET_CMDS
  for f in $(MTD_TARGETS_y) ; do \
-- 
1.9.3
