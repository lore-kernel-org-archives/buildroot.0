From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Fri,  8 Aug 2014 19:09:30 +0400
Subject: [Buildroot] [PATCH v4 2/4] pulseaudio: Add dependency on atomic
	intrinsics
In-Reply-To: <1407510572-20603-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <In-Reply-To: <CAAXf6LURyGxEfQR+3g6xriwqUeE1E91Oav2X=r_C3YD66JzpEA@mail.gmail.com>
 <1407510572-20603-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1407510572-20603-2-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pulseaudio requires GCC built-in atomic functions which are architecture specific
and may not be implemented.

This fixes:
http://autobuild.buildroot.net/results/d463f3bf730a600a07ed6cd33695bf45e9fd3540/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/gstreamer/gst-plugins-good/Config.in   | 5 +++++
 package/gstreamer1/gst1-plugins-good/Config.in | 5 +++++
 package/mpd/Config.in                          | 5 +++--
 package/pulseaudio/Config.in                   | 6 ++++--
 4 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 2e81a6a..7ab9519 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -212,9 +212,14 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
 	depends on BR2_USE_MMU # pulseaudio
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 
+comment "pulseaudio support needs a toolchain w/ largefile, threads, atomic intrinsics"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
 	depends on BR2_USE_WCHAR # libsoup -> glib2
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index aa45ba7..71b0a37 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -308,11 +308,16 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
 	depends on BR2_USE_MMU # pulseaudio
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 	help
 	  PulseAudio plugin library
 
+comment "pulseaudio support needs a toolchain w/ largefile, threads, atomic intrinsics"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
 	depends on BR2_USE_WCHAR # libsoup -> glib2
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index f5f5b34..8382a5d 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -45,12 +45,13 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
 
-comment "pulseaudio support needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
+comment "pulseaudio support needs a toolchain w/ largefile, atomic intrinsics"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 
 config BR2_PACKAGE_MPD_BZIP2
 	bool "bzip2"
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index ac6222c..de99fc8 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_SPEEX
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
@@ -30,6 +31,7 @@ config BR2_PACKAGE_PULSEAUDIO_DAEMON
 
 endif
 
-comment "pulseaudio needs a toolchain w/ wchar, largefile, threads"
+comment "pulseaudio needs a toolchain w/ wchar, largefile, threads, atomic intrinsics"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
-- 
1.8.4.1
