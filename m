From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Oct 2018 23:48:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: added support for PostgreSQL
 (non-PDO).
Message-ID: <20181020214841.19072-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for example for phppgadmin.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/Config.ext | 12 ++++++++++++
 package/php/php.mk     |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 51dcbbf4a4..bcd20cd25e 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -117,6 +117,18 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 	help
 	  MySQL Improved extension support
 
+config BR2_PACKAGE_PHP_EXT_PGSQL
+	bool "PostgreSQL"
+	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  PostgreSQL support
+
+comment "PostgreSQL extension needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_PHP_EXT_SQLITE
 	bool "SQLite3"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/php/php.mk b/package/php/php.mk
index 4365847733..bd1835f65f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -196,6 +196,12 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQLI),y)
 PHP_CONF_OPTS += --with-mysqli
 endif
+
+ifeq ($(BR2_PACKAGE_PHP_EXT_PGSQL),y)
+PHP_CONF_OPTS += --with-pgsql=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += postgresql
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += sqlite
-- 
2.19.1
