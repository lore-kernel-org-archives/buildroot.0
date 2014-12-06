From: Steve Kenton <skenton@ou.edu>
Date: Fri, 05 Dec 2014 19:58:25 -0600
Subject: [Buildroot] [PATCH] ffmpeg: V1.0 configure ffmpeg with
 --enable-libfreetype if libfreetype package is enabled
Message-ID: <548262C1.7080000@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Buildroot][PATCH] ffmpeg: V1.0 configure ffmpeg with --enable-libfreetype if libfreetype package is enabled

I needed ffmpeg on the target configured using --enable-libfreetype and using "Additional parameters for ./configure" missed the dependency.
Modeled on the blocks above and below it in ffmpeg.mk - let me know if the order is important and I need to move it somewhere else.

Signed-off-by Stephen M. Kenton <skenton@ou.edu>

---
diff -ru buildroot-2014.11.clean/package/ffmpeg/ffmpeg.mk buildroot-2014.11/package/ffmpeg/ffmpeg.mk
--- buildroot-2014.11.clean/package/ffmpeg/ffmpeg.mk
+++ buildroot-2014.11/package/ffmpeg/ffmpeg.mk
@@ -50,7 +50,6 @@
 	--disable-libopencv \
 	--disable-libdc1394 \
 	--disable-libfaac \
-	--disable-libfreetype \
 	--disable-libgsm \
 	--disable-libmp3lame \
 	--disable-libnut \
@@ -229,6 +228,13 @@
 FFMPEG_CONF_OPTS += --disable-libvpx
 endif

+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+FFMPEG_CONF_OPTS += --enable-libfreetype
+FFMPEG_DEPENDENCIES += freetype
+else
+FFMPEG_CONF_OPTS += --disable-libfreetype
+endif
+
 ifeq ($(BR2_PACKAGE_X264)$(BR2_PACKAGE_FFMPEG_GPL),yy)
 FFMPEG_CONF_OPTS += --enable-libx264
 FFMPEG_DEPENDENCIES += x264
