From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  9 Mar 2019 22:50:36 +0100
Subject: [Buildroot] [PATCH v1] package/gst1-plugins-bad: add zbar plugin
 option
Message-ID: <20190309215036.23103-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note: patch depends on '[PATCH v4] package/zbar: bump version to 0.22'
      https://patchwork.ozlabs.org/patch/1053876
---
 package/gstreamer1/gst1-plugins-bad/Config.in       | 13 +++++++++++++
 .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  8 +++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index a2ceeb9035..869f0a9d45 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -587,4 +587,17 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 comment "x265 needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_ZBAR
+	bool "zbar"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zbar-> libv4l
+	depends on BR2_USE_MMU # zbar-> libv4l
+	depends on BR2_INSTALL_LIBSTDCPP # zbar-> libv4l
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # zbar -> libv4l
+	select BR2_PACKAGE_ZBAR
+
+comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
 endif
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ac39f1e5ce..f5b081f972 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -57,7 +57,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-gme \
 	--disable-vdpau \
 	--disable-schro \
-	--disable-zbar \
 	--disable-spandsp \
 	--disable-gtk3
 
@@ -719,6 +718,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-x265
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_ZBAR),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-zbar
+GST1_PLUGINS_BAD_DEPENDENCIES += zbar
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-zbar
+endif
+
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
 GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL-2.0+
-- 
2.21.0
