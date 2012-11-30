From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 00:01:17 -0800
Subject: [Buildroot] [git commit] gstreamer: Added option to disable plugin
	registry.
Message-ID: <20121203145713.EAC6F99808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc50f0c372d8c49dc713b11e756c1d940163b496
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The plugin registry can take a while to be generated when GStreamer is
initialized. Turning it off can speed up up GStreamer application launch
times. Default behaviour is unchanged.

Signed-off-by: Tim Sheridan <tim.sheridan@imgtec.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gstreamer/Config.in    |   14 +++++++++++---
 package/multimedia/gstreamer/gstreamer.mk |    3 ++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 4d279b8..9a67481 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -12,9 +12,17 @@ config BR2_PACKAGE_GSTREAMER_GST_DEBUG
 	default y
 	depends on BR2_PACKAGE_GSTREAMER
 	help
-	  Enable support for the gst-debug tracing functionality
-	  in gstreamer. This has limited CPU overhead, but does
-	  increase the rootfs size somewhat.
+	  Enable support for the gst-debug tracing functionality in gstreamer.
+	  This has limited CPU overhead, but does increase the rootfs size
+	  somewhat.
+
+config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
+	bool "enable plugin registry"
+	default y
+	depends on BR2_PACKAGE_GSTREAMER
+	help
+	  Enable support for the GStreamer plugin registry. This may increase
+	  the launch-time for a GStreamer application.
 
 comment "gstreamer requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index a9841b1..b87f029 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -21,7 +21,8 @@ GSTREAMER_CONF_OPT = \
 		--disable-tests \
 		--disable-failing-tests \
 		--disable-loadsave \
-		$(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug)
+		$(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug) \
+		$(if $(BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY),,--disable-registry)
 
 GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf
 
