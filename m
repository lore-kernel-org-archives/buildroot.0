From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 15 Jul 2020 23:57:33 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] package/fluidsynth: needs dynamic library
Message-ID: <20200715215734.999562-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

applications, such as mpd, fail to build statically with fluidsynth
because fluidsynth does not fill Libs.Private in their pkg-config file

Because fluidsynth is a cmake-package with many dependencies, it is not
easy to fix so just add a dynamic library dependency.

Here is an extract of src/CMakeLists.txt that gives the list of
fluidsynth possible dependencies:

target_link_libraries ( libfluidsynth
${GLIB_LIBRARIES}
${GMODULE_LIBRARIES}
${LASH_LIBRARIES}
${JACK_LIBRARIES}
${ALSA_LIBRARIES}
${PULSE_LIBRARIES}
${PORTAUDIO_LIBRARIES}
${LIBSNDFILE_LIBRARIES}
${SDL2_LIBRARIES}
${DBUS_LIBRARIES}
${READLINE_LIBS}
${DART_LIBS}
${COREAUDIO_LIBS}
${COREMIDI_LIBS}
${WINDOWS_LIBS}
${MidiShare_LIBS}
${OpenSLES_LIBS}
${OBOE_LIBS}
${LIBFLUID_LIBS}
${LIBINSTPATCH_LIBRARIES}
)

Fixes:
 - http://autobuild.buildroot.org/results/ec9dd2903359b9bf6b15c8cb69e732f8cb6c4d39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Propagate to BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
 - Add the list of dependencies in the commit message

 package/fluidsynth/Config.in                  | 6 ++++--
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index c1cb923489..4fcbfa7411 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FLUIDSYNTH
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  FluidSynth is a real-time software synthesizer based on the
@@ -115,6 +116,7 @@ config BR2_PACKAGE_FLUIDSYNTH_READLINE
 
 endif # BR2_PACKAGE_FLUIDSYNTH
 
-comment "fluidsynth needs a toolchain w/ threads, wchar"
+comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 08de5d2188..93e16ac806 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -395,6 +395,7 @@ comment "fdk-aac needs a toolchain w/ C++"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
 	bool "fluidsynth"
+	depends on !BR2_STATIC_LIBS # fluidsynth
 	depends on BR2_USE_WCHAR # fluidsynth
 	depends on BR2_TOOLCHAIN_HAS_THREADS # fluidsynth
 	depends on BR2_USE_MMU # fluidsynth
@@ -402,9 +403,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
 	help
 	  Fluidsynth MIDI decoder plugin
 
-comment "fluidsynth needs a toolchain w/ threads, wchar"
+comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
 	bool "gl"
-- 
2.27.0
