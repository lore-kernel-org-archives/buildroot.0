From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Oct 2017 16:00:08 +0200
Subject: [Buildroot] [PATCH] sqlite: add security patches
Message-ID: <612f27420cbbca777de7bfcf3747769cebe1727b.1508680808.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2017-13685: The dump_callback function in SQLite 3.20.0 allows
remote attackers to cause a denial of service (EXC_BAD_ACCESS and
application crash) via a crafted file.

CVE-2017-15286: SQLite 3.20.1 has a NULL pointer dereference in
tableColumnList in shell.c
because it fails to consider certain cases where
`sqlite3_step(pStmt)==SQLITE_ROW` is false and a data structure is never
initialized.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sqlite/0001-CVE-2017-13685.patch | 54 ++++++++++++++++++++++++++++++++
 package/sqlite/0002-CVE-2017-15286.patch | 28 +++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 package/sqlite/0001-CVE-2017-13685.patch
 create mode 100644 package/sqlite/0002-CVE-2017-15286.patch

diff --git a/package/sqlite/0001-CVE-2017-13685.patch b/package/sqlite/0001-CVE-2017-13685.patch
new file mode 100644
index 000000000000..9fd88f27e2e6
--- /dev/null
+++ b/package/sqlite/0001-CVE-2017-13685.patch
@@ -0,0 +1,54 @@
+Fix CVE-2017-13685
+
+The dump_callback function in SQLite 3.20.0 allows remote attackers to cause a
+denial of service (EXC_BAD_ACCESS and application crash) via a crafted file.
+
+Patch taken from Debian:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=873762
+
+Upstream issue: https://sqlite.org/src/info/02f0f4c54f2819b3
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+Index: src/shell.c
+==================================================================
+--- src/shell.c
++++ src/shell.c
+@@ -2657,10 +2657,11 @@
+   int *aiType      /* Column types */
+ ){
+   int i;
+   ShellState *p = (ShellState*)pArg;
+ 
++  if( azArg==0 ) return 0;
+   switch( p->cMode ){
+     case MODE_Line: {
+       int w = 5;
+       if( azArg==0 ) break;
+       for(i=0; i<nArg; i++){
+@@ -3007,10 +3008,11 @@
+ */
+ static int captureOutputCallback(void *pArg, int nArg, char **azArg, char **az){
+   ShellText *p = (ShellText*)pArg;
+   int i;
+   UNUSED_PARAMETER(az);
++  if( azArg==0 ) return 0;
+   if( p->n ) appendText(p, "|", 0);
+   for(i=0; i<nArg; i++){
+     if( i ) appendText(p, ",", 0);
+     if( azArg[i] ) appendText(p, azArg[i], 0);
+   }
+@@ -3888,11 +3890,11 @@
+   const char *zType;
+   const char *zSql;
+   ShellState *p = (ShellState *)pArg;
+ 
+   UNUSED_PARAMETER(azNotUsed);
+-  if( nArg!=3 ) return 1;
++  if( nArg!=3 || azArg==0 ) return 0;
+   zTable = azArg[0];
+   zType = azArg[1];
+   zSql = azArg[2];
+ 
+   if( strcmp(zTable, "sqlite_sequence")==0 ){
+
diff --git a/package/sqlite/0002-CVE-2017-15286.patch b/package/sqlite/0002-CVE-2017-15286.patch
new file mode 100644
index 000000000000..681e9d06047d
--- /dev/null
+++ b/package/sqlite/0002-CVE-2017-15286.patch
@@ -0,0 +1,28 @@
+Fix CVE-2017-15286
+
+SQLite 3.20.1 has a NULL pointer dereference in tableColumnList in shell.c 
+because it fails to consider certain cases where 
+`sqlite3_step(pStmt)==SQLITE_ROW` is false and a data structure is never 
+initialized.
+
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=878680
+
+Upstream commit: http://www.sqlite.org/src/info/5d0ceb8dcdef92cd
+
+Index: src/shell.c
+==================================================================
+--- src/shell.c
++++ src/shell.c
+@@ -3807,10 +3807,11 @@
+         isIPK = 0;
+       }
+     }
+   }
+   sqlite3_finalize(pStmt);
++  if( azCol==0 ) return 0;
+   azCol[0] = 0;
+   azCol[nCol+1] = 0;
+ 
+   /* The decision of whether or not a rowid really needs to be preserved
+   ** is tricky.  We never need to preserve a rowid for a WITHOUT ROWID table
+
-- 
2.14.2
