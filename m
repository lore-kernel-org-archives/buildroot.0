From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 21 Feb 2016 17:55:08 +0100
Subject: [Buildroot] [PATCH] package/sdl_mixer: disable libmad support for
	static build only
Message-ID: <1456073708-19562-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the discussion on the ML [1], all package using SDL_mixer will
unlikely forget to link with -lmad.

[...]sysroot/usr/lib/libSDL_mixer.a(music_mad.o): In function `read_next_frame':
music_mad.c:(.text+0xbc): undefined reference to `mad_stream_buffer'
music_mad.c:(.text+0xd0): undefined reference to `mad_frame_decode'
music_mad.c:(.text+0x134): undefined reference to `mad_timer_add'

Until SDL_mixer and other package using it are not fixed, disable libmad support
for static build only.

Fixes:
http://autobuild.buildroot.net/results/e09/e09ea3a64d396bbc855acf7c07fcbea28fb2395d

[1] http://lists.busybox.net/pipermail/buildroot/2016-February/153442.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Rodrigo Rebello <rprebello@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_mixer/sdl_mixer.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index a602b6e..3547799 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -20,7 +20,8 @@ SDL_MIXER_CONF_OPTS = \
 	--disable-music-mp3 \
 	--disable-music-flac # configure script fails when cross compiling
 
-ifeq ($(BR2_PACKAGE_LIBMAD),y)
+# disable libmad support for static build only.
+ifeq ($(BR2_PACKAGE_LIBMAD)x$(BR2_STATIC_LIBS),yx)
 SDL_MIXER_CONF_OPTS += --enable-music-mp3-mad-gpl
 SDL_MIXER_DEPENDENCIES += libmad
 else
-- 
2.5.0
