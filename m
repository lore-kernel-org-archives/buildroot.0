From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 09:22:49 +0200
Subject: [Buildroot] [git commit] pulseaudio: needs dynamic library support
Message-ID: <20150517072309.BA27880DF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ed9137fee544875fa6dca7c0369808ec4b274d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/75a/75a3380fdcce88f1f9f2a77c4f059787623919d7/
http://autobuild.buildroot.net/results/f4a/f4a22344bd5c8f59e6f8cacb6a549f8d8fe99af2/

Pulseaudio uses dlfcn.h, so it cannot work in a pure static environment.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-good/Config.in   |    5 +++--
 package/gstreamer1/gst1-plugins-good/Config.in |    5 +++--
 package/mpd/Config.in                          |    4 ++++
 package/pulseaudio/Config.in                   |    5 +++--
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 70ae9c1..0544b7c 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -205,13 +205,14 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
+	depends on !BR2_STATIC_LIBS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 
-comment "pulseaudio support needs a toolchain w/ threads"
+comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index b3929b4..6216c7f 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -312,15 +312,16 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
+	depends on !BR2_STATIC_LIBS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 	help
 	  PulseAudio plugin library
 
-comment "pulseaudio support needs a toolchain w/ threads"
+comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index b57aa55..ed036fe 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -238,10 +238,14 @@ config BR2_PACKAGE_MPD_OSS
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
+	depends on !BR2_STATIC_LIBS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
 
+comment "pulseaudio support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 comment "Miscellaneous plugins"
 
 config BR2_PACKAGE_MPD_AVAHI_SUPPORT
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index b2be9ab..63c8ca4 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
@@ -30,7 +31,7 @@ config BR2_PACKAGE_PULSEAUDIO_DAEMON
 
 endif
 
-comment "pulseaudio needs a toolchain w/ wchar, threads"
+comment "pulseaudio needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
