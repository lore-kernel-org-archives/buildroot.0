From: Steve Kenton <skenton@ou.edu>
Date: Fri, 02 Jan 2015 15:51:30 -0600
Subject: [Buildroot] [PATCH][Resend] ffmpeg: enable freetype support
In-Reply-To: <5494F00B.4080107@ou.edu>
References: <5494F00B.4080107@ou.edu>
Message-ID: <54A712E2.8080506@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libfreetype has been select configure ffmpeg to use it if possible
Since this requires fenv.h it won't happen when using uClibc except for x86 targets

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
Noticed the stray line at the bottom of the last version
Updated against last nights snapshot
diff -pruN buildroot.orig/package/ffmpeg/ffmpeg.mk buildroot/package/ffmpeg/ffmpeg.mk
--- buildroot.orig/package/ffmpeg/ffmpeg.mk	2015-01-01 17:02:23.000000000 -0600
+++ buildroot/package/ffmpeg/ffmpeg.mk	2015-01-02 15:25:30.649237010 -0600
@@ -49,7 +49,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-libopencv \
 	--disable-libdc1394 \
 	--disable-libfaac \
-	--disable-libfreetype \
 	--disable-libgsm \
 	--disable-libmp3lame \
 	--disable-libnut \
@@ -234,6 +233,22 @@ else
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
