From: Steve Kenton <skenton@ou.edu>
Date: Fri, 19 Dec 2014 21:42:03 -0600
Subject: [Buildroot] [PATCH] ffmpeg: enable freetype support
Message-ID: <5494F00B.4080107@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libfreetype has been select configure ffmpeg to use it if possible
Since this requires fenv.h it won't happen when using uClibc except for x86 targets

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
diff -pruN buildroot-2014.11.clean/package/ffmpeg/ffmpeg.mk buildroot-2014.11.modified/package/ffmpeg/ffmpeg.mk
--- buildroot-2014.11.clean/package/ffmpeg/ffmpeg.mk	2014-12-01 03:19:00.000000000 -0600
+++ buildroot-2014.11.modified/package/ffmpeg/ffmpeg.mk	2014-12-19 21:27:00.321228195 -0600
@@ -50,7 +49,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-libopencv \
 	--disable-libdc1394 \
 	--disable-libfaac \
-	--disable-libfreetype \
 	--disable-libgsm \
 	--disable-libmp3lame \
 	--disable-libnut \
@@ -229,6 +233,22 @@ else
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
+else
+FFMPEG_CONF_OPTS += --disable-libfreetype
+endif
+
 ifeq ($(BR2_PACKAGE_X264)$(BR2_PACKAGE_FFMPEG_GPL),yy)
 FFMPEG_CONF_OPTS += --enable-libx264
 FFMPEG_DEPENDENCIES += x264
