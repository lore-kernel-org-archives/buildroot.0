From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 23:24:00 +0100
Subject: [Buildroot] [git commit] package/fluidsynth: add sdl2 optional
 dependency
Message-ID: <20210107220624.BAA4686070@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cdf1941aec02e8809a28e66d828ba787462b24f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sdl2 is an optional dependency (enabled by default) since version 2.1.0:
https://github.com/FluidSynth/fluidsynth/commit/978283bbf0309191a441121b7ea867e41e329d3b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluidsynth/Config.in     | 10 ++++++++++
 package/fluidsynth/fluidsynth.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index 7c8836b608..5726e235e4 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -89,6 +89,16 @@ comment "pulseaudio support needs a toolchain w/ dynamic library, wchar, threads
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
index 5756df544c..c53c5d7649 100644
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
