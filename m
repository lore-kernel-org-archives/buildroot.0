From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Apr 2015 22:32:30 -0300
Subject: [Buildroot] [PATCH] php: allow cache for strcasestr test
Message-ID: <1428543150-10434-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fileinfo does an AC_TRY_RUN to test for strcasestr without allowing a
canned response, hence breaking cross-compiles. Use AC_CACHE_VAL. Fixes:
http://autobuild.buildroot.net/results/10a/10ae44cbc7c0c8e6f1ac54dae4c9d94c703aa3dd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/0005-ac-cache-strcasestr.patch | 24 ++++++++++++++++++++++++
 package/php/php.mk                         |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 package/php/0005-ac-cache-strcasestr.patch

diff --git a/package/php/0005-ac-cache-strcasestr.patch b/package/php/0005-ac-cache-strcasestr.patch
new file mode 100644
index 0000000..8a8c5d8
--- /dev/null
+++ b/package/php/0005-ac-cache-strcasestr.patch
@@ -0,0 +1,24 @@
+Allow cache answer for strcasestr discovery.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura php-5.6.7.orig/ext/fileinfo/config.m4 php-5.6.7/ext/fileinfo/config.m4
+--- php-5.6.7.orig/ext/fileinfo/config.m4	2015-04-08 22:19:45.798770792 -0300
++++ php-5.6.7/ext/fileinfo/config.m4	2015-04-08 22:26:33.110654338 -0300
+@@ -14,6 +14,7 @@
+     libmagic/readcdf.c libmagic/softmagic.c"
+ 
+   AC_MSG_CHECKING([for strcasestr])
++  AC_CACHE_VAL(ac_cv_func_strcasestr,
+   AC_TRY_RUN([
+ #include <string.h>
+ #include <strings.h>
+@@ -46,7 +47,7 @@
+     AC_MSG_RESULT(no)
+     AC_MSG_NOTICE(using libmagic strcasestr implementation)
+     libmagic_sources="$libmagic_sources libmagic/strcasestr.c"
+-  ])
++  ]))
+ 
+   PHP_NEW_EXTENSION(fileinfo, fileinfo.c $libmagic_sources, $ext_shared,,-I at ext_srcdir@/libmagic)
+   PHP_ADD_BUILD_DIR($ext_builddir/libmagic)
diff --git a/package/php/php.mk b/package/php/php.mk
index f355632..1a5e084 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -20,7 +20,9 @@ PHP_CONF_OPTS = \
 	--without-pear \
 	--with-config-file-path=/etc \
 	--disable-rpath
-PHP_CONF_ENV = EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
+PHP_CONF_ENV = \
+	ac_cv_func_strcasestr=yes \
+	EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
 
 # PHP can't be AUTORECONFed the standard way unfortunately
 PHP_DEPENDENCIES += host-autoconf host-automake host-libtool
-- 
2.0.5
