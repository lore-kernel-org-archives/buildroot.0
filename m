From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue,  2 Jun 2015 08:28:37 -0500
Subject: [Buildroot] [PATCH v7 21/22] mtd: Add xattr support
In-Reply-To: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1433251718-3167-22-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding extended attribute support for the mtd tools when theattr
package is selected. This is needed for SELinux support.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

---
Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes
---
 package/mtd/mtd.mk | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 3397ebc..653848c 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -24,7 +24,18 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 MTD_DEPENDENCIES += busybox
 endif
 
-HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
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
+HOST_MTD_DEPENDENCIES += host-zlib host-lzo host-e2fsprogs
 
 define HOST_MTD_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE1) \
@@ -84,7 +95,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs/mkfs.ubifs
 
 define MTD_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
-		BUILDDIR=$(@D) WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 -C $(@D) \
+		BUILDDIR=$(@D) $(MTD_MAKE_OPTS) -C $(@D) \
 		$(addprefix $(@D)/,$(MTD_TARGETS_y)) \
 		$(addprefix $(@D)/,$(MTD_STAGING_y))
 endef
-- 
1.9.1
