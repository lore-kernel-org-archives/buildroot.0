From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 23:58:36 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package: propagate
 pulseaudio dependencies correctly
Message-ID: <20180823215228.AA9048E4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e0db1a8800d8e1b0e391d2e8fdfaa02ec8af361
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC dependency of
BR2_PACKAGE_PULSEAUDIO was not properly propagated to reverse
dependencies, causing the following kconfig warning:

warning: (BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO && BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE && BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE && BR2_PACKAGE_KODI_PULSEAUDIO && BR2_PACKAGE_MPD_PULSEAUDIO && BR2_PACKAGE_EFL_PULSEAUDIO) selects BR2_PACKAGE_PULSEAUDIO which has unmet direct dependencies (BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && !BR2_STATIC_LIBS && BR2_USE_MMU)

This commit fixes that by propagating the dependency as it should have
been done.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 68161802eb53f0af58a274904aebfa115988a468)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/Config.in                          |  5 +++++
 package/espeak/Config.in                       |  1 +
 package/gstreamer/gst-plugins-good/Config.in   |  7 +++++--
 package/gstreamer1/gst1-plugins-good/Config.in |  7 +++++--
 package/kodi/Config.in                         |  1 +
 package/mpd/Config.in                          | 12 +++++++++---
 6 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index cfb803c6df..aa5749db05 100644
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
index 097f32d779..4f83d00a48 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -321,13 +321,16 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
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
index 071c03d640..992b155f29 100644
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
index 5991b6f4bb..31afb49602 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -254,13 +254,19 @@ config BR2_PACKAGE_MPD_OSS
 
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
