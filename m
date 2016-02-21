From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:27:43 +0100
Subject: [Buildroot] [git commit] package/sdl_sound: add optional support
	for libmodplug
Message-ID: <20160221172808.D307A81801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57ace26b6c12a2602b56500e57abb2bc79e30bdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libmodplug was compiled before, sdl_sound will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libSDL_sound-1.0.so.1.0.2 | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libmodplug.so.1]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_sound/sdl_sound.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 416f381..faf88ae 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -21,6 +21,13 @@ ifeq ($(BR2_PACKAGE_FLAC),y)
 SDL_SOUND_DEPENDENCIES += flac # is only used if ogg is also enabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
+SDL_SOUND_CONF_OPTS += --enable-modplug
+SDL_SOUND_DEPENDENCIES += libmodplug
+else
+SDL_SOUND_CONF_OPTS += --disable-modplug
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 SDL_SOUND_DEPENDENCIES += libvorbis
 endif
