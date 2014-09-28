From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 21:45:38 +0200
Subject: [Buildroot] [git commit] package/mtd: install libubi.a and libmtd.a
	to staging
Message-ID: <20140928195515.15F779D535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=666d7e2efd7a36700b495ace1850e1a39102daa2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the mtd package only installs the mtd utilities into the
target directory. However, the mtd-utils also provide two
static libraries (libmtd.a and libubi.a) that can be used by other
packages or tools.

Therefore, this commit extends the mtd package by adding the
installation to the staging directory of those two libraries.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/mtd.mk |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 80928b6..1d92f81 100644
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
@@ -36,6 +38,7 @@ endef
 MKFS_JFFS2 = $(HOST_DIR)/usr/sbin/mkfs.jffs2
 SUMTOOL = $(HOST_DIR)/usr/sbin/sumtool
 
+MTD_STAGING_y = lib/libmtd.a ubi-utils/libubi.a
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)		+= flashcp
@@ -79,16 +82,17 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIBLOCK)	+= ubiblock
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
+	$(INSTALL) -D -m 0755 $(@D)/lib/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
+	$(INSTALL) -D -m 0755 $(@D)/ubi-utils/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
+endef
 
 define MTD_INSTALL_TARGET_CMDS
  for f in $(MTD_TARGETS_y) ; do \
