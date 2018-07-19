From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 11:53:34 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libv4l: fix build with
 sdl2_image
Message-ID: <20180719095055.4FA2F88E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24f9f94cab28cca8e57b097f01b12f331ac6d33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

sdlcam test includes jpeglib.h so add a patch to disable it if jpeg is
disabled

Fixes:
 - http://autobuild.buildroot.net/results/1eded8b44cc369550566c6ce0b3c042f1aec8d44

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d92d3ddeb1374325a7d92c885dc827317a5c90f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0004-Build-sdlcam-only-if-jpeg-is-enabled.patch | 31 ++++++++++++++++++++++
 package/libv4l/libv4l.mk                           |  4 +++
 2 files changed, 35 insertions(+)

diff --git a/package/libv4l/0004-Build-sdlcam-only-if-jpeg-is-enabled.patch b/package/libv4l/0004-Build-sdlcam-only-if-jpeg-is-enabled.patch
new file mode 100644
index 0000000000..4c4365f907
--- /dev/null
+++ b/package/libv4l/0004-Build-sdlcam-only-if-jpeg-is-enabled.patch
@@ -0,0 +1,31 @@
+From 5c407e130f8d0416f91f5a12bcdc2709f00dda65 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 29 Jun 2018 21:15:10 +0200
+Subject: [PATCH] Build sdlcam only if jpeg is enabled
+
+Fixes:
+ - http://autobuild.buildroot.net/results/1eded8b44cc369550566c6ce0b3c042f1aec8d44
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ contrib/test/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
+index 0188fe21..c7c38e7a 100644
+--- a/contrib/test/Makefile.am
++++ b/contrib/test/Makefile.am
+@@ -17,8 +17,10 @@ noinst_PROGRAMS += v4l2gl
+ endif
+ 
+ if HAVE_SDL
++if HAVE_JPEG
+ noinst_PROGRAMS += sdlcam
+ endif
++endif
+ 
+ driver_test_SOURCES = driver-test.c
+ driver_test_LDADD = ../../utils/libv4l2util/libv4l2util.la
+-- 
+2.14.1
+
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 95a700b2d5..c95b2778cd 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -10,6 +10,10 @@ LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = --disable-doxygen-doc
+# We're patching contrib/test/Makefile.am
+LIBV4L_AUTORECONF = YES
+# add host-gettext for AM_ICONV macro
+LIBV4L_DEPENDENCIES += host-gettext
 
 # fix uclibc-ng configure/compile
 LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
