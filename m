From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sat, 16 Jul 2011 00:33:00 +0200
Subject: [Buildroot] [PATCH] gst-plugins-ugly: fix dependencies for mad MP3
	decoder plug-in
In-Reply-To: <1310628453-3966-3-git-send-email-s.neumann@raumfeld.com>
References: <1310628453-3966-3-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1310769180-1179-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mad plug-in depends on libid3tag. This dependency used to be
implicit by selecting the id3tag plug-in. Now that this plug-in
is not any longer part of gst-plugins-ugly we need an explicit
dependency on libid3tag.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/gst-plugins-ugly/Config.in      |    2 +-
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/multimedia/gst-plugins-ugly/Config.in
index e20426f..94e2b9d 100644
--- a/package/multimedia/gst-plugins-ugly/Config.in
+++ b/package/multimedia/gst-plugins-ugly/Config.in
@@ -40,7 +40,7 @@ comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD
 	bool "mad (*.mp3 audio)"
-	select BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ID3TAG
+	select BR2_PACKAGE_LIBID3TAG
 	select BR2_PACKAGE_LIBMAD
 
 config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEG2DEC
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index 0d8d32d..451f649 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -66,7 +66,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD),y)
 GST_PLUGINS_UGLY_CONF_OPT += --enable-mad
-GST_PLUGINS_UGLY_DEPENDENCIES += libmad
+GST_PLUGINS_UGLY_DEPENDENCIES += libid3tag libmad
 else
 GST_PLUGINS_UGLY_CONF_OPT += --disable-mad
 endif
-- 
1.7.4.1
