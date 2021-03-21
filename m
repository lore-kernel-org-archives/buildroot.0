From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Sun, 21 Mar 2021 07:17:04 +0000
Subject: [Buildroot] [PATCH 1/1] package/sdl_mixer: Update to 15 Mar 2021
 version
Message-ID: <20210321071704.1740166-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest officially released version of SDL_mixer is 1.2.12, released in 2012.
Since then, there have been many bugfixes on master.

This commit points to the SDL-1.2 branch from 15 Mar 2021.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 ...ibs.private-field-to-pkg-config-file.patch | 23 +++++++------
 .../0002-add-LDFLAGS-while-linking.patch      | 29 ----------------
 ...0002-configure__set_macro_directory.patch} |  6 ++--
 .../0003-Fix-include-of-modplug.h.patch       | 33 -------------------
 package/sdl_mixer/sdl_mixer.hash              |  2 +-
 package/sdl_mixer/sdl_mixer.mk                |  9 +++--
 6 files changed, 21 insertions(+), 81 deletions(-)
 delete mode 100644 package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch
 rename package/sdl_mixer/{0004-configure__set_macro_directory.patch => 0002-configure__set_macro_directory.patch} (93%)
 delete mode 100644 package/sdl_mixer/0003-Fix-include-of-modplug.h.patch

diff --git a/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch b/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch
index e0e85710d9..073460018f 100644
--- a/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch
+++ b/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 1/1] Add 'Libs.private' field to pkg-config file
 In order to support static linking, SDL_mixer.pc should include a
 'Libs.private' field listing all the libraries that SDL_mixer requires.
 
-This patch adds such a field and also modifies configure.in so that
+This patch adds such a field and also modifies configure.ac so that
 EXTRA_LDFLAGS (which is now also used as the value of 'Libs.private')
 no longer includes SDL_LIBS. This is done so as to prevent libraries
 required by SDL from being listed twice when 'pkg-config --libs --static
@@ -20,14 +20,14 @@ Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
 ---
  Makefile.in     | 2 +-
  SDL_mixer.pc.in | 1 +
- configure.in    | 1 -
+ configure.ac    | 1 -
  3 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 3d10565..ce4efd4 100644
+index 027a99b..18015a2 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -63,7 +63,7 @@ $(objects):
+@@ -61,7 +61,7 @@ $(objects):
  .PHONY: all install install-hdrs install-lib install-bin uninstall uninstall-hdrs uninstall-lib uninstall-bin clean distclean dist
  
  $(objects)/$(TARGET): $(OBJECTS) $(VERSION_OBJECTS)
@@ -35,7 +35,7 @@ index 3d10565..ce4efd4 100644
 +	$(LIBTOOL) --mode=link $(CC) -o $@ $(OBJECTS) $(VERSION_OBJECTS) $(LDFLAGS) $(SDL_LIBS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS)
  
  $(objects)/playwave$(EXE): $(objects)/playwave.lo $(objects)/$(TARGET)
- 	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playwave.lo $(SDL_CFLAGS) $(SDL_LIBS) $(objects)/$(TARGET)
+ 	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playwave.lo $(SDL_CFLAGS) $(SDL_LIBS) $(LDFLAGS) $(objects)/$(TARGET)
 diff --git a/SDL_mixer.pc.in b/SDL_mixer.pc.in
 index 1c4965d..d793521 100644
 --- a/SDL_mixer.pc.in
@@ -47,11 +47,11 @@ index 1c4965d..d793521 100644
 +Libs.private: @EXTRA_LDFLAGS@
  Cflags: -I${includedir}/SDL
  
