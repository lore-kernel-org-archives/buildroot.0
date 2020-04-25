From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 25 Apr 2020 15:00:10 -0500
Subject: [Buildroot] [PATCH] package/davfs2: bump to version 1.5.6
Message-ID: <20200425200010.6870-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0002-fix-iconv.patch as this has been fixed as part of bug
56178 which is a part of the 1.5.6 release.

  http://savannah.nongnu.org/bugs/?56178

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/davfs2/0002-fix-iconv.patch | 48 -----------------------------
 package/davfs2/davfs2.hash          |  2 +-
 package/davfs2/davfs2.mk            |  2 +-
 3 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 package/davfs2/0002-fix-iconv.patch

diff --git a/package/davfs2/0002-fix-iconv.patch b/package/davfs2/0002-fix-iconv.patch
deleted file mode 100644
index f2bae8f8e9..0000000000
--- a/package/davfs2/0002-fix-iconv.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-webdav.c: fix iconv calls
-
-Replace HAVE_ICONV_H by HAVE_ICONV to fix build with iconv indeed
-HAVE_ICONV_H is never set as AC_CHECK_HEADERS is not called to check for
-iconv.h
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://savannah.nongnu.org/bugs/index.php?56178]
-
-diff -Naurp davfs2-1.5.4-orig/src/webdav.c davfs2-1.5.4/src/webdav.c
---- davfs2-1.5.4-orig/src/webdav.c	2019-04-20 12:12:38.252599230 +0200
-+++ davfs2-1.5.4/src/webdav.c	2019-04-20 12:13:33.012925300 +0200
-@@ -25,7 +25,7 @@
- #ifdef HAVE_FCNTL_H
- #include <fcntl.h>
- #endif
--#ifdef HAVE_ICONV_H
-+#ifdef HAVE_ICONV
- #include <iconv.h>
- #endif
- #ifdef HAVE_LANGINFO_H
-@@ -231,7 +231,7 @@ static int initialized;
-    Needed by  ssl_verify() which may be called at any time. */
- static int have_terminal;
- 
--#ifdef HAVE_ICONV_H
-+#ifdef HAVE_ICONV
- /* Handle to convert character encoding from utf-8 to LC_CTYPE.
-    If NULL no conversion is done. */
- static iconv_t from_utf_8;
-@@ -264,7 +264,7 @@ static char **cookie_list;
- /* Private function prototypes and inline functions */
- /*==================================================*/
- 
--#ifdef HAVE_ICONV_H
-+#ifdef HAVE_ICONV
- static void
- convert(char **s, iconv_t conv);
- #endif
-@@ -337,7 +337,7 @@ dav_init_webdav(const dav_args *args)
-     if (args->neon_debug & ~NE_DBG_HTTPPLAIN)
-         syslog(LOG_MAKEPRI(LOG_DAEMON, LOG_DEBUG), "Initializing webdav");
- 
--#ifdef HAVE_ICONV_H
-+#ifdef HAVE_ICONV
-     char *lc_charset = nl_langinfo(CODESET);
-     if (lc_charset && strcasecmp(lc_charset, "UTF-8") != 0) {
-         from_utf_8 = iconv_open(lc_charset, "UTF-8");
diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
index 7e2078bec5..b8ac0af1b5 100644
--- a/package/davfs2/davfs2.hash
+++ b/package/davfs2/davfs2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 587c6a25ad78109995a7ccb8e60aa1c491b149f2c99d47033f3d5e648430ad2f  davfs2-1.5.5.tar.gz
+sha256 417476cdcfd53966b2dcfaf12455b54f315959b488a89255ab4b44586153d801  davfs2-1.5.6.tar.gz
 # License file, locally calculated
 sha256 0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 90f73f4df0..a73093a52a 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAVFS2_VERSION = 1.5.5
+DAVFS2_VERSION = 1.5.6
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
-- 
2.17.1
