From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Dec 2014 16:00:31 +0100
Subject: [Buildroot] [PATCH 1/3] package/tvheadend: Rework CFLAGS handling
	for liburiparser
Message-ID: <1417878033-29169-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Thomas:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/100646

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index f593b3f..e0ce160 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -32,9 +32,10 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TVHEADEND_DEPENDENCIES += libiconv
 endif
 
+TVHEADEND_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
 TVHEADEND_DEPENDENCIES += liburiparser
-TVHEADEND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)"
+TVHEADEND_CFLAGS += $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)
 endif
 
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
@@ -43,7 +44,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	(cd $(@D);						\
 		$(TARGET_CONFIGURE_OPTS)			\
 		$(TARGET_CONFIGURE_ARGS)			\
-		$(TVHEADEND_CONF_ENV)				\
+		CFLAGS="$(TVHEADEND_CFLAGS)"			\
 		./configure					\
 			--prefix=/usr				\
 			--arch="$(ARCH)"			\
-- 
1.7.10.4
