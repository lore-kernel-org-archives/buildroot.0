From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 May 2010 23:11:57 +0200
Subject: [Buildroot] [git commit master] mtd-utils: buildsystem is broken
	with parallel make (regarding libubi)
Message-ID: <20100519211234.93B3C8F4EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f3122259e2cbbc0be0fc02820a146b4e4f48bef6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 package/mtd/mtd.mk |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8c7aaba..5b0065c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: avahi, busybox
+	Updated/fixed packages: avahi, busybox, mtd-utils
 
 2010.05-rc2, Released May 11th, 2010:
 
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 2c69c16..0c9ed42 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -14,12 +14,12 @@ HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
 
 define HOST_MTD_BUILD_CMDS
 	CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
-		CROSS= $(MAKE) BUILDDIR=$(@D) \
+		CROSS= $(MAKE1) BUILDDIR=$(@D) \
 		WITHOUT_XATTR=1 -C $(@D)
 endef
 
 define HOST_MTD_INSTALL_CMDS
-	$(MAKE) BUILDDIR=$(@D) DESTDIR=$(HOST_DIR) -C $(@D) install
+	$(MAKE1) BUILDDIR=$(@D) DESTDIR=$(HOST_DIR) -C $(@D) install
 endef
 
 MKFS_JFFS2=$(HOST_DIR)/usr/sbin/mkfs.jffs2
@@ -71,7 +71,7 @@ MTD_MAKE_COMMON_FLAGS = \
 
 ifneq ($(MTD_TARGETS_y),)
 define MTD_TARGETS_BUILD
-	$(MAKE) $(MTD_MAKE_COMMON_FLAGS) \
+	$(MAKE1) $(MTD_MAKE_COMMON_FLAGS) \
 		BUILDDIR=$(@D) \
 		-C $(@D) \
 		$(addprefix $(@D)/, $(MTD_TARGETS_y))
@@ -80,7 +80,7 @@ endif
 
 ifneq ($(MTD_TARGETS_UBI_y),)
 define MTD_TARGETS_UBI_BUILD
-	$(MAKE) $(MTD_MAKE_COMMON_FLAGS) \
+	$(MAKE1) $(MTD_MAKE_COMMON_FLAGS) \
 		BUILDDIR=$(@D)/ubi-utils/ \
 		-C $(@D)/ubi-utils \
 		$(addprefix $(@D)/ubi-utils/, $(MTD_TARGETS_UBI_y))
-- 
1.6.3.3
