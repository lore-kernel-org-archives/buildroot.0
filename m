From: Valentine Barshak <gvaxon@gmail.com>
Date: Thu, 27 Sep 2012 22:17:37 +0400
Subject: [Buildroot] [PATCH 3/3] mplayer: Fix DVD support
In-Reply-To: <20120927181306.GA21215@gmail.com>
Message-ID: <20120927181737.GA21348@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This sets paths to dvdread-config and dvdnav-config,
and configuration options to enable external libdvdread
and libdvdnav support when these libraries are enabled.
Otherwise DVD support is disabled.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/multimedia/mplayer/mplayer.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 05120bf..0458507 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -42,6 +42,26 @@ else
 MPLAYER_CONF_OPTS += --disable-freetype
 endif
 
+MPLAYER_CONF_OPTS += --disable-dvdread-internal
+
+ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
+MPLAYER_CONF_OPTS +=  \
+	--enable-dvdread \
+	--with-dvdread-config=$(STAGING_DIR)/usr/bin/dvdread-config
+MPLAYER_DEPENDENCIES += libdvdread
+else
+MPLAYER_CONF_OPTS += --disable-dvdread
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
+MPLAYER_CONF_OPTS +=  \
+	--enable-dvdnav \
+	--with-dvdnav-config=$(STAGING_DIR)/usr/bin/dvdnav-config
+MPLAYER_DEPENDENCIES += libdvdnav
+else
+MPLAYER_CONF_OPTS += --disable-dvdnav
+endif
+
 ifeq ($(BR2_PACKAGE_MPLAYER_MPLAYER),y)
 MPLAYER_CONF_OPTS += --enable-mplayer
 else
-- 
1.7.11.4
