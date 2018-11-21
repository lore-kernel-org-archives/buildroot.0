From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 20:58:51 +0100
Subject: [Buildroot] [git commit] mtd: fix build on riscv
Message-ID: <20181121195554.3CB6C83FC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ea1179eb5eece404a17cf5d313b05f303ae18e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Define _REENTRANT otherwise pthread detection will fail

Fixes:
 - http://autobuild.buildroot.org/results/b0e7978a997a2aae383161455b5d898b8c28e2e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
