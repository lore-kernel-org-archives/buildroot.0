From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:08:48 +0200
Subject: [Buildroot] [PATCH 3/3] libplayer: fix CFLAGS
In-Reply-To: <1338674928-1889-1-git-send-email-s.martin49@gmail.com>
References: <1338674928-1889-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1338674928-1889-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because libplayer is not a "real" AUTOTARGET, pkg-config magic is not
handled as expected, so some headers cannot be found.

This patch provides the include directory for the following unfound
headers:
- glib.h
- glibconfig.h
- gst/gst.h

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index 093821e..f744361 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -32,6 +32,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBPLAYER_GSTREAMER),y)
 	LIBPLAYER_DEPENDENCIES += gstreamer
 	LIBPLAYER_CONF_OPT += --enable-gstreamer
+	LIBPLAYER_MAKE_OPT += \
+		CFLAGS+="-I$(STAGING_DIR)/usr/include/glib-2.0 \
+			-I$(STAGING_DIR)/usr/lib/glib-2.0/include \
+			-I$(STAGING_DIR)/usr/include/gstreamer-0.10"
 else
 	LIBPLAYER_CONF_OPT += --disable-gstreamer
 endif
-- 
1.7.10.3
