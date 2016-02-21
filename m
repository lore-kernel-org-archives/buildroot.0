From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 11:51:28 +0100
Subject: [Buildroot] [PATCH 7/7] package/sdl_sound: FLAC support depends on
	libogg
In-Reply-To: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456051888-2047-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the flac package itself libogg is an optional dependency, but for
flac support in sdl_sound libogg is mandatory:
http://hg.icculus.org/icculus/SDL_sound/file/394e3ec86164/configure.in#l263

To avoid compiling flac when libogg is disabled change the if-clause
in this package to reflect the real dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libSDL_sound-1.0.so.1.0.2 | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libFLAC.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libmodplug.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libogg.so.0]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sdl_sound/sdl_sound.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 0e7f44d..01753bd 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -17,8 +17,8 @@ SDL_SOUND_DEPENDENCIES += libiconv
 endif
 
 # optional dependencies
-ifeq ($(BR2_PACKAGE_FLAC),y)
-SDL_SOUND_DEPENDENCIES += flac # is only used if ogg is also enabled
+ifeq ($(BR2_PACKAGE_FLAC)$(BR2_PACKAGE_LIBOGG),yy)
+SDL_SOUND_DEPENDENCIES += flac libogg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
-- 
2.7.0
