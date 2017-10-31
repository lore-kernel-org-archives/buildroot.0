From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Oct 2017 14:17:52 +0200
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.21.0
Message-ID: <76401edd0d91f5e33cd1b4dfc49bf577c4d61f8a.1509452272.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patches.

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sqlite/0001-CVE-2017-13685.patch | 54 --------------------------------
 package/sqlite/0002-CVE-2017-15286.patch | 28 -----------------
 package/sqlite/sqlite.hash               |  6 ++--
 package/sqlite/sqlite.mk                 |  2 +-
 4 files changed, 5 insertions(+), 85 deletions(-)
 delete mode 100644 package/sqlite/0001-CVE-2017-13685.patch
 delete mode 100644 package/sqlite/0002-CVE-2017-15286.patch

diff --git a/package/sqlite/0001-CVE-2017-13685.patch b/package/sqlite/0001-CVE-2017-13685.patch
deleted file mode 100644
index 9fd88f27e2e6..000000000000
--- a/package/sqlite/0001-CVE-2017-13685.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Fix CVE-2017-13685
-
-The dump_callback function in SQLite 3.20.0 allows remote attackers to cause a
-denial of service (EXC_BAD_ACCESS and application crash) via a crafted file.
-
-Patch taken from Debian:
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=873762
-
-Upstream issue: https://sqlite.org/src/info/02f0f4c54f2819b3
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
-Index: src/shell.c
-==================================================================
---- src/shell.c
-+++ src/shell.c
-@@ -2657,10 +2657,11 @@
-   int *aiType      /* Column types */
- ){
-   int i;
-   ShellState *p = (ShellState*)pArg;
- 
-+  if( azArg==0 ) return 0;
-   switch( p->cMode ){
-     case MODE_Line: {
-       int w = 5;
-       if( azArg==0 ) break;
-       for(i=0; i<nArg; i++){
-@@ -3007,10 +3008,11 @@
- */
- static int captureOutputCallback(void *pArg, int nArg, char **azArg, char **az){
-   ShellText *p = (ShellText*)pArg;
-   int i;
-   UNUSED_PARAMETER(az);
-+  if( azArg==0 ) return 0;
-   if( p->n ) appendText(p, "|", 0);
-   for(i=0; i<nArg; i++){
-     if( i ) appendText(p, ",", 0);
-     if( azArg[i] ) appendText(p, azArg[i], 0);
-   }
-@@ -3888,11 +3890,11 @@
-   const char *zType;
-   const char *zSql;
-   ShellState *p = (ShellState *)pArg;
- 
-   UNUSED_PARAMETER(azNotUsed);
--  if( nArg!=3 ) return 1;
-+  if( nArg!=3 || azArg==0 ) return 0;
-   zTable = azArg[0];
-   zType = azArg[1];
-   zSql = azArg[2];
- 
-   if( strcmp(zTable, "sqlite_sequence")==0 ){
-
diff --git a/package/sqlite/0002-CVE-2017-15286.patch b/package/sqlite/0002-CVE-2017-15286.patch
deleted file mode 100644
index 681e9d06047d..000000000000
--- a/package/sqlite/0002-CVE-2017-15286.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix CVE-2017-15286
-
-SQLite 3.20.1 has a NULL pointer dereference in tableColumnList in shell.c 
-because it fails to consider certain cases where 
-`sqlite3_step(pStmt)==SQLITE_ROW` is false and a data structure is never 
-initialized.
-
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=878680
-
-Upstream commit: http://www.sqlite.org/src/info/5d0ceb8dcdef92cd
-
-Index: src/shell.c
-==================================================================
---- src/shell.c
-+++ src/shell.c
-@@ -3807,10 +3807,11 @@
-         isIPK = 0;
-       }
-     }
-   }
-   sqlite3_finalize(pStmt);
-+  if( azCol==0 ) return 0;
-   azCol[0] = 0;
-   azCol[nCol+1] = 0;
- 
-   /* The decision of whether or not a rowid really needs to be preserved
-   ** is tricky.  We never need to preserve a rowid for a WITHOUT ROWID table
-
diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 22882c9530d4..be5820e1f800 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,6 @@
 # From http://www.sqlite.org/download.html
-sha1 48593dcd19473f25fe6fcd08048e13ddbff4c983  sqlite-autoconf-3200100.tar.gz
+sha1 f56fe3407d8297fc0a68a058f4c9e6b77e83575c  sqlite-autoconf-3210000.tar.gz
 # Calculated based on the hash above
-sha256 ec66595b29bc0798b023a5122021ea646ab4fa9e2f735937c5426feeba950742  sqlite-autoconf-3200100.tar.gz
+sha256 d7dd516775005ad87a57f428b6f86afd206cb341722927f104d3f0cf65fbbbe3  sqlite-autoconf-3210000.tar.gz
+# Locally calculated
+sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 39ea9ce3619e..5239592f1863 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3200100
+SQLITE_VERSION = 3210000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
-- 
2.14.2
