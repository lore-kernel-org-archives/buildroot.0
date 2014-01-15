From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 15 Jan 2014 19:44:21 +0100
Subject: [Buildroot] [PATCH 1/1] gst-ffmpeg: Use internal libav instead of
	external ffmpeg
Message-ID: <BLU0-SMTP442A9DE801569E9B4917C36D9BE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

External ffmpeg 1.2.4 is incompatible, gst-ffmpeg suggests
to always use internal libav.

Adding two patches:
Allow uClibc compilation: gst-ffmpeg-uclibc.patch
Fixes compiling with gcc-4.7: gst-ffmpeg-0.10.13_gcc47.patch (taken from Slackware)

Fixes
http://autobuild.buildroot.net/results/ab8/ab8ec4904020ceb848a1e50f1865f594f46b8295//
http://autobuild.buildroot.net/results/f0a/f0a420015a92ebb8868c41c0dbf82cf27b2bdd0f//

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/gstreamer/gst-ffmpeg/Config.in             |    4 --
 .../gst-ffmpeg/gst-ffmpeg-0.10.13_gcc47.patch      |   65 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg/gst-ffmpeg-uclibc.patch   |   16 +++++
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk         |    9 ++-
 4 files changed, 88 insertions(+), 6 deletions(-)
 create mode 100644 package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_gcc47.patch
 create mode 100644 package/gstreamer/gst-ffmpeg/gst-ffmpeg-uclibc.patch

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index da254ef..d879f5e 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
 	select BR2_PACKAGE_GST_PLUGINS_BASE
-	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_GPL
-	select BR2_PACKAGE_FFMPEG_POSTPROC
-	select BR2_PACKAGE_FFMPEG_SWSCALE
 	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 	help
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_gcc47.patch b/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_gcc47.patch
new file mode 100644
index 0000000..16744ab
--- /dev/null
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_gcc47.patch
@@ -0,0 +1,65 @@
+gst-ffmpeg libav: Fixes compiling gst-ffmpeg with gcc-4.7
+
+Fetch from: http://www.slackware.com/~alien/slackbuilds/gst-plugins-ffmpeg/build/gst-ffmpeg-0.10.13_gcc47.patch
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+---
+Submitted By: Andrew Benton <andy@benton.eu.com>
+Date: 2012-06-15
+Initial Package Version: 0.10.13
+Upstream Status: From upstream
+Origin:
+http://git.videolan.org/?p=ffmpeg.git;a=patch;h=5f654897e325349dacf2546674e0510bb72ecb50
+
+Description: Fixes compiling gst-ffmpeg with gcc-4.7
+
+libavcodec/x86/h264_qpel_mmx.c: Assembler messages:
+libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
+make[5]: *** [libavcodec/x86/dsputil_mmx.o] Error 1
+
+Index: gst-ffmpeg-0.10.13/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c
+===================================================================
+--- gst-ffmpeg-0.10.13.orig/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:39:41.324522051 -0700
++++ gst-ffmpeg-0.10.13/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:54:08.152564075 -0700
+@@ -398,7 +398,7 @@
+             "2:                         \n\t"\
+             \
+             : "+a"(src), "+c"(dst)\
+-            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
++            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
+             : "memory"\
+         );\
+         src += 4-(h+5)*srcStride;\
+@@ -446,7 +446,7 @@
+             QPEL_H264HV(%%mm3, %%mm4, %%mm5, %%mm0, %%mm1, %%mm2, 15*48)\
+             "2:                     \n\t"\
+             : "+a"(src)\
+-            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)\
++            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)\
+             : "memory"\
+             );\
+         tmp += 4;\
+@@ -823,7 +823,7 @@
+         "2:                          \n\t"\
+         \
+         : "+a"(src), "+c"(dst)\
+-        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
++        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
+         : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3", \
+                        "%xmm4", "%xmm5", "%xmm6", "%xmm7",)\
+           "memory"\
+@@ -878,7 +878,7 @@
+             QPEL_H264HV_XMM(%%xmm3, %%xmm4, %%xmm5, %%xmm0, %%xmm1, %%xmm2, 15*48)
+             "2:                         \n\t"
+             : "+a"(src)
+-            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)
++            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)
+             : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3",
+                            "%xmm4", "%xmm5", "%xmm6", "%xmm7",)
+               "memory"
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg-uclibc.patch b/package/gstreamer/gst-ffmpeg/gst-ffmpeg-uclibc.patch
new file mode 100644
index 0000000..82a7ffb
--- /dev/null
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg-uclibc.patch
@@ -0,0 +1,16 @@
+libav configure: Allow uClibc compilation
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff -uNr gst-ffmpeg-0.10.13.org/gst-libs/ext/libav/configure gst-ffmpeg-0.10.13/gst-libs/ext/libav/configure
+--- gst-ffmpeg-0.10.13.org/gst-libs/ext/libav/configure	2011-11-02 16:16:24.000000000 +0100
++++ gst-ffmpeg-0.10.13/gst-libs/ext/libav/configure	2014-01-14 21:03:07.496887791 +0100
+@@ -2471,7 +2471,7 @@
+         enable dos_paths
+         add_cppflags -U__STRICT_ANSI__
+         ;;
+-    linux)
++    linux|linux-uclibc)
+         add_cppflags -D_POSIX_C_SOURCE=200112 -D_XOPEN_SOURCE=600
+         enable dv1394
+         ;;
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index fc59c30..c57a8c8 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -8,11 +8,16 @@ GST_FFMPEG_VERSION = 0.10.13
 GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base ffmpeg
-GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
+GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
+
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+GST_FFMPEG_DEPENDENCIES += host-yasm
+endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 GST_FFMPEG_DEPENDENCIES += bzip2
 endif
 
+GST_FFMPEG_CONF_OPT = --with-ffmpeg-extra-configure="--cross-prefix=$(TARGET_CROSS)"
+
 $(eval $(autotools-package))
-- 
1.7.9.5
