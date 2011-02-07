From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Feb 2011 17:24:47 +0100
Subject: [Buildroot] [git commit master 1/1] Add gst-omapfb package
Message-ID: <20110207164338.519018F414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0c19765ba4289f0a1d53b7060095b65c42b9cda6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                |    1 +
 package/multimedia/gst-omapfb/Config.in     |    7 +++++++
 package/multimedia/gst-omapfb/gst-omapfb.mk |   19 +++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst-omapfb/Config.in
 create mode 100644 package/multimedia/gst-omapfb/gst-omapfb.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index cfc4190..69ad113 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -8,6 +8,7 @@ source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-ffmpeg/Config.in"
 source "package/multimedia/gst-dsp/Config.in"
+source "package/multimedia/gst-omapfb/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
diff --git a/package/multimedia/gst-omapfb/Config.in b/package/multimedia/gst-omapfb/Config.in
new file mode 100644
index 0000000..e603cb1
--- /dev/null
+++ b/package/multimedia/gst-omapfb/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GST_OMAPFB
+	bool "gst-omapfb"
+	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
+	help
+	  GStreamer plug-in to use OMAP framebuffer.
+
+	  http://github.com/felipec/gst-omapfb
diff --git a/package/multimedia/gst-omapfb/gst-omapfb.mk b/package/multimedia/gst-omapfb/gst-omapfb.mk
new file mode 100644
index 0000000..726ef83
--- /dev/null
+++ b/package/multimedia/gst-omapfb/gst-omapfb.mk
@@ -0,0 +1,19 @@
+GST_OMAPFB_VERSION=1.0
+GST_OMAPFB_SOURCE=gst-omapfb-$(GST_OMAPFB_VERSION).tar.gz
+GST_OMAPFB_SITE=http://gst-dsp.googlecode.com/files/
+
+define GST_OMAPFB_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
+endef
+
+define GST_OMAPFB_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
+endef
+
+define GST_OMAPFB_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstomapfb.so
+endef
+
+GST_OMAPFB_DEPENDENCIES = gstreamer
+
+$(eval $(call GENTARGETS,package/multimedia,gst-omapfb))
-- 
1.7.3.4
