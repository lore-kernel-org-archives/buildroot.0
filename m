From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 15 May 2013 16:59:38 -0500
Subject: [Buildroot] [PATCH v6 10/10] gst-omx: add gst-omx package
In-Reply-To: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368655178-19176-11-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst-omx enables OpenMAX based accelerated video decode.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in          |    1 +
 package/multimedia/gst-omx/Config.in  |   11 +++++++++++
 package/multimedia/gst-omx/gst-omx.mk |    9 +++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/multimedia/gst-omx/Config.in
 create mode 100644 package/multimedia/gst-omx/gst-omx.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index a0927e9..68dfa13 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -11,6 +11,7 @@ source "package/multimedia/gst-ffmpeg/Config.in"
 source "package/multimedia/gst-dsp/Config.in"
 source "package/multimedia/gst-fsl-plugins/Config.in"
 source "package/multimedia/gst-omapfb/Config.in"
+source "package/multimedia/gst-omx/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst1-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
diff --git a/package/multimedia/gst-omx/Config.in b/package/multimedia/gst-omx/Config.in
new file mode 100644
index 0000000..789454c
--- /dev/null
+++ b/package/multimedia/gst-omx/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GST_OMX
+	bool "gst-omx"
+	depends on BR2_PACKAGE_HAS_OPENMAX
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  GStreamer plug-in to use OpenMAX API.
+
+	  http://cgit.freedesktop.org/gstreamer/gst-omx
+
+comment "gst-omx requires a OpenMAX implementation please select rpi-userland or bellagio"
+	depends on BR2_PACKAGE_GSTREAMER1 && ! BR2_PACKAGE_HAS_OPENMAX
diff --git a/package/multimedia/gst-omx/gst-omx.mk b/package/multimedia/gst-omx/gst-omx.mk
new file mode 100644
index 0000000..7f54900
--- /dev/null
+++ b/package/multimedia/gst-omx/gst-omx.mk
@@ -0,0 +1,9 @@
+GST_OMX_VERSION=1.0.0
+GST_OMX_SOURCE=gst-omx-$(GST_OMX_VERSION).tar.xz
+GST_OMX_SITE=http://gstreamer.freedesktop.org/src/gst-omx/
+GST_OMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libopenmax
+GST_OMX_LICENSE = LGPLv2.1
+GST_OMX_LICENSE_FILE = COPYING
+GST_OMX_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.9.5
