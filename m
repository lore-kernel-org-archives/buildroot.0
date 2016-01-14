From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Jan 2016 22:40:00 +0100
Subject: [Buildroot] [PATCH v6 19/29] package/freeswitch: enable mod_isac
In-Reply-To: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452807610-15534-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/Config.in     | 10 ++++++++++
 package/freeswitch/freeswitch.mk |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 608dbc2..aa7dbff 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -46,4 +46,14 @@ config BR2_PACKAGE_FREESWITCH_ZRTP
 
 	  https://wiki.freeswitch.org/wiki/ZRTP
 
+config BR2_PACKAGE_FREESWITCH_ISAC
+	bool "isac"
+	# no aarch64/armeb support in src/mod/codecs/mod_isac/typedefs.h
+	depends on !BR2_aarch64 && !BR2_armeb
+	help
+	  iSAC is a HD codec kit similar to G.722 anthony extracted iSAC
+	  codec from WebRTC project and built mod_iSAC on top of it.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_isac
+
 endif # BR2_PACKAGE_FREESWITCH
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 84a0f86..af3db24 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -137,6 +137,10 @@ FREESWITCH_DEPENDENCIES += ffmpeg libvpx libyuv
 FREESWITCH_ENABLED_MODULES += applications/mod_av
 endif
 
+ifeq ($(BR2_PACKAGE_FREESWITCH_ISAC),y)
+FREESWITCH_ENABLED_MODULES += codecs/mod_isac
+endif
+
 ifeq ($(BR2_PACKAGE_FREESWITCH_ZRTP),y)
 FREESWITCH_CONF_OPTS += --enable-zrtp
 else
-- 
2.6.4
