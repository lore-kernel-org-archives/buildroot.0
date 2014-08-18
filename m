From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:00:07 +0200
Subject: [Buildroot] [git commit] pulseaudio: add dependency on atomic
	operations
Message-ID: <20140818090640.287189D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8277bb18db21848a9d6dd05a31b0edf7d9363be1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes:
http://autobuild.buildroot.net/results/d463f3bf730a600a07ed6cd33695bf45e9fd3540/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
[yann.morin.1998 at free.fr: use the new symbol; remove comment strings]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-good/Config.in   |    6 ++++++
 package/gstreamer1/gst1-plugins-good/Config.in |    6 ++++++
 package/mpd/Config.in                          |    2 ++
 package/pulseaudio/Config.in                   |    2 ++
 4 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 36b15a8..3e25820 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -209,9 +209,15 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
 	depends on BR2_USE_MMU # pulseaudio
+	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 
+comment "pulseaudio support needs a toolchain w/ largefile, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
 	depends on BR2_USE_WCHAR # libsoup -> glib2
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index f44690c..22980dc 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -309,11 +309,17 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
 	depends on BR2_USE_MMU # pulseaudio
+	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 	help
 	  PulseAudio plugin library
 
+comment "pulseaudio support needs a toolchain w/ largefile, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
 	depends on BR2_USE_WCHAR # libsoup -> glib2
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index f5f5b34..b8a56b7 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -45,11 +45,13 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
+	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
 
 comment "pulseaudio support needs a toolchain w/ largefile"
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_MPD_BZIP2
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index ac6222c..4bf64c2 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_SPEEX
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
@@ -32,4 +33,5 @@ endif
 
 comment "pulseaudio needs a toolchain w/ wchar, largefile, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
