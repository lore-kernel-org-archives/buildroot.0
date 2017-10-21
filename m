From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Oct 2017 21:30:30 +0200
Subject: [Buildroot] [PATCH v2] gst1-plugins-bad: fix openjpeg-2.3 compile
	failure
Message-ID: <20171021193030.19126-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch [1], fixes [2]:

  In file included from gstopenjpegdec.h:29:0,
                   from gstopenjpegdec.c:27:
  gstopenjpeg.h:42:37: fatal error: openjpeg-2.2/openjpeg.h: No such file or directory
  #  include <openjpeg-2.2/openjpeg.h>

[1] https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=bff2d834a4a38f64e555cee3d0144fde6c515acd
[2] http://autobuild.buildroot.net/results/884/884956af56f63b2634a1984f5ea416075ed87bc8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 --> v2:
  - fix patch (was mixed up with 'gst-plugins-bad: openjpeg: Remove
    compatibility with openjpeg 2.0')
---
 ...upport-building-with-openjpeg-2.3-simpler.patch | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
new file mode 100644
index 0000000000..23569424a8
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
@@ -0,0 +1,89 @@
+From b08b3ad2c4ca27519b34229b7430af5cb73cc7ef Mon Sep 17 00:00:00 2001
+From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
+Date: Thu, 19 Oct 2017 16:36:17 +0200
+Subject: [PATCH] openjpeg: Support building with openjpeg 2.3, simpler
+
+OpenJPEG 2.3 installs its headers to /usr/include/openjpeg-2.3. However,
+since libopenjp2.pc seems to provide the right includedir CFLAGS at
+least since version 2.1, instead of adding yet another version check,
+just remove the subdir and the check for 2.2.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=788703
+
+Upstream: https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=bff2d834a4a38f64e555cee3d0144fde6c515acd
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac               |  5 -----
+ ext/openjpeg/gstopenjpeg.h |  6 ++----
+ ext/openjpeg/meson.build   | 20 +++++++-------------
+ 3 files changed, 9 insertions(+), 22 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7a8d752..f9727ac 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2815,11 +2815,6 @@ AG_GST_CHECK_FEATURE(OPENJPEG, [openjpeg library], openjpeg, [
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
+2.14.2
+
-- 
2.14.2
