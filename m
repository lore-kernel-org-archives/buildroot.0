From: Steve Kenton <skenton@ou.edu>
Date: Mon, 01 Dec 2014 18:55:35 -0600
Subject: [Buildroot] [PATCH] ffprobe: V2.0 Add ffprobe option to ffmpeg
 package
In-Reply-To: <5479642D.1030408@ou.edu>
References: <54796318.7010207@ou.edu> <5479642D.1030408@ou.edu>
Message-ID: <547D0E07.2070502@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/29/2014 12:14 AM, Steve Kenton wrote:
V2.0 updated for buildroot 2014.11

[Buildroot][PATCH] ffprobe: V2.0 Add ffprobe option to ffmpeg package

I found I needed ffprobe on the target so this adds
BR2_PACKAGE_FFMPEG_FFPROBE to make it an option

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
diff -ru buildroot-2014.11.clean/package/ffmpeg/Config.in buildroot-2014.11/package/ffmpeg/Config.in
--- buildroot-2014.11.clean/package/ffmpeg/Config.in	2014-12-01 03:19:00.000000000 -0600
+++ buildroot-2014.11/package/ffmpeg/Config.in	2014-12-01 10:41:51.550502361 -0600
@@ -49,6 +49,12 @@
 	help
 	  FFserver is a streaming server for both audio and video.

+config BR2_PACKAGE_FFMPEG_FFPROBE
+	bool "Build ffprobe"
+	help
+	  FFprobe is a utility to determine the audio and video
+	  characteristics of a container file.
+
 config BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	bool "Build libavresample"
 	help
diff -ru buildroot-2014.11.clean/package/ffmpeg/ffmpeg.mk buildroot-2014.11/package/ffmpeg/ffmpeg.mk
--- buildroot-2014.11.clean/package/ffmpeg/ffmpeg.mk	2014-12-01 03:19:00.000000000 -0600
+++ buildroot-2014.11/package/ffmpeg/ffmpeg.mk	2014-12-01 10:31:58.950490993 -0600
@@ -23,7 +23,6 @@
 	--enable-logging \
 	--enable-optimizations \
 	--disable-extra-warnings \
-	--disable-ffprobe \
 	--enable-avdevice \
 	--enable-avcodec \
 	--enable-avformat \
@@ -104,6 +103,12 @@
 FFMPEG_CONF_OPTS += --disable-avresample
 endif

+ifeq ($(BR2_PACKAGE_FFMPEG_FFPROBE),y)
+FFMPEG_CONF_OPTS += --enable-ffprobe
+else
+FFMPEG_CONF_OPTS += --disable-ffprobe
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
 FFMPEG_CONF_OPTS += --enable-postproc
 else
