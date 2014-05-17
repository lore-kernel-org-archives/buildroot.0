From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 23:27:42 +0200
Subject: [Buildroot] [git commit] pulseaudio: uses fork(),
	not available on noMMU platforms
Message-ID: <20140517213137.33FAC9CC58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=382eef528e262ae15e6612a0bc4dded0c5c545e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though pulseaudio has some HAVE_FORK compile-time conditionals to
avoid using fork(), those parts of pulseaudio are not using it. Since
using pulseaudio on !MMU platforms is fairly unlikely, we simply
disable it when no MMU is available, and propagate this dependency to
the appropriate locations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-good/Config.in   |    1 +
 package/gstreamer1/gst1-plugins-good/Config.in |    1 +
 package/mpd/Config.in                          |    1 +
 package/pulseaudio/Config.in                   |    2 ++
 4 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 9c2b884..3ec93cf 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -207,6 +207,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
+	depends on BR2_USE_MMU # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 9fd6114..7159c5a 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -303,6 +303,7 @@ comment "gdkpixbuf needs a toolchain w/ wchar, threads"
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
+	depends on BR2_USE_MMU # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 	help
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 7237b89..1bf7ad1 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -48,6 +48,7 @@ config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
+	depends on BR2_USE_MMU # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index e5b9d8a..ac6222c 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
@@ -30,4 +31,5 @@ config BR2_PACKAGE_PULSEAUDIO_DAEMON
 endif
 
 comment "pulseaudio needs a toolchain w/ wchar, largefile, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
