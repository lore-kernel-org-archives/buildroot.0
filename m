From: Maarten ter Huurne <maarten@treewalker.org>
Date: Sat, 18 Oct 2014 05:19:18 +0200
Subject: [Buildroot] [PATCH] sdl_mixer: Enable support for libmodplug
Message-ID: <1413602358-7476-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 .../sdl_mixer/sdl_mixer-0001-modplug-include.patch | 33 ++++++++++++++++++++++
 package/sdl_mixer/sdl_mixer.mk                     |  7 +++++
 2 files changed, 40 insertions(+)
 create mode 100644 package/sdl_mixer/sdl_mixer-0001-modplug-include.patch

diff --git a/package/sdl_mixer/sdl_mixer-0001-modplug-include.patch b/package/sdl_mixer/sdl_mixer-0001-modplug-include.patch
new file mode 100644
index 0000000..20a475f
--- /dev/null
+++ b/package/sdl_mixer/sdl_mixer-0001-modplug-include.patch
@@ -0,0 +1,33 @@
+Fix the modplug include path
+
+Since libmodplug 0.8.8.5, the cflags reported by pkg-config no longer
+add the "libmodplug" dir, so the #include directive must contain that
+path instead.
+
+Upstream status: the SDL-1.2 branch seems to be unmaintained
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+
+diff -ru SDL_mixer-1.2.12.org/configure.in sdl_mixer-1.2.12/configure.in
+--- SDL_mixer-1.2.12.org/configure.in	2012-01-15 23:01:05.000000000 +0100
++++ sdl_mixer-1.2.12/configure.in	2014-07-03 05:25:44.761854572 +0200
+@@ -315,7 +315,7 @@
+ 	EXTRA_CFLAGS="$EXTRA_CFLAGS -DMODPLUG_MUSIC  $MODPLUG_CFLAGS"
+ 	EXTRA_LDFLAGS="$EXTRA_LDFLAGS $MODPLUG_LIBS"
+ dnl	AC_TRY_COMPILE([
+-dnl     #include "modplug.h"
++dnl     #include "libmodplug/modplug.h"
+ dnl    ],[
+ dnl    ],[
+     have_libmodplug=yes
+diff -ru SDL_mixer-1.2.12.org/music_modplug.h sdl_mixer-1.2.12/music_modplug.h
+--- SDL_mixer-1.2.12.org/music_modplug.h	2012-01-15 23:01:05.000000000 +0100
++++ sdl_mixer-1.2.12/music_modplug.h	2014-07-03 05:26:03.919219618 +0200
+@@ -1,6 +1,6 @@
+ #ifdef MODPLUG_MUSIC
+ 
+-#include "modplug.h"
++#include "libmodplug/modplug.h"
+ #include "SDL_rwops.h"
+ #include "SDL_audio.h"
+ #include "SDL_mixer.h"
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index a602b6e..45ee6b6 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -20,6 +20,13 @@ SDL_MIXER_CONF_OPTS = \
 	--disable-music-mp3 \
 	--disable-music-flac # configure script fails when cross compiling
 
+ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
+SDL_MIXER_CONF_OPTS += --enable-music-mod-modplug
+SDL_MIXER_DEPENDENCIES += libmodplug
+else
+SDL_MIXER_CONF_OPTS += --disable-music-mod-modplug
+endif
+
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
 SDL_MIXER_CONF_OPTS += --enable-music-mp3-mad-gpl
 SDL_MIXER_DEPENDENCIES += libmad
-- 
1.8.4.5
