From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:18:03 +0100
Subject: [Buildroot] [git commit branch/next] gst1-plugins-bad: enable
	fdkaac plugin
Message-ID: <20161107205049.D069F7FB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d45e57a1292a803fe3d118c580243d2e8bd41c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It's new for 1.10.0, add an explicit option for the fdkaac plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[Thomas: add missing dependencies for the fdk-aac select, as noticed
by Baruch Siach.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 12 ++++++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 2f288ca..8af35cc 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -520,6 +520,18 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV
 	help
 	  Linux framebuffer video sink
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FDK_AAC
+	bool "fdk-aac"
+	select BR2_PACKAGE_FDK_AAC
+	depends on BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  MPEG AAC encoder/decoder
+
+comment "fdk-aac needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
 	bool "gl"
 	default y
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ac99fcd..cd9da7c 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -642,6 +642,14 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-fbdev
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FDK_AAC),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-fdk_aac
+GST1_PLUGINS_BAD_DEPENDENCIES += fdk-aac
+GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-fdk_aac
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-gl
 else
