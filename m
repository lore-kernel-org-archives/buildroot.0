From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 16 Jan 2014 20:48:04 +0100
Subject: [Buildroot] [PATCH v2 1/1] gst-ffmpeg: Use internal libav instead
	of external ffmpeg
Message-ID: <BLU0-SMTP123CF536ADA15AAB1DD2175D9B90@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

External ffmpeg 1.2.4 is incompatible, gst-ffmpeg suggests
to always use internal libav.

Adding one patch:
Fixes compiling with gcc-4.7: gst-ffmpeg-0.10.13_gcc47.patch (taken from Slackware)

Fixes
http://autobuild.buildroot.net/results/ab8/ab8ec4904020ceb848a1e50f1865f594f46b8295/
http://autobuild.buildroot.net/results/f0a/f0a420015a92ebb8868c41c0dbf82cf27b2bdd0f/

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
Changes v1 -> v2:
- replaced gst-ffmpeg-uclibc.patch with configure option --target-os=linux (Peter)
- port libav-supported CPU optimization flags from ffmpeg/ffmpeg.mk (Peter)

 package/gstreamer/gst-ffmpeg/Config.in             |    4 --
 .../gst-ffmpeg/gst-ffmpeg-0.10.13_gcc47.patch      |   65 +++++++++++++++++++
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk         |   67 +++++++++++++++++++-
 3 files changed, 130 insertions(+), 6 deletions(-)
 create mode 100644 package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_gcc47.patch

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
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index fc59c30..6534f93 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -8,11 +8,74 @@ GST_FFMPEG_VERSION = 0.10.13
 GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base ffmpeg
-GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
+GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
+
+GST_FFMPEG_CONF_EXTRA_OPT = \
+		--cross-prefix=$(TARGET_CROSS) \
+		--target-os=linux
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GST_FFMPEG_CONF_EXTRA_OPT += --enable-zlib
+GST_FFMPEG_DEPENDENCIES += zlib
+else
+GST_FFMPEG_CONF_EXTRA_OPT += --disable-zlib
+endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
+GST_FFMPEG_CONF_EXTRA_OPT += --enable-bzlib
 GST_FFMPEG_DEPENDENCIES += bzip2
+else
+GST_FFMPEG_CONF_EXTRA_OPT += --disable-bzlib
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+GST_FFMPEG_CONF_EXTRA_OPT += --enable-yasm
+GST_FFMPEG_DEPENDENCIES += host-yasm
+else
+GST_FFMPEG_CONF_EXTRA_OPT += --disable-yasm
+GST_FFMPEG_CONF_EXTRA_OPT += --disable-mmx
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+GST_FFMPEG_CONF_EXTRA_OPT += --enable-sse
+else
+GST_FFMPEG_CONF_EXTRA_OPT += --disable-sse
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
+GST_FFMPEG_CONF_EXTRA_OPT += --enable-ssse3
+else
+GST_FFMPEG_CONF_EXTRA_OPT += --disable-ssse3
+endif
+
+# Explicitly disable everything that doesn't match for ARM
+# FFMPEG "autodetects" by compiling an extended instruction via AS
+# This works on compilers that aren't built for generic by default
+ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
+GST_FFMPEG_CONF_EXTRA_OPT += --disable-armv5te
+endif
+ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
+GST_FFMPEG_CONF_EXTRA_OPT += --enable-armv6
+else
+GST_FFMPEG_CONF_EXTRA_OPT += --disable-armv6 --disable-armv6t2
+endif
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+GST_FFMPEG_CONF_EXTRA_OPT += --enable-neon
+endif
+
+# Set powerpc altivec appropriately
+ifeq ($(BR2_powerpc),y)
+ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+GST_FFMPEG_CONF_EXTRA_OPT += --enable-altivec
+else
+GST_FFMPEG_CONF_EXTRA_OPT += --disable-altivec
+endif
+endif
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+GST_FFMPEG_CONF_EXTRA_OPT += --enable-pic
+endif
+
+GST_FFMPEG_CONF_OPT = --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPT)"
+
 $(eval $(autotools-package))
-- 
1.7.9.5
