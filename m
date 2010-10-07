From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Oct 2010 16:00:41 +0200
Subject: [Buildroot] [git commit master 1/1] ffmpeg: add options for
	postproc/swscale
Message-ID: <20101007140136.BAB5E8BE96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4ff345522306956172bf61b69eba63afb425e693
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/Config.in |   11 +++++++++++
 package/multimedia/ffmpeg/ffmpeg.mk |   14 ++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
index fb6591b..2f94991 100644
--- a/package/multimedia/ffmpeg/Config.in
+++ b/package/multimedia/ffmpeg/Config.in
@@ -47,6 +47,17 @@ config BR2_PACKAGE_FFMPEG_FFSERVER
 	help
          FFserver is a streaming server for both audio and video.
 
+config BR2_PACKAGE_FFMPEG_POSTPROC
+	bool "Build libpostproc"
+	depends on BR2_PACKAGE_FFMPEG_GPL
+	help
+	  Postproc is a library of video postprocessing routines.
+
+config BR2_PACKAGE_FFMPEG_SWSCALE
+	bool "Build libswscale"
+	help
+	  Swscale is a library of video scaling routines.
+
 config BR2_PACKAGE_FFMPEG_ENCODERS
 	string "Enabled encoders"
 	default "all"
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 4e6924c..959efa3 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -13,8 +13,6 @@ FFMPEG_CONF_OPT = \
 	--prefix=/usr		\
 	--enable-shared 	\
 	--disable-avfilter	\
-	--disable-postproc	\
-	--disable-swscale	\
 	--disable-vhook		\
 
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
@@ -49,6 +47,18 @@ else
 FFMPEG_CONF_OPT += --disable-ffserver
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
+FFMPEG_CONF_OPT += --enable-postproc
+else
+FFMPEG_CONF_OPT += --disable-postproc
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
+FFMPEG_CONF_OPT += --enable-swscale
+else
+FFMPEG_CONF_OPT += --disable-swscale
+endif
+
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_ENCODERS)),all)
 FFMPEG_CONF_OPT += --disable-encoders \
 	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_ENCODERS)),--enable-encoder=$(x))
-- 
1.7.1
