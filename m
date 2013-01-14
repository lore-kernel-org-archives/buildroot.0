From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 15:08:09 +0100
Subject: [Buildroot] [git commit] gst-fsl-plugins: new package
Message-ID: <20130114152702.0E56D800FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31a4dfab1a7c821f4b23c244702ee648e68f816d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-fsl-plugins/Config.in       |   92 ++++++++++++++++++++
 ...sl-plugins-0001-gplay-add-missing-include.patch |   23 +++++
 ...gins-0002-Fix-bashism-in-configure-script.patch |   65 ++++++++++++++
 .../gst-fsl-plugins-0003-Use-proper-objdump.patch  |   36 ++++++++
 .../multimedia/gst-fsl-plugins/gst-fsl-plugins.mk  |   42 +++++++++
 6 files changed, 259 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 273d9bc..e50eda9 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -8,6 +8,7 @@ source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-ffmpeg/Config.in"
 source "package/multimedia/gst-dsp/Config.in"
+source "package/multimedia/gst-fsl-plugins/Config.in"
 source "package/multimedia/gst-omapfb/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
diff --git a/package/multimedia/gst-fsl-plugins/Config.in b/package/multimedia/gst-fsl-plugins/Config.in
new file mode 100644
index 0000000..4246734
--- /dev/null
+++ b/package/multimedia/gst-fsl-plugins/Config.in
@@ -0,0 +1,92 @@
+comment "gst-fsl-plugins requires an imx-specific kernel to be built"
+	depends on BR2_arm && BR2_PACKAGE_GSTREAMER && !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_GST_FSL_PLUGINS
+	bool "gst-fsl-plugins"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_LIBFSLVPUWRAP
+	select BR2_PACKAGE_IMX_LIB
+	select BR2_PACKAGE_LIBFSLPARSER
+	select BR2_PACKAGE_LIBFSLCODEC
+	help
+	  GStreamer plugins for hardware-accelerated audio and video
+	  parsers and codecs on i.MX platforms. It requires a kernel that
+	  includes the i.MX specific headers to be built.
+
+	  To use the VPU, its firmware blob must be installed as well. This
+	  can be found in the firmware-imx package in the "Hardware handling"
+	  menu.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream. Pengutronix maintains gst-fsl-plugins at
+	  git://git.pengutronix.de/git/imx/gst-plugins-fsl-vpu.git
+	  but it diverges heavily from Freescale's original implementation.
+
+if BR2_PACKAGE_GST_FSL_PLUGINS
+choice
+	prompt "i.MX platform"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX233
+	bool "imx233"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX25
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
+	bool "imx25"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX27
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
+	bool "imx27"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX28
+	bool "imx28"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX31
+	bool "imx31"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX35
+	bool "imx35"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX37
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
+	bool "imx37"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX50
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
+	bool "imx50"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX51
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
+	bool "imx51"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX53
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
+	bool "imx53"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX5X
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX5X
+	bool "imx5X"
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX6
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
+	bool "imx6"
+
+endchoice
+
+config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM
+	string
+	default "MX233" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX233
+	default "MX25" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX25
+	default "MX27" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX27
+	default "MX28" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX28
+	default "MX31" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX31
+	default "MX35" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX35
+	default "MX37" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX37
+	default "MX50" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX50
+	default "MX51" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX51
+	default "MX53" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX53
+	default "MX5X" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX5X
+	default "MX6" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX6
+endif
diff --git a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0001-gplay-add-missing-include.patch b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0001-gplay-add-missing-include.patch
new file mode 100644
index 0000000..19753bc
--- /dev/null
+++ b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0001-gplay-add-missing-include.patch
@@ -0,0 +1,23 @@
+From ed649ccb8ddc724546172d329fca39b23c49b804 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Mon, 17 Dec 2012 17:58:28 +0100
+Subject: [PATCH] gplay: add missing include
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ tools/gplay/gst_snapshot.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/gplay/gst_snapshot.c b/tools/gplay/gst_snapshot.c
+index 40dbb6f..596f399 100755
+--- a/tools/gplay/gst_snapshot.c
++++ b/tools/gplay/gst_snapshot.c
+@@ -22,6 +22,7 @@
+ 
+ #include <gst/gst.h>
+ #include <string.h>
++#include <stdio.h>
+ #include "gst_snapshot.h"
+ 
+ static void
+-- 
diff --git a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch
new file mode 100644
index 0000000..8af3644
--- /dev/null
+++ b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch
@@ -0,0 +1,65 @@
+From 83b4f84b1c490b9bb816e1ecbc743d80d48cc06d Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 18 Dec 2012 12:05:22 +0100
+Subject: [PATCH] Fix bashism in configure script.
+
+The configure script uses +=, which is not POSIX. Debians that
+have the default dash as /bin/sh define a variable ending with
++ instead of appending to it.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ configure.ac |   22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5968eb6..1a31a06 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -60,10 +60,10 @@ AC_DEFUN([CHECK_DISABLE_FEATURE],
+         [use_[$1]=yes])
+     if test "$use_[$1]" = "yes"; then
+         SAVE_CPPFLAGS="$CPPFLAGS"
+-        CPPFLAGS=`$PKG_CONFIG --cflags libfslaudiocodec`
+-        CPPFLAGS+=`$PKG_CONFIG --cflags libfslvideocodec`
+-        CPPFLAGS+=`$PKG_CONFIG --cflags libfslparser`
+-        CPPFLAGS+=`$PKG_CONFIG --cflags libfslvpuwrap`
++        CPPFLAGS="$CPPFLAGS `$PKG_CONFIG --cflags libfslaudiocodec`"
++        CPPFLAGS="$CPPFLAGS `$PKG_CONFIG --cflags libfslvideocodec`"
++        CPPFLAGS="$CPPFLAGS `$PKG_CONFIG --cflags libfslparser`"
++        CPPFLAGS="$CPPFLAGS `$PKG_CONFIG --cflags libfslvpuwrap`"
+         AC_CHECK_HEADERS([$4], HAVE_[$3]=yes, HAVE_[$3]=no && break)
+         CPPFLAGS="$SAVE_CPPFLAGS"
+         if test "x$HAVE_[$3]" = "xyes"; then
+@@ -157,7 +157,7 @@ AC_SUBST(GST_PLUGINS_BASE_LIBS)
+ AC_CHECK_HEADERS([vpu_lib.h], [HAVE_VPU_LIB=yes], [HAVE_VPU_LIB=no])
+ if test "x$HAVE_VPU_LIB" = "xyes"; then
+     VPU_LIBS=`$PKG_CONFIG --libs libfslvpuwrap 2>/dev/null`
+-    VPU_LIBS+=" -lvpu"
++    VPU_LIBS="$VPU_LIBS -lvpu"
+ fi
+ AC_SUBST(VPU_LIBS)
+ 
+@@ -173,15 +173,15 @@ AC_SUBST(IPU_CFLAGS)
+ AC_SUBST(IPU_LIBS)
+ 
+ FSL_MM_CORE_CFLAGS=`$PKG_CONFIG --cflags libfslaudiocodec 2>/dev/null`
+-FSL_MM_CORE_CFLAGS+=`$PKG_CONFIG --cflags libfslvideocodec 2>/dev/null`
+-FSL_MM_CORE_CFLAGS+=`$PKG_CONFIG --cflags libfslparser 2>/dev/null`
+-FSL_MM_CORE_CFLAGS+=`$PKG_CONFIG --cflags libfslvpuwrap 2>/dev/null`
++FSL_MM_CORE_CFLAGS="$FSL_MM_CORE_CFLAGS `$PKG_CONFIG --cflags libfslvideocodec 2>/dev/null`"
++FSL_MM_CORE_CFLAGS="$FSL_MM_CORE_CFLAGS `$PKG_CONFIG --cflags libfslparser 2>/dev/null`"
++FSL_MM_CORE_CFLAGS="$FSL_MM_CORE_CFLAGS `$PKG_CONFIG --cflags libfslvpuwrap 2>/dev/null`"
+ AC_SUBST(FSL_MM_CORE_CFLAGS)
+ 
+ FSL_MM_CORE_LIBS=`$PKG_CONFIG --libs libfslaudiocodec 2>/dev/null`
+-FSL_MM_CORE_LIBS+=`$PKG_CONFIG --libs libfslvideocodec 2>/dev/null`
+-FSL_MM_CORE_LIBS+=`$PKG_CONFIG --libs libfslparser 2>/dev/null`
+-FSL_MM_CORE_LIBS+=`$PKG_CONFIG --libs libfslvpuwrap 2>/dev/null`
++FSL_MM_CORE_LIBS="$FSL_MM_CORE_LIBS `$PKG_CONFIG --libs libfslvideocodec 2>/dev/null`"
++FSL_MM_CORE_LIBS="$FSL_MM_CORE_LIBS `$PKG_CONFIG --libs libfslparser 2>/dev/null`"
++FSL_MM_CORE_LIBS="$FSL_MM_CORE_LIBS `$PKG_CONFIG --libs libfslvpuwrap 2>/dev/null`"
+ AC_SUBST(FSL_MM_CORE_LIBS)
+ 
+ EXTRAPLATFORMCFLAGS="-DARM -D_GNUC_"
+-- 
diff --git a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch
new file mode 100644
index 0000000..8fce239
--- /dev/null
+++ b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch
@@ -0,0 +1,36 @@
+From c58b658a93b1b6d6e94ba0306d58de845012cef6 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 18 Dec 2012 12:22:52 +0100
+Subject: [PATCH] Use proper objdump
+
+If the OBJDUMP environment variable is set, that should be used rather
+than the objdump in PATH.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ configure.ac |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1a31a06..cc7557d 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,7 +17,7 @@ AC_DEFUN([FIND_PARSER_SONAME],
+     AC_MSG_CHECKING([for lib_$1_parser_$2_elinux.3.0.so soname])
+     path=`$PKG_CONFIG --variable=libdir libfslparser`
+     SONAME=$( $CC -print-file-name=$path/lib_$1_parser_$2_elinux.so | \
+-	    while read output; do objdump -p $output | \
++	    while read output; do $OBJDUMP -p $output | \
+ 	    grep "SONAME" | \
+ 	    sed -e 's/ \+SONAME \+//'; done 2> /dev/null )
+     if [[ -z "$SONAME" ]]; then
+@@ -37,7 +37,7 @@ AC_DEFUN([FIND_ACODEC_SONAME],
+     AC_MSG_CHECKING([for lib_$1_wrap_$2_elinux.so soname])
+     path=`$PKG_CONFIG --variable=libdir libfslaudiocodec`
+     SONAME=$( $CC -print-file-name=$path/wrap/lib_$1_wrap_$2_elinux.so | \
+-	    while read output; do objdump -p $output | \
++	    while read output; do $OBJDUMP -p $output | \
+ 	    grep "SONAME" | \
+ 	    sed -e 's/ \+SONAME \+//'; done 2> /dev/null )
+     if [[ -z "$SONAME" ]]; then
+-- 
diff --git a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk
new file mode 100644
index 0000000..639fd52
--- /dev/null
+++ b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -0,0 +1,42 @@
+#############################################################
+#
+# buildroot makefile for gst-fsl-plugins
+#
+#############################################################
+
+GST_FSL_PLUGINS_VERSION = 3.0.1
+# No official download site from freescale, just this mirror
+GST_FSL_PLUGINS_SITE = http://download.ossystems.com.br/bsp/freescale/source
+
+# Most is LGPLv2+, but some sources are copied from upstream and are
+# LGPLv2.1+, which essentially makes it LGPLv2.1+
+GST_FSL_PLUGINS_LICENSE = LGPLv2+, LGPLv2.1+, PROPRIETARY (asf.h)
+GST_FSL_PLUGINS_LICENSE_FILES = COPYING-LGPL-2.1 COPYING-LGPL-2
+
+GST_FSL_PLUGINS_INSTALL_STAGING = YES
+GST_FSL_PLUGINS_AUTORECONF = YES
+
+GST_FSL_PLUGINS_DEPENDENCIES += host-pkgconf gstreamer gst-plugins-base \
+	libfslvpuwrap imx-lib libfslparser libfslcodec
+
+GST_FSL_PLUGINS_CONF_ENV = PLATFORM=$(BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM)
+
+# needs access to imx-specific kernel headers
+GST_FSL_PLUGINS_DEPENDENCIES += linux
+GST_FSL_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(LINUX_DIR)/include"
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+GST_FSL_PLUGINS_DEPENDENCIES += xlib_libX11
+GST_FSL_PLUGINS_CONF_OPT += --enable-x11
+else
+GST_FSL_PLUGINS_CONF_OPT += --disable-x11
+endif
+
+# Autoreconf requires an m4 directory to exist
+define GST_FSL_PLUGINS_PATCH_M4
+	mkdir -p $(@D)/m4
+endef
+
+GST_FSL_PLUGINS_POST_PATCH_HOOKS += GST_FSL_PLUGINS_PATCH_M4
+
+$(eval $(autotools-package))
