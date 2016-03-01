From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Mar 2016 22:58:35 +0100
Subject: [Buildroot] [PATCH/next v10 07/28] package/freeswitch: add optional
	dependency to unixodbc
In-Reply-To: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456869536-18324-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 37949a3..3d71d7a 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -61,7 +61,6 @@ FREESWITCH_CONF_ENV += \
 	ac_cv_gcc_supports_w_no_unused_result=no
 
 FREESWITCH_CONF_OPTS = \
-	--disable-core-odbc-support \
 	--without-erlang \
 	--enable-fhs \
 	--without-python \
@@ -168,6 +167,15 @@ FREESWITCH_DEPENDENCIES += libpng
 FREESWITCH_ENABLED_MODULES += formats/mod_png
 endif
 
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+FREESWITCH_DEPENDENCIES += unixodbc
+FREESWITCH_CONF_OPTS += \
+	--enable-core-odbc-support \
+	--with-odbc=$(STAGING_DIR)/usr
+else
+FREESWITCH_CONF_OPTS += --disable-core-odbc-support
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 FREESWITCH_DEPENDENCIES += util-linux
 endif
-- 
2.7.0
