From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 10 Jun 2012 13:46:46 +0200
Subject: [Buildroot] [PATCH v2 1/1] libplayer: fix cflags
In-Reply-To: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1339328813-6269-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly run pkg-config to add some include directories to the cflags
when gstreamer support is enabled.

This patch fixes the following unfound headers:
- glib.h
- glibconfig.h
- gst/gst.h

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index 093821e..643c7bb 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -30,8 +30,10 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPLAYER_GSTREAMER),y)
-	LIBPLAYER_DEPENDENCIES += gstreamer
+	LIBPLAYER_DEPENDENCIES += host-pkg-config libglib2 gstreamer
 	LIBPLAYER_CONF_OPT += --enable-gstreamer
+	LIBPLAYER_MAKE_OPT += \
+		CFLAGS+="`$(PKG_CONFIG_HOST_BINARY) --cflags glib-2.0 gstreamer-0.10`"
 else
 	LIBPLAYER_CONF_OPT += --disable-gstreamer
 endif
-- 
1.7.10.4
