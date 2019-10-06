From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Oct 2019 14:53:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/libwebsockets: fix build with libev
 and libevent
Message-ID: <20191006125339.23402-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libev and libevent can't be enabled at the same time since version 3.0.0
and
https://github.com/warmcat/libwebsockets/commit/ff2f5f601d5965f5860bc989d05b61246f172095

So prefer libev over libevent to have the same default behavior than
upstream LWS_WITH_DISTRO_RECOMMENDED target

Fixes:
 - http://autobuild.buildroot.org/results/ee5ef79a39570bcf5c605b1a4b6b48523605d647

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libwebsockets/libwebsockets.mk | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 0b488d1f05..7a065dfb22 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -30,16 +30,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBEV),y)
 LIBWEBSOCKETS_DEPENDENCIES += libev
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEV=ON
-else
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEV=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_LIBEV=ON \
+	-DLWS_WITH_LIBEVENT=OFF
+else ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBWEBSOCKETS_DEPENDENCIES += libevent
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEVENT=ON
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_LIBEV=OFF \
+	-DLWS_WITH_LIBEVENT=ON
 else
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEVENT=OFF
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_LIBEV=OFF \
+	-DLWS_WITH_LIBEVENT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUV),y)
-- 
2.23.0
