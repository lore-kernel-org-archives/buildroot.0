From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue,  6 Dec 2016 15:32:37 +0100
Subject: [Buildroot] [PATCH 1/1] ffmpeg: fix build for ffplay
Message-ID: <1481034757-24066-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream has dropped SDL support for ffplay in favor of SDL2.
This results in silently not building ffplay even if it is selected
in Buildroot config.

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/ffmpeg/Config.in | 2 +-
 package/ffmpeg/ffmpeg.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index e813595..075ac12 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -41,7 +41,7 @@ config BR2_PACKAGE_FFMPEG_FFMPEG
 config BR2_PACKAGE_FFMPEG_FFPLAY
 	bool "Build ffplay"
 	select BR2_PACKAGE_FFMPEG_SWSCALE
-	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_SDL2
 	help
 	  FFplay is a very simple and portable media player using the
 	  FFmpeg libraries and the SDL library.
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
-- 
2.1.4
