From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2016 21:59:24 +0100
Subject: [Buildroot] [PATCH v5 08/29] package/freeswitch: add optional
	dependency to unixodbc
In-Reply-To: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452459585-7085-9-git-send-email-bernd.kuhls@t-online.de>
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
index d190973..5cab5cc 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -57,7 +57,6 @@ FREESWITCH_CONF_ENV += \
 	apr_cv_mutex_robust_shared=yes
 
 FREESWITCH_CONF_OPTS = \
-	--disable-core-odbc-support \
 	--without-erlang \
 	--enable-fhs \
 	--without-python \
@@ -142,6 +141,15 @@ FREESWITCH_DEPENDENCIES += libpng
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
2.6.4
