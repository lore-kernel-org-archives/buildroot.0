From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Aug 2015 07:35:33 +0300
Subject: [Buildroot] [PATCH] mtd: drop unconditional non LFS build
Message-ID: <69313616e067d45fde821f7f7d6ee388f323319d.1439267733.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot removed non LFS support in the 2015.05 release. We now pass
-D_FILE_OFFSET_BITS=64 unconditionally, so the mtd WITHOUT_LARGEFILE make
variable has no effect.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mtd/mtd.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index edf6e083ed60..5f14f1677645 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -24,15 +24,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 MTD_DEPENDENCIES += busybox
 endif
 
-MTD_MAKE_OPTS = WITHOUT_LARGEFILE=1
-
 # If extended attributes are required, the acl package must
 # also be enabled which will also include the attr package.
 ifeq ($(BR2_PACKAGE_ACL),y)
 MTD_DEPENDENCIES += acl
-MTD_MAKE_OPTS += WITHOUT_XATTR=0
+MTD_MAKE_OPTS = WITHOUT_XATTR=0
 else
-MTD_MAKE_OPTS += WITHOUT_XATTR=1
+MTD_MAKE_OPTS = WITHOUT_XATTR=1
 endif
 
 HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
-- 
2.5.0
