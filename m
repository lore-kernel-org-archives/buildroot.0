From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Apr 2016 13:54:43 -0300
Subject: [Buildroot] [PATCH] weston: disable v4l simple dmabuf for headers <
	3.8
Message-ID: <1461171283-14226-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses VIDIOC_EXPBUF which only came to light with kernel 3.8, so
disable it if headers are older. Fixes:
http://autobuild.buildroot.net/results/7fb/7fb9968b13f144c4576b28ecd01c82b74e4ed9d5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 1f31097..052784e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -26,6 +26,11 @@ WESTON_CONF_OPTS = \
 WESTON_MAKE_OPTS = \
 	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
 
+# Uses VIDIOC_EXPBUF, only available from 3.8+
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
+WESTON_CONF_OPTS += --disable-simple-dmabuf-v4l-client
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 WESTON_CONF_OPTS += --enable-dbus
 WESTON_DEPENDENCIES += dbus
-- 
2.7.3
