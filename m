From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 12:16:15 +0200
Subject: [Buildroot] [git commit] Revert "package/sdl2: disable altivec
	built-in function for PowerPC"
Message-ID: <20170415101705.8A4F280559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e53da0534ad0bb8d71d22b784fe654491be7e2b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bug discovered while packaging supertux is now fixed by the previous
patch but the issue can still be present in other C++11 package if
-std=c++11 is used on PPC with Altivec vectorization.

This reverts commit d2903aaf1314b50a8a10ce937d2b33c5c42e463e.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl2/sdl2.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 1db4e76..f8a3196 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -23,16 +23,6 @@ SDL2_CONF_OPTS += \
 # We must enable static build to get compilation successful.
 SDL2_CONF_OPTS += --enable-static
 
-# From https://bugs.debian.org/cgi-bin/bugreport.cgi/?bug=770670
-# "The problem lies within SDL_cpuinfo.h.  It includes altivec.h, which by
-# definition provides an unconditional vector, pixel and bool define in
-# standard-c++ mode.  In GNU-c++ mode this names are only defined
-# context-sensitive by cpp.  SDL_cpuinfo.h is included by SDL.h.
-# Including altivec.h makes arbitrary code break."
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-SDL2_CONF_OPTS += --disable-altivec
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 SDL2_DEPENDENCIES += udev
 SDL2_CONF_OPTS += --enable-libudev
