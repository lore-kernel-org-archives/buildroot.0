From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 07:24:35 +0100
Subject: [Buildroot] [git commit] package: fixup dependencies after
	mysql_client -> mysql rename
Message-ID: <20140122062622.141709C536@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99fd373bf54a1092bf0963e7e3972b691a495d2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in         |    2 +-
 package/collectd/collectd.mk       |    4 ++--
 package/cppdb/Config.in            |    4 ++--
 package/cppdb/cppdb.mk             |    4 ++--
 package/linknx/linknx.mk           |    4 ++--
 package/open2300/open2300.mk       |    2 +-
 package/php/Config.ext             |    6 +++---
 package/php/php.mk                 |    6 +++---
 package/poco/Config.in             |    2 +-
 package/poco/poco.mk               |    2 +-
 package/qt/Config.sql.in           |    2 +-
 package/qt/qt.mk                   |    2 +-
 package/qt5/qt5base/Config.in      |    2 +-
 package/qt5/qt5base/qt5base.mk     |    2 +-
 package/sconeserver/Config.in      |    2 +-
 package/sconeserver/sconeserver.mk |    2 +-
 package/strongswan/Config.in       |    2 +-
 package/strongswan/strongswan.mk   |    2 +-
 package/ulogd/ulogd.mk             |    4 ++--
 19 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 8123162..70b0439 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -236,7 +236,7 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_MYSQL
 	help
 	  Connects to a MySQL database and issues a "show status" command.
 
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index e7dc093..b133b73 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -104,7 +104,7 @@ COLLECTD_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
-	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mysql_client) \
+	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mysql) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),libesmtp) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
 	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),protobuf-c) \
@@ -117,7 +117,7 @@ COLLECTD_DEPENDENCIES = host-pkgconf \
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 	COLLECTD_CONF_OPT += --with-libcurl=$(STAGING_DIR)/usr
 endif
-ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
+ifeq ($(BR2_PACKAGE_MYSQL),y)
 	COLLECTD_CONF_OPT += --with-libmysql=$(STAGING_DIR)/usr
 endif
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
index f79b70b..a09151e 100644
--- a/package/cppdb/Config.in
+++ b/package/cppdb/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_CPPDB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Can be built without them but it's useless
-	depends on BR2_PACKAGE_MYSQL_CLIENT || BR2_PACKAGE_SQLITE
+	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_SQLITE
 	help
 	  CppDB is an SQL connectivity library that is designed to provide
 	  platform and Database independent connectivity API similarly
@@ -12,5 +12,5 @@ config BR2_PACKAGE_CPPDB
 	  http://cppcms.com/sql/cppdb/
 
 comment "cppdb needs a toolchain w/ C++, threads"
-	depends on BR2_PACKAGE_MYSQL_CLIENT || BR2_PACKAGE_SQLITE
+	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_SQLITE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cppdb/cppdb.mk b/package/cppdb/cppdb.mk
index 7cb858f..01da167 100644
--- a/package/cppdb/cppdb.mk
+++ b/package/cppdb/cppdb.mk
@@ -12,8 +12,8 @@ CPPDB_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
 CPPDB_LICENSE = Boost-v1.0 or MIT
 CPPDB_LICENSE_FILES = LICENSE_1_0.txt MIT.txt
 
-ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
-CPPDB_DEPENDENCIES += mysql_client
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+CPPDB_DEPENDENCIES += mysql
 CPPDB_CONF_OPT += -DMYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql
 endif
 
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index b838854..1c0259f 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -13,9 +13,9 @@ LINKNX_CONF_OPT = --without-lua --without-log4cpp --without-pth-test \
 
 LINKNX_DEPENDENCIES = libpthsem
 
-ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
+ifeq ($(BR2_PACKAGE_MYSQL),y)
 LINKNX_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
-LINKNX_DEPENDENCIES += mysql_client
+LINKNX_DEPENDENCIES += mysql
 else
 LINKNX_CONF_OPT += --without-mysql
 endif
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index d083795..e9f1cf5 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -12,7 +12,7 @@ OPEN2300_BINS = open2300 dump2300 log2300 fetch2300 wu2300 cw2300 history2300 \
 		histlog2300 bin2300 xml2300 light2300 interval2300 minmax2300
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-	OPEN2300_DEPENDENCIES += mysql_client
+	OPEN2300_DEPENDENCIES += mysql
 	OPEN2300_BINS         += mysql2300 mysqlhistlog2300
 endif
 
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 2ffa2c2..df02047 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -96,7 +96,7 @@ config BR2_PACKAGE_PHP_EXT_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_MYSQL
 	help
 	  MySQL support
 
@@ -105,7 +105,7 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_PHP_EXT_MYSQL
 	help
 	  MySQL Improved extension support
@@ -122,7 +122,7 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_MYSQL
 	help
 	  PDO driver for MySQL
 
