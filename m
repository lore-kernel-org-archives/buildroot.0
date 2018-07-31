From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 23:12:14 +0200
Subject: [Buildroot] [git commit] package: propagate pulseaudio dependencies
 correctly
Message-ID: <20180731210652.491FF8B353@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68161802eb53f0af58a274904aebfa115988a468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC dependency of
BR2_PACKAGE_PULSEAUDIO was not properly propagated to reverse
dependencies, causing the following kconfig warning:

warning: (BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO && BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE && BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE && BR2_PACKAGE_KODI_PULSEAUDIO && BR2_PACKAGE_MPD_PULSEAUDIO && BR2_PACKAGE_EFL_PULSEAUDIO) selects BR2_PACKAGE_PULSEAUDIO which has unmet direct dependencies (BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && !BR2_STATIC_LIBS && BR2_USE_MMU)

This commit fixes that by propagating the dependency as it should have
been done.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efl/Config.in                          |  5 +++++
 package/espeak/Config.in                       |  1 +
 package/gstreamer/gst-plugins-good/Config.in   |  7 +++++--
 package/gstreamer1/gst1-plugins-good/Config.in |  7 +++++--
 package/kodi/Config.in                         |  1 +
 package/mpd/Config.in                          | 12 +++++++++---
 6 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index e965d4d142..05be5aae56 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -97,6 +97,11 @@ config BR2_PACKAGE_EFL_LIBSNDFILE
 config BR2_PACKAGE_EFL_PULSEAUDIO
 	bool "Enable pulseaudio support (recommended)"
 	default y
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  The only audio output method supported by Ecore right now is
diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index 5e46b17e32..5f9007a165 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -35,6 +35,7 @@ config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
 	bool "pulseaudio"
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
 	select BR2_PACKAGE_PULSEAUDIO
 
 endchoice
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index e92cd0c5b2..3b2a99f5b4 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -205,11 +205,14 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
+	depends on BR2_USE_WCHAR # pulseaudio
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 
-comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
+comment "pulseaudio support needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 3bb98a4308..afb9a418d8 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -333,13 +333,16 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
+	depends on BR2_USE_WCHAR # pulseaudio
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  PulseAudio plugin library
 
-comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
+comment "pulseaudio support needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index d96d546bf9..5f9c95a7a0 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -192,6 +192,7 @@ config BR2_PACKAGE_KODI_NONFREE
 
 config BR2_PACKAGE_KODI_PULSEAUDIO
 	bool "pulseaudio"
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
 	# Pulseaudio support in kodi needs glib support in Pulseaudio,
 	# see FindPulseAudio.cmake. Kodi meets all dependencies of
 	# libglib2, so there is no need to propagate them here.
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1d50c7bf44..d3844391a2 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -264,13 +264,19 @@ config BR2_PACKAGE_MPD_OSS
 
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
-	depends on !BR2_STATIC_LIBS # pulseaudio
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
 
-comment "pulseaudio support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "pulseaudio support needs a toolchain w/ threads, wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_MPD_SHOUTCAST
 	bool "shoutcast"
