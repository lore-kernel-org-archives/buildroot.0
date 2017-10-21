From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sat, 21 Oct 2017 21:08:41 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: add upstream patch for
	openjpeg2.3
Message-ID: <20171021190841.8636-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch has been merged in the upstream repository,
thus it can be removed for subsequent releases

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 .../0001-support-building-with-openjpeg-2.3.patch  | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-bad/0001-support-building-with-openjpeg-2.3.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-support-building-with-openjpeg-2.3.patch b/package/gstreamer1/gst1-plugins-bad/0001-support-building-with-openjpeg-2.3.patch
new file mode 100644
index 0000000000..7faee45a63
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0001-support-building-with-openjpeg-2.3.patch
@@ -0,0 +1,81 @@
+From bff2d834a4a38f64e555cee3d0144fde6c515acd Mon Sep 17 00:00:00 2001
+From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
+Date: Thu, 19 Oct 2017 16:36:17 +0200
+Subject: openjpeg: Support building with openjpeg 2.3, simpler
+
+OpenJPEG 2.3 installs its headers to /usr/include/openjpeg-2.3. However,
+since libopenjp2.pc seems to provide the right includedir CFLAGS at
+least since version 2.1, instead of adding yet another version check,
+just remove the subdir and the check for 2.2.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=788703
+
+diff --git a/configure.ac b/configure.ac
+index a54af0f..7bef688 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2870,11 +2870,6 @@ AG_GST_CHECK_FEATURE(OPENJPEG, [openjpeg library], openjpeg, [
+     AG_GST_PKG_CHECK_MODULES(OPENJPEG_2_1, libopenjp2 >= 2.1)
+     if test x"$HAVE_OPENJPEG_2_1" = x"yes"; then
+       AC_DEFINE([HAVE_OPENJPEG_2_1], 1, [Define if OpenJPEG 2.1 is used])
+-        dnl include paths changed for v2.2
+-        AG_GST_PKG_CHECK_MODULES(OPENJPEG_2_2, libopenjp2 >= 2.2)
+-        if test x"$HAVE_OPENJPEG_2_2" = x"yes"; then
+-          AC_DEFINE([HAVE_OPENJPEG_2_2], 1, [Define if OpenJPEG 2.2 is used])
+-        fi
+     fi
+   else
+     # Fallback to v1.5
+diff --git a/ext/openjpeg/gstopenjpeg.h b/ext/openjpeg/gstopenjpeg.h
+index 52410a4..f9ca74a 100644
+--- a/ext/openjpeg/gstopenjpeg.h
++++ b/ext/openjpeg/gstopenjpeg.h
+@@ -38,10 +38,8 @@
+ #define OPJ_CPRL CPRL
+ #else
+ #include <stdio.h>
+-# if defined(HAVE_OPENJPEG_2_2)
+-#  include <openjpeg-2.2/openjpeg.h>
+-# elif defined(HAVE_OPENJPEG_2_1)
+-#  include <openjpeg-2.1/openjpeg.h>
++# if defined(HAVE_OPENJPEG_2_1)
++#  include <openjpeg.h>
+ # else
+ #  include <openjpeg-2.0/openjpeg.h>
+ # endif
+diff --git a/ext/openjpeg/meson.build b/ext/openjpeg/meson.build
+index 0d97ebb..14b8583 100644
+--- a/ext/openjpeg/meson.build
++++ b/ext/openjpeg/meson.build
+@@ -6,21 +6,15 @@ openjpeg_sources = [
+ 
+ openjpeg_cargs = []
+ 
+-# Check for 2.2, 2.1, then 2.0
+-openjpeg_dep = dependency('libopenjp2', version : '>=2.2', required : false)
++# Check for 2.1, then 2.0, then 1.5
++openjpeg_dep = dependency('libopenjp2', version : '>=2.1', required : false)
+ if openjpeg_dep.found()
+-  openjpeg_cargs += ['-DHAVE_OPENJPEG_2_2', '-DHAVE_OPENJPEG_2_1']
++  openjpeg_cargs += ['-DHAVE_OPENJPEG_2_1']
+ else
+-  openjpeg_dep = dependency('libopenjp2', version : '>=2.1', required : false)
+-  if openjpeg_dep.found()
+-    openjpeg_cargs += ['-DHAVE_OPENJPEG_2_1']
+-  else
+-    openjpeg_dep = dependency('libopenjp2', required : false)
+-    # Fallback to 1.5
+-    if not openjpeg_dep.found()
+-      openjpeg_dep = dependency('libopenjpeg1', required : false)
+-      openjpeg_cargs += ['-DHAVE_OPENJPEG_1']
+-    endif
++  openjpeg_dep = dependency('libopenjp2', required : false)
++  if not openjpeg_dep.found()
++    openjpeg_dep = dependency('libopenjpeg1', required : false)
++    openjpeg_cargs += ['-DHAVE_OPENJPEG_1']
+   endif
+ endif
+ 
+-- 
+cgit v0.10.2
+
-- 
2.11.0
