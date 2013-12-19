From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 22:31:03 +0100
Subject: [Buildroot] [git commit] gstreamer packages: factorize dependency
	on gstreamer
Message-ID: <20131219213349.963DB9C10B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61cef6db35ab35546eb836fdb0a2f0494fac1782
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Proposed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/Config.in                  |    3 +++
 package/gstreamer/gst-dsp/Config.in          |    2 +-
 package/gstreamer/gst-ffmpeg/Config.in       |    2 --
 package/gstreamer/gst-fsl-plugins/Config.in  |    3 +--
 package/gstreamer/gst-omapfb/Config.in       |    2 +-
 package/gstreamer/gst-plugin-x170/Config.in  |    3 +--
 package/gstreamer/gst-plugins-bad/Config.in  |    1 -
 package/gstreamer/gst-plugins-base/Config.in |    1 -
 package/gstreamer/gst-plugins-good/Config.in |    1 -
 package/gstreamer/gst-plugins-ugly/Config.in |    1 -
 package/gstreamer/gstreamer/Config.in        |    6 ++++--
 11 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/package/gstreamer/Config.in b/package/gstreamer/Config.in
index 039d657..c6292f4 100644
--- a/package/gstreamer/Config.in
+++ b/package/gstreamer/Config.in
@@ -1,5 +1,7 @@
 # Gstreamer 0.10.x & Plugins
 source "package/gstreamer/gstreamer/Config.in"
+
+if BR2_PACKAGE_GSTREAMER
 source "package/gstreamer/gst-plugins-base/Config.in"
 source "package/gstreamer/gst-plugins-good/Config.in"
 source "package/gstreamer/gst-plugins-bad/Config.in"
@@ -9,3 +11,4 @@ source "package/gstreamer/gst-dsp/Config.in"
 source "package/gstreamer/gst-fsl-plugins/Config.in"
 source "package/gstreamer/gst-omapfb/Config.in"
 source "package/gstreamer/gst-plugin-x170/Config.in"
+endif
diff --git a/package/gstreamer/gst-dsp/Config.in b/package/gstreamer/gst-dsp/Config.in
index 590931a..102cf69 100644
--- a/package/gstreamer/gst-dsp/Config.in
+++ b/package/gstreamer/gst-dsp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GST_DSP
 	bool "gst-dsp"
-	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
+	depends on BR2_cortex_a8
 	select BR2_PACKAGE_TIDSP_BINARIES
 	help
 	  GStreamer plug-in to access TI OMAP3 DSP algorithms.
diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index 1d6a707..da254ef 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
@@ -14,5 +13,4 @@ config BR2_PACKAGE_GST_FFMPEG
 	  http://gstreamer.freedesktop.org/
 
 comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
-	depends on BR2_PACKAGE_GSTREAMER
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index a9034fa..4e2bbe4 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -1,11 +1,10 @@
 comment "gst-fsl-plugins needs an imx-specific Linux kernel to be built"
-	depends on BR2_arm && BR2_PACKAGE_GSTREAMER && !BR2_LINUX_KERNEL
+	depends on BR2_arm && !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_GST_FSL_PLUGINS
 	bool "gst-fsl-plugins"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_LIBFSLVPUWRAP
 	select BR2_PACKAGE_IMX_LIB
diff --git a/package/gstreamer/gst-omapfb/Config.in b/package/gstreamer/gst-omapfb/Config.in
index e603cb1..cfe5bba 100644
--- a/package/gstreamer/gst-omapfb/Config.in
+++ b/package/gstreamer/gst-omapfb/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GST_OMAPFB
 	bool "gst-omapfb"
-	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
+	depends on BR2_cortex_a8
 	help
 	  GStreamer plug-in to use OMAP framebuffer.
 
diff --git a/package/gstreamer/gst-plugin-x170/Config.in b/package/gstreamer/gst-plugin-x170/Config.in
index d7fe96a..ed668c6 100644
--- a/package/gstreamer/gst-plugin-x170/Config.in
+++ b/package/gstreamer/gst-plugin-x170/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_GST_PLUGIN_X170
 	bool "gst-plugin-x170"
-	depends on BR2_PACKAGE_GSTREAMER
 	depends on BR2_arm926t
 	# glibc toolchain includes WCHAR and threading for libglib2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # on2-8170-libs
@@ -12,5 +11,5 @@ config BR2_PACKAGE_GST_PLUGIN_X170
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 
 comment "gst-plugin-x170 needs an (e)glibc toolchain"
-	depends on BR2_PACKAGE_GSTREAMER && BR2_arm926t
+	depends on BR2_arm926t
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index c42172a..047bf7e 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_GST_PLUGINS_BAD
 	bool "gst-plugins-bad"
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	help
 	  A set of plug-ins for GStreamer that may be of poor quality or
diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
index 20c2d36..fce68c1 100644
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ b/package/gstreamer/gst-plugins-base/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_GST_PLUGINS_BASE
 	bool "gst-plugins-base"
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXV if BR2_PACKAGE_XORG7
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index bc2c293..81bd340 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_GST_PLUGINS_GOOD
 	bool "gst-plugins-good"
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	help
 	  A set of well-supported plug-ins for GStreamer under the preferred
diff --git a/package/gstreamer/gst-plugins-ugly/Config.in b/package/gstreamer/gst-plugins-ugly/Config.in
index c0046e4..3d133cf 100644
--- a/package/gstreamer/gst-plugins-ugly/Config.in
+++ b/package/gstreamer/gst-plugins-ugly/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_GST_PLUGINS_UGLY
 	bool "gst-plugins-ugly"
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	help
 	  A set of well-supported plug-ins for GStreamer, but might pose
diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
index 9a83a96..75f8fda 100644
--- a/package/gstreamer/gstreamer/Config.in
+++ b/package/gstreamer/gstreamer/Config.in
@@ -12,10 +12,11 @@ config BR2_PACKAGE_GSTREAMER
 
 	  http://gstreamer.freedesktop.org/
 
+if BR2_PACKAGE_GSTREAMER
+
 config BR2_PACKAGE_GSTREAMER_GST_DEBUG
 	bool "enable gst-debug trace support"
 	default y
-	depends on BR2_PACKAGE_GSTREAMER
 	help
 	  Enable support for the gst-debug tracing functionality in gstreamer.
 	  This has limited CPU overhead, but does increase the rootfs size
@@ -24,11 +25,12 @@ config BR2_PACKAGE_GSTREAMER_GST_DEBUG
 config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
 	bool "enable plugin registry"
 	default y
-	depends on BR2_PACKAGE_GSTREAMER
 	help
 	  Enable support for the GStreamer plugin registry. This may increase
 	  the launch-time for a GStreamer application.
 
+endif
+
 comment "gstreamer needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
