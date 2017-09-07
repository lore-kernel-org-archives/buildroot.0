From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  7 Sep 2017 23:16:28 +0200
Subject: [Buildroot] [PATCH v2] gst1-plugins-bad: fix build against openjpeg
	2.2
Message-ID: <20170907211628.18644-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix build against openjpeg 2.2 and patch
to bump gettext version to 0.19 to fix autoreconf build step.

Fixes [1]:

  gstopenjpeg.h:42:37: fatal error: openjpeg-2.1/openjpeg.h: No such file or directory

[1] http://autobuild.buildroot.net/results/90f1f7838f08e3a557be27470406d4d84dbcc828

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...1-openjpeg-Fix-build-against-openjpeg-2.2.patch | 93 ++++++++++++++++++++++
 .../0002-Bump-gettext-version-to-0.19.patch        | 46 +++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch
 create mode 100644 package/gstreamer1/gst1-plugins-bad/0002-Bump-gettext-version-to-0.19.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch
new file mode 100644
index 0000000000..d9268bc9b6
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch
@@ -0,0 +1,93 @@
+From daaf649bda7231fd0d760802232a36ba62a4ea2d Mon Sep 17 00:00:00 2001
+From: Clemens Lang <cal@macports.org>
+Date: Sun, 13 Aug 2017 21:17:18 +0200
+Subject: [PATCH] openjpeg: Fix build against openjpeg 2.2
+
+OpenJPEG 2.2 has some API changes and thus ships its headers in a new
+include path. Add a configure check (to both meson and autoconf) to
+detect the newer version of OpenJPEG and add conditional includes.
+
+Fix the autoconf test for OpenJPEG 2.1, which checked for HAVE_OPENJPEG,
+which was always set even for 2.0.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=786250
+
+Upstream: https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/patch/?id=15f24fef53a955c7c76fc966302cb0453732e657
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac               |  7 ++++++-
+ ext/openjpeg/gstopenjpeg.h |  4 +++-
+ ext/openjpeg/meson.build   | 21 +++++++++++++--------
+ 3 files changed, 22 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 30e26b8..c4f08c7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2813,8 +2813,13 @@ AG_GST_CHECK_FEATURE(OPENJPEG, [openjpeg library], openjpeg, [
+   if test x"$HAVE_OPENJPEG" = x"yes"; then
+     dnl minor API changes in v2.1
+     AG_GST_PKG_CHECK_MODULES(OPENJPEG_2_1, libopenjp2 >= 2.1)
+-    if test x"$HAVE_OPENJPEG" = x"yes"; then
++    if test x"$HAVE_OPENJPEG_2_1" = x"yes"; then
+       AC_DEFINE([HAVE_OPENJPEG_2_1], 1, [Define if OpenJPEG 2.1 is used])
++        dnl include paths changed for v2.2
++        AG_GST_PKG_CHECK_MODULES(OPENJPEG_2_2, libopenjp2 >= 2.2)
++        if test x"$HAVE_OPENJPEG_2_2" = x"yes"; then
++          AC_DEFINE([HAVE_OPENJPEG_2_2], 1, [Define if OpenJPEG 2.2 is used])
++        fi
+     fi
+   else
+     # Fallback to v1.5
+diff --git a/ext/openjpeg/gstopenjpeg.h b/ext/openjpeg/gstopenjpeg.h
+index 03ce52e..52410a4 100644
+--- a/ext/openjpeg/gstopenjpeg.h
++++ b/ext/openjpeg/gstopenjpeg.h
+@@ -38,7 +38,9 @@
+ #define OPJ_CPRL CPRL
+ #else
+ #include <stdio.h>
+-# ifdef HAVE_OPENJPEG_2_1
++# if defined(HAVE_OPENJPEG_2_2)
++#  include <openjpeg-2.2/openjpeg.h>
++# elif defined(HAVE_OPENJPEG_2_1)
+ #  include <openjpeg-2.1/openjpeg.h>
+ # else
+ #  include <openjpeg-2.0/openjpeg.h>
+diff --git a/ext/openjpeg/meson.build b/ext/openjpeg/meson.build
+index d60974c..e9c416c 100644
+--- a/ext/openjpeg/meson.build
++++ b/ext/openjpeg/meson.build
+@@ -6,16 +6,21 @@ openjpeg_sources = [
+ 
+ openjpeg_cargs = []
+ 
+-# Check for 2.1, then 2.0
+-openjpeg_dep = dependency('libopenjp2', version : '>=2.1', required : false)
++# Check for 2.2, 2.1, then 2.0
++openjpeg_dep = dependency('libopenjp2', version : '>=2.2', required : false)
+ if openjpeg_dep.found()
+-  openjpeg_cargs += ['-DHAVE_OPENJPEG_2_1']
++  openjpeg_cargs += ['-DHAVE_OPENJPEG_2_2']
+ else
+-  openjpeg_dep = dependency('libopenjp2', required : false)
+-  # Fallback to 1.5
+-  if not openjpeg_dep.found()
+-    openjpeg_dep = dependency('libopenjpeg1', required : false)
+-    openjpeg_cargs += ['-DHAVE_OPENJPEG_1']
++  openjpeg_dep = dependency('libopenjp2', version : '>=2.1', required : false)
++  if openjpeg_dep.found()
++    openjpeg_cargs += ['-DHAVE_OPENJPEG_2_1']
++  else
++    openjpeg_dep = dependency('libopenjp2', required : false)
++    # Fallback to 1.5
++    if not openjpeg_dep.found()
++      openjpeg_dep = dependency('libopenjpeg1', required : false)
++      openjpeg_cargs += ['-DHAVE_OPENJPEG_1']
++    endif
+   endif
+ endif
+ 
+-- 
+2.12.3
+
diff --git a/package/gstreamer1/gst1-plugins-bad/0002-Bump-gettext-version-to-0.19.patch b/package/gstreamer1/gst1-plugins-bad/0002-Bump-gettext-version-to-0.19.patch
new file mode 100644
index 0000000000..ccac1f1073
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0002-Bump-gettext-version-to-0.19.patch
@@ -0,0 +1,46 @@
+From 750da2a0dbaaefa4e702bf7ede16917b57b7efa8 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 7 Sep 2017 23:01:44 +0200
+Subject: [PATCH] Bump gettext version to 0.19
+
+Fixes autoreconf failure:
+
+  *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.17 but the autoconf macros are from gettext version 0.19
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac      | 2 +-
+ po/Makefile.in.in | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c4f08c7..009f6e6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -67,7 +67,7 @@ AC_SUBST(ACLOCAL_AMFLAGS, "-I m4 -I common/m4")
+ 
+ dnl set up gettext
+ dnl the version check needs to stay here because autopoint greps for it
+-AM_GNU_GETTEXT_VERSION([0.17])
++AM_GNU_GETTEXT_VERSION([0.19])
+ AM_GNU_GETTEXT([external])
+ AG_GST_GETTEXT([gst-plugins-bad-$GST_API_VERSION])
+ 
+diff --git a/po/Makefile.in.in b/po/Makefile.in.in
+index fecf500..fcd3167 100644
+--- a/po/Makefile.in.in
++++ b/po/Makefile.in.in
+@@ -8,8 +8,8 @@
+ # Please note that the actual code of GNU gettext is covered by the GNU
+ # General Public License and is *not* in the public domain.
+ #
+-# Origin: gettext-0.17
+-GETTEXT_MACRO_VERSION = 0.17
++# Origin: gettext-0.19
++GETTEXT_MACRO_VERSION = 0.19
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+-- 
+2.12.3
+
-- 
2.12.3
