From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 12:34:11 +0200
Subject: [Buildroot] [git commit] mtd: Add xattr support
Message-ID: <20150706103457.2B83880DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b09f8f01c7d295ef195b1c7699343972fd2649ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding extended attribute support for the mtd tools when the attr
package is selected. This is needed for SELinux support.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd.mk |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 3397ebc..535e580 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -24,6 +24,17 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 MTD_DEPENDENCIES += busybox
 endif
 
+MTD_MAKE_OPTS = WITHOUT_LARGEFILE=1
+
+# If extended attributes are required, the acl package must
+# also be enabled which will also include the attr package.
+ifeq ($(BR2_PACKAGE_ACL),y)
+MTD_DEPENDENCIES += acl
+MTD_MAKE_OPTS += WITHOUT_XATTR=0
+else
+MTD_MAKE_OPTS += WITHOUT_XATTR=1
+endif
+
 HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
 
 define HOST_MTD_BUILD_CMDS
@@ -84,7 +95,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs/mkfs.ubifs
 
 define MTD_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
-		BUILDDIR=$(@D) WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 -C $(@D) \
+		BUILDDIR=$(@D) $(MTD_MAKE_OPTS) -C $(@D) \
 		$(addprefix $(@D)/,$(MTD_TARGETS_y)) \
 		$(addprefix $(@D)/,$(MTD_STAGING_y))
 endef
