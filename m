From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Mar 2021 19:55:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: add option for iptv
 support
Message-ID: <20210329175542.182931-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When enabled some IPTV streams are piped using /usr/bin/ffmpeg so make
sure that the ffmpeg binary is present.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/Config.in    | 7 +++++++
 package/tvheadend/tvheadend.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 909d955c02..94e1ccafe2 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -28,6 +28,13 @@ config BR2_PACKAGE_TVHEADEND
 
 if BR2_PACKAGE_TVHEADEND
 
+config BR2_PACKAGE_TVHEADEND_IPTV
+	bool "IPTV support"
+	default y
+	select BR2_PACKAGE_FFMPEG_FFMPEG if BR2_PACKAGE_FFMPEG
+	help
+	  Enable IPTV support.
+
 config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	bool "transcoding support"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 114142bfa9..e013c83446 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -63,6 +63,13 @@ TVHEADEND_CONF_OPTS += \
 	--disable-libx265
 endif
 
+ifeq ($(BR2_PACKAGE_TVHEADEND_IPTV),y)
+TVHEADEND_CONF_OPTS += --enable-iptv
+TVHEADEND_DEPENDENCIES += ffmpeg
+else
+TVHEADEND_CONF_OPTS += --disable-iptv
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
 TVHEADEND_DEPENDENCIES += libdvbcsa
 TVHEADEND_CONF_OPTS += --enable-tvhcsa
-- 
2.29.2
