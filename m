From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Nov 2011 23:48:09 +0100
Subject: [Buildroot] [git commit] mtd-utils: bump version, cleanup
Message-ID: <20111201085837.630898F75B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08d78545cc1bc1ead30016b41906736eacf7caf5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flash_eraseall / flash_info are no more, and simplify build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/Config.in |    8 --------
 package/mtd/mtd.mk    |   34 ++++++----------------------------
 2 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 692654c..7330dd5 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -20,14 +20,6 @@ config BR2_PACKAGE_MTD_FLASH_ERASE
 	bool "flash_erase"
 	default y
 
-config BR2_PACKAGE_MTD_FLASH_ERASEALL
-	bool "flash_eraseall"
-	default y
-
-config BR2_PACKAGE_MTD_FLASH_INFO
-	bool "flash_info"
-	default y
-
 config BR2_PACKAGE_MTD_FLASH_LOCK
 	bool "flash_lock"
 	default y
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 1b23e83..ea72ba8 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION = 1.4.6
+MTD_VERSION = 1.4.7
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
@@ -29,8 +29,6 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)		+= flashcp
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)	+= flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL)	+= flash_eraseall
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO)	+= flash_info
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)	+= flash_lock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
@@ -64,37 +62,17 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL)	+= ubirmvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL)	+= ubirsvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
 
-MTD_MAKE_COMMON_FLAGS = \
-	$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
-	WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1
-
-define MTD_TARGETS_BUILD
-	$(MAKE1) $(MTD_MAKE_COMMON_FLAGS) \
-		BUILDDIR=$(@D) \
-		-C $(@D) \
-		$(addprefix $(@D)/, lib/libmtd.a $(MTD_TARGETS_y))
-endef
-
-ifneq ($(MTD_TARGETS_UBI_y),)
-define MTD_TARGETS_UBI_BUILD
-	$(MAKE1) $(MTD_MAKE_COMMON_FLAGS) \
-		BUILDDIR=$(@D)/ubi-utils/ \
-		-C $(@D)/ubi-utils \
-		$(addprefix $(@D)/ubi-utils/, $(MTD_TARGETS_UBI_y))
-endef
-endif
+MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
 
 define MTD_BUILD_CMDS
- $(MTD_TARGETS_BUILD)
- $(MTD_TARGETS_UBI_BUILD)
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
+		BUILDDIR=$(@D) WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 -C $(@D) \
+		$(addprefix $(@D)/,$(MTD_TARGETS_y))
 endef
 
 define MTD_INSTALL_TARGET_CMDS
  for f in $(MTD_TARGETS_y) ; do \
-  install -D -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$$f ; \
- done ; \
- for f in $(MTD_TARGETS_UBI_y) ; do \
-  install -D -m 0755 $(@D)/ubi-utils/$$f $(TARGET_DIR)/usr/sbin/$$f ; \
+  install -D -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$${f##*/} ; \
  done
 endef
 
