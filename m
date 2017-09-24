From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Sep 2017 16:46:53 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] gst1-plugins-bad: fix
	build against openjpeg 2.2
Message-ID: <20170924144030.CFB8780AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bde9621d0f0c5d88f316ea0df9e125f73c88f2bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Add upstream patch to fix build against openjpeg 2.2.

Fixes [1]:

  gstopenjpeg.h:42:37: fatal error: openjpeg-2.1/openjpeg.h: No such file or directory

[1] http://autobuild.buildroot.net/results/90f1f7838f08e3a557be27470406d4d84dbcc828

[Peter: drop meson changes for 2017.02.x]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3a5d4db9549f6a777b06819bc00146a30d687d22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-openjpeg-Fix-build-against-openjpeg-2.2.patch | 60 ++++++++++++++++++++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  4 ++
 2 files changed, 64 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch
new file mode 100644
index 0000000..6d4419c
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch
@@ -0,0 +1,60 @@
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
+[Peter: drop meson changes for 2017.02.x]
+Upstream: https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/patch/?id=15f24fef53a955c7c76fc966302cb0453732e657
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac               |  7 ++++++-
+ ext/openjpeg/gstopenjpeg.h |  4 +++-
+ 2 files changed, 22 insertions(+), 10 deletions(-)
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
+ 
+-- 
+2.12.3
+
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 9f39bbf..8e3010b 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -13,6 +13,10 @@ GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
 # enabled.
 GST1_PLUGINS_BAD_LICENSE = LGPLv2+, LGPLv2.1+
 
+# patch 0001-openjpeg-Fix-build-against-openjpeg-2.2.patch touches configure.ac
+GST1_PLUGINS_BAD_AUTORECONF = YES
+GST1_PLUGINS_BAD_GETTEXTIZE = YES
+
 GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples \
 	--disable-valgrind \
