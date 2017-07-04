From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 13:31:41 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: add new Timed Text
	Markup Language (TTML) plugin
Message-ID: <20170704113143.38C3C7FCBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea82b2d34a9ec29dbb11c7b1d7d77a72ee24032c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 17 +++++++++++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 96ab12b..67d3923 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -547,6 +547,23 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
 comment "libmms needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML
+	bool "ttml"
+	depends on BR2_USE_WCHAR # pango -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PANGO
+	help
+	  Timed Text Markup Language (TTML) subtitle plugin
+
+comment "ttml needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
 	bool "mpeg2enc"
 	select BR2_PACKAGE_LIBMPEG2
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 6a66726..56e443c 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -636,6 +636,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-libmms
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-ttml
+GST1_PLUGINS_BAD_DEPENDENCIES += cairo libxml2 pango
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-ttml
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpeg2enc
 GST1_PLUGINS_BAD_DEPENDENCIES += libmpeg2
