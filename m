From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Nov 2018 19:52:37 +0100
Subject: [Buildroot] [PATCH 1/1] mtd: fix build on riscv
Message-ID: <20181120185237.31403-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Define _REENTRANT otherwise pthread detection will fail

Fixes:
 - http://autobuild.buildroot.org/results/b0e7978a997a2aae383161455b5d898b8c28e2e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtd/mtd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 13e501fc33..2d627ffa3d 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -11,6 +11,13 @@ MTD_LICENSE = GPL-2.0
 MTD_LICENSE_FILES = COPYING
 MTD_INSTALL_STAGING = YES
 
+# gcc on riscv doesn't define _REENTRANT when -pthread is passed while
+# it should. Compensate this deficiency here otherwise mtd configure
+# script doesn't find that thread support is enabled.
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS):$(BR2_riscv),y:y)
+MTD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
+endif
+
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
 MTD_DEPENDENCIES += zlib lzo host-pkgconf
 MTD_CONF_OPTS += --with-jffs
-- 
2.14.1
