From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 11:16:00 +0100
Subject: [Buildroot] [git commit] pulseaudio: remove BR2_ARCH_HAS_ATOMICS
	dependency
Message-ID: <20160206101651.A7EA9805BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7290dc1e87b23fe21c75c50b2238004273a0ec5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pulseaudio is able to either use the atomic __sync builtins from the
compiler, or to rely on libatomic_ops for atomic operations. However,
since it anyway selects json-c which requires the __sync built-ins, it
means using libatomic_ops is useless: even if you use libatomic_ops
for pulseaudio, you'd still get a link error in pulseaudio due to the
missing __sync built-in for the json-c library.

Also, since pulseaudio now inherits the BR2_TOOLCHAIN_HAS_SYNC_4 from
json-c, which matches the __sync built-in from pulseaudio, this
commit:

 - Drops the BR2_ARCH_HAS_ATOMICS dependency
 - Forces pulseaudio to not detect libatomic_ops
 - Propagates the removal of BR2_ARCH_HAS_ATOMICS dependency to
   pulseaudio's reverse dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/efl/Config.in                          | 1 -
 package/espeak/Config.in                       | 1 -
 package/gstreamer/gst-plugins-good/Config.in   | 2 --
 package/gstreamer1/gst1-plugins-good/Config.in | 2 --
 package/mpd/Config.in                          | 1 -
 package/pulseaudio/Config.in                   | 2 --
 package/pulseaudio/pulseaudio.mk               | 7 ++++++-
 7 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 21cbf5f..418f41e 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -81,7 +81,6 @@ config BR2_PACKAGE_EFL_LIBSNDFILE
 
 config BR2_PACKAGE_EFL_PULSEAUDIO
 	bool "Enable pulseaudio support (recommended)"
-	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	default y
diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index eebaf6f..aed627a 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -32,7 +32,6 @@ config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
 	bool "pulseaudio"
-	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index f169435..36ab6cb 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -204,7 +204,6 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
-	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
@@ -212,7 +211,6 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 6855c4b..2606b86 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -311,7 +311,6 @@ comment "gdkpixbuf needs a toolchain w/ wchar, threads"
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
-	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
@@ -321,7 +320,6 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 17f8e96..1da8243 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -250,7 +250,6 @@ config BR2_PACKAGE_MPD_OSS
 
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
-	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 4583d22..20aa374 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
@@ -34,6 +33,5 @@ endif
 
 comment "pulseaudio needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 8450090..86bbb2f 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -15,9 +15,14 @@ PULSEAUDIO_CONF_OPTS = \
 	--disable-legacy-database-entry-format \
 	--disable-manpages
 
+# Make sure we don't detect libatomic_ops. Indeed, since pulseaudio
+# requires json-c, which needs 4 bytes __sync builtins, there should
+# be no need for pulseaudio to rely on libatomic_ops.
+PULSE_AUDIO_CONF_ENV += \
+	ac_cv_header_atomic_ops_h=no
+
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool json-c libsndfile speex host-intltool \
-	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
