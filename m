From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Mon,  7 Feb 2011 01:45:03 +0200
Subject: [Buildroot] [PATCH 2/4] Add gst-dsp package
In-Reply-To: <1297035905-29896-1-git-send-email-felipe.contreras@gmail.com>
References: <1297035905-29896-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <1297035905-29896-2-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/Config.in          |    1 +
 package/multimedia/gst-dsp/Config.in  |    8 ++++++++
 package/multimedia/gst-dsp/gst-dsp.mk |   19 +++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst-dsp/Config.in
 create mode 100644 package/multimedia/gst-dsp/gst-dsp.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 415e6ad..cfc4190 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -7,6 +7,7 @@ source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-ffmpeg/Config.in"
+source "package/multimedia/gst-dsp/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
diff --git a/package/multimedia/gst-dsp/Config.in b/package/multimedia/gst-dsp/Config.in
new file mode 100644
index 0000000..590931a
--- /dev/null
+++ b/package/multimedia/gst-dsp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GST_DSP
+	bool "gst-dsp"
+	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
+	select BR2_PACKAGE_TIDSP_BINARIES
+	help
+	  GStreamer plug-in to access TI OMAP3 DSP algorithms.
+
+	  http://code.google.com/p/gst-dsp/
diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
new file mode 100644
index 0000000..bd538f1
--- /dev/null
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -0,0 +1,19 @@
+GST_DSP_VERSION=0.8.0
+GST_DSP_SOURCE=gst-dsp-$(GST_DSP_VERSION).tar.gz
+GST_DSP_SITE=http://gst-dsp.googlecode.com/files/
+
+define GST_DSP_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
+endef
+
+define GST_DSP_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
+endef
+
+define GST_DSP_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstdsp.so
+endef
+
+GST_DSP_DEPENDENCIES = gstreamer
+
+$(eval $(call GENTARGETS,package/multimedia,gst-dsp))
-- 
1.7.4.1.gf4271.dirty
