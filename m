From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 11:21:39 +0100
Subject: [Buildroot] [git commit] Revert "mtd: fix build on riscv"
Message-ID: <20181124104553.A253B880BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2cad590dae2b05bd3a698b8a6835b98348c8a5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 9ea1179eb5eece404a17cf5d313b05f303ae18e2, which is
no longer needed now that the RISC-V gcc has been patched to define
_REENTRANT when -pthread is passed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mtd/mtd.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 2d627ffa3d..13e501fc33 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -11,13 +11,6 @@ MTD_LICENSE = GPL-2.0
 MTD_LICENSE_FILES = COPYING
 MTD_INSTALL_STAGING = YES
 
-# gcc on riscv doesn't define _REENTRANT when -pthread is passed while
-# it should. Compensate this deficiency here otherwise mtd configure
-# script doesn't find that thread support is enabled.
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS):$(BR2_riscv),y:y)
-MTD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
-endif
-
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
 MTD_DEPENDENCIES += zlib lzo host-pkgconf
 MTD_CONF_OPTS += --with-jffs
