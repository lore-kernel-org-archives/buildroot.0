From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Dec 2019 10:31:17 +0100
Subject: [Buildroot] [git commit] SDL_mixer: Add support for libmodplug
Message-ID: <20191211141815.102BA890D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78a2456e32d26d33c93eebf52d01875b21bddfd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for playing back tracker modules using libmodplug.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../sdl_mixer/0003-Fix-include-of-modplug.h.patch  | 33 ++++++++++++++++++++++
 package/sdl_mixer/sdl_mixer.mk                     |  7 +++++
 2 files changed, 40 insertions(+)

diff --git a/package/sdl_mixer/0003-Fix-include-of-modplug.h.patch b/package/sdl_mixer/0003-Fix-include-of-modplug.h.patch
new file mode 100644
index 0000000000..841cef4ef5
--- /dev/null
+++ b/package/sdl_mixer/0003-Fix-include-of-modplug.h.patch
@@ -0,0 +1,33 @@
+From fb8e7c535a88838cc8ae364cd2a099df6316d3b0 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul@crapouillou.net>
+Date: Tue, 30 Apr 2019 23:12:15 +0200
+Subject: [PATCH] Fix include of modplug.h
+
+The include path should be <libmodplug/modplug.h>, since the library
+doesn't provide any specific include path in its pkg-config file.
+
+This patch was obtained from this bug report:
+https://bugzilla.libsdl.org/show_bug.cgi?id=4893
+
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+
+---
+ music_modplug.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/music_modplug.h b/music_modplug.h
+index 92cbafd..49abbb0 100644
+--- a/music_modplug.h
++++ b/music_modplug.h
+@@ -1,6 +1,7 @@
+ #ifdef MODPLUG_MUSIC
+ 
+-#include "modplug.h"
++#include <libmodplug/modplug.h>
++
+ #include "SDL_rwops.h"
+ #include "SDL_audio.h"
+ #include "SDL_mixer.h"
+-- 
+2.21.0.593.g511ec345e18
+
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 9183a4aa8c..81ace86498 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -35,6 +35,13 @@ else
 SDL_MIXER_CONF_OPTS += --disable-music-mp3-mad-gpl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
+SDL_MIXER_CONF_OPTS += --enable-music-mod-modplug
+SDL_MIXER_DEPENDENCIES += libmodplug
+else
+SDL_MIXER_CONF_OPTS += --disable-music-mod-modplug
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 SDL_MIXER_CONF_OPTS += --enable-music-ogg
 SDL_MIXER_DEPENDENCIES += libvorbis
