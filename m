From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 21:54:25 +0100
Subject: [Buildroot] [git commit] package/sdl2: disable altivec built-in
	function for PowerPC
Message-ID: <20170301205443.C236B821E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2903aaf1314b50a8a10ce937d2b33c5c42e463e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in this bug report [1], altivec support in SDL break
arbitrary C++ code.

Issue reported by test-pkg script while testing supertux package:
    error: could not convert 'true' from 'bool' to '__vector(4) __bool int'

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi/?bug=770670

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl2/sdl2.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index d2ee50d..628d906 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -23,6 +23,16 @@ SDL2_CONF_OPTS += \
 # We must enable static build to get compilation successful.
 SDL2_CONF_OPTS += --enable-static
 
+# From https://bugs.debian.org/cgi-bin/bugreport.cgi/?bug=770670
+# "The problem lies within SDL_cpuinfo.h.  It includes altivec.h, which by
+# definition provides an unconditional vector, pixel and bool define in
+# standard-c++ mode.  In GNU-c++ mode this names are only defined
+# context-sensitive by cpp.  SDL_cpuinfo.h is included by SDL.h.
+# Including altivec.h makes arbitrary code break."
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
+SDL2_CONF_OPTS += --disable-altivec
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 SDL2_DEPENDENCIES += udev
 SDL2_CONF_OPTS += --enable-libudev
