From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Sep 2011 11:54:20 +0200
Subject: [Buildroot] [git commit] gstreamer: add option to disable gst_debug
	tracing functionality
Message-ID: <20110927180431.4393B8DAD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11285bd2c7be86cf8c2e6145bce59cad5286a51e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shrinks gst library sizes with ~1MB (depending on the amount of plugins
enabled).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gstreamer/Config.in    |    9 +++++++++
 package/multimedia/gstreamer/gstreamer.mk |    4 +++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 7de904c..4d279b8 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -7,5 +7,14 @@ config BR2_PACKAGE_GSTREAMER
 
 	  http://gstreamer.freedesktop.org/
 
+config BR2_PACKAGE_GSTREAMER_GST_DEBUG
+	bool "enable gst-debug trace support"
+	default y
+	depends on BR2_PACKAGE_GSTREAMER
+	help
+	  Enable support for the gst-debug tracing functionality
+	  in gstreamer. This has limited CPU overhead, but does
+	  increase the rootfs size somewhat.
+
 comment "gstreamer requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index db5ccaf..ffc8745 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -1,3 +1,4 @@
+
 #############################################################
 #
 # gstreamer
@@ -19,7 +20,8 @@ GSTREAMER_CONF_OPT = \
 		--disable-examples \
 		--disable-tests \
 		--disable-failing-tests \
-		--disable-loadsave
+		--disable-loadsave \
+		$(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug)
 
 GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config
 
