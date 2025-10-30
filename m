Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88826CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6100741165;
	Thu, 30 Oct 2025 08:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8g7-UTpwTC7; Thu, 30 Oct 2025 08:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C291241185
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C291241185;
	Thu, 30 Oct 2025 08:23:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B3CD160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DED09613B7
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrH5yjJKBtru for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78E4461382
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78E4461382
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 774C4879C2; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:18:23 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 40bce3fba3fe25372e11e151f84df84764aea36c
X-Git-Newrev: c5335ec098d336cf58344e271ee07f7b7175892d
X-Patchwork-Hint: ignore
Message-Id: <20251030082229.774C4879C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/sqlite: bump
 version to 3.50.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c5335ec098d336cf58344e271ee07f7b7175892d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This commit includes reverts of the last attempt to bump sqlite:
git revert --no-edit c4c282f8ec 014174f00d 835b5659ea db481210e9 296744b0f4 939244b828 f0a272ef14 274c36578f

and the following new changes:

The autoconf-based configure script until version 3.48.0 enabled rtree
support by default:
https://github.com/sqlite/sqlite/blob/version-3.48.0/autoconf/configure.ac#L180

while the autosetup-based needs -DSQLITE_ENABLE_RTREE
https://github.com/sqlite/sqlite/blob/version-3.50.4/autosetup/sqlite-config.tcl#L763

Added Config.in option for RTREE support and enabled it for gdal to
provide a needed dependency:
https://github.com/OSGeo/gdal/blob/v3.11.4/cmake/helpers/CheckDependentLibraries.cmake#L277

Added upstream patch to fix forced addition of rpath and added
configure option --disable-rpath to target build.

Added configure option --soname=legacy to fix wrong library name which
breaks linking of kodi:
https://github.com/LibreELEC/LibreELEC.tv/commit/7f2281bd7cc59425e754ac9d720071688f75580f

Added configure option --disable-shared for static builds.

Added build fixes for BR2_m68k_cf.

Removed SQLITE_CONF_OPTS and readline support from host build to avoid
dependencies.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2cc346e763341f3abf88096701b3deb0889c43bb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gdal/Config.in                             |   1 +
 package/sqlite/0001-disable-rpath.patch            |  59 ++++++++++
 ...in-revert-upstream-commits-causing-build-.patch |  48 --------
 ...ast-to-avoid-32-bit-integer-overflow-in-t.patch |  36 ------
 ...3-Raise-error-if-too-many-aggregate-terms.patch | 123 ---------------------
 package/sqlite/Config.in                           |   6 +
 package/sqlite/sqlite.hash                         |   2 +-
 package/sqlite/sqlite.mk                           | 104 ++++++++++++-----
 8 files changed, 142 insertions(+), 237 deletions(-)

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index 6ee088ce0c..c1bbf58fc7 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_GDAL
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_QHULL
+	select BR2_PACKAGE_SQLITE_ENABLE_RTREE if BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
 	help
 	  GDAL is a translator library for raster and vector geospatial
