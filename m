From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Dec 2015 21:19:27 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: fix openh264 handling
Message-ID: <20151230202300.67924826DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=332d44a94f5f0ec3a1844f0173b851a896a54e46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 301e8ffbb25 (gst1-plugins-bad: update configure options) added a sub
option for openh264, but didn't propagate the toolchain dependencies or add
any configure options.

Fix this and while we're at it also add a help text for the option.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 11 +++++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index bc9415b..f557678 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -595,7 +595,18 @@ comment "opencv plugin needs OpenCV-2.4"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264
 	bool "openh264"
+	depends on BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # libopenh264
+	depends on !BR2_STATIC_LIBS # libopenh264
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libopenh264
 	select BR2_PACKAGE_LIBOPENH264
+	help
+	  OpenH264 based encoding/decoding plugin
+
+comment "openh264 plugin needs a toolchain w/ C++, dynamic library, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENJPEG
 	bool "openjpeg"
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 5a913a3..94f4b2c 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -714,6 +714,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-opencv
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-openh264
+GST1_PLUGINS_BAD_DEPENDENCIES += libopenh264
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-openh264
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENJPEG),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-openjpeg
 GST1_PLUGINS_BAD_DEPENDENCIES += openjpeg
