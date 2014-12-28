From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 22:08:56 +0100
Subject: [Buildroot] [git commit] links: bump to version 2.8
Message-ID: <20141228211000.8D6D57FF87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d856c328243930aa7c83aa79942f5978cd41be8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/links/0001-no-largefile.patch        |   26 ++++++++++++++++++++++++++
 package/links/links-0001-no-largefile.patch  |   22 ----------------------
 package/links/links-0002-CVE-2013-6050.patch |   17 -----------------
 package/links/links.hash                     |    2 ++
 package/links/links.mk                       |    2 +-
 5 files changed, 29 insertions(+), 40 deletions(-)

diff --git a/package/links/0001-no-largefile.patch b/package/links/0001-no-largefile.patch
new file mode 100644
index 0000000..782a25a
--- /dev/null
+++ b/package/links/0001-no-largefile.patch
@@ -0,0 +1,26 @@
+Make links buildable without LFS support.
+Author/status: unknown.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura links-2.8/com-defs.h links-2.8.nonlfs/com-defs.h
+--- links-2.8/com-defs.h	2013-07-31 20:45:30.000000000 -0300
++++ links-2.8.nonlfs/com-defs.h	2014-12-28 08:42:47.352237462 -0300
+@@ -5,6 +5,9 @@
+ #define __EXTENSIONS__
+ #endif
+ 
++#include <features.h>
++/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
+ #ifndef _LARGEFILE_SOURCE
+ #define _LARGEFILE_SOURCE	1
+ #endif
+@@ -20,6 +23,7 @@
+ #ifndef _FILE_OFFSET_BITS
+ #define _FILE_OFFSET_BITS	64
+ #endif
++#endif /* UCLIBC !LFS */
+ 
+ #if defined(vax) && !defined(__vax)
+ #define __vax	vax
diff --git a/package/links/links-0001-no-largefile.patch b/package/links/links-0001-no-largefile.patch
deleted file mode 100644
index f3143cb..0000000
--- a/package/links/links-0001-no-largefile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: links-1.01pre1-no-ssl/links.h
-===================================================================
---- links-1.01pre1-no-ssl.orig/links.h	2010-06-21 00:39:10.000000000 +0200
-+++ links-1.01pre1-no-ssl/links.h	2010-06-21 00:39:52.000000000 +0200
-@@ -2,6 +2,9 @@
- #define __EXTENSIONS__
- #endif
- 
-+#include <features.h>
-+/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
-+#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
- #ifndef _LARGEFILE_SOURCE
- #define _LARGEFILE_SOURCE	1
- #endif
-@@ -9,6 +12,7 @@
- #ifndef _FILE_OFFSET_BITS
- #define _FILE_OFFSET_BITS	64
- #endif
-+#endif
- 
- #ifdef HAVE_CONFIG_H
- #include "config.h"
diff --git a/package/links/links-0002-CVE-2013-6050.patch b/package/links/links-0002-CVE-2013-6050.patch
deleted file mode 100644
index d85c250..0000000
--- a/package/links/links-0002-CVE-2013-6050.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Description: Fix integer overflow in graphics mode (CVE-2013-6050)
-Author: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
-Bug-CVE: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-6050
-
-Index: links-2.7/html_tbl.c
-===================================================================
---- links-2.7.orig/html_tbl.c   2013-11-22 01:57:29.000000000 +0100
-+++ links-2.7/html_tbl.c        2013-11-22 01:58:30.000000000 +0100
-@@ -1550,6 +1550,8 @@ static void add_to_rect_sets(struct rect
- static void add_to_cell_sets(struct table_cell ****s, int **nn, int *n, struct rect *r, struct table_cell *c)
- {
- 	int i, j;
-+	if (r->y1 < 0 || r->y2 < 0)
-+		fatal_exit("add_to_cell_sets: integer overflow: %d, %d", r->y1, r->y2);
- 	for (i = r->y1 >> RECT_BOUND_BITS; i <= (r->y2 - 1) >> RECT_BOUND_BITS; i++) {
- 		if (i >= *n) {
- 			struct table_cell ***ns;
diff --git a/package/links/links.hash b/package/links/links.hash
new file mode 100644
index 0000000..a6e79b3
--- /dev/null
+++ b/package/links/links.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5070a759af7f107ca4f9572833b8f086cd9f7c21ef5e1fce8482a2883a743c7a	links-2.8.tar.gz
diff --git a/package/links/links.mk b/package/links/links.mk
index c7f3671..2ad56f9 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.7
+LINKS_VERSION = 2.8
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
 LINKS_LICENSE = GPLv2+
