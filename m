From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat,  9 Aug 2014 19:06:36 +0200
Subject: [Buildroot] [PATCH 1/1] php: add pdo_pgsql extension
Message-ID: <1407603996-13837-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds support for the PDO PostgreSQL extension to the PHP package.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/php/Config.ext                | 10 ++++++++
 package/php/php-04-no-pg-config.patch | 46 +++++++++++++++++++++++++++++++++++
 package/php/php.mk                    |  4 +++
 3 files changed, 60 insertions(+)
 create mode 100644 package/php/php-04-no-pg-config.patch

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 078be8d..cb25d26 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -135,6 +135,16 @@ comment "MySQL drivers need a toolchain w/ C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
+	bool "PostgreSQL"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  PDO driver for PostgreSQL
+
+comment "PostgreSQL needs glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "SQLite3"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/php/php-04-no-pg-config.patch b/package/php/php-04-no-pg-config.patch
new file mode 100644
index 0000000..60e0adc
--- /dev/null
+++ b/package/php/php-04-no-pg-config.patch
@@ -0,0 +1,46 @@
+Disable executing pg_config in configure as there is only
+a pg_config build for the target architecture, and not for the host.
+
+Modifying configure directly, as autoreconf doesn't like php
+
+Signed-off-by: Floris Bos <bos@je-eigen-domein.nl> 
+
+diff -ur php-5.5.15.orig/configure php-5.5.15/configure
+--- php-5.5.15.orig/configure	2014-08-09 16:39:36.309032685 +0200
++++ php-5.5.15/configure	2014-08-09 17:58:22.353843902 +0200
+@@ -72832,27 +72832,6 @@
+     PGSQL_INCLUDE="$ep_realdir"/`basename "$PGSQL_INCLUDE"`
+   fi
+ 
+-
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for pg_config" >&5
+-$as_echo_n "checking for pg_config... " >&6; }
+-  for i in $PHP_PDO_PGSQL $PHP_PDO_PGSQL/bin /usr/local/pgsql/bin /usr/local/bin /usr/bin ""; do
+-    if test -x $i/pg_config; then
+-      PG_CONFIG="$i/pg_config"
+-      break;
+-    fi
+-  done
+-
+-  if test -n "$PG_CONFIG"; then
+-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $PG_CONFIG" >&5
+-$as_echo "$PG_CONFIG" >&6; }
+-    PGSQL_INCLUDE=`$PG_CONFIG --includedir`
+-    PGSQL_LIBDIR=`$PG_CONFIG --libdir`
+-
+-$as_echo "#define HAVE_PG_CONFIG_H 1" >>confdefs.h
+-
+-  else
+-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: not found" >&5
+-$as_echo "not found" >&6; }
+     if test "$PHP_PDO_PGSQL" = "yes"; then
+       PGSQL_SEARCH_PATHS="/usr /usr/local /usr/local/pgsql"
+     else
+@@ -72878,7 +72857,6 @@
+         fi
+       done
+     done
+-  fi
+ 
+   if test -z "$PGSQL_INCLUDE"; then
+     as_fn_error $? "Cannot find libpq-fe.h. Please specify correct PostgreSQL installation path" "$LINENO" 5
diff --git a/package/php/php.mk b/package/php/php.mk
index de7d668..d0418ad 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -162,6 +162,10 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
 	PHP_CONF_OPT += --with-pdo-mysql=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += mysql
 endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL),y)
+	PHP_CONF_OPT += --with-pdo-pgsql=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += postgresql
+endif
 endif
 
 ### Use external PCRE if it's available
-- 
1.8.3.2
