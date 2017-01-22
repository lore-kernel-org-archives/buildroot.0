From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 Jan 2017 15:16:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: bump version to 10.0
Message-ID: <20170122141637.18048-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/10.0/

Dependency to json-c was dropped, updated reverse dependencies as well.
Added optional dependency to libatomic_ops.

Removed patch which was applied upstream:
0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/efl/Config.in                              |  1 -
 package/espeak/Config.in                           |  1 -
 package/gstreamer/gst-plugins-good/Config.in       |  2 --
 package/gstreamer1/gst1-plugins-good/Config.in     |  2 --
 package/mpd/Config.in                              |  2 --
 ...-C-11-is-only-required-for-WebRTC-support.patch | 41 ----------------------
 package/pulseaudio/Config.in                       |  4 +--
 package/pulseaudio/pulseaudio.hash                 |  8 +++--
 package/pulseaudio/pulseaudio.mk                   | 20 +++++------
 9 files changed, 15 insertions(+), 66 deletions(-)
 delete mode 100644 package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch

diff --git a/package/efl/Config.in b/package/efl/Config.in
index f6ec579541..4f5b381064 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -87,7 +87,6 @@ config BR2_PACKAGE_EFL_LIBSNDFILE
 
 config BR2_PACKAGE_EFL_PULSEAUDIO
 	bool "Enable pulseaudio support (recommended)"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	default y
 	help
diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index aed627af92..286f1c4bcb 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -32,7 +32,6 @@ config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
 	bool "pulseaudio"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 
 endchoice
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 65f74e819d..323c77bdd7 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -204,13 +204,11 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 27f24f5e73..d13517025a 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -319,7 +319,6 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 	help
@@ -327,7 +326,6 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 9b22f68cef..3ba31fe406 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -252,13 +252,11 @@ config BR2_PACKAGE_MPD_OSS
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on !BR2_STATIC_LIBS # pulseaudio
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
 
 comment "pulseaudio support needs a toolchain w/ dynamic library"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_MPD_SHOUTCAST
diff --git a/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch b/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
deleted file mode 100644
index b2c065196b..0000000000
--- a/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7af6cbe74d48a9853b60b029d4ce38a963386138 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 3 Jul 2016 20:19:48 +0200
-Subject: [PATCH] webrtc: C++11 is only required for WebRTC support
-
-Make C++11 support optional and explicitely check for gnu++11.
-
-Stop the build only if no C++11 support has been found and WebRTC
-support has been resquested.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4edc8e0..fea93a9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -84,7 +84,7 @@ AM_PROG_CC_C_O
- # Only required if you want the WebRTC canceller -- no runtime dep on
- # libstdc++ otherwise
- AC_PROG_CXX
--AX_CXX_COMPILE_STDCXX_11
-+AX_CXX_COMPILE_STDCXX_11([ext],[optional])
- AC_PROG_GCC_TRADITIONAL
- AC_USE_SYSTEM_EXTENSIONS
- 
-@@ -1414,6 +1414,9 @@ fi
- AC_ARG_ENABLE([webrtc-aec],
-     AS_HELP_STRING([--enable-webrtc-aec], [Enable the optional WebRTC-based echo canceller]))
- 
-+AS_IF([test "x$enable_webrtc_aec" = "xyes" && test "$HAVE_CXX11" = "0"],
-+    [AC_MSG_ERROR([*** webrtc-audio-processing needs C++11 support])])
-+
- AS_IF([test "x$enable_webrtc_aec" != "xno"],
-     [PKG_CHECK_MODULES(WEBRTC, [ webrtc-audio-processing >= 0.2 ], [HAVE_WEBRTC=1], [HAVE_WEBRTC=0])],
-     [HAVE_WEBRTC=0])
--- 
-2.5.5
-
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 20aa374fce..2d1debdb41 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -3,9 +3,8 @@ config BR2_PACKAGE_PULSEAUDIO
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_LIBTOOL
-	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
 	depends on BR2_USE_MMU # fork()
@@ -33,5 +32,4 @@ endif
 
 comment "pulseaudio needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index 0ef825d83a..4a255e5c7d 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,3 +1,5 @@
-# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-9.0.tar.xz.{md5,sha1}
-md5 da7162541b3a9bc20576dbd0d7d1489a  pulseaudio-9.0.tar.xz
-sha1 d9a9d7cb667ed95ee1de4b6544d5c7444c5a0064  pulseaudio-9.0.tar.xz
+# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-10.0.tar.xz.{md5,sha1}
+md5 4950d2799bf55ab91f6b7f990b7f0971  pulseaudio-10.0.tar.xz
+sha1 ab7cc41a2dc2b9da0794e3a51a4eb7e82e7da511  pulseaudio-10.0.tar.xz
+# Locally computed
+sha256 a3186824de9f0d2095ded5d0d0db0405dc73133983c2fbb37291547e37462f57  pulseaudio-10.0.tar.xz
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 74a028be45..82bbc60cdd 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 9.0
+PULSEAUDIO_VERSION = 10.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
@@ -15,17 +15,8 @@ PULSEAUDIO_CONF_OPTS = \
 	--disable-legacy-database-entry-format \
 	--disable-manpages
 
-# Make sure we don't detect libatomic_ops. Indeed, since pulseaudio
-# requires json-c, which needs 4 bytes __sync builtins, there should
-# be no need for pulseaudio to rely on libatomic_ops.
-PULSEAUDIO_CONF_ENV += \
-	ac_cv_header_atomic_ops_h=no
-
-# 0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
-PULSEAUDIO_AUTORECONF = YES
-
 PULSEAUDIO_DEPENDENCIES = \
-	host-pkgconf libtool json-c libsndfile speex host-intltool \
+	host-pkgconf libtool libsndfile speex host-intltool \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
@@ -50,6 +41,13 @@ else
 PULSEAUDIO_CONF_OPTS += --disable-jack
 endif
 
+ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
+PULSEAUDIO_DEPENDENCIES += libatomic_ops
+ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
+PULSEAUDIO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DAO_NO_SPARC_V9"
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 PULSEAUDIO_DEPENDENCIES += orc
 PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/usr/bin/orcc
-- 
2.11.0
