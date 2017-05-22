From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 22 May 2017 15:13:05 +0200
Subject: [Buildroot] [PATCH 1/3] sdl2_mixer: new package
Message-ID: <20170522131307.27529-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |  1 +
 package/sdl2_mixer/Config.in       | 11 +++++++++++
 package/sdl2_mixer/sdl2_mixer.hash |  2 ++
 package/sdl2_mixer/sdl2_mixer.mk   | 40 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 package/sdl2_mixer/Config.in
 create mode 100644 package/sdl2_mixer/sdl2_mixer.hash
 create mode 100644 package/sdl2_mixer/sdl2_mixer.mk

diff --git a/package/Config.in b/package/Config.in
index 7991353f99..3eb05651c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -281,6 +281,7 @@ comment "Graphic libraries"
 	source "package/sdl2/Config.in"
 	source "package/sdl2_gfx/Config.in"
 	source "package/sdl2_image/Config.in"
+	source "package/sdl2_mixer/Config.in"
 	source "package/sdl2_ttf/Config.in"
 
 comment "Other GUIs"
diff --git a/package/sdl2_mixer/Config.in b/package/sdl2_mixer/Config.in
new file mode 100644
index 0000000000..e8cf4361f5
--- /dev/null
+++ b/package/sdl2_mixer/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SDL2_MIXER
+	bool "sdl2_mixer"
+	depends on BR2_PACKAGE_SDL2
+	help
+	  SDL_mixer is a sample multi-channel audio mixer library.
+	  It supports any number of simultaneously playing channels of
+	  16 bit stereo audio, plus a single channel of music, mixed by
+	  the popular FLAC, MikMod MOD, Timidity MIDI, Ogg Vorbis, and
+	  SMPEG MP3 libraries.
+
+	  http://www.libsdl.org/projects/SDL_mixer/
diff --git a/package/sdl2_mixer/sdl2_mixer.hash b/package/sdl2_mixer/sdl2_mixer.hash
new file mode 100644
index 0000000000..48bc887a4b
--- /dev/null
+++ b/package/sdl2_mixer/sdl2_mixer.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5a24f62a610249d744cbd8d28ee399d8905db7222bf3bdbc8a8b4a76e597695f  SDL2_mixer-2.0.1.tar.gz
diff --git a/package/sdl2_mixer/sdl2_mixer.mk b/package/sdl2_mixer/sdl2_mixer.mk
new file mode 100644
index 0000000000..c990847974
--- /dev/null
+++ b/package/sdl2_mixer/sdl2_mixer.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# sdl2_mixer
+#
+################################################################################
+
+SDL2_MIXER_VERSION = 2.0.1
+SDL2_MIXER_SOURCE = SDL2_mixer-$(SDL2_MIXER_VERSION).tar.gz
+SDL2_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
+SDL2_MIXER_LICENSE = Zlib
+SDL2_MIXER_LICENSE_FILES = COPYING.txt
+SDL2_MIXER_INSTALL_STAGING = YES
+SDL2_MIXER_DEPENDENCIES = sdl2 host-pkgconf
+
+SDL2_MIXER_CONF_OPTS = \
+	--disable-fluidsynth \
+	--disable-music-mp3
+
+ifeq ($(BR2_PACKAGE_FLAC),y)
+SDL2_MIXER_CONF_OPTS += --enable-music-flac
+SDL2_MIXER_DEPENDENCIES += flac
+else
+SDL2_MIXER_CONF_OPTS += --disable-music-flac
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
+SDL2_MIXER_CONF_OPTS += --enable-music-mod-modplug
+SDL2_MIXER_DEPENDENCIES += libmodplug
+else
+SDL2_MIXER_CONF_OPTS += --disable-music-mod-modplug
+endif
+
+ifeq ($(BR2_PACKAGE_TREMOR),y)
+SDL2_MIXER_CONF_OPTS += --enable-music-ogg-tremor
+SDL2_MIXER_DEPENDENCIES += tremor
+else
+SDL2_MIXER_CONF_OPTS += --disable-music-ogg-tremor
+endif
+
+$(eval $(autotools-package))
-- 
2.11.0
