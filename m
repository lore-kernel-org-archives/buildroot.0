From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:29:37 +0200
Subject: [Buildroot] [git commit] package/fluidsynth: needs dynamic library
Message-ID: <20200813212441.D1FA1863DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=111a1c7091aed6f9da03c2a095bcc2f50a1ad32c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluidsynth/Config.in                  | 8 ++++++--
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index c1cb923489..7c8836b608 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_FLUIDSYNTH
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	# the .pc file installed by fluidsynth does not mention its
+	# indirect dependencies in Libs.private.
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  FluidSynth is a real-time software synthesizer based on the
@@ -115,6 +118,7 @@ config BR2_PACKAGE_FLUIDSYNTH_READLINE
 
 endif # BR2_PACKAGE_FLUIDSYNTH
 
-comment "fluidsynth needs a toolchain w/ threads, wchar"
+comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 6190cb5028..c6e4a547f1 100644
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
