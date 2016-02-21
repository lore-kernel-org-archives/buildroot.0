From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:27:53 +0100
Subject: [Buildroot] [git commit] package/sdl_sound: FLAC support depends on
	libogg
Message-ID: <20160221172808.F3C867FD6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91861878bf643168422cbe930f1d4379f5374c63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_sound/sdl_sound.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index faf88ae..6201967 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -17,8 +17,11 @@ SDL_SOUND_DEPENDENCIES += libiconv
 endif
 
 # optional dependencies
-ifeq ($(BR2_PACKAGE_FLAC),y)
-SDL_SOUND_DEPENDENCIES += flac # is only used if ogg is also enabled
+ifeq ($(BR2_PACKAGE_FLAC)$(BR2_PACKAGE_LIBOGG),yy)
+SDL_SOUND_CONF_OPTS += --enable-flac
+SDL_SOUND_DEPENDENCIES += flac libogg
+else
+SDL_SOUND_CONF_OPTS += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