-diff --git a/configure.in b/configure.in
-index 2272b29..442eca6 100644
---- a/configure.in
-+++ b/configure.in
-@@ -202,7 +202,6 @@ AM_PATH_SDL($SDL_VERSION,
+diff --git a/configure.ac b/configure.ac
+index 01a3d83..3ad3b4f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -200,7 +200,6 @@ AM_PATH_SDL($SDL_VERSION,
              AC_MSG_ERROR([*** SDL version $SDL_VERSION not found!])
  )
  EXTRA_CFLAGS="$EXTRA_CFLAGS $SDL_CFLAGS"
@@ -60,5 +60,4 @@ index 2272b29..442eca6 100644
  dnl Check for math library
  AC_CHECK_LIB(m, pow, [LIBM="-lm"])
 -- 
-2.1.4
-
+2.27.0
diff --git a/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch b/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch
deleted file mode 100644
index 4144660741..0000000000
--- a/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Pass LDFLAGS while creating binaries.
-
-Fixes following linking error with uClibc-ng:
-br/output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o): In function `_Unwind_Find_FDE':
-br/output/build/host-gcc-final-5.4.0/build/powerpc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:465: undefined reference to `dl_iterate_phdr'
-collect2: error: ld returned 1 exit status
-
-Since uClibc-ng 1.0.18 a circular dependency between libc and libgcc
-exist, when static linking is used. It can be resolved by the compiler
-when -static is correctly passed in the linking step.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur SDL_mixer-1.2.12.orig/Makefile.in SDL_mixer-1.2.12/Makefile.in
---- SDL_mixer-1.2.12.orig/Makefile.in	2012-01-15 23:01:04.000000000 +0100
-+++ SDL_mixer-1.2.12/Makefile.in	2016-12-07 08:29:22.479786596 +0100
-@@ -66,10 +66,10 @@
- 	$(LIBTOOL) --mode=link $(CC) -o $@ $(OBJECTS) $(VERSION_OBJECTS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS)
- 
- $(objects)/playwave$(EXE): $(objects)/playwave.lo $(objects)/$(TARGET)
--	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playwave.lo $(SDL_CFLAGS) $(SDL_LIBS) $(objects)/$(TARGET)
-+	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playwave.lo $(SDL_CFLAGS) $(SDL_LIBS) $(LDFLAGS) $(objects)/$(TARGET)
- 
- $(objects)/playmus$(EXE): $(objects)/playmus.lo $(objects)/$(TARGET)
--	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playmus.lo $(SDL_CFLAGS) $(SDL_LIBS) $(objects)/$(TARGET)
-+	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playmus.lo $(SDL_CFLAGS) $(SDL_LIBS) $(LDFLAGS) $(objects)/$(TARGET)
- 
- install: all install-hdrs install-lib #install-bin
- install-hdrs:
diff --git a/package/sdl_mixer/0004-configure__set_macro_directory.patch b/package/sdl_mixer/0002-configure__set_macro_directory.patch
similarity index 93%
rename from package/sdl_mixer/0004-configure__set_macro_directory.patch
rename to package/sdl_mixer/0002-configure__set_macro_directory.patch
index 5b47f0e80d..9802333a1d 100644
--- a/package/sdl_mixer/0004-configure__set_macro_directory.patch
+++ b/package/sdl_mixer/0002-configure__set_macro_directory.patch
@@ -21,9 +21,9 @@ Fixes:
 
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 
-diff --git a/configure.in b/configure.in
---- a/configure.in
-+++ b/configure.in
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
 @@ -1,6 +1,7 @@
  dnl Process this file with autoconf to produce a configure script.
  AC_INIT(README)
diff --git a/package/sdl_mixer/0003-Fix-include-of-modplug.h.patch b/package/sdl_mixer/0003-Fix-include-of-modplug.h.patch
deleted file mode 100644
index 841cef4ef5..0000000000
--- a/package/sdl_mixer/0003-Fix-include-of-modplug.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From fb8e7c535a88838cc8ae364cd2a099df6316d3b0 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul@crapouillou.net>
-Date: Tue, 30 Apr 2019 23:12:15 +0200
-Subject: [PATCH] Fix include of modplug.h
-
-The include path should be <libmodplug/modplug.h>, since the library
-doesn't provide any specific include path in its pkg-config file.
-
-This patch was obtained from this bug report:
-https://bugzilla.libsdl.org/show_bug.cgi?id=4893
-
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
-
----
- music_modplug.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/music_modplug.h b/music_modplug.h
-index 92cbafd..49abbb0 100644
---- a/music_modplug.h
-+++ b/music_modplug.h
-@@ -1,6 +1,7 @@
- #ifdef MODPLUG_MUSIC
- 
--#include "modplug.h"
-+#include <libmodplug/modplug.h>
-+
- #include "SDL_rwops.h"
- #include "SDL_audio.h"
- #include "SDL_mixer.h"
--- 
-2.21.0.593.g511ec345e18
-
diff --git a/package/sdl_mixer/sdl_mixer.hash b/package/sdl_mixer/sdl_mixer.hash
index 5d7e7836cd..4ac5bfe7ea 100644
--- a/package/sdl_mixer/sdl_mixer.hash
+++ b/package/sdl_mixer/sdl_mixer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a	SDL_mixer-1.2.12.tar.gz
+sha256	b3c0f36500b23a6f5832d472f3e07b74f1d3f6bd00bf6700bc5e99babc9ba2ab	sdl_mixer-d1725fc.tar.gz
 sha256	bc4c3bc32b311044d81c32b5e5402a6bc971a3b235850bb63445ec14bb6fe59e	COPYING
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 9636c228ad..b478098ca5 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -4,9 +4,12 @@
 #
 ################################################################################
 
-SDL_MIXER_VERSION = 1.2.12
-SDL_MIXER_SOURCE = SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
-SDL_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
+# The latest officially released version of SDL_mixer is 1.2.12, released in 2012.
+# Since then, there have been many bugfixes on master.
+#
+# This commit points to the SDL-1.2 branch from 15 Mar 2021.
+SDL_MIXER_VERSION = d1725fc
+SDL_MIXER_SITE = $(call github,libsdl-org,SDL_mixer,$(SDL_MIXER_VERSION))
 SDL_MIXER_LICENSE = Zlib
 SDL_MIXER_LICENSE_FILES = COPYING
 
-- 
2.27.0
