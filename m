From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 21:53:07 +0100
Subject: [Buildroot] [git commit] package/sdl_mixer: prefer tremor over
 libvorbis
Message-ID: <20191212204432.310E38A35B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcb32a0030d8bd2e3c53ed2881351c097c4b9517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When Tremor is enabled, configure SDL_mixer to use this Vorbis decoding
library instead of libvorbis. Since Tremor does fixed-point math, it is
safe to assume that if it's enabled then it is faster than libvorbis on
the target architecture.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl_mixer/sdl_mixer.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 81ace86498..0423817316 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -42,7 +42,10 @@ else
 SDL_MIXER_CONF_OPTS += --disable-music-mod-modplug
 endif
 
-ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+ifeq ($(BR2_PACKAGE_TREMOR),y)
+SDL_MIXER_CONF_OPTS += --enable-music-ogg-tremor
+SDL_MIXER_DEPENDENCIES += tremor
+else ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 SDL_MIXER_CONF_OPTS += --enable-music-ogg
 SDL_MIXER_DEPENDENCIES += libvorbis
 else
