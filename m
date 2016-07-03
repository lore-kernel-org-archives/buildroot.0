From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  3 Jul 2016 18:20:44 +0200
Subject: [Buildroot] [PATCH] package/pulseaudio: needs gcc >= 4.8
Message-ID: <1467562844-8629-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A toolchain with C++11 support is required since pulseaudio 9.0 [1]

Propagate this new dependency on packages selecting pulseaudio.

Fixes:
http://autobuild.buildroot.net/results/d89/d897a94a8b6a52eba03d04c24536f554a7643000

[1] https://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=aa02e1654bcdfa0677e19ab9bb27b44dc8bf26b9

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in                          | 1 +
 package/espeak/Config.in                       | 1 +
 package/gstreamer/gst-plugins-good/Config.in   | 4 +++-
 package/gstreamer1/gst1-plugins-good/Config.in | 4 +++-
 package/mpd/Config.in                          | 3 ++-
 package/pulseaudio/Config.in                   | 6 ++++--
 6 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 4ab1ec4..6e77580 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -86,6 +86,7 @@ config BR2_PACKAGE_EFL_LIBSNDFILE
 
 config BR2_PACKAGE_EFL_PULSEAUDIO
 	bool "Enable pulseaudio support (recommended)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	default y
diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index aed627a..b03ebb3 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
 	bool "pulseaudio"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 65f74e8..0041de3 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -204,6 +204,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
@@ -211,7 +212,8 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 95318d9..4a4724c 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -319,6 +319,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
@@ -328,7 +329,8 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 2ea21fc..457f266 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -253,6 +253,7 @@ config BR2_PACKAGE_MPD_OSS
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on !BR2_STATIC_LIBS # pulseaudio
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	help
@@ -260,7 +261,7 @@ config BR2_PACKAGE_MPD_PULSEAUDIO
 
 comment "pulseaudio support needs a toolchain w/ dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "Miscellaneous plugins"
 
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 20aa374..42cd3d5 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_JSON_C
@@ -31,7 +32,8 @@ config BR2_PACKAGE_PULSEAUDIO_DAEMON
 
 endif
 
-comment "pulseaudio needs a toolchain w/ wchar, threads, dynamic library"
+comment "pulseaudio needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-- 
2.5.5
