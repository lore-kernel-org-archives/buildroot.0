From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:04:10 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/apr-util: add
 optional support for postgresql
Message-ID: <20180528142834.060CC822ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55c2c6ceaa6d8c525cafbb9e78abcb7ab34ec843
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

apr-util contains optional support for postgresql:

$ ls -1 output/target/usr/lib/apr-util-1/apr_dbd_pg*
output/target/usr/lib/apr-util-1/apr_dbd_pgsql-1.so
output/target/usr/lib/apr-util-1/apr_dbd_pgsql.la
output/target/usr/lib/apr-util-1/apr_dbd_pgsql.so

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ec1479fbe520ec468ad7a00bda8311597cff8ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
