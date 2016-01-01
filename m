From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jan 2016 19:55:42 +0100
Subject: [Buildroot] [git commit] package/gstreamer/zbar-plugin: propagate
	dependencies from zbar
Message-ID: <20160101185721.7C16381F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d52deb9a9f1af9cfc8b4fed9ff9189eff29d2788
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR select BR2_PACKAGE_ZBAR which
has several dependencies from libv4l.

Propagate these dependencies to avoid unmet dependencies while
selecting BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR.

[Peter: show comment if toolchain dependencies aren't available]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-bad/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index e2a67f1..43849e2 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -322,6 +322,16 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VP8
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
 	bool "zbar"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zbar-> libv4l
+	depends on BR2_USE_MMU # zbar-> libv4l
+	depends on !BR2_STATIC_LIBS # zbar-> libv4l
+	depends on BR2_INSTALL_LIBSTDCPP # zbar-> libv4l
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # zbar-> libv4l
 	select BR2_PACKAGE_ZBAR
 
+comment "zbar plugin needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
 endif
