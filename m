From: Ryan Mallon <rmallon@gmail.com>
Date: Mon, 24 Sep 2012 08:58:15 +1000
Subject: [Buildroot] [PATCH] libsndfile: Add dependency on BR2_LARGEFILE
Message-ID: <505F9407.7000206@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsndfile requires sizeof(sf_count_t) == 8, where sf_count_t is a
typedef alias for off_t. This is not true by default for all
tool-chains, which leads to a runtime assert failure in binaries
compiled against libsndfile. See:
    
  http://permalink.gmane.org/gmane.comp.audio.libsndfile.devel/229
    
Add a dependency on BR2_LARGEFILE for libsndfile, and a comment if
BR2_LARGEFILE is not selected.
    
Signed-off-by: Ryan Mallon <rmallon@gmail.com>
---

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 9836b21..d324ba3 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -20,9 +20,13 @@ config BR2_PACKAGE_BLUEZ_UTILS_AUDIO
 	bool "audio support"
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_LIBSNDFILE
+	depends on BR2_LARGEFILE
 	help
 	  Audio support
 
+comment "bluez-utils audio requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_BLUEZ_UTILS_USB
 	bool "USB support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/libsndfile/Config.in b/package/libsndfile/Config.in
index 9afe496..21e1591 100644
--- a/package/libsndfile/Config.in
+++ b/package/libsndfile/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBSNDFILE
 	bool "libsndfile"
+	depends on BR2_LARGEFILE
 	help
 	  Libsndfile is a C library for reading and writing files containing
 	  sampled sound (such as MS Windows WAV and the Apple/SGI AIFF format)
 	  through one standard library interface.
 
 	  http://www.mega-nerd.com/libsndfile/
+
+comment "libsndfile requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 7784ad7..f767ed4 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -297,6 +297,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SNDFILE
 	bool "sndfile"
 	select BR2_PACKAGE_LIBSNDFILE
+	depends on BR2_LARGEFILE
+
+comment "gst-plugins-bad-plugin-sndfile requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 5d08182..d84b547 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -104,10 +104,14 @@ config BR2_PACKAGE_MPD_LIBSAMPLERATE
 config BR2_PACKAGE_MPD_LIBSNDFILE
 	bool "libsndfile"
 	select BR2_PACKAGE_LIBSNDFILE
+	depends on BR2_LARGEFILE
 	help
 	  Enable libsndfile input/streaming support.
 	  Select this if you want to play back WAV files.
 
+comment "mpd-libsndfile requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_MPD_MAD
 	bool "mad"
 	default y
diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 6c767bb..971fc9d 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	depends on BR2_LARGEFILE
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
@@ -17,5 +18,8 @@ config BR2_PACKAGE_PULSEAUDIO
 
 	  http://pulseaudio.org
 
+comment "pulseaudio depends on a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
 comment "pulseaudio requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
