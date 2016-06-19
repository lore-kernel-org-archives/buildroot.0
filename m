From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jun 2016 18:20:29 +0200
Subject: [Buildroot] [PATCH 7/7] package/gstreamer1/gst1-plugins-ugly:
	libdvdread can now be linked statically
In-Reply-To: <1466353229-12798-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466353229-12798-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1466353229-12798-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After libdvdread bump to version 5.0.3 static linking works, tested
using this defconfig:
http://autobuild.buildroot.net/toolchains/configs/br-arm-full-static.config

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer1/gst1-plugins-ugly/Config.in            | 4 ----
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index 995835e..f30163a 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -40,14 +40,10 @@ comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD
 	bool "dvdread"
-	depends on !BR2_STATIC_LIBS # libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  Access a DVD with dvdread
 
-comment "dvdread needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
 	bool "lame (*.mp3 audio encoder)"
 	select BR2_PACKAGE_LAME
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index d37908c..8864b04 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -59,6 +59,10 @@ GST1_PLUGINS_UGLY_CONF_OPTS += --disable-realmedia
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD),y)
+# configure does not use pkg-config to detect libdvdread
+ifeq ($(BR2_PACKAGE_LIBDVDCSS)$(BR2_STATIC_LIBS),yy)
+GST1_PLUGINS_UGLY_CONF_ENV += LIBS="-ldvdcss"
+endif
 GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdread
 GST1_PLUGINS_UGLY_DEPENDENCIES += libdvdread
 GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
-- 
2.8.1
