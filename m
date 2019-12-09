From: Paul Cercueil <paul@crapouillou.net>
Date: Mon,  9 Dec 2019 20:15:53 +0100
Subject: [Buildroot] [PATCH 1/2] SDL_mixer: Add option to prefer Tremor over
 libvorbis
Message-ID: <20191209191554.821230-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a menu option to set the Vorbis decoding library to Tremor instead
of libvorbis.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/sdl_mixer/Config.in    | 13 +++++++++++++
 package/sdl_mixer/sdl_mixer.mk |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/package/sdl_mixer/Config.in b/package/sdl_mixer/Config.in
index 42dfe63c0a..94fcda7a0e 100644
--- a/package/sdl_mixer/Config.in
+++ b/package/sdl_mixer/Config.in
@@ -9,3 +9,16 @@ config BR2_PACKAGE_SDL_MIXER
 	  SMPEG MP3 libraries.
 
 	  http://www.libsdl.org/projects/SDL_mixer/
+
+if BR2_PACKAGE_SDL_MIXER
+
+config BR2_PACKAGE_SDL_MIXER_USE_TREMOR
+	bool "Prefer Tremor for Vorbis decoding"
+	select BR2_PACKAGE_TREMOR
+	help
+	  Prefer Tremor over libvorbis for Vorbis decoding.
+	  Tremor is a fixed-point implementation of an Ogg Vorbis
+	  decoder. Choose this option if the target CPU has no
+	  FPU.
+
+endif
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 9183a4aa8c..3159d0dee1 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -35,11 +35,16 @@ else
 SDL_MIXER_CONF_OPTS += --disable-music-mp3-mad-gpl
 endif
 
+ifeq ($(BR2_PACKAGE_SDL_MIXER_USE_TREMOR),y)
+SDL_MIXER_CONF_OPTS += --enable-music-ogg-tremor
+SDL_MIXER_DEPENDENCIES += tremor
+else
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 SDL_MIXER_CONF_OPTS += --enable-music-ogg
 SDL_MIXER_DEPENDENCIES += libvorbis
 else
 SDL_MIXER_CONF_OPTS += --disable-music-ogg
 endif
+endif
 
 $(eval $(autotools-package))
-- 
2.24.0
