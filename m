From: Tim Sheridan <Tim.Sheridan@imgtec.com>
Date: Thu, 22 Nov 2012 13:19:05 +0000
Subject: [Buildroot] [PATCH] gstreamer: Added option to disable
	plugin	registry.
Message-ID: <98E3058E5505294895CA69F176CAD66272CE5E@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Whoops, I forgot to include the sign-off for the patch. The amended patch is included below:

---------SNIP---------
The plugin registry can take a while to be generated when GStreamer is
initialized. Turning it off speeds up GStreamer application launch times.
Default behavior unchanged.

Signed-off-by: Tim Sheridan <tim.sheridan@imgtec.com>
---
 package/multimedia/gstreamer/Config.in    |    9 +++++++++
 package/multimedia/gstreamer/gstreamer.mk |    3 ++- 
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 4d279b8..e946b18 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -16,5 +16,14 @@ config BR2_PACKAGE_GSTREAMER_GST_DEBUG
          in gstreamer. This has limited CPU overhead, but does
          increase the rootfs size somewhat.
 
+config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
+       bool "enable plugin registry"
+       default y
+       depends on BR2_PACKAGE_GSTREAMER
+       help
+         Enable support for the GStreamer plugin registry.
+         This may increase the launch-time for a GStreamer
+         application.
+
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
-               $(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug)
+               $(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug) \
+               $(if $(BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY),,--disable-registry)
 
 GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf
 
-- 
1.7.1
