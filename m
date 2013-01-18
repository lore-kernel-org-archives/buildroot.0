From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Jan 2013 23:22:27 +0100
Subject: [Buildroot] [git commit] gd: ensure libpng-config from staging is
	used
Message-ID: <20130118222226.A5F029A30B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b69814d4880c2f58e2aad44f9912468a600708b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gd package configure call 'libpng-config' to get the compiler
flags required to use the libpng. The configure correctly allow to
specify the path of the staging libpng-config by using the
ac_cv_path_LIBPNG_CONFIG but the configure.ac call simply
'libpng-config' instead of the specified one. The configure.ac is now
modified to call the specified libpng_config.

[Peter: explictly pass --without-png instead of auto detect]
Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gd/gd-libpng-config.patch |   30 ++++++++++++++++++++++++++++++
 package/gd/gd.mk                  |    4 ++++
 2 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/gd/gd-libpng-config.patch b/package/gd/gd-libpng-config.patch
new file mode 100644
index 0000000..cf8b92e
--- /dev/null
+++ b/package/gd/gd-libpng-config.patch
@@ -0,0 +1,30 @@
+Call the libpng12-confg and libpng-config specified by
+$LIBPNG12_CONFIG and $LIBPNG_CONFIG variables that are set by
+ac_cv_path_LIBPNG12_CONFIG and ac_cv_path_LIBPNG_CONFIG. This is
+important for cross compiler that need to get the staging settings
+instead of the host settings.
+
+Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
+
+diff -Nura gd-2.0.35.orig/configure.ac gd-2.0.35/configure.ac
+--- gd-2.0.35.orig/configure.ac	2013-01-18 02:00:59.000000000 +0100
++++ gd-2.0.35/configure.ac	2013-01-18 02:01:44.000000000 +0100
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
index 972d8dd..de1f5d1 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -33,6 +33,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 GD_DEPENDENCIES += libpng
 GD_CONF_OPT += --with-png
+GD_CONF_ENV += ac_cv_path_LIBPNG12_CONFIG=""
+GD_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
+else
+GD_CONF_OPT += --without-png
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