diff --git a/package/sqlite/0001-disable-rpath.patch b/package/sqlite/0001-disable-rpath.patch
new file mode 100644
index 0000000000..6eb20488b0
--- /dev/null
+++ b/package/sqlite/0001-disable-rpath.patch
@@ -0,0 +1,59 @@
+Add the --disable-rpath configure script flag to address
+
+Upstream: https://sqlite.org/src/info/a59d9bb25e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: autosetup/sqlite-config.tcl
+==================================================================
+--- a/autosetup/sqlite-config.tcl
++++ b/autosetup/sqlite-config.tcl
+@@ -334,12 +334,12 @@
+         # canonical build!
+         static-shell=1
+           => {Link the sqlite3 shell app against the DLL instead of embedding sqlite3.c}
+       }
+       {canonical autoconf} {
+-        # A potential TODO without a current use case:
+-        #rpath=1 => {Disable use of the rpath linker flag}
++        rpath=1 => {Disable use of the rpath linker flag}
++
+         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
+         soname:=legacy
+           => {SONAME for libsqlite3.so. "none", or not using this flag, sets no
+               soname. "legacy" sets it to its historical value of
+               libsqlite3.so.0.  A value matching the glob "libsqlite3.*" sets
+@@ -2138,25 +2138,25 @@
+ }
+ 
+ ########################################################################
+ # Handle the --enable/disable-rpath flag.
+ proc sqlite-handle-rpath {} {
+-  proj-check-rpath
+   # autosetup/cc-shared.tcl sets the rpath flag definition in
+   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
+   # rather than as a compiler check. Though we should do a proper
+   # compiler check (as proj-check-rpath does), we may want to consider
+   # adopting its approach of clearing the rpath flags for environments
+   # for which sqlite-env-is-unix-on-windows returns a non-empty
+   # string.
+ 
+-#  if {[proj-opt-truthy rpath]} {
+-#    proj-check-rpath
+-#  } else {
+-#    msg-result "Disabling use of rpath."
+-#    define LDFLAGS_RPATH ""
+-#  }
++  # https://sqlite.org/forum/forumpost/13cac3b56516f849
++  if {[proj-opt-truthy rpath]} {
++    proj-check-rpath
++  } else {
++    msg-result "Disabling use of rpath."
++    define LDFLAGS_RPATH ""
++  }
+ }
+ 
+ ########################################################################
+ # If the --dump-defines configure flag is provided then emit a list of
+ # all [define] values to config.defines.txt, else do nothing.
+
diff --git a/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch b/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch
deleted file mode 100644
index f35c8b8ddd..0000000000
--- a/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From f70123a40193c2056755117aa291582f42db5f35 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 13 Apr 2025 17:47:53 +0200
-Subject: [PATCH] sqlite3.pc.in: revert upstream commits causing build issues
-
-This reverts upstream commit a2d88f6a03c9ebde3d037b0e297f47216c685381
-and a number of following commits related to the same commit. The
-sqlite build system is indeed upstream not based on autoconf, but the
-project "generates" an "autoconf-based amalgamation":
-
-  https://www3.sqlite.org/src/dir?ci=tip&name=autoconf
-
-Unfortunately commit a2d88f6a03c9ebde3d037b0e297f47216c685381 broke
-the build with the autoconf amalgamation because while @LIBS@ gets
-replaced by the autoconf machinery, @LDFLAGS_*@ do not, causing build
-failures such as:
-
-output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_MATH@: No such file or directory
-output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_ZLIB@: No such file or directory
-output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_ICU@: No such file or directory
-
-This issue has been reported at
-https://sqlite.org/forum/info/e40b9b424a, and upstream says that the
-issue has been fixed in the amalgamation script by basically doing the
-same as what this commit does:
-
-  https://sqlite.org/src/info/fe47154799bfe
-
-Upstream: https://sqlite.org/forum/info/e40b9b424a
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- sqlite3.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sqlite3.pc.in b/sqlite3.pc.in
-index a9f941b1e4..3799671e61 100644
---- a/sqlite3.pc.in
-+++ b/sqlite3.pc.in
-@@ -9,5 +9,5 @@ Name: SQLite
- Description: SQL database engine
- Version: @PACKAGE_VERSION@
- Libs: -L${libdir} -lsqlite3
--Libs.private: @LDFLAGS_MATH@ @LDFLAGS_ZLIB@ @LDFLAGS_ICU@
-+Libs.private: @LIBS@
- Cflags: -I${includedir}
--- 
-2.49.0
-
diff --git a/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch b/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
deleted file mode 100644
index cb8b39b1be..0000000000
--- a/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1cbb088f4be95e7a02627f64de60653ef2b13ab5 Mon Sep 17 00:00:00 2001
-From: drh <>
-Date: Sun, 16 Feb 2025 10:57:25 +0000
-Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
- concat_ws() function with an enormous separator values and many arguments.
-
-Fixes the following CVE:
-  - CVE-2025-29087: In SQLite 3.44.0 through 3.49.0 before 3.49.1,
-                    the concat_ws() SQL function can cause memory to be
-                    written beyond the end of a malloc-allocated buffer.
-
-For more info see https://nvd.nist.gov/vuln/detail/CVE-2025-29087
-
-Upstream: https://sqlite.org/src/info/498e3f1cf57f164f
-
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- sqlite3.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sqlite3.c b/sqlite3.c
-index 80433f6..8a43734 100644
---- a/sqlite3.c
-+++ b/sqlite3.c
-@@ -130954,7 +130954,7 @@ static void concatFuncCore(
-   for(i=0; i<argc; i++){
-     n += sqlite3_value_bytes(argv[i]);
-   }
--  n += (argc-1)*nSep;
-+  n += (argc-1)*(i64)nSep;
-   z = sqlite3_malloc64(n+1);
-   if( z==0 ){
-     sqlite3_result_error_nomem(context);
--- 
-2.49.0
-
diff --git a/package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch b/package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch
deleted file mode 100644
index 43be545b83..0000000000
--- a/package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 1cbb088f4be95e7a02627f64de60653ef2b13ab5 Mon Sep 17 00:00:00 2001
-From: drh <>
-Date: Sun, 16 Feb 2025 10:57:25 +0000
-Subject: [PATCH] Raise an error right away if the number of aggregate terms in a query exceeds the maximum number of columns. 
-
-CVE: CVE-2025-6965
-
-For more info see https://nvd.nist.gov/vuln/detail/CVE-2025-6965
-
-Upstream: https://www.sqlite.org/src/vinfo/5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c2b487b5c8
-
-[Titouan: adapt to sqlite3 "amalgamation" source code]
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- sqlite3.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sqlite3.c b/sqlite3.c
-index 80433f6..8a43734 100644
---- a/sqlite3.c	2025-09-03 13:04:29.799853238 +0200
-+++ b/sqlite3.c	2025-09-03 13:47:54.274155427 +0200
-@@ -20,7 +20,7 @@
- ** The content in this amalgamation comes from Fossil check-in
- ** d2fe6b05f38d9d7cd78c5d252e99ac59f1ae with changes in files:
- **
--**    
-+**
- */
- #ifndef SQLITE_AMALGAMATION
- #define SQLITE_CORE 1
-@@ -15258,6 +15258,14 @@
- #define SMALLEST_INT64 (((i64)-1) - LARGEST_INT64)
- 
- /*
-+** Macro SMXV(n) return the maximum value that can be held in variable n,
-+** assuming n is a signed integer type.  UMXV(n) is similar for unsigned
-+** integer types.
-+*/
-+#define SMXV(n) ((((i64)1)<<(sizeof(n)*8-1))-1)
-+#define UMXV(n) ((((i64)1)<<(sizeof(n)*8))-1)
-+
-+/*
- ** Round up a number to the next larger multiple of 8.  This is used
- ** to force 8-byte alignment on 64-bit architectures.
- **
-@@ -19046,7 +19054,7 @@
-                           ** from source tables rather than from accumulators */
-   u8 useSortingIdx;       /* In direct mode, reference the sorting index rather
-                           ** than the source table */
--  u16 nSortingColumn;     /* Number of columns in the sorting index */
-+  u32 nSortingColumn;     /* Number of columns in the sorting index */
-   int sortingIdx;         /* Cursor number of the sorting index */
-   int sortingIdxPTab;     /* Cursor number of pseudo-table */
-   int iFirstReg;          /* First register in range for aCol[] and aFunc[] */
-@@ -19055,8 +19063,8 @@
-     Table *pTab;             /* Source table */
-     Expr *pCExpr;            /* The original expression */
-     int iTable;              /* Cursor number of the source table */
--    i16 iColumn;             /* Column number within the source table */
--    i16 iSorterColumn;       /* Column number in the sorting index */
-+    int iColumn;             /* Column number within the source table */
-+    int iSorterColumn;       /* Column number in the sorting index */
-   } *aCol;
-   int nColumn;            /* Number of used entries in aCol[] */
-   int nAccumulator;       /* Number of columns that show through to the output.
-@@ -116445,7 +116453,9 @@
- ){
-   struct AggInfo_col *pCol;
-   int k;
-+  int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
- 
-+  assert( mxTerm <= SMXV(i16) );
-   assert( pAggInfo->iFirstReg==0 );
-   pCol = pAggInfo->aCol;
-   for(k=0; k<pAggInfo->nColumn; k++, pCol++){
-@@ -116463,6 +116473,10 @@
-     assert( pParse->db->mallocFailed );
-     return;
-   }
-+  if( k>mxTerm ){
-+    sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
-+    k = mxTerm;
-+  }
-   pCol = &pAggInfo->aCol[k];
-   assert( ExprUseYTab(pExpr) );
-   pCol->pTab = pExpr->y.pTab;
-@@ -116496,6 +116510,7 @@
-   if( pExpr->op==TK_COLUMN ){
-     pExpr->op = TK_AGG_COLUMN;
-   }
-+  assert( k <= SMXV(pExpr->iAgg) );
-   pExpr->iAgg = (i16)k;
- }
- 
-@@ -116580,13 +116595,19 @@
-         ** function that is already in the pAggInfo structure
-         */
-         struct AggInfo_func *pItem = pAggInfo->aFunc;
-+        int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
-+        assert( mxTerm <= SMXV(i16) );
-         for(i=0; i<pAggInfo->nFunc; i++, pItem++){
-           if( NEVER(pItem->pFExpr==pExpr) ) break;
-           if( sqlite3ExprCompare(0, pItem->pFExpr, pExpr, -1)==0 ){
-             break;
-           }
-         }
--        if( i>=pAggInfo->nFunc ){
-+        if( i>mxTerm ){
-+          sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
-+          i = mxTerm;
-+          assert( i<pAggInfo->nFunc );
-+        }else if( i>=pAggInfo->nFunc ){
-           /* pExpr is original.  Make a new entry in pAggInfo->aFunc[]
-           */
-           u8 enc = ENC(pParse->db);
-@@ -116640,6 +116661,7 @@
-         */
-         assert( !ExprHasProperty(pExpr, EP_TokenOnly|EP_Reduced) );
-         ExprSetVVAProperty(pExpr, EP_NoReduce);
-+        assert( i <= SMXV(pExpr->iAgg) );
-         pExpr->iAgg = (i16)i;
-         pExpr->pAggInfo = pAggInfo;
-         return WRC_Prune;
diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 12fb8b9415..c649267040 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -30,6 +30,12 @@ config BR2_PACKAGE_SQLITE_ENABLE_FTS3
 	  http://www.sqlite.org/amalgamation.html), version 3 of the
 	  full-text search engine is added to the build automatically.
 
+config BR2_PACKAGE_SQLITE_ENABLE_RTREE
+	bool "Enable the RTREE extension for SQLite"
+	help
+	  When this option is defined in the amalgamation, the RTREE
+	  extension is added to the build automatically.
+
 config BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
 	bool "Enable sqlite3_unlock_notify() interface"
 	help
diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 5b933fba8f..2ade5afe03 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5  sqlite-autoconf-3480000.tar.gz
+sha256  a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18  sqlite-autoconf-3500400.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 29ebb0365d..667ee8d70e 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.48.0
-SQLITE_TAR_VERSION = 3480000
+SQLITE_VERSION = 3.50.4
+SQLITE_TAR_VERSION = 3500400
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
@@ -13,11 +13,6 @@ SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
 SQLITE_INSTALL_STAGING = YES
 
-# 0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
-SQLITE_IGNORE_CVES = CVE-2025-29087 CVE-2025-3277
-# 0003-Raise-error-if-too-many-aggregate-terms.patch
-SQLITE_IGNORE_CVES += CVE-2025-6965
-
 ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
 endif
@@ -26,8 +21,8 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
 endif
 
-ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
-SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_RTREE),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_RTREE
 endif
 
 ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
@@ -46,35 +41,86 @@ endif
 # Work around using -O0
 ifeq ($(BR2_microblaze):$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y:)
 SQLITE_CFLAGS += $(TARGET_CFLAGS) -O0
+else ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
+SQLITE_CFLAGS += $(TARGET_CFLAGS) -O0
 else
 # fallback to standard -O3 when -Ofast is present to avoid -ffast-math
 SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
 endif
 
-SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
-
-ifeq ($(BR2_STATIC_LIBS),y)
-SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
+ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
+SQLITE_DEPENDENCIES += ncurses readline
+SQLITE_CFLAGS  += -DHAVE_READLINE=1
+SQLITE_LDFLAGS += -lreadline -lncurses
+else ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_LIBEDIT),yy)
+SQLITE_DEPENDENCIES += ncurses libedit
+SQLITE_CFLAGS  += -DHAVE_EDITLINE=1
+SQLITE_LDFLAGS += -ledit -lncurses
 else
-SQLITE_CONF_OPTS += --disable-static-shell
+SQLITE_CONF_OPTS += --disable-readline
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-SQLITE_CONF_OPTS += --enable-threadsafe
-else
-SQLITE_CONF_OPTS += --disable-threadsafe
-SQLITE_CFLAGS += -DSQLITE_THREADSAFE=0
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
+SQLITE_CONF_OPTS += --fts3
 endif
 
-ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
-SQLITE_DEPENDENCIES += ncurses readline
-SQLITE_CONF_OPTS += --disable-editline --enable-readline
-else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
-SQLITE_DEPENDENCIES += libedit
-SQLITE_CONF_OPTS += --enable-editline --disable-readline
-else
-SQLITE_CONF_OPTS += --disable-editline --disable-readline
+ifeq ($(BR2_STATIC_LIBS),y)
+SQLITE_CONF_OPTS += --disable-shared
 endif
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)" LDFLAGS="$(SQLITE_LDFLAGS)"
+
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101971
+define SQLITE_FIX_MAKEFILE
+	chmod +w $(@D)/Makefile
+	sed -i "s/-fPIC//" $(@D)/Makefile
+endef
+
+define SQLITE_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
+		$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
+		$(SQLITE_CONF_ENV) ./configure \
+		--prefix=/usr \
+		--host="$(GNU_TARGET_NAME)" \
+		--build="$(GNU_HOST_NAME)" \
+		--sysroot="$(STAGING_DIR)" \
+		--disable-rpath \
+		--soname=legacy \
+		$(SQLITE_CONF_OPTS) \
+	)
+	$(if $(BR2_m68k_cf),$(SQLITE_FIX_MAKEFILE))
+endef
+
+define SQLITE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define SQLITE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
+endef
+
+define SQLITE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+define HOST_SQLITE_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) \
+		./configure \
+		--prefix=/usr \
+		--host="$(GNU_HOST_NAME)" \
+		--build="$(GNU_HOST_NAME)" \
+		--sysroot="$(HOST_DIR)" \
+		--disable-readline \
+	)
+endef
+
+define HOST_SQLITE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_SQLITE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) DESTDIR="$(HOST_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
