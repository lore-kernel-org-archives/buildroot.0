From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jun 2019 22:41:18 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: add
 wpe plugin option
Message-ID: <20190608205629.0EA9E8A37A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11a290b5890c3823958963c78e96518bdbff2d00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed gst1-plugins-bad dependency from wpewebkit gstreamer-gl option
so that there isn't a circular dependency with gst1-plugins-bad.

It appears that wpewebkit gstreamer-gl only has a runtime dependency on
gst1-plugins-bad.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 10 ++++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  7 +++++++
 package/wpewebkit/wpewebkit.mk                          |  1 -
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index fa04a23bdf..f00f3edb7c 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -591,6 +591,16 @@ comment "webrtcdsp needs a toolchain w/ C++, NPTL, gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
+	bool "wpe"
+	default y
+	depends on BR2_PACKAGE_WPEWEBKIT
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+
+comment "wpe needs the gst1-plugins-base opengl library and wpewebkit"
+	depends on !BR2_PACKAGE_WPEWEBKIT \
+		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 	bool "x265"
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index e21ffae3d9..9c238771e2 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -698,6 +698,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtcdsp
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-wpe
+GST1_PLUGINS_BAD_DEPENDENCIES += wpewebkit
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-wpe
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-x265
 GST1_PLUGINS_BAD_DEPENDENCIES += x265
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index b59a1f793a..4dc4a29064 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -34,7 +34,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
-WPEWEBKIT_DEPENDENCIES += gst1-plugins-bad
 else
 WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
 endif
