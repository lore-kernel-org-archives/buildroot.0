From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Oct 2017 14:56:53 -0400
Subject: [Buildroot] [PATCH 04/10] gst1-plugins-bad: bump to 1.12.3
In-Reply-To: <20171009185659.7631-1-Adamduskett@outlook.com>
References: <20171009185659.7631-1-Adamduskett@outlook.com>
Message-ID: <20171009185659.7631-4-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Also remove openjpeg-Fix-build-against-openjpeg-2.2.patch.
Upstream commit id: df4c6385aa0739d59e83916d32b704de9b9f3d40

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 ...1-openjpeg-Fix-build-against-openjpeg-2.2.patch | 93 ----------------------
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  2 +-
 3 files changed, 3 insertions(+), 96 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch
deleted file mode 100644
index d9268bc9b6..0000000000
--- a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From daaf649bda7231fd0d760802232a36ba62a4ea2d Mon Sep 17 00:00:00 2001
-From: Clemens Lang <cal@macports.org>
-Date: Sun, 13 Aug 2017 21:17:18 +0200
-Subject: [PATCH] openjpeg: Fix build against openjpeg 2.2
-
-OpenJPEG 2.2 has some API changes and thus ships its headers in a new
-include path. Add a configure check (to both meson and autoconf) to
-detect the newer version of OpenJPEG and add conditional includes.
-
-Fix the autoconf test for OpenJPEG 2.1, which checked for HAVE_OPENJPEG,
-which was always set even for 2.0.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=786250
-
-Upstream: https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/patch/?id=15f24fef53a955c7c76fc966302cb0453732e657
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac               |  7 ++++++-
- ext/openjpeg/gstopenjpeg.h |  4 +++-
- ext/openjpeg/meson.build   | 21 +++++++++++++--------
- 3 files changed, 22 insertions(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 30e26b8..c4f08c7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2813,8 +2813,13 @@ AG_GST_CHECK_FEATURE(OPENJPEG, [openjpeg library], openjpeg, [
-   if test x"$HAVE_OPENJPEG" = x"yes"; then
-     dnl minor API changes in v2.1
-     AG_GST_PKG_CHECK_MODULES(OPENJPEG_2_1, libopenjp2 >= 2.1)
--    if test x"$HAVE_OPENJPEG" = x"yes"; then
-+    if test x"$HAVE_OPENJPEG_2_1" = x"yes"; then
-       AC_DEFINE([HAVE_OPENJPEG_2_1], 1, [Define if OpenJPEG 2.1 is used])
-+        dnl include paths changed for v2.2
-+        AG_GST_PKG_CHECK_MODULES(OPENJPEG_2_2, libopenjp2 >= 2.2)
-+        if test x"$HAVE_OPENJPEG_2_2" = x"yes"; then
-+          AC_DEFINE([HAVE_OPENJPEG_2_2], 1, [Define if OpenJPEG 2.2 is used])
-+        fi
-     fi
-   else
-     # Fallback to v1.5
-diff --git a/ext/openjpeg/gstopenjpeg.h b/ext/openjpeg/gstopenjpeg.h
-index 03ce52e..52410a4 100644
---- a/ext/openjpeg/gstopenjpeg.h
-+++ b/ext/openjpeg/gstopenjpeg.h
-@@ -38,7 +38,9 @@
- #define OPJ_CPRL CPRL
- #else
- #include <stdio.h>
--# ifdef HAVE_OPENJPEG_2_1
-+# if defined(HAVE_OPENJPEG_2_2)
-+#  include <openjpeg-2.2/openjpeg.h>
-+# elif defined(HAVE_OPENJPEG_2_1)
- #  include <openjpeg-2.1/openjpeg.h>
- # else
- #  include <openjpeg-2.0/openjpeg.h>
-diff --git a/ext/openjpeg/meson.build b/ext/openjpeg/meson.build
-index d60974c..e9c416c 100644
---- a/ext/openjpeg/meson.build
-+++ b/ext/openjpeg/meson.build
-@@ -6,16 +6,21 @@ openjpeg_sources = [
- 
- openjpeg_cargs = []
- 
--# Check for 2.1, then 2.0
--openjpeg_dep = dependency('libopenjp2', version : '>=2.1', required : false)
-+# Check for 2.2, 2.1, then 2.0
-+openjpeg_dep = dependency('libopenjp2', version : '>=2.2', required : false)
- if openjpeg_dep.found()
--  openjpeg_cargs += ['-DHAVE_OPENJPEG_2_1']
-+  openjpeg_cargs += ['-DHAVE_OPENJPEG_2_2']
- else
--  openjpeg_dep = dependency('libopenjp2', required : false)
--  # Fallback to 1.5
--  if not openjpeg_dep.found()
--    openjpeg_dep = dependency('libopenjpeg1', required : false)
--    openjpeg_cargs += ['-DHAVE_OPENJPEG_1']
-+  openjpeg_dep = dependency('libopenjp2', version : '>=2.1', required : false)
-+  if openjpeg_dep.found()
-+    openjpeg_cargs += ['-DHAVE_OPENJPEG_2_1']
-+  else
-+    openjpeg_dep = dependency('libopenjp2', required : false)
-+    # Fallback to 1.5
-+    if not openjpeg_dep.found()
-+      openjpeg_dep = dependency('libopenjpeg1', required : false)
-+      openjpeg_cargs += ['-DHAVE_OPENJPEG_1']
-+    endif
-   endif
- endif
- 
--- 
-2.12.3
-
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index b34fb02b5e..e4b83ff11c 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.2.tar.xz.sha256sum
-sha256 9c2c7edde4f59d74eb414e0701c55131f562e5c605a3ce9b091754f106c09e37 gst-plugins-bad-1.12.2.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.3.tar.xz.sha256sum
+sha256 36d059761852bed0f1a7fcd3ef64a8aeecab95d2bca53cd6aa0f08054b1cbfec gst-plugins-bad-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 8b707d5eb9..9f94148cfa 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.12.2
+GST1_PLUGINS_BAD_VERSION = 1.12.3
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.13.6
