From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Mar 2017 22:59:01 +0100
Subject: [Buildroot] [PATCH v5 4/4] Revert "package/sdl2: disable altivec
	built-in function for PowerPC"
In-Reply-To: <20170325215901.15044-1-romain.naour@gmail.com>
References: <20170325215901.15044-1-romain.naour@gmail.com>
Message-ID: <20170325215901.15044-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bug discover while packaging supertux is now fixed by the previous
patch but the issue can still be present in other C++11 package if
-std=c++11 is used on PPC with Altivec vectorization.

This reverts commit d2903aaf1314b50a8a10ce937d2b33c5c42e463e.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/sdl2/sdl2.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 628d906..d2ee50d 100644
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
-- 
2.9.3
