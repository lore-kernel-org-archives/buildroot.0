From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 21:45:05 +0100
Subject: [Buildroot] [git commit] libsndfile: Add dependency on BR2_LARGEFILE
Message-ID: <20130205204626.192FC9A9A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f8e537d4329832fbe6e62e52ecfee8c41673f7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsndfile requires sizeof(sf_count_t) == 8, where sf_count_t is a
typedef alias for off_t. This is not true by default for all
tool-chains, which leads to a runtime assert failure in binaries
compiled against libsndfile. See:

  http://permalink.gmane.org/gmane.comp.audio.libsndfile.devel/229

Add a dependency on BR2_LARGEFILE for libsndfile, and a comment if
BR2_LARGEFILE is not selected.

[Thomas: rebased patch, added more propagation of the new
BR2_LARGEFILE dependency to gst-plugins-good and mpd.]

Signed-off-by: Ryan Mallon <rmallon@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bluez_utils/Config.in                 |    4 ++++
 package/libsndfile/Config.in                  |    7 +++++++
 package/multimedia/gst-plugins-bad/Config.in  |    4 ++++
 package/multimedia/gst-plugins-good/Config.in |    1 +
 package/multimedia/mpd/Config.in              |    5 +++++
 package/multimedia/pulseaudio/Config.in       |    5 +++--
 6 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 7ca23fc..72b900c 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -22,9 +22,13 @@ config BR2_PACKAGE_BLUEZ_UTILS_AUDIO
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
index 9afe496..cdba70b 100644
--- a/package/libsndfile/Config.in
+++ b/package/libsndfile/Config.in
@@ -1,8 +1,15 @@
 config BR2_PACKAGE_LIBSNDFILE
 	bool "libsndfile"
+	# The absence of largefile doesn't prevent libsndfile to
+	# build, but at runtime the code assumes that off_t is 64
+	# bits, and asserts if not.
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
index 8cbe021..370259b 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -305,6 +305,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SNDFILE
 	bool "sndfile"
 	select BR2_PACKAGE_LIBSNDFILE
+	depends on BR2_LARGEFILE
+
+comment "gst-plugins-bad-plugin-sndfile requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 1498ed0..978aa0b 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -198,6 +198,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
+	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 2e44741..6e5c690 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
+	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
@@ -105,10 +106,14 @@ config BR2_PACKAGE_MPD_LIBSAMPLERATE
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
index eeb8b5a..03c2613 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	depends on BR2_LARGEFILE
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
@@ -18,5 +19,5 @@ config BR2_PACKAGE_PULSEAUDIO
 
 	  http://pulseaudio.org
 
-comment "pulseaudio requires a toolchain with WCHAR and threads support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "pulseaudio requires a toolchain with WCHAR, LARGEFILE and threads support"
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
