From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 13:01:21 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: Add kmssink support
Message-ID: <20170109121712.9604480296@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43d24b533496d7a1d8bf949db750e20d68b79660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the KMS video sink element. From the Gstreamer 1.10
release notes:

"New element kmssink to render video using Direct Rendering Manager (DRM)
and Kernel Mode Setting (KMS) subsystems in the Linux kernel. It is oriented
to be used mostly in embedded systems."

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 7 +++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 16c0b7e..6bec362 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -549,6 +549,13 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 	help
 	  Fragmented streaming plugins
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS
+	bool "kmssink"
+	depends on BR2_TOOLCHAIN_HAS_THREADS #  libdrm -> libpthread-stubs
+	select BR2_PACKAGE_LIBDRM
+	help
+	  KMS video sink
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
 	bool "libmms"
 	depends on BR2_USE_WCHAR # libmms -> libglib2
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ba9f305..4d629f5 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -680,6 +680,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-hls
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-kms
+GST1_PLUGINS_BAD_DEPENDENCIES += libdrm
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-kms
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-libmms
 GST1_PLUGINS_BAD_DEPENDENCIES += libmms
