From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 3 Aug 2016 17:49:27 +0530
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: hls: allow user to select
	crypto backend
Message-ID: <1470226767-21018-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HLS plugin can be built with nettle or libgcrypt or openssl
cryptographic backend. But current dependency on gnutls is incorrect.
It has been working so far because gnutls depends on nettle.

gst-plugins-bad's build system for HLS allow user to choose which
cryptographic backend to use. So it makes sense to allow user to
select which cryptographic backend to use.

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      | 25 +++++++++++++++++++++-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 18 +++++++++++++++-
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0f9fb15..51c1280 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -530,10 +530,33 @@ comment "gl needs the gst1-plugins-bad opengl library"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 	bool "hls"
-	select BR2_PACKAGE_GNUTLS
 	help
 	  Fragmented streaming plugins
 
+if BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
+
+choice
+	prompt "choose HLS cryptographic backend"
+	default BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_NETTLE
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_LIBGCRYPT
+	bool "libgcrypt"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
+	select BR2_PACKAGE_LIBGCRYPT
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_NETTLE
+	bool "nettle"
+	select BR2_PACKAGE_NETTLE
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_OPENSSL
+	bool "openssl"
+	select BR2_PACKAGE_OPENSSL
+
+endchoice
+
+endif # BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
+
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
 	bool "libmms"
 	depends on BR2_USE_WCHAR # libmms -> libglib2
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 8f739ec..e920939 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -650,7 +650,23 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-hls
-GST1_PLUGINS_BAD_DEPENDENCIES += gnutls
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_LIBGCRYPT),y)
+GST1_PLUGINS_BAD_DEPENDENCIES += libgcrypt
+GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=libgcrypt \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_NETTLE),y)
+GST1_PLUGINS_BAD_DEPENDENCIES += nettle
+GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=nettle
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_OPENSSL),y)
+GST1_PLUGINS_BAD_DEPENDENCIES += openssl
+GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=openssl
+endif
+
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-hls
 endif
-- 
2.6.2
