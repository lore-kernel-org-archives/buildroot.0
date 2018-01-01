From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 23:14:06 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: bump to 1.12.4
Message-ID: <20180101221428.21FDB83A03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=330b03305b8bdadbfa0092423ca56a3fd9a438be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch, as it has been added upstream.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...upport-building-with-openjpeg-2.3-simpler.patch | 89 ----------------------
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  6 +-
 3 files changed, 3 insertions(+), 96 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
deleted file mode 100644
index 2356942..0000000
--- a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From b08b3ad2c4ca27519b34229b7430af5cb73cc7ef Mon Sep 17 00:00:00 2001
-From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
-Date: Thu, 19 Oct 2017 16:36:17 +0200
-Subject: [PATCH] openjpeg: Support building with openjpeg 2.3, simpler
-
-OpenJPEG 2.3 installs its headers to /usr/include/openjpeg-2.3. However,
-since libopenjp2.pc seems to provide the right includedir CFLAGS at
-least since version 2.1, instead of adding yet another version check,
-just remove the subdir and the check for 2.2.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=788703
-
-Upstream: https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=bff2d834a4a38f64e555cee3d0144fde6c515acd
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac               |  5 -----
- ext/openjpeg/gstopenjpeg.h |  6 ++----
- ext/openjpeg/meson.build   | 20 +++++++-------------
- 3 files changed, 9 insertions(+), 22 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7a8d752..f9727ac 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2815,11 +2815,6 @@ AG_GST_CHECK_FEATURE(OPENJPEG, [openjpeg library], openjpeg, [
-     AG_GST_PKG_CHECK_MODULES(OPENJPEG_2_1, libopenjp2 >= 2.1)
-     if test x"$HAVE_OPENJPEG_2_1" = x"yes"; then
-       AC_DEFINE([HAVE_OPENJPEG_2_1], 1, [Define if OpenJPEG 2.1 is used])
--        dnl include paths changed for v2.2
--        AG_GST_PKG_CHECK_MODULES(OPENJPEG_2_2, libopenjp2 >= 2.2)
--        if test x"$HAVE_OPENJPEG_2_2" = x"yes"; then
--          AC_DEFINE([HAVE_OPENJPEG_2_2], 1, [Define if OpenJPEG 2.2 is used])
--        fi
-     fi
-   else
-     # Fallback to v1.5
-diff --git a/ext/openjpeg/gstopenjpeg.h b/ext/openjpeg/gstopenjpeg.h
-index 52410a4..f9ca74a 100644
---- a/ext/openjpeg/gstopenjpeg.h
-+++ b/ext/openjpeg/gstopenjpeg.h
-@@ -38,10 +38,8 @@
- #define OPJ_CPRL CPRL
- #else
- #include <stdio.h>
--# if defined(HAVE_OPENJPEG_2_2)
--#  include <openjpeg-2.2/openjpeg.h>
--# elif defined(HAVE_OPENJPEG_2_1)
--#  include <openjpeg-2.1/openjpeg.h>
-+# if defined(HAVE_OPENJPEG_2_1)
-+#  include <openjpeg.h>
- # else
- #  include <openjpeg-2.0/openjpeg.h>
- # endif
-diff --git a/ext/openjpeg/meson.build b/ext/openjpeg/meson.build
-index 0d97ebb..14b8583 100644
---- a/ext/openjpeg/meson.build
-+++ b/ext/openjpeg/meson.build
-@@ -6,21 +6,15 @@ openjpeg_sources = [
- 
- openjpeg_cargs = []
- 
--# Check for 2.2, 2.1, then 2.0
--openjpeg_dep = dependency('libopenjp2', version : '>=2.2', required : false)
-+# Check for 2.1, then 2.0, then 1.5
-+openjpeg_dep = dependency('libopenjp2', version : '>=2.1', required : false)
- if openjpeg_dep.found()
--  openjpeg_cargs += ['-DHAVE_OPENJPEG_2_2', '-DHAVE_OPENJPEG_2_1']
-+  openjpeg_cargs += ['-DHAVE_OPENJPEG_2_1']
- else
--  openjpeg_dep = dependency('libopenjp2', version : '>=2.1', required : false)
--  if openjpeg_dep.found()
--    openjpeg_cargs += ['-DHAVE_OPENJPEG_2_1']
--  else
--    openjpeg_dep = dependency('libopenjp2', required : false)
--    # Fallback to 1.5
--    if not openjpeg_dep.found()
--      openjpeg_dep = dependency('libopenjpeg1', required : false)
--      openjpeg_cargs += ['-DHAVE_OPENJPEG_1']
--    endif
-+  openjpeg_dep = dependency('libopenjp2', required : false)
-+  if not openjpeg_dep.found()
-+    openjpeg_dep = dependency('libopenjpeg1', required : false)
-+    openjpeg_cargs += ['-DHAVE_OPENJPEG_1']
-   endif
- endif
- 
--- 
-2.14.2
-
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 5cd25da..752d50a 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.3.tar.xz.sha256sum
-sha256 36d059761852bed0f1a7fcd3ef64a8aeecab95d2bca53cd6aa0f08054b1cbfec gst-plugins-bad-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.4.tar.xz.sha256sum
+sha256 0c7857be16686d5c1ba6e34bd338664d3d4599d32714a8eca5c8a41a101e2d08 gst-plugins-bad-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 9f94148..83cb94b 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.12.3
+GST1_PLUGINS_BAD_VERSION = 1.12.4
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
@@ -13,10 +13,6 @@ GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
 # enabled.
 GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
 
-# patch 0001-openjpeg-Fix-build-against-openjpeg-2.2.patch touches configure.ac
-GST1_PLUGINS_BAD_AUTORECONF = YES
-GST1_PLUGINS_BAD_GETTEXTIZE = YES
-
 GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples \
 	--disable-valgrind \
