From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 16:07:39 +0200
Subject: [Buildroot] [git commit] package/php: Fix static linking by
	reworking static libs handling
Message-ID: <20150531140814.916B3817D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7fa5f07942d358d7723129df9148432e9609e58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/157/157749f8b44bc02fbed0232a2b33137aba495134/
http://autobuild.buildroot.net/results/df4/df4e2ea098b0126867455af1891837c6d7d99a92/
http://autobuild.buildroot.net/results/e69/e6993d66aeebbe994063a60871412b2235ce5455/

[Peter: unixodbc only needs -lpthread if toolchain has threads support]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 89d22aa..c9bcfe3 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -25,6 +25,10 @@ PHP_CONF_ENV = \
 	ac_cv_func_strcasestr=yes \
 	EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
 
+ifeq ($(BR2_STATIC_LIBS),y)
+PHP_CONF_ENV += LIBS="$(PHP_STATIC_LIBS)"
+endif
+
 ifeq ($(BR2_TARGET_LOCALTIME),)
 PHP_LOCALTIME = UTC
 else
@@ -112,9 +116,7 @@ PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += openssl
 # openssl needs zlib, but the configure script forgets to link against
 # it causing detection failures with static linking
-ifeq ($(BR2_STATIC_LIBS),y)
-PHP_CONF_ENV += LIBS='-lz'
-endif
+PHP_STATIC_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs --static openssl)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
@@ -185,6 +187,7 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += sqlite
+PHP_STATIC_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs --static sqlite3)
 endif
 
 ### PDO
@@ -206,6 +209,9 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC),y)
 PHP_CONF_OPTS += --with-pdo-odbc=unixODBC,$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += unixodbc
+ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+PHP_STATIC_LIBS += -lpthread
+endif
 endif
 endif
 