diff --git a/package/php/php.mk b/package/php/php.mk
index f31217e..54d6e05 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -133,11 +133,11 @@ endif
 ### Native MySQL extensions
 ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQL),y)
 	PHP_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += mysql_client
+	PHP_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQLI),y)
 	PHP_CONF_OPT += --with-mysqli=$(STAGING_DIR)/usr/bin/mysql_config
-	PHP_DEPENDENCIES += mysql_client
+	PHP_DEPENDENCIES += mysql
 endif
 
 ### PDO
@@ -153,7 +153,7 @@ endif
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
 	PHP_CONF_OPT += --with-pdo-mysql=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += mysql_client
+	PHP_DEPENDENCIES += mysql
 endif
 endif
 
diff --git a/package/poco/Config.in b/package/poco/Config.in
index 342fd6c..e8832e8 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -56,7 +56,7 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 	bool "mysql"
 	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_POCO_DATA
-	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_MYSQL
 
 endif # BR2_PACKAGE_POCO
 
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 3516c04..9ee2d61 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -17,7 +17,7 @@ POCO_DEPENDENCIES = zlib pcre					\
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl)		\
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl)	\
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite)		\
-	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql_client)
+	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql)
 
 POCO_OMIT = Data/ODBC PageCompiler					\
 	$(if $(BR2_PACKAGE_POCO_XML),,XML)				\
diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 04489c7..259a574 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -6,7 +6,7 @@ menuconfig BR2_PACKAGE_QT_SQL_MODULE
 if BR2_PACKAGE_QT_SQL_MODULE
 config BR2_PACKAGE_QT_MYSQL
 	bool "MySQL Driver"
-	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	depends on BR2_USE_MMU # mysql
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 867b798..bc329f0 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -341,7 +341,7 @@ QT_CONFIGURE_OPTS += -qt-sql-ibase
 endif
 ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
 QT_CONFIGURE_OPTS += -qt-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
-QT_DEPENDENCIES   += mysql_client
+QT_DEPENDENCIES   += mysql
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
 QT_CONFIGURE_OPTS += -qt-sql-odbc
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 3090d65..2fca9d2 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -53,7 +53,7 @@ config BR2_PACKAGE_QT5BASE_SQL
 if BR2_PACKAGE_QT5BASE_SQL
 config BR2_PACKAGE_QT5BASE_MYSQL
 	bool "MySQL Plugin"
-	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	depends on BR2_USE_MMU # mysql
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 6928bb8..fcfad4e 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -61,7 +61,7 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
 QT5BASE_CONFIGURE_OPTS += -plugin-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
-QT5BASE_DEPENDENCIES   += mysql_client
+QT5BASE_DEPENDENCIES   += mysql
 else
 QT5BASE_CONFIGURE_OPTS += -no-sql-mysql
 endif
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 839c111..1dc41d2 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -38,7 +38,7 @@ config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
 config BR2_PACKAGE_SCONESERVER_MYSQL
 	bool "mysql"
 	depends on BR2_USE_MMU # mysql
-	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_MYSQL
 	help
 	  MySQL module for Sconeserver
 
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index be5fab7..5768b73 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -57,7 +57,7 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
-	SCONESERVER_DEPENDENCIES += mysql_client
+	SCONESERVER_DEPENDENCIES += mysql
 	SCONESERVER_CONF_OPT += --with-mysql \
 		--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config" \
 		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/mysql"
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 3ed0b31..63316cb 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -100,7 +100,7 @@ config BR2_PACKAGE_STRONGSWAN_STROKE
 
 config BR2_PACKAGE_STRONGSWAN_SQL
 	bool "Enable SQL database configuration backend"
-	depends on BR2_PACKAGE_SQLITE || BR2_PACKAGE_MYSQL_CLIENT
+	depends on BR2_PACKAGE_SQLITE || BR2_PACKAGE_MYSQL
 
 endif
 
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index aa63d0d..24079c6 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -64,7 +64,7 @@ STRONGSWAN_DEPENDENCIES +=                               \
 ifeq ($(BR2_PACKAGE_STRONGSWAN_SQL),y)
 STRONGSWAN_DEPENDENCIES +=                               \
       $(if $(BR2_PACKAGE_SQLITE),sqlite)                 \
-      $(if $(BR2_PACKAGE_MYSQL_CLIENT),mysql_client)
+      $(if $(BR2_PACKAGE_MYSQL),mysql)
 endif
 
 # Strongswan uses AC_LIB_PREFIX, which is relatively new.
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 03958bb..b51da21 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -17,9 +17,9 @@ ULOGD_LICENSE_FILES = COPYING
 
 # DB backends need threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
+ifeq ($(BR2_PACKAGE_MYSQL),y)
 	ULOGD_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
-	ULOGD_DEPENDENCIES += mysql_client
+	ULOGD_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	ULOGD_DEPENDENCIES += sqlite
