From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Apr 2020 13:39:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/fluidsynth: add sdl2 optional
 dependency
Message-ID: <20200424113928.213441-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sdl2 is an optional dependency (enabled by default) since version 2.1.0:
https://github.com/FluidSynth/fluidsynth/commit/978283bbf0309191a441121b7ea867e41e329d3b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluidsynth/Config.in     | 10 ++++++++++
 package/fluidsynth/fluidsynth.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index c1cb923489..9b4d05bbb9 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -86,6 +86,16 @@ comment "pulseaudio support needs a toolchain w/ dynamic library, wchar, threads
 	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS || !BR2_USE_MMU || !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_FLUIDSYNTH_SDL2
+	bool "sdl2"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_SDL2
+	help
+	  Enable SDL2 audio support.
+
+comment "SDL2 audio support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 comment "Misc options"
 
 config BR2_PACKAGE_FLUIDSYNTH_DBUS
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 2bd792dbaf..98eb1ad30c 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -66,4 +66,11 @@ else
 FLUIDSYNTH_CONF_OPTS += -Denable-readline=0
 endif
 
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_SDL2),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-sdl2=1
+FLUIDSYNTH_DEPENDENCIES += sdl2
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-sdl2=0
+endif
+
 $(eval $(cmake-package))
-- 
2.25.1
