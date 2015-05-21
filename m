From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 12:06:11 +0200
Subject: [Buildroot] [git commit] package/sqlite: fix parallel build failures
Message-ID: <20150521100712.5F93D81DA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7541b28aa7a91c682c50cfa82d33cbb450afc53c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/aed/aed3690689b60844e3278626da3c3eb75f2a2586/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/0001-fix-parallel-build.patch |   22 ++++++++++++++++++++++
 package/sqlite/sqlite.mk                     |    3 +++
 2 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/0001-fix-parallel-build.patch b/package/sqlite/0001-fix-parallel-build.patch
new file mode 100644
index 0000000..79d80fb
--- /dev/null
+++ b/package/sqlite/0001-fix-parallel-build.patch
@@ -0,0 +1,22 @@
+Use correct dependency in Makefile.am
+
+Depending on a libtool library should be done using the .la name, not on
+the object file.
+
+Fixes hard-to-reproduce parallel build failures, like so:
+    http://autobuild.buildroot.org/results/aed/aed3690689b60844e3278626da3c3eb75f2a2586/build-end.log
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN sqlite-3081000.orig/Makefile.am sqlite-3081000/Makefile.am
+--- sqlite-3081000.orig/Makefile.am	2015-05-07 16:59:22.000000000 +0200
++++ sqlite-3081000/Makefile.am	2015-05-20 23:30:03.878784079 +0200
+@@ -7,7 +7,7 @@
+ 
+ bin_PROGRAMS = sqlite3
+ sqlite3_SOURCES = shell.c sqlite3.h
+-sqlite3_LDADD = sqlite3.$(OBJEXT) @READLINE_LIBS@
++sqlite3_LDADD = libsqlite3.la @READLINE_LIBS@
+ 
+ include_HEADERS = sqlite3.h sqlite3ext.h
+ 
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index fff219a..b2283f0 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -10,6 +10,9 @@ SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
 SQLITE_INSTALL_STAGING = YES
 
+# Patching Makefile.am:
+SQLITE_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
 endif
