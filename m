From: Steve Kenton <skenton@ou.edu>
Date: Sat, 29 Nov 2014 00:14:05 -0600
Subject: [Buildroot] [PATCH] ffprobe: V1.0 Add ffprobe option to ffmpeg
	package
In-Reply-To: <54796318.7010207@ou.edu>
References: <54796318.7010207@ou.edu>
Message-ID: <5479642D.1030408@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Buildroot][PATCH] ffprobe: V1.0 Add ffprobe option to ffmpeg package

I found I needed ffprobe on the target so this adds
BR2_PACKAGE_FFMPEG_FFPROBE to make it an option
Patch mailed to myself, reapplied with "patch -up1 <../ffpatch.eml" to a fresh buildroot-2014.08 and build tested

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
diff -ru buildroot-2014.08.clean/package/ffmpeg/Config.in buildroot-2014.08.mod/package/ffmpeg/Config.in
--- buildroot-2014.08.clean/package/ffmpeg/Config.in	2014-09-01 06:20:56.000000000 -0500
+++ buildroot-2014.08.mod/package/ffmpeg/Config.in	2014-11-28 00:14:42.642463528 -0600
@@ -49,6 +49,12 @@
 	help
 	  FFserver is a streaming server for both audio and video.

+config BR2_PACKAGE_FFMPEG_FFPROBE
+	bool "Build ffprobe"
+	help
+	  FFprobe is a utility to determine the audio and video
+	  characteristics of a container file.
+
 config BR2_PACKAGE_FFMPEG_POSTPROC
 	bool "Build libpostproc"
 	depends on BR2_PACKAGE_FFMPEG_GPL
diff -ru buildroot-2014.08.clean/package/ffmpeg/ffmpeg.mk buildroot-2014.08.mod/package/ffmpeg/ffmpeg.mk
--- buildroot-2014.08.clean/package/ffmpeg/ffmpeg.mk	2014-09-01 06:20:56.000000000 -0500
+++ buildroot-2014.08.mod/package/ffmpeg/ffmpeg.mk	2014-11-28 00:14:48.802463646 -0600
@@ -25,7 +25,6 @@
 	--disable-pic \
 	--enable-optimizations \
 	--disable-extra-warnings \
-	--disable-ffprobe \
 	--enable-avdevice \
 	--enable-avcodec \
 	--enable-avformat \
@@ -103,6 +102,12 @@
 FFMPEG_CONF_OPT += --disable-ffserver
 endif

+ifeq ($(BR2_PACKAGE_FFMPEG_FFPROBE),y)
+FFMPEG_CONF_OPT += --enable-ffprobe
+else
+FFMPEG_CONF_OPT += --disable-ffprobe
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
 FFMPEG_CONF_OPT += --enable-postproc
 else
