From: Paul Cercueil <paul@crapouillou.net>
Date: Thu,  2 Jul 2020 17:25:47 +0200
Subject: [Buildroot] [PATCH 2/2] sdl_mixer: add MIDI support using Timidity
In-Reply-To: <20200702152547.258093-1-paul@crapouillou.net>
References: <20200702152547.258093-1-paul@crapouillou.net>
Message-ID: <20200702152547.258093-2-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add MIDI playback support using SDL_mixer' built-in Timidity synth.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/sdl_mixer/Config.in    | 10 ++++++++++
 package/sdl_mixer/sdl_mixer.mk |  9 ++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/sdl_mixer/Config.in b/package/sdl_mixer/Config.in
index 42dfe63c0a..a886b7c1ac 100644
--- a/package/sdl_mixer/Config.in
+++ b/package/sdl_mixer/Config.in
@@ -9,3 +9,13 @@ config BR2_PACKAGE_SDL_MIXER
 	  SMPEG MP3 libraries.
 
 	  http://www.libsdl.org/projects/SDL_mixer/
+
+if BR2_PACKAGE_SDL_MIXER
+
+config BR2_PACKAGE_SDL_MIXER_MIDI_TIMIDITY
+	bool "MIDI support with built-in Timidity synth"
+	help
+	  Support MIDI audio using the built-in synth based on Timidity.
+	  You will need MIDI instruments installed in the filesystem.
+
+endif
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index a35b184a23..c415f837b1 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -24,11 +24,18 @@ SDL_MIXER_CONF_OPTS = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--disable-music-midi \
 	--disable-music-native-midi \
-	--disable-music-timidity-midi \
 	--disable-music-mod \
 	--disable-music-mp3 \
 	--disable-music-flac # configure script fails when cross compiling
 
+ifeq ($(BR2_PACKAGE_SDL_MIXER_MIDI_TIMIDITY),y)
+SDL_MIXER_CONF_OPTS += \
+	--enable-music-midi \
+	--enable-music-timidity-midi
+else
+SDL_MIXER_CONF_OPTS += --disable-music-timidity-midi
+endif
+
 ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
 SDL_MIXER_DEPENDENCIES += fluidsynth
 SDL_MIXER_CONF_OPTS += \
-- 
2.27.0
