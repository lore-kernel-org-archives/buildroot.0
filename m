From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 May 2018 20:26:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: add optional support
 for postgresql
Message-ID: <20180504182634.20368-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 98f2f48356..4d490b0730 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -275,6 +275,17 @@ FREESWITCH_DEPENDENCIES += opencv
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
 
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+FREESWITCH_CONF_ENV += \
+	ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
+FREESWITCH_CONF_OPTS += \
+	--enable-core-pgsql-pkgconfig \
+	--enable-core-pgsql-support
+FREESWITCH_DEPENDENCIES += postgresql
+else
+FREESWITCH_CONF_OPTS += --disable-core-pgsql-support
+endif
+
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 FREESWITCH_DEPENDENCIES += unixodbc
 FREESWITCH_CONF_OPTS += \
-- 
2.14.2
