From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 May 2016 21:15:45 +0200
Subject: [Buildroot] [git commit branch/next] gst1-plugins-bad: add sbc
	support
Message-ID: <20160519191751.374FE8079C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d9389ebc2d9a3020277102466a9f223c2a3f24b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Reviewed-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 4 ++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index c4c4e43..046c2aa 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -638,6 +638,10 @@ comment "rsvg plugin needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SBC
+	bool "sbc"
+	select BR2_PACKAGE_SBC
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index c3c4682..8ddf5d9 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -71,7 +71,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-gme \
 	--disable-xvid \
 	--disable-vdpau \
-	--disable-sbc \
 	--disable-schro \
 	--disable-zbar \
 	--disable-rtmp \
@@ -743,6 +742,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-rsvg
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SBC),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-sbc
+GST1_PLUGINS_BAD_DEPENDENCIES += sbc
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-sbc
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL),y)
 GST1_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdl
