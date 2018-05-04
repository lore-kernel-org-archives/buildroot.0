From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 May 2018 20:26:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/apr-util: add optional support for
 postgresql
Message-ID: <20180504182615.8674-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apr-util contains optional support for postgresql:

$ ls -1 output/target/usr/lib/apr-util-1/apr_dbd_pg*
output/target/usr/lib/apr-util-1/apr_dbd_pgsql-1.so
output/target/usr/lib/apr-util-1/apr_dbd_pgsql.la
output/target/usr/lib/apr-util-1/apr_dbd_pgsql.so

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr-util/apr-util.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index c44cef009f..22f1913865 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -54,6 +54,13 @@ else
 APR_UTIL_CONF_OPTS += --without-crypto
 endif
 
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+APR_UTIL_CONF_OPTS += --with-pgsql="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += postgresql
+else
+APR_UTIL_CONF_OPTS += --without-pgsql
+endif
+
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 APR_UTIL_CONF_OPTS += --with-odbc="$(STAGING_DIR)/usr"
 # avoid using target binary $(STAGING_DIR)/usr/bin/odbc_config
-- 
2.14.2
