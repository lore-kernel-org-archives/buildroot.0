From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Mar 2016 17:55:22 -0300
Subject: [Buildroot] [PATCH] xdriver_xf86-video-ati: needs dri3proto for
	glamor
Message-ID: <1458334522-22176-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to match xserver here, since we need glamor support there in
order to enable it here, hence need to match the dependencies.
For xserver it needs dri3proto+libepoxy, however if only libepoxy is
present then glamor would be disabled for the server but enabled for the
driver, leading to build failure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 3dd3d07..09af05a 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -22,7 +22,7 @@ XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	xproto_xproto \
 	xserver_xorg-server
 
-ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO)$(BR2_PACKAGE_LIBEPOXY),yy)
 XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --enable-glamor
 else
 XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --disable-glamor
-- 
2.4.10
