From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jun 2010 08:52:17 +0200
Subject: [Buildroot] [git commit master 1/1] ffmpeg: add commandline programs
Message-ID: <20100615065458.13E4080E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5253efadb0f5ba7e3bc3c339a1fa2a83df86ac7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/Config.in                |   23 ++++++++++++++++++++
 .../ffmpeg-0.5.2-fix-sdl-config-search.patch       |   17 ++++++++++++++
 package/multimedia/ffmpeg/ffmpeg.mk                |   23 +++++++++++++++++--
 3 files changed, 60 insertions(+), 3 deletions(-)
 create mode 100644 package/multimedia/ffmpeg/ffmpeg-0.5.2-fix-sdl-config-search.patch

diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
index f60790a..16bb32d 100644
--- a/package/multimedia/ffmpeg/Config.in
+++ b/package/multimedia/ffmpeg/Config.in
@@ -24,4 +24,27 @@ config BR2_PACKAGE_FFMPEG_NONFREE
          allow use of nonfree code, the resulting libs and binaries
          will be unredistributable
 
+config BR2_PACKAGE_FFMPEG_FFMPEG
+	bool "Build ffmpeg (the command line application)"
+	default y
+	help
+         FFmpeg is a very fast video and audio converter.
+         It can also grab from a live audio/video source.
+
+         It is not needed if you want to link the FFmpeg libraries
+         to your application.
+
+config BR2_PACKAGE_FFMPEG_FFPLAY
+	bool "Build ffplay"
+	select BR2_PACKAGE_SDL
+	help
+         FFplay is a very simple and portable media player using the
+         FFmpeg libraries and the SDL library.
+         It is mostly used as a testbed for the various FFmpeg APIs.
+
+config BR2_PACKAGE_FFMPEG_FFSERVER
+	bool "Build ffserver"
+	help
+         FFserver is a streaming server for both audio and video.
+
 endif
diff --git a/package/multimedia/ffmpeg/ffmpeg-0.5.2-fix-sdl-config-search.patch b/package/multimedia/ffmpeg/ffmpeg-0.5.2-fix-sdl-config-search.patch
new file mode 100644
index 0000000..58d08aa
--- /dev/null
+++ b/package/multimedia/ffmpeg/ffmpeg-0.5.2-fix-sdl-config-search.patch
@@ -0,0 +1,17 @@
+Allow FFmpeg's ./configure script to use a custom sdl-config command.
+
+Inspired from:
+http://www.mail-archive.com/uclinux-dist-commits at blackfin.uclinux.org/msg01099.html
+
+diff -u ffmpeg-0.5.2-orig/configure ffmpeg-0.5.2/configure
+--- a/configure
++++ b/configure
+@@ -2066,7 +2066,7 @@
+ 
+ disable sdl_too_old
+ disable sdl
+-SDL_CONFIG="${cross_prefix}sdl-config"
++SDL_CONFIG="${SDL_CONFIG-${cross_prefix}sdl-config}"
+ if "${SDL_CONFIG}" --version > /dev/null 2>&1; then
+     sdl_cflags=`"${SDL_CONFIG}" --cflags`
+     temp_cflags $sdl_cflags
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 618a3c4..1f9f472 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -12,9 +12,6 @@ FFMPEG_INSTALL_TARGET = YES
 FFMPEG_CONF_OPT = \
 	--prefix=/usr		\
 	--enable-shared 	\
-	--disable-ffmpeg	\
-	--disable-ffplay	\
-	--disable-ffserver	\
 	--disable-avfilter	\
 	--disable-postproc	\
 	--disable-swscale	\
@@ -32,6 +29,26 @@ else
 FFMPEG_CONF_OPT += --disable-nonfree
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG_FFMPEG),y)
+FFMPEG_CONF_OPT += --enable-ffmpeg
+else
+FFMPEG_CONF_OPT += --disable-ffmpeg
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_FFPLAY),y)
+FFMPEG_DEPENDENCIES += sdl
+FFMPEG_CONF_OPT += --enable-ffplay
+FFMPEG_CONF_ENV += SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
+else
+FFMPEG_CONF_OPT += --disable-ffplay
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_FFSERVER),y)
+FFMPEG_CONF_OPT += --enable-ffserver
+else
+FFMPEG_CONF_OPT += --disable-ffserver
+endif
+
 ifeq ($(BR2_PTHREADS_NONE),y)
 FFMPEG_CONF_OPT += --disable-pthreads
 else
-- 
1.7.1
