From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Thu,  4 Apr 2019 16:08:54 +0300
Subject: [Buildroot] [PATCH 1/1] package/freerdp: add h264 support
Message-ID: <20190404130854.18876-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 package/freerdp/Config.in  | 7 +++++++
 package/freerdp/freerdp.mk | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 59bc18b672..6c2802e673 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -59,6 +59,13 @@ comment "gstreamer support needs X.Org"
 	depends on !BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_GSTREAMER || BR2_PACKAGE_GSTREAMER1
 
+config BR2_PACKAGE_FREERDP_H264
+        bool "h264 support"
+        depends on BR2_PACKAGE_X264
+        default y
+        help
+                h264 codec support for freerdp
+
 config BR2_PACKAGE_FREERDP_SERVER
 	bool "server"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 91e4ae47ee..6aea6a309f 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -14,6 +14,11 @@ FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev
 
+ifeq ($(BR2_PACKAGE_FREERDP_H264),y)
+       FREERDP_CONF_OPTS += -DWITH_GFX_H264=ON
+       FREERDP_DEPENDENCIES += x264
+endif
+
 ifeq ($(BR2_PACKAGE_FREERDP_GSTREAMER),y)
 FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
 FREERDP_DEPENDENCIES += gstreamer gst-plugins-base libxml2
-- 
2.20.1
