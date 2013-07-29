From: Paul B. Henson <henson@acm.org>
Date: Sun, 28 Jul 2013 19:11:50 -0700
Subject: [Buildroot] [PATCH] mtd: add option to build mkfs.ubifs for target
Message-ID: <20130729021746.EF4355C127@zaphod.pbhware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paul B. Henson <henson@acm.org>
---
 package/mtd/Config.in |    6 ++++++
 package/mtd/mtd.mk    |    7 +++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index ddc3737..2e13157 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -54,6 +54,12 @@ config BR2_PACKAGE_MTD_MKFSJFFS2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LZO
 
+config BR2_PACKAGE_MTD_MKFSUBIFS
+	bool "mkfs.ubifs"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+
 config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
 	default y
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 994a73a..55fa727 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -14,6 +14,10 @@ ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
 MTD_DEPENDENCIES = zlib lzo
 endif
 
+ifeq ($(BR2_PACKAGE_MTD_MKFSUBIFS),y)
+MTD_DEPENDENCIES += util-linux zlib lzo
+endif
+
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 MTD_DEPENDENCIES += busybox
 endif
@@ -71,7 +75,10 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL)	+= ubirmvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL)	+= ubirsvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
 
+MTD_TARGETS_UBIFS_$(BR2_PACKAGE_MTD_MKFSUBIFS)	+= mkfs.ubifs
+
 MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
+MTD_TARGETS_y += $(addprefix mkfs.ubifs/,$(MTD_TARGETS_UBIFS_y))
 
 # only call make if atleast a single tool is enabled
 ifneq ($(MTD_TARGETS_y),)
-- 
1.7.8.6
