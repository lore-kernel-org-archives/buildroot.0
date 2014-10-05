From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 15:45:15 +0200
Subject: [Buildroot] [PATCH 5/8] package/apr-util: Rework dependencies
In-Reply-To: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412516718-12597-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add expat hard-dependency, when missing apr-util compiles its own expat
- all database libs are optional
- add optional OpenSSL support
- remove unused dependencies neon and zlib

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr-util/Config.in   |    5 +----
 package/apr-util/apr-util.mk |   37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index fcef693..6757e7e 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_APR_UTIL
 	bool "apr-util"
 	select BR2_PACKAGE_APR
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_NEON
-	select BR2_PACKAGE_NEON_ZLIB
-	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_EXPAT
 	# apr really needs shared library support
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU # apr
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 3e9ce54..4d5d988 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -9,7 +9,7 @@ APR_UTIL_SITE = http://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
 APR_UTIL_INSTALL_STAGING = YES
-APR_UTIL_DEPENDENCIES = apr sqlite neon zlib
+APR_UTIL_DEPENDENCIES = apr expat
 APR_UTIL_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config
 APR_UTIL_CONFIG_SCRIPTS = apu-1-config
@@ -18,4 +18,39 @@ APR_UTIL_CONFIG_SCRIPTS = apu-1-config
 # features.
 APR_UTIL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
+APR_UTIL_CONF_OPTS += --with-dbm=db53 --with-berkeley-db="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += berkeleydb
+else
+APR_UTIL_CONF_OPTS += --without-berkeley-db
+endif
+
+ifeq ($(BR2_PACKAGE_GDBM),y)
+APR_UTIL_CONF_OPTS += --with-gdbm="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += gdbm
+else
+APR_UTIL_CONF_OPTS += --without-gdbm
+endif
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+APR_UTIL_CONF_OPTS += --with-mysql="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += mysql
+else
+APR_UTIL_CONF_OPTS += --without-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+APR_UTIL_CONF_OPTS += --with-crypto --with-openssl="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += openssl
+else
+APR_UTIL_CONF_OPTS += --without-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+APR_UTIL_CONF_OPTS += --with-sqlite3="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += sqlite
+else
+APR_UTIL_CONF_OPTS += --without-sqlite3
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
