From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Apr 2019 12:25:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/davfs2: add optional dependency on
 iconv and NLS
In-Reply-To: <20190420102528.8559-1-fontaine.fabrice@gmail.com>
References: <20190420102528.8559-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420102528.8559-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/ac2c39a7300fbdd069ac5504148ccb2b065fbf8e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/davfs2/0002-fix-iconv.patch | 48 +++++++++++++++++++++++++++++
 package/davfs2/davfs2.mk            |  8 +++--
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 package/davfs2/0002-fix-iconv.patch

diff --git a/package/davfs2/0002-fix-iconv.patch b/package/davfs2/0002-fix-iconv.patch
new file mode 100644
index 0000000000..f2bae8f8e9
--- /dev/null
+++ b/package/davfs2/0002-fix-iconv.patch
@@ -0,0 +1,48 @@
+webdav.c: fix iconv calls
+
+Replace HAVE_ICONV_H by HAVE_ICONV to fix build with iconv indeed
+HAVE_ICONV_H is never set as AC_CHECK_HEADERS is not called to check for
+iconv.h
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://savannah.nongnu.org/bugs/index.php?56178]
+
+diff -Naurp davfs2-1.5.4-orig/src/webdav.c davfs2-1.5.4/src/webdav.c
+--- davfs2-1.5.4-orig/src/webdav.c	2019-04-20 12:12:38.252599230 +0200
++++ davfs2-1.5.4/src/webdav.c	2019-04-20 12:13:33.012925300 +0200
+@@ -25,7 +25,7 @@
+ #ifdef HAVE_FCNTL_H
+ #include <fcntl.h>
+ #endif
+-#ifdef HAVE_ICONV_H
++#ifdef HAVE_ICONV
+ #include <iconv.h>
+ #endif
+ #ifdef HAVE_LANGINFO_H
+@@ -231,7 +231,7 @@ static int initialized;
+    Needed by  ssl_verify() which may be called at any time. */
+ static int have_terminal;
+ 
+-#ifdef HAVE_ICONV_H
++#ifdef HAVE_ICONV
+ /* Handle to convert character encoding from utf-8 to LC_CTYPE.
+    If NULL no conversion is done. */
+ static iconv_t from_utf_8;
+@@ -264,7 +264,7 @@ static char **cookie_list;
+ /* Private function prototypes and inline functions */
+ /*==================================================*/
+ 
+-#ifdef HAVE_ICONV_H
++#ifdef HAVE_ICONV
+ static void
+ convert(char **s, iconv_t conv);
+ #endif
+@@ -337,7 +337,7 @@ dav_init_webdav(const dav_args *args)
+     if (args->neon_debug & ~NE_DBG_HTTPPLAIN)
+         syslog(LOG_MAKEPRI(LOG_DAEMON, LOG_DEBUG), "Initializing webdav");
+ 
+-#ifdef HAVE_ICONV_H
++#ifdef HAVE_ICONV
+     char *lc_charset = nl_langinfo(CODESET);
+     if (lc_charset && strcasecmp(lc_charset, "UTF-8") != 0) {
+         from_utf_8 = iconv_open(lc_charset, "UTF-8");
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index c1f8477f8b..f2b2fdbe41 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -9,9 +9,13 @@ DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
 
-DAVFS2_DEPENDENCIES = neon
+DAVFS2_DEPENDENCIES = \
+	neon \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	$(TARGET_NLS_DEPENDENCIES)
 
 DAVFS2_CONF_ENV += \
-	ac_cv_path_NEON_CONFIG=$(STAGING_DIR)/usr/bin/neon-config
+	ac_cv_path_NEON_CONFIG=$(STAGING_DIR)/usr/bin/neon-config \
+	LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
-- 
2.20.1
