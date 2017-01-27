From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:49:56 +1300
Subject: [Buildroot] [git commit] gst-plugins-base: add missing dependency
	on libxml2 for subparse
Message-ID: <20170127085018.B13D282101@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13b8ed48c33d5d9deebb64ae189501b375198890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gst-plugins-base configure script claims that the subparse plugin is
dependency-less - but it also silently disables subparse if libxml2 is
not available.  So depend on libxml2 when subparse is selected.

Note: the analogous gst1 subparse plugin does not have this requirement.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-plugins-base/Config.in           | 7 ++++---
 package/gstreamer/gst-plugins-base/gst-plugins-base.mk | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
index 8ad9a8e..e9c8239 100644
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ b/package/gstreamer/gst-plugins-base/Config.in
@@ -46,9 +46,6 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK
 	bool "playback (mandatory)"
 	default y
 
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE
-	bool "subparse"
-
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TCP
 	bool "tcp"
 
@@ -92,6 +89,10 @@ comment "pango plugin needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE
+	bool "subparse"
+	select BR2_PACKAGE_LIBXML2
+
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
 	select BR2_PACKAGE_LIBTHEORA
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
