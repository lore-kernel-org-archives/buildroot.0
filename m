From: Ryan Mallon <rmallon@gmail.com>
Date: Tue, 18 Sep 2012 16:13:15 +1000
Subject: [Buildroot] [PATCH] libsndfile: Add dependency on BR2_LARGEFILE
In-Reply-To: <20120918075551.5f3c294c@skate>
References: <505801FF.20207@gmail.com> <20120918075551.5f3c294c@skate>
Message-ID: <505810FB.20004@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/09/12 15:55, Thomas Petazzoni wrote:
> Dear Ryan Mallon,
>
> On Tue, 18 Sep 2012 15:09:19 +1000, Ryan Mallon wrote:
>> libsndfile requires sizeof(sf_count_t) == 8, where sf_count_t is a
>> typedef alias for off_t. This is not true by default for all
>> tool-chains, which leads to a runtime assert failure in binaries
>> compiled against libsndfile. See:
>>     
>>   http://permalink.gmane.org/gmane.comp.audio.libsndfile.devel/229
>>     
>> Add a dependency on BR2_LARGEFILE for libsndfile, and a comment if
>> BR2_LARGEFILE is not selected.
>>     
>> Signed-off-by: Ryan Mallon <rmallon@gmail.com>
> Ok, looks better. But now you need to udpate all the reverse
> dependencies of libsndfile (i.e, all packages that select
> BR2_PACKAGE_LIBSNDFILE), to add the same BR2_LARGEFILE dependency. This
> concerns bluez_utils, gst-plugins-bad, mpd and pulseaudio.
>
> (Note: this problem should be simplified once we get Yann's work on
> the _AVAILABLE thing merged, but in the mean time, we have to handle
> those reverse dependencies manually).
>

Like this? I can repost in full if needed.

~Ryan

---

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index d63284d..3003277 100644
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
index c7c0cd7..ff9f573 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -103,10 +103,14 @@ config BR2_PACKAGE_MPD_LIBSAMPLERATE
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
index 6e6d64c..9e4084c 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
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
