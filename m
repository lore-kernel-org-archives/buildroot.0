From: Steve Kenton <skenton@ou.edu>
Date: Mon, 26 Jan 2015 19:22:35 -0600
Subject: [Buildroot] [PATCH V2] ffmpeg: enable use of freetype and fontconfig
Message-ID: <54C6E85B.2010707@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configure ffmpeg to use freetype and fontconfig
if those packages are selected.

ffmpeg freetype support require fenv.h
which is not available in uClibc
except for uClibc on x86

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
V2 Added fontconfig to make freetype support more robust

I could not find a good way to do "or" in the make file
Is there something better than nesting and using two
ffmpeg_environment_has_fenv ?= y
statements? I'm not really happy about the temporary

diff -pruN buildroot.ori/package/ffmpeg/ffmpeg.mk buildroot/package/ffmpeg/ffmpeg.mk
--- buildroot.ori/package/ffmpeg/ffmpeg.mk	2015-01-25 17:21:49.000000000 -0600
+++ buildroot/package/ffmpeg/ffmpeg.mk	2015-01-26 18:44:50.971678526 -0600
@@ -49,7 +49,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-libopencv \
 	--disable-libdc1394 \
 	--disable-libfaac \
-	--disable-libfreetype \
 	--disable-libgsm \
 	--disable-libmp3lame \
 	--disable-libnut \
@@ -234,6 +233,28 @@ else
 FFMPEG_CONF_OPTS += --disable-libvpx
 endif

+# ffmpeg freetype support require fenv.h
+# which is not available in uClibc
+ifneq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+ffmpeg_environment_has_fenv ?= y
+endif
+# except for uClibc on x86
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+ffmpeg_environment_has_fenv ?= y
+endif
+ifeq ($(BR2_PACKAGE_FREETYPE)$(ffmpeg_environment_has_fenv),yy)
+FFMPEG_CONF_OPTS += --enable-libfreetype
+FFMPEG_DEPENDENCIES += freetype
+# fontconfig only makes sense if we also have freetype
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+FFMPEG_CONF_OPTS += --enable-fontconfig
+FFMPEG_DEPENDENCIES += fontconfig
+endif
+else
+FFMPEG_CONF_OPTS += --disable-libfreetype
+FFMPEG_CONF_OPTS += --disable-fontconfig
+endif
+
 ifeq ($(BR2_PACKAGE_X264)$(BR2_PACKAGE_FFMPEG_GPL),yy)
 FFMPEG_CONF_OPTS += --enable-libx264
 FFMPEG_DEPENDENCIES += x264
