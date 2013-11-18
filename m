From: sonic.adi at gmail.com <sonic.adi@gmail.com>
Date: Mon, 18 Nov 2013 17:41:13 +0800
Subject: [Buildroot] [PATCH v2] alsa-lib: Make alsa mixer lib depend on
	BR2_PREFER_STATIC_LIB.
Message-ID: <1384767673-8834-1-git-send-email-Sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

The mixer in ALSA library depends on runtime library loader which
doesn't available if building for static library.

Propagate this dependency to package alsa-utils, alsamixergui,
gstreamer, gstreamer1 and mpd as well.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/alsa-lib/Config.in                     | 1 +
 package/alsa-utils/Config.in                   | 8 ++++++--
 package/alsamixergui/Config.in                 | 3 ++-
 package/gstreamer/gst-plugins-base/Config.in   | 5 ++++-
 package/gstreamer1/gst1-plugins-base/Config.in | 5 ++++-
 package/mpd/Config.in                          | 5 ++++-
 6 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index df05240..58be7a8 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -51,6 +51,7 @@ config BR2_PACKAGE_ALSA_LIB_ALOAD
 config BR2_PACKAGE_ALSA_LIB_MIXER
 	bool "mixer"
 	default y
+	depends on !BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_ALSA_LIB_PCM
 	bool "pcm"
diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index db9f007..d47b892 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -24,25 +24,29 @@ config BR2_PACKAGE_ALSA_UTILS_ALSACTL
 
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
+	depends on BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_NCURSES_TARGET_FORM
 	select BR2_PACKAGE_NCURSES_TARGET_MENU
-	select BR2_PACKAGE_ALSA_LIB_MIXER
 	depends on BR2_USE_WCHAR
 	default y
 
 comment "alsamixer needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on !BR2_PACKAGE_ALSA_LIB_MIXER
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	bool "amidi"
 
 config BR2_PACKAGE_ALSA_UTILS_AMIXER
-	select BR2_PACKAGE_ALSA_LIB_MIXER
+	depends on BR2_PACKAGE_ALSA_LIB_MIXER
 	bool "amixer"
 
+comment "amixer needs alsa mixer lib"
+	depends on !BR2_PACKAGE_ALSA_LIB_MIXER
+
 config BR2_PACKAGE_ALSA_UTILS_APLAY
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	bool "aplay/arecord"
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index 5b61f38..a43265f 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_ALSAMIXERGUI
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fltk fork()
+	depends on BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_FLTK
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM
-	select BR2_PACKAGE_ALSA_LIB_MIXER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	bool "alsamixergui"
 	help
@@ -16,3 +16,4 @@ config BR2_PACKAGE_ALSAMIXERGUI
 comment "alsamixergui needs a toolchain w/ C++, threads"
 	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_ALSA_LIB_MIXER
diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
index 20c2d36..ae9e8b1 100644
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ b/package/gstreamer/gst-plugins-base/Config.in
@@ -75,10 +75,13 @@ comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA
 	bool "alsa (mandatory for audio playback)"
+	depends on BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_ALSA_LIB_PCM
 
+comment "alsa plugin needs alsa mixer lib"
+	depends on !BR2_PACKAGE_ALSA_LIB_MIXER
+
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
 	bool "ogg (*.ogg audio/video)"
 	select BR2_PACKAGE_LIBOGG
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 5b54bab..5dbb88b 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -109,12 +109,15 @@ comment "plugins with external dependencies"
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
 	bool "alsa (mandatory for audio playback)"
+	depends on BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	help
 	  ALSA plugin library
 
+comment "alsa plugin needs alsa mixer lib"
+	depends on !BR2_PACKAGE_ALSA_LIB_MIXER
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR
 	bool "tremor"
 	select BR2_PACKAGE_TREMOR
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 9314984..adb6bc7 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -21,11 +21,14 @@ config BR2_PACKAGE_MPD_ALSA
 	default y
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM
-	select BR2_PACKAGE_ALSA_LIB_MIXER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on BR2_PACKAGE_ALSA_LIB_MIXER
 	help
 	  Enable alsa output support.
 
+comment "alsa support needs alsa mixer library"
+	depends on !BR2_PACKAGE_ALSA_LIB_MIXER
+
 config BR2_PACKAGE_MPD_AO
 	bool "ao"
 	select BR2_PACKAGE_LIBAO
-- 
1.8.2.3
