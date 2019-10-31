From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 11:22:42 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/mjpegtools: fix
 build with -fPIC on x86
Message-ID: <20191031101633.A184D83AB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b26ca381b5a035d3f149c2acc196aaec2bbe564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Retrieve upstream patch to fix build with BR2_PIC_PIE on x86

Fixes:
 - http://autobuild.buildroot.org/results/b1252b7907944d227694ad8506de25881bf2ca04

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 41eadb1a9b8e8626006ef4378bd97925a29b8d38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ly-causes-problems-on-some-x86_64-systems.patch | 73 ++++++++++++++++++++++
 package/mjpegtools/mjpegtools.mk                   |  2 +
 2 files changed, 75 insertions(+)

diff --git a/package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch b/package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch
new file mode 100644
index 0000000000..f5de8ee969
--- /dev/null
+++ b/package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch
@@ -0,0 +1,73 @@
+From e69557bea18eb7c3069c9527cc30f7cd91be27b7 Mon Sep 17 00:00:00 2001
+From: sms00 <sms00@3be20b7b-d6de-45d7-9b51-1db703c412de>
+Date: Thu, 28 Nov 2013 22:39:41 +0000
+Subject: [PATCH] PROGRAM_NOPIC apparently causes problems on some x86_64
+ systems, has little to no performance effect on x86_64 systems and even on
+ x86 systems most programs are I/O bound anyhow.  So remove the 4 uses of the
+ flag
+
+git-svn-id: https://svn.code.sf.net/p/mjpeg/Code/trunk/mjpeg_play at 3359 3be20b7b-d6de-45d7-9b51-1db703c412de
+
+[Retrieved (and backported by removing INSTALL updates) from:
+https://github.com/jaystevens/mjpegtools/commit/e69557bea18eb7c3069c9527cc30f7cd91be27b7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ y4mdenoise/Makefile.am |   4 +-
+ y4munsharp/Makefile.am |   2 +-
+ y4mutils/Makefile.am   |   2 +-
+ yuvscaler/Makefile.am  |   2 +-
+ 5 files changed, 26 insertions(+), 94 deletions(-)
+
+diff --git a/y4mdenoise/Makefile.am b/y4mdenoise/Makefile.am
+index dee9064f..d7fa76e2 100644
+--- a/y4mdenoise/Makefile.am
++++ b/y4mdenoise/Makefile.am
+@@ -4,8 +4,8 @@ MAINTAINERCLEANFILES = Makefile.in
+ 
+ EXTRA_DIST = implementation.html
+ 
+-AM_CFLAGS = -DNDEBUG -finline-functions @PROGRAM_NOPIC@
+-AM_CXXFLAGS = -DNDEBUG -finline-functions @PROGRAM_NOPIC@
++AM_CFLAGS = -DNDEBUG -finline-functions
++AM_CXXFLAGS = -DNDEBUG -finline-functions
+ 
+ INCLUDES =  -I$(top_srcdir) -I$(top_srcdir)/utils
+ 
+diff --git a/y4munsharp/Makefile.am b/y4munsharp/Makefile.am
+index a7f98acc..f99ff5cf 100644
+--- a/y4munsharp/Makefile.am
++++ b/y4munsharp/Makefile.am
+@@ -4,7 +4,7 @@ MAINTAINERCLEANFILES = Makefile.in
+ 
+ INCLUDES = -I $(top_srcdir)/utils -I $(top_srcdir)
+ 
+-y4munharp_CFLAGS=@PROGRAM_NOPIC@
++y4munharp_CFLAGS=
+ 
+ bin_PROGRAMS = y4munsharp
+ 
+diff --git a/y4mutils/Makefile.am b/y4mutils/Makefile.am
+index f3b0a671..7b8b1881 100644
+--- a/y4mutils/Makefile.am
++++ b/y4mutils/Makefile.am
+@@ -2,7 +2,7 @@
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+ 
+-AM_CFLAGS   = @PROGRAM_NOPIC@
++AM_CFLAGS   =
+ AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/utils
+ 
+ LIBMJPEGUTILS = $(top_builddir)/utils/libmjpegutils.la
+diff --git a/yuvscaler/Makefile.am b/yuvscaler/Makefile.am
+index 1fe4d757..6d2adaca 100644
+--- a/yuvscaler/Makefile.am
++++ b/yuvscaler/Makefile.am
+@@ -18,6 +18,6 @@ noinst_HEADERS = \
+ 
+ EXTRA_DIST = yuvscaler_implementation.txt
+ 
+-yuvscaler_CFLAGS=@PROGRAM_NOPIC@
++yuvscaler_CFLAGS=
+ yuvscaler_SOURCES = yuvscaler.c yuvscaler_resample.c yuvscaler_bicubic.c
+ yuvscaler_LDADD = $(LIBMJPEGUTILS) $(LIBM_LIBS)
diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
index 14713c868e..f028afc82d 100644
--- a/package/mjpegtools/mjpegtools.mk
+++ b/package/mjpegtools/mjpegtools.mk
@@ -9,6 +9,8 @@ MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEG
 MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
 MJPEGTOOLS_LICENSE = GPL-2.0+
 MJPEGTOOLS_LICENSE_FILES = COPYING
+# We're patching Makefile.am
+MJPEGTOOLS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT),y)
 MJPEGTOOLS_CONF_OPTS += --enable-simd-accel
