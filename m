From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:26:53 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-base: add
 tools option
Message-ID: <20200309140909.6129E80426@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5d14dc131d7bbc1d35d0ca3502e9d069c9d4611
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add tools option to disable building/installing of gst-discoverer,
gst-device-monitor and gst-play command line tools (similar to
BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-base/Config.in            | 6 ++++++
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index f60d540337..db916ed219 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -10,6 +10,12 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
 
 if BR2_PACKAGE_GST1_PLUGINS_BASE
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_INSTALL_TOOLS
+	bool "install tools"
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
