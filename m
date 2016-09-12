From: Abhilash Tuse <Abhilash.Tuse@imgtec.com>
Date: Mon, 12 Sep 2016 16:20:21 +0530
Subject: [Buildroot] [PATCH v2] gst1-rtsp-server: new package
Message-ID: <1473677421-16673-1-git-send-email-Abhilash.Tuse@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>

Based on patch by Phil Edworthy:
http://lists.busybox.net/pipermail/buildroot/2010-June/035777.html

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Signed-off-by: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
Signed-off-by: Abhilash Tuse <Abhilash.Tuse@imgtec.com>

---
Changes v1 -> v2:
  - add optional dependency of libcgroup & gst1-plugins-bad  (suggested by Thomas Petazzoni)
  - add mandatory dependencies  (suggested by Thomas Petazzoni & Peter Korsgaard)

 package/gstreamer1/Config.in                       |  1 +
 package/gstreamer1/gst1-rtsp-server/Config.in      | 12 +++++++++++
 .../gst1-rtsp-server/gst1-rtsp-server.hash         |  2 ++
 .../gst1-rtsp-server/gst1-rtsp-server.mk           | 23 ++++++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/gstreamer1/gst1-rtsp-server/Config.in
 create mode 100644 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
 create mode 100644 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index ea35ecc..23862bd 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -8,6 +8,7 @@ source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 source "package/gstreamer1/gst1-imx/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
+source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
 endif
diff --git a/package/gstreamer1/gst1-rtsp-server/Config.in b/package/gstreamer1/gst1-rtsp-server/Config.in
new file mode 100644
index 0000000..5869952
--- /dev/null
+++ b/package/gstreamer1/gst1-rtsp-server/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GST1_RTSP_SERVER
+	bool "gst1-rtsp-server"
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTP # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTPMANAGER # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_UDP # runtime
+	help
+	  RTSP server library based on GStreamer.
+
+	  http://gstreamer.freedesktop.org/
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
new file mode 100644
index 0000000..a30afbc
--- /dev/null
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -0,0 +1,2 @@
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.8.3.tar.xz.sha256sum
+sha256 010f06800c1c957851d1352e5ec7a8ba3ce6a857fec1b8afc7d1a9e5f53288bf  gst-rtsp-server-1.8.3.tar.xz
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
new file mode 100644
index 0000000..e41b094
--- /dev/null
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# gst1-rtsp-server
+#
+################################################################################
+
+GST1_RTSP_SERVER_VERSION = 1.8.3
+GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
+GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
+GST1_RTSP_SERVER_LICENSE = LGPLv2+
+GST1_RTSP_SERVER_LICENSE_FILES = COPYING COPYING.LIB
+GST1_RTSP_SERVER_INSTALL_STAGING = YES
+GST1_RTSP_SERVER_DEPENDENCIES = gstreamer1 gst1-plugins-base gst1-plugins-good
+
+ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
+GST1_RTSP_SERVER_DEPENDENCIES += libcgroup
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
+GST1_RTSP_SERVER_DEPENDENCIES += gst1-plugins-bad
+endif
+
+$(eval $(autotools-package))
-- 
2.6.2
