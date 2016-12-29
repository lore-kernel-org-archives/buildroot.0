From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 28 Dec 2016 21:52:08 -0500
Subject: [Buildroot] [PATCH 1/1] gst-plugins-base: add missing dependency on
	libxml2 for subparse
Message-ID: <1482979928-2625-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gst-plugins-base configure script claims that the subparse plugin is
dependency-less - but it also silently disables subparse if libxml2 is
not available.  So depend on libxml2 when subparse is selected.

Note: the analogous gst1 subparse plugin does not have this requirement.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/gstreamer/gst-plugins-base/Config.in           | 1 +
 package/gstreamer/gst-plugins-base/gst-plugins-base.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
index 8ad9a8e..e02675e 100644
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ b/package/gstreamer/gst-plugins-base/Config.in
@@ -48,6 +48,7 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE
 	bool "subparse"
+	select BR2_PACKAGE_LIBXML2
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TCP
 	bool "tcp"
diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
index e1374ed..51c22a9 100644
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
+++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
@@ -111,6 +111,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE),y)
 GST_PLUGINS_BASE_CONF_OPTS += --enable-subparse
+GST_PLUGINS_BASE_DEPENDENCIES += libxml2
 else
 GST_PLUGINS_BASE_CONF_OPTS += --disable-subparse
 endif
-- 
1.9.1
