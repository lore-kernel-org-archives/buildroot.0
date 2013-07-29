From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 20:47:48 +0200
Subject: [Buildroot] [git commit] mtd: add option to build mkfs.ubifs for
	target
Message-ID: <20130729184758.42F629AE88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b50e0fa113bf641a3764ae99b94bb7ba4e1e8f85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: implement simplifications suggested by Thomas De
Schampheleire, add missing 'depends' on required toolchain features.]

Signed-off-by: Paul B. Henson <henson@acm.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/Config.in |   12 ++++++++++++
 package/mtd/mtd.mk    |    5 +++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index ddc3737..d3da413 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -54,6 +54,18 @@ config BR2_PACKAGE_MTD_MKFSJFFS2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LZO
 
+config BR2_PACKAGE_MTD_MKFSUBIFS
+	bool "mkfs.ubifs"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+
+comment "mkfs.ubifs requires largefile and wchar support in toolchain"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+
 config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
 	default y
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 994a73a..6b2af0d 100644
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
@@ -72,6 +76,7 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL)	+= ubirsvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
 
 MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs/mkfs.ubifs
 
 # only call make if atleast a single tool is enabled
 ifneq ($(MTD_TARGETS_y),)
