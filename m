From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Nov 2014 20:56:52 +0100
Subject: [Buildroot] [PATCH next 2/3] package/tvheadend: Add support for
	liburiparser
In-Reply-To: <1416772613-13447-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416772613-13447-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416772613-13447-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 0fd6eea..4921da4 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -32,12 +32,18 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TVHEADEND_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
+TVHEADEND_DEPENDENCIES += liburiparser
+TVHEADEND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)"
+endif
+
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
 define TVHEADEND_CONFIGURE_CMDS
 	(cd $(@D);				\
 	 $(TARGET_CONFIGURE_OPTS)		\
 	 $(TARGET_CONFIGURE_ARGS)		\
+	 $(TVHEADEND_CONF_ENV)			\
 	 ./configure				\
 	 --prefix=/usr				\
 	 --arch="$(ARCH)"			\
-- 
1.7.10.4
