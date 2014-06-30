From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Jun 2014 23:52:09 +0200
Subject: [Buildroot] [PATCH 09/14] gst-fsl-plugins: bump to version 3.0.11
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <e74146136c6c80460b5a3c12aff5739d7c2e95e4.1404164261.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gary Bisson <bisson.gary@gmail.com>

As the VPU code is now apart from imx-lib, this package also depends
on imx-vpu.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: slightly tweak commit log <80 chars]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
---
 package/gstreamer/gst-fsl-plugins/Config.in        |  1 +
 ...gins-0002-Fix-bashism-in-configure-script.patch | 25 +++++-----------------
 .../gst-fsl-plugins-0003-Use-proper-objdump.patch  |  6 +++---
 ...sl-linkage-add-lrt-for-shared-memory-func.patch |  2 +-
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   | 10 +++++----
 5 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index 19fa0da..fc0184e 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_GST_FSL_PLUGINS
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_LIBFSLVPUWRAP
 	select BR2_PACKAGE_IMX_LIB
+	select BR2_PACKAGE_IMX_VPU
 	select BR2_PACKAGE_LIBFSLPARSER
 	select BR2_PACKAGE_LIBFSLCODEC
 	help
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch
index 8af3644..35617cd 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch
@@ -9,29 +9,14 @@ have the default dash as /bin/sh define a variable ending with
 
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
- configure.ac |   22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
+ configure.ac | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
 index 5968eb6..1a31a06 100755
 --- a/configure.ac
 +++ b/configure.ac
-@@ -60,10 +60,10 @@ AC_DEFUN([CHECK_DISABLE_FEATURE],
-         [use_[$1]=yes])
-     if test "$use_[$1]" = "yes"; then
-         SAVE_CPPFLAGS="$CPPFLAGS"
--        CPPFLAGS=`$PKG_CONFIG --cflags libfslaudiocodec`
--        CPPFLAGS+=`$PKG_CONFIG --cflags libfslvideocodec`
--        CPPFLAGS+=`$PKG_CONFIG --cflags libfslparser`
--        CPPFLAGS+=`$PKG_CONFIG --cflags libfslvpuwrap`
-+        CPPFLAGS="$CPPFLAGS `$PKG_CONFIG --cflags libfslaudiocodec`"
-+        CPPFLAGS="$CPPFLAGS `$PKG_CONFIG --cflags libfslvideocodec`"
-+        CPPFLAGS="$CPPFLAGS `$PKG_CONFIG --cflags libfslparser`"
-+        CPPFLAGS="$CPPFLAGS `$PKG_CONFIG --cflags libfslvpuwrap`"
-         AC_CHECK_HEADERS([$4], HAVE_[$3]=yes, HAVE_[$3]=no && break)
-         CPPFLAGS="$SAVE_CPPFLAGS"
-         if test "x$HAVE_[$3]" = "xyes"; then
-@@ -157,7 +157,7 @@ AC_SUBST(GST_PLUGINS_BASE_LIBS)
+@@ -152,7 +152,7 @@ AC_SUBST(GST_PLUGINS_BASE_LIBS)
  AC_CHECK_HEADERS([vpu_lib.h], [HAVE_VPU_LIB=yes], [HAVE_VPU_LIB=no])
  if test "x$HAVE_VPU_LIB" = "xyes"; then
      VPU_LIBS=`$PKG_CONFIG --libs libfslvpuwrap 2>/dev/null`
@@ -40,8 +25,8 @@ index 5968eb6..1a31a06 100755
  fi
  AC_SUBST(VPU_LIBS)
  
