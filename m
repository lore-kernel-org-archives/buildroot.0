From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  3 Mar 2020 17:47:02 +0100
Subject: [Buildroot] [PATCH/next v1] package/gst1-plugins-base: add tools
 option
Message-ID: <20200303164702.18418-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add tools option to disable building/installing of
gst-discoverer, gst-device-monitor and gst-play commandline
tools (analog BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-base/Config.in            | 7 +++++++
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index f60d540337..3a3694b72e 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -10,6 +10,13 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
 
 if BR2_PACKAGE_GST1_PLUGINS_BASE
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_INSTALL_TOOLS
+	bool "install gst-discoverer & gst-device-monitor & gst-play
+	default y
+	help
+	  Install the gst-discoverer, gst-device-monitor and gst-play
+	  tools.
+
 comment "dependency-less plugins"
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 1781a5d461..ccecbb3c08 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -26,6 +26,12 @@ GST1_PLUGINS_BASE_CONF_OPTS += \
 	-Dlibvisual=disabled \
 	-Diso-codes=disabled
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_INSTALL_TOOLS),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dtools=enabled
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Dtools=disabled
+endif
+
 GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1 $(TARGET_NLS_DEPENDENCIES)
 
 GST1_PLUGINS_BASE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
-- 
2.25.1
