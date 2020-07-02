From: Paul Cercueil <paul@crapouillou.net>
Date: Thu,  2 Jul 2020 17:25:46 +0200
Subject: [Buildroot] [PATCH 1/2] sdl_mixer: add FluidSynth support
Message-ID: <20200702152547.258093-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for MIDI playback using FluidSynth.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/sdl_mixer/sdl_mixer.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 73eb821ff3..a35b184a23 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -23,10 +23,21 @@ SDL_MIXER_CONF_OPTS = \
 	--without-x \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--disable-music-midi \
+	--disable-music-native-midi \
+	--disable-music-timidity-midi \
 	--disable-music-mod \
 	--disable-music-mp3 \
 	--disable-music-flac # configure script fails when cross compiling
 
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
+SDL_MIXER_DEPENDENCIES += fluidsynth
+SDL_MIXER_CONF_OPTS += \
+	--enable-music-midi \
+	--enable-music-fluidsynth-midi
+else
+SDL_MIXER_CONF_OPTS += --disable-music-fluidsynth-midi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
 SDL_MIXER_CONF_OPTS += --enable-music-mp3-mad-gpl
 SDL_MIXER_DEPENDENCIES += libmad
-- 
2.27.0
