From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Jul 2010 08:57:09 +0200
Subject: [Buildroot] [git commit master 1/1] sdl_sound: needs iconv if
	!locale
Message-ID: <20100704065727.149FF82575@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d31046ec2667a109bae6e342d40d452cbd06b653
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl_sound/Config.in    |    1 +
 package/sdl_sound/sdl_sound.mk |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/sdl_sound/Config.in b/package/sdl_sound/Config.in
index 08ad754..542c996 100644
--- a/package/sdl_sound/Config.in
+++ b/package/sdl_sound/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SDL_SOUND
 	bool "SDL_sound"
 	depends on BR2_PACKAGE_SDL
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  SDL_sound is a library that handles the decoding of several
 	  popular sound file formats, such as .WAV and .MP3.
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 610e968..5058551 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -11,6 +11,10 @@ SDL_SOUND_INSTALL_STAGING:=YES
 SDL_SOUND_INSTALL_TARGET:=YES
 SDL_SOUND_DEPENDENCIES = sdl
 
+ifneq ($(BR2_ENABLE_LOCALE),y)
+SDL_SOUND_DEPENDENCIES += libiconv
+endif
+
 SDL_SOUND_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
 		--disable-sdltest \
-- 
1.7.1
