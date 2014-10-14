From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Oct 2014 20:28:29 +0200
Subject: [Buildroot] [PATCH v3 7/7] package/tvheadend: Add transcoding
	support by ffmpeg
In-Reply-To: <1413311309-30811-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413311309-30811-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413311309-30811-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: no changes
v2: add --disable-libffmpeg_static, newly added option to git master

 package/tvheadend/tvheadend.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 8acf6af..357ba7d 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -14,6 +14,13 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE)$(BR2_PACKAGE_FFMPEG_SWSCALE),yy)
+TVHEADEND_DEPENDENCIES += ffmpeg
+TVHEADEND_CONF_OPTS += --enable-libav
+else
+TVHEADEND_CONF_OPTS += --disable-libav
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
 TVHEADEND_DEPENDENCIES += libdvbcsa
 TVHEADEND_CONF_OPTS += --enable-dvbcsa
@@ -38,6 +45,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	 --python="$(HOST_DIR)/usr/bin/python"	\
 	 --disable-dvbscan			\
 	 --enable-bundle			\
+	 --disable-libffmpeg_static		\
 	 $(TVHEADEND_CONF_OPTS)			\
 	)
 endef
-- 
1.7.10.4
