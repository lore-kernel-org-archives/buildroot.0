From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Jul 2014 13:36:32 -0300
Subject: [Buildroot] [PATCHv2] e2fsprogs: bump to version 1.42.11
Message-ID: <1405096592-15847-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ..._CFLAGS-add-includes-when-cross-compiling.patch | 29 ------------------
 ...2fsck-fix-Makefile-dependency-for-quota.o.patch | 32 --------------------
 ...n-fix-external-libblkid-test-for-static-l.patch | 34 ----------------------
 package/e2fsprogs/e2fsprogs.mk                     |  4 +--
 4 files changed, 1 insertion(+), 98 deletions(-)
 delete mode 100644 package/e2fsprogs/e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch
 delete mode 100644 package/e2fsprogs/e2fsprogs-0003-e2fsck-fix-Makefile-dependency-for-quota.o.patch
 delete mode 100644 package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch

diff --git a/package/e2fsprogs/e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch b/package/e2fsprogs/e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch
deleted file mode 100644
index 2aa86aa..0000000
--- a/package/e2fsprogs/e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2d9bfcc82b986f9da203270fd4059041bb7f1983 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 3 Jun 2014 18:51:07 -0300
-Subject: [PATCH] e2fsprogs: Add INCLUDES to BUILD_CFLAGS when cross-compiling
-
-We need $INCLUDES in BUILD_CFLAGS otherwise cross-compilation is broken
-now that util/subst.c uses config.h (from commit 2873927d15).
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index 448a292..8bac870 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1382,7 +1382,7 @@ if test $cross_compiling = no; then
-    BUILD_CFLAGS="$CFLAGS $CPPFLAGS $INCLUDES -DHAVE_CONFIG_H"
-    BUILD_LDFLAGS="$LDFLAGS"
- else
--   BUILD_CFLAGS=
-+   BUILD_CFLAGS="$INCLUDES -DHAVE_CONFIG_H"
-    BUILD_LDFLAGS=
- fi
- AC_SUBST(BUILD_CFLAGS)
---
-1.8.5.5
-
diff --git a/package/e2fsprogs/e2fsprogs-0003-e2fsck-fix-Makefile-dependency-for-quota.o.patch b/package/e2fsprogs/e2fsprogs-0003-e2fsck-fix-Makefile-dependency-for-quota.o.patch
deleted file mode 100644
index 1e3f20d..0000000
--- a/package/e2fsprogs/e2fsprogs-0003-e2fsck-fix-Makefile-dependency-for-quota.o.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5c15bf5f978bae01f1ca3cbe6414ab1d355a6adf Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Thu, 22 May 2014 18:52:27 -0400
-Subject: [PATCH] e2fsck: fix Makefile dependency for quota.o
-
-Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- e2fsck/Makefile.in | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/e2fsck/Makefile.in b/e2fsck/Makefile.in
-index 4b10f6f..f773fea 100644
---- a/e2fsck/Makefile.in
-+++ b/e2fsck/Makefile.in
-@@ -552,3 +552,13 @@ logfile.o: $(srcdir)/logfile.c $(top_builddir)/lib/config.h \
-  $(top_srcdir)/lib/quota/dqblk_v2.h $(top_srcdir)/lib/quota/quotaio_tree.h \
-  $(top_srcdir)/lib/../e2fsck/dict.h
- prof_err.o: prof_err.c
-+quota.o: $(srcdir)/quota.c $(top_builddir)/lib/config.h \
-+ $(top_builddir)/lib/dirpaths.h $(srcdir)/e2fsck.h \
-+ $(top_srcdir)/lib/ext2fs/ext2_fs.h $(top_builddir)/lib/ext2fs/ext2_types.h \
-+ $(top_srcdir)/lib/ext2fs/ext2fs.h $(top_srcdir)/lib/ext2fs/ext3_extents.h \
-+ $(top_srcdir)/lib/et/com_err.h $(top_srcdir)/lib/ext2fs/ext2_io.h \
-+ $(top_builddir)/lib/ext2fs/ext2_err.h \
-+ $(top_srcdir)/lib/ext2fs/ext2_ext_attr.h $(top_srcdir)/lib/ext2fs/bitops.h \
-+ $(srcdir)/profile.h prof_err.h $(top_srcdir)/lib/quota/quotaio.h \
-+ $(top_srcdir)/lib/quota/dqblk_v2.h $(top_srcdir)/lib/quota/quotaio_tree.h \
-+ $(top_srcdir)/lib/../e2fsck/dict.h $(srcdir)/problem.h
--- 
-1.8.5.5
-
diff --git a/package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch b/package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch
deleted file mode 100644
index 65d6c4c..0000000
--- a/package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b52e76432fe23490b891884f3a66504101c2a5bd Mon Sep 17 00:00:00 2001
-Message-Id: <b52e76432fe23490b891884f3a66504101c2a5bd.1402480818.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 11 Jun 2014 12:56:15 +0300
-Subject: [PATCH] configure.in: fix external libblkid test for static link
-
-External libblkid needs -luuid when linking statically. Use pkg-config to
-determine it correctly. Adding --static doesn't hurt even for dynamic
-linking.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-Patch status: sent upstream: http://patchwork.ozlabs.org/patch/358584/
-
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index 448a2926776a..ec6068320878 100644
---- a/configure.in
-+++ b/configure.in
-@@ -551,7 +551,7 @@ then
- 		[LIBBLKID=`$PKG_CONFIG --libs blkid`;
- 		 STATIC_LIBBLKID=`$PKG_CONFIG --static --libs blkid`],
- 		[AC_MSG_ERROR([external blkid library not found])],
--		[$LIBBLKID])
-+		[`$PKG_CONFIG --static --libs blkid`])
- 	BLKID_CMT=#
- 	AC_MSG_RESULT([Disabling private blkid library])
- else
--- 
-2.0.0
-
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index fa0191f..fdd2e4e 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.42.10
+E2FSPROGS_VERSION = 1.42.11
 E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
 E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
-# For e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch
-E2FSPROGS_AUTORECONF = YES
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-libs
 
-- 
1.8.5.5
