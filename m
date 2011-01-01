From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 1 Jan 2011 14:31:47 +0100
Subject: [Buildroot] [git commit master 1/1] gst-plugins-good: add option to
	build cairo plugin
Message-ID: <20110101133252.E45A58F326@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=06aa68394d4725c90500b35b75183ceec015c8fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build issue when cairo is built without png support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-good/Config.in      |    5 +++++
 .../gst-plugins-good/gst-plugins-good.mk           |    7 +++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index dd293e9..368642f 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -168,6 +168,11 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX
 	bool "annodex (XML Library)"
 	select BR2_PACKAGE_LIBXML2
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CAIRO
+	bool "cairo"
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
 	bool "flac (libFLAC)"
 	select BR2_PACKAGE_FLAC
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 62d9d47..f7a2087 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -302,6 +302,13 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-annodex
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CAIRO),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-cairo
+GST_PLUGINS_GOOD_DEPENDENCIES += cairo
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-cairo
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-flac
 GST_PLUGINS_GOOD_DEPENDENCIES += flac
-- 
1.7.2.2