-@@ -173,15 +173,15 @@ AC_SUBST(IPU_CFLAGS)
- AC_SUBST(IPU_LIBS)
+@@ -176,15 +176,15 @@ AC_SUBST(RT_CFLAGS)
+ AC_SUBST(RT_LIBS)
  
  FSL_MM_CORE_CFLAGS=`$PKG_CONFIG --cflags libfslaudiocodec 2>/dev/null`
 -FSL_MM_CORE_CFLAGS+=`$PKG_CONFIG --cflags libfslvideocodec 2>/dev/null`
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch
index 8fce239..b7b8c9f 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch
@@ -18,16 +18,16 @@ index 1a31a06..cc7557d 100755
 @@ -17,7 +17,7 @@ AC_DEFUN([FIND_PARSER_SONAME],
      AC_MSG_CHECKING([for lib_$1_parser_$2_elinux.3.0.so soname])
      path=`$PKG_CONFIG --variable=libdir libfslparser`
-     SONAME=$( $CC -print-file-name=$path/lib_$1_parser_$2_elinux.so | \
+     SONAME=$( $CC -print-file-name=$PKG_CONFIG_SYSROOT_DIR$path/lib_$1_parser_$2_elinux.so | \
 -	    while read output; do objdump -p $output | \
 +	    while read output; do $OBJDUMP -p $output | \
  	    grep "SONAME" | \
  	    sed -e 's/ \+SONAME \+//'; done 2> /dev/null )
      if [[ -z "$SONAME" ]]; then
-@@ -37,7 +37,7 @@ AC_DEFUN([FIND_ACODEC_SONAME],
+@@ -36,7 +36,7 @@ AC_DEFUN([FIND_ACODEC_SONAME],
      AC_MSG_CHECKING([for lib_$1_wrap_$2_elinux.so soname])
      path=`$PKG_CONFIG --variable=libdir libfslaudiocodec`
-     SONAME=$( $CC -print-file-name=$path/wrap/lib_$1_wrap_$2_elinux.so | \
+     SONAME=$( $CC -print-file-name=$PKG_CONFIG_SYSROOT_DIR$path/wrap/lib_$1_wrap_$2_elinux.so | \
 -	    while read output; do objdump -p $output | \
 +	    while read output; do $OBJDUMP -p $output | \
  	    grep "SONAME" | \
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
index e58467e..763703c 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
@@ -18,7 +18,7 @@ diff --git a/configure.ac b/configure.ac
 index a5d1655..7b5a7a6 100755
 --- a/configure.ac
 +++ b/configure.ac
-@@ -173,6 +173,9 @@ AC_CHECK_LIB(ipu, mxc_ipu_lib_task_init, [IPU_LIBS=-lipu], [echo "No libipu arou
+@@ -170,6 +170,9 @@ AC_CHECK_LIB(ipu, mxc_ipu_lib_task_init, [IPU_LIBS=-lipu], [echo "No libipu arou
  AC_SUBST(IPU_CFLAGS)
  AC_SUBST(IPU_LIBS)
  
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 9ec92d8..1ae6596 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_FSL_PLUGINS_VERSION = $(FREESCALE_IMX_VERSION)
+GST_FSL_PLUGINS_VERSION = 3.0.11
 GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
 
 # Most is LGPLv2+, but some sources are copied from upstream and are
@@ -16,13 +16,15 @@ GST_FSL_PLUGINS_INSTALL_STAGING = YES
 GST_FSL_PLUGINS_AUTORECONF = YES
 
 GST_FSL_PLUGINS_DEPENDENCIES += host-pkgconf gstreamer gst-plugins-base \
-	libfslvpuwrap imx-lib libfslparser libfslcodec
+	libfslvpuwrap imx-lib imx-vpu libfslparser libfslcodec
 
-GST_FSL_PLUGINS_CONF_ENV = PLATFORM=$(BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM)
+GST_FSL_PLUGINS_CONF_ENV = \
+	PLATFORM=$(BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM) \
+	CROSS_ROOT="$(STAGING_DIR)"
 
 # needs access to imx-specific kernel headers
 GST_FSL_PLUGINS_DEPENDENCIES += linux
-GST_FSL_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(LINUX_DIR)/include"
+GST_FSL_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(LINUX_DIR)/include/uapi"
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 GST_FSL_PLUGINS_DEPENDENCIES += xlib_libX11
-- 
1.9.1
