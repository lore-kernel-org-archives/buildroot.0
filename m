From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Dec 2016 19:56:40 +0100
Subject: [Buildroot] [git commit] ffmpeg: fix build for ffplay
Message-ID: <20161206185828.33DA37F9E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d767ff85f2bf9b5e1fbcbad22f0cab6a6a606e6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has dropped SDL support for ffplay in favor of SDL2.
This results in silently not building ffplay even if it is selected
in Buildroot config.

[Peter: propagate !static dependency from sdl2]
Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/Config.in | 6 +++++-
 package/ffmpeg/ffmpeg.mk | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index e813595..b5850db 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -41,12 +41,16 @@ config BR2_PACKAGE_FFMPEG_FFMPEG
 config BR2_PACKAGE_FFMPEG_FFPLAY
 	bool "Build ffplay"
 	select BR2_PACKAGE_FFMPEG_SWSCALE
-	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_SDL2
+	depends on !BR2_STATIC_LIBS # sdl2
 	help
 	  FFplay is a very simple and portable media player using the
 	  FFmpeg libraries and the SDL library.
 	  It is mostly used as a testbed for the various FFmpeg APIs.
 
+comment "ffplay needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_FFMPEG_FFSERVER
 	bool "Build ffserver"
 	depends on BR2_USE_MMU # fork()
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 699de2a..a681192 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -80,9 +80,9 @@ FFMPEG_CONF_OPTS += --disable-ffmpeg
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_FFPLAY),y)
-FFMPEG_DEPENDENCIES += sdl
+FFMPEG_DEPENDENCIES += sdl2
 FFMPEG_CONF_OPTS += --enable-ffplay
-FFMPEG_CONF_ENV += SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
+FFMPEG_CONF_ENV += SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl2-config
 else
 FFMPEG_CONF_OPTS += --disable-ffplay
 endif
