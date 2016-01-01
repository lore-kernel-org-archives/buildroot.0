From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  1 Jan 2016 19:34:17 +0100
Subject: [Buildroot] [PATCH] package/gstreamer/zbar-plugin: propagate
	dependencies from zbar
Message-ID: <1451673257-23081-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR select BR2_PACKAGE_ZBAR which
has several dependencies from libv4l.

Propagate these dependencies to avoid unmet dependencies while
selecting BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gstreamer/gst-plugins-bad/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index e2a67f1..95acbaf 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -322,6 +322,11 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VP8
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
 	bool "zbar"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zbar-> libv4l
+	depends on BR2_USE_MMU # zbar-> libv4l
+	depends on !BR2_STATIC_LIBS # zbar-> libv4l
+	depends on BR2_INSTALL_LIBSTDCPP # zbar-> libv4l
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # zbar-> libv4l
 	select BR2_PACKAGE_ZBAR
 
 endif
-- 
2.4.3
