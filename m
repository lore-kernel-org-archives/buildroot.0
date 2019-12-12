From: Paul Cercueil <paul@crapouillou.net>
Date: Thu, 12 Dec 2019 18:18:59 +0100
Subject: [Buildroot] [PATCH v2] SDL_mixer: Prefer Tremor over libvorbis
Message-ID: <20191212171859.783617-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When Tremor is enabled, configure SDL_mixer to use this Vorbis decoding
library instead of libvorbis. Since Tremor does fixed-point math, it is
safe to assume that if it's enabled then it is faster than libvorbis on
the target architecture.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Remove Config.in option; enable Tremor support if Tremor is enabled
        in the config.

 package/sdl_mixer/sdl_mixer.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 81ace86498..d6f7b42deb 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -42,11 +42,16 @@ else
 SDL_MIXER_CONF_OPTS += --disable-music-mod-modplug
 endif
 
+ifeq ($(BR2_PACKAGE_TREMOR),y)
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
