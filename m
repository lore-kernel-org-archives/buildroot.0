From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Feb 2010 15:14:43 +0100
Subject: [Buildroot] [git commit master] mtd: zlib/lzo is only needed for
	mkfs.jffs2
Message-ID: <20100203151850.21E8477761@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f85ed72c70925c7953c11fa0526bd77fb8698de2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/Config.in |    3 ++-
 package/mtd/mtd.mk    |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index af71252..01fe611 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_MTD
 	bool "mtd/jffs2 utilities"
-	select BR2_PACKAGE_ZLIB
 	help
 	  Build mtd/jffs utilities
 
@@ -57,6 +56,8 @@ config BR2_PACKAGE_MTD_JFFS2DUMP
 
 config BR2_PACKAGE_MTD_MKFSJFFS2
 	bool "mkfs.jffs2"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LZO
 	default y
 
 config BR2_PACKAGE_MTD_MTD_DEBUG
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index e4f5917..244fd8e 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -132,7 +132,7 @@ $(MTD_TARGET_BINS): $(MTD_BUILD_TARGETS)
 	mkdir -p $(TARGET_DIR)/usr/sbin
 	$(INSTALL) -m 0755 $^ $(TARGET_DIR)/usr/sbin
 
-mtd: zlib lzo $(MTD_TARGET_BINS)
+mtd: $(if $(BR2_PACKAGE_MTD_MKFSJFFS2),zlib lzo) $(MTD_TARGET_BINS)
 
 mtd-source: $(DL_DIR)/$(MTD_SOURCE)
 
-- 
1.6.3.3
