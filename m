From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  8 Sep 2017 19:07:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: bump version to 11.0
Message-ID: <20170908170725.12590-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/10.0/
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/11.0/

Dependency to json-c was dropped, updated reverse dependencies as well
and added optional dependency to libatomic_ops
https://cgit.freedesktop.org/pulseaudio/pulseaudio/tree/configure.ac#n250
when __sync_bool_compare_and_swap is not available.

Removed patch applied upstream:
0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/efl/Config.in                              |  1 -
 package/espeak/Config.in                           |  1 -
 package/gstreamer/gst-plugins-good/Config.in       |  1 -
 package/gstreamer1/gst1-plugins-good/Config.in     |  1 -
 package/kodi/Config.in                             |  1 -
 package/mpd/Config.in                              |  1 -
 ...-C-11-is-only-required-for-WebRTC-support.patch | 41 ----------------------
 package/pulseaudio/Config.in                       | 15 ++++++--
 package/pulseaudio/pulseaudio.hash                 |  8 +++--
 package/pulseaudio/pulseaudio.mk                   | 20 +++++------
 10 files changed, 26 insertions(+), 64 deletions(-)
 delete mode 100644 package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 6ea57dc94..cfb803c6d 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -97,7 +97,6 @@ config BR2_PACKAGE_EFL_LIBSNDFILE
 config BR2_PACKAGE_EFL_PULSEAUDIO
 	bool "Enable pulseaudio support (recommended)"
 	default y
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  The only audio output method supported by Ecore right now is
diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index 6a8f1d409..5e46b17e3 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -35,7 +35,6 @@ config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
 	bool "pulseaudio"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 
 endchoice
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index a36481a1c..f593b751e 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -205,7 +205,6 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 9d23e9f87..7c50428c8 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -320,7 +320,6 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  PulseAudio plugin library
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a3b771014..851e89c71 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -194,7 +194,6 @@ config BR2_PACKAGE_KODI_NONFREE
 
 config BR2_PACKAGE_KODI_PULSEAUDIO
 	bool "pulseaudio"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	# Pulseaudio support in kodi needs glib support in Pulseaudio,
 	# see FindPulseAudio.cmake. Kodi meets all dependencies of
 	# libglib2, so there is no need to propagate them here.
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 0c73548fb..9da623a5e 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -274,7 +274,6 @@ config BR2_PACKAGE_MPD_OSS
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on !BR2_STATIC_LIBS # pulseaudio
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
diff --git a/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch b/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
deleted file mode 100644
index b2c065196..000000000
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
index 0adfd88c7..6600006a6 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -1,13 +1,22 @@
+config BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
+	bool
+	default y if BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS || \
+		BR2_TOOLCHAIN_HAS_SYNC_4
+
+config BR2_PACKAGE_PULSEAUDIO_ENABLE_ATOMIC
+	bool
+	select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_TOOLCHAIN_HAS_SYNC_4
+
 config BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTOOL
-	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
+	select BR2_PACKAGE_PULSEAUDIO_ENABLE_ATOMIC
 	select BR2_PACKAGE_SPEEX
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
@@ -33,5 +42,5 @@ endif
 
 comment "pulseaudio needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index 0ef825d83..491fb2031 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,3 +1,5 @@
-# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-9.0.tar.xz.{md5,sha1}
-md5 da7162541b3a9bc20576dbd0d7d1489a  pulseaudio-9.0.tar.xz
-sha1 d9a9d7cb667ed95ee1de4b6544d5c7444c5a0064  pulseaudio-9.0.tar.xz
+# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-11.0.tar.xz.{md5,sha1}
+md5 c5fe1cd05f5306b1a0fba5099f0e9e37  pulseaudio-11.0.tar.xz
+sha1 df04f9ffb3fc1de9255f8b88e5d824fcd942607d  pulseaudio-11.0.tar.xz
+# Locally computed
+sha256 072305d4018fc5e75bb1b45ee6b938fa52fc9fd27493bf327415ef89ed14c969  pulseaudio-11.0.tar.xz
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index c627c4b5b..79ffbb3f3 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 9.0
+PULSEAUDIO_VERSION = 11.0
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
@@ -49,6 +40,13 @@ else
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
 PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/bin/orcc
-- 
2.11.0
