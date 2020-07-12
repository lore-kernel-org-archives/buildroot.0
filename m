From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 15:45:29 +0200
Subject: [Buildroot] [git commit] pakcage/sdl_mixer: add optional dependency
 on FluidSynth for MIDI
Message-ID: <20200712135154.A10A28684B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08319fe05b6ec4920a67d3401c83229e003bc2f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for MIDI playback using FluidSynth.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl_mixer/sdl_mixer.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 73eb821ff3..4cd13de2f6 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -22,11 +22,20 @@ SDL_MIXER_AUTORECONF = YES
 SDL_MIXER_CONF_OPTS = \
 	--without-x \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
-	--disable-music-midi \
 	--disable-music-mod \
 	--disable-music-mp3 \
 	--disable-music-flac # configure script fails when cross compiling
 
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
+SDL_MIXER_DEPENDENCIES += fluidsynth
+SDL_MIXER_CONF_OPTS += \
+	--enable-music-midi \
+	--enable-music-fluidsynth-midi
+else
+SDL_MIXER_CONF_OPTS += \
+	--disable-music-midi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
 SDL_MIXER_CONF_OPTS += --enable-music-mp3-mad-gpl
 SDL_MIXER_DEPENDENCIES += libmad
