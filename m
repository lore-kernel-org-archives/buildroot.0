From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Fri, 18 Jan 2013 02:43:39 +0100
Subject: [Buildroot] [PATCH] Use the libpng-config from staging instead of
	the one from the host.
Message-ID: <1358473419-13477-1-git-send-email-jc@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gd package configure call 'libpng-config' to get the compiler
flags required to use the libpng. The configure correctly allow to
specify the path of the staging libpng-config by using the
ac_cv_path_LIBPNG_CONFIG but the configure.ac call simply
'libpng-config' instead of the specified one. The configure.ac is now
modified to call the specified libpng_config.

In buildroot gd.mk, specify the staging libpng-config and to a empty
string the libpng12-config to prevent to use the -lpng12 flag or the
host setting.

Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
---
 package/gd/gd-libpng-config.patch |   22 ++++++++++++++++++++++
 package/gd/gd.mk                  |    2 ++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/gd/gd-libpng-config.patch

diff --git a/package/gd/gd-libpng-config.patch b/package/gd/gd-libpng-config.patch
new file mode 100644
index 0000000..655da78
--- /dev/null
+++ b/package/gd/gd-libpng-config.patch
@@ -0,0 +1,22 @@
+diff -ruN a/configure.ac b/configure.ac
+--- a/configure.ac	2013-01-18 02:00:59.000000000 +0100
++++ b/configure.ac	2013-01-18 02:01:44.000000000 +0100
+@@ -353,14 +353,14 @@
+   AC_PATH_PROG([LIBPNG12_CONFIG], [libpng12-config])
+   AC_PATH_PROG([LIBPNG_CONFIG], [libpng-config])
+   if test -n "$LIBPNG12_CONFIG"; then
+-    libpng_CPPFLAGS=`libpng12-config --cflags`
++    libpng_CPPFLAGS=`$LIBPNG12_CONFIG --cflags`
+     # should be --ldopts, but it's currently broken
+-    libpng_LDFLAGS=`libpng12-config --ldflags`
++    libpng_LDFLAGS=`$LIBPNG12_CONFIG --ldflags`
+     libpng_LDFLAGS=`echo " $libpng_LDFLAGS" | sed 's/ -l[[^ ]][[^ ]]*//g'`
+   elif test -n "$LIBPNG_CONFIG"; then
+-    libpng_CPPFLAGS=`libpng-config --cflags`
++    libpng_CPPFLAGS=`$LIBPNG_CONFIG --cflags`
+     # should be --ldopts, but it's currently broken
+-    libpng_LDFLAGS=`libpng-config --ldflags`
++    libpng_LDFLAGS=`$LIBPNG_CONFIG --ldflags`
+     libpng_LDFLAGS=`echo " $libpng_LDFLAGS" | sed 's/ -l[[^ ]][[^ ]]*//g'`
+   elif test -d "$withval"; then
+     libpng_CPPFLAGS="-I$withval/include"
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 972d8dd..96abf9e 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -33,6 +33,8 @@ endif
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 GD_DEPENDENCIES += libpng
 GD_CONF_OPT += --with-png
+GD_CONF_ENV += ac_cv_path_LIBPNG12_CONFIG=""
+GD_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
-- 
1.7.2.5
