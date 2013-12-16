From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 16:19:13 +0100
Subject: [Buildroot] [git commit] php: bump to version 5.5.7
Message-ID: <20131216151942.CAA7D9BC5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76ad808a50384a383712b9d7b7fb1913c0249696
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.ext |   17 ++++++-----------
 package/php/php.mk     |   14 ++------------
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 23d2306..2ffa2c2 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -91,17 +91,6 @@ config BR2_PACKAGE_PHP_EXT_DBA_INI
 
 endif
 
-config BR2_PACKAGE_PHP_EXT_SQLITE
-	bool "SQLite"
-	help
-	  Legacy SQLite2 support
-
-config BR2_PACKAGE_PHP_EXT_SQLITE_UTF8
-	bool "sqlite UTF8 support"
-	depends on BR2_PACKAGE_PHP_EXT_SQLITE
-	help
-	  UTF8 support for sqlite
-
 config BR2_PACKAGE_PHP_EXT_MYSQL
 	bool "Mysql"
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -227,6 +216,7 @@ config BR2_PACKAGE_PHP_EXT_FTP
 
 config BR2_PACKAGE_PHP_EXT_SNMP
 	bool "SNMP"
+	depends on BR2_USE_MMU # netsnmp fork()
 	select BR2_PACKAGE_NETSNMP
 	select BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 	help
@@ -234,13 +224,18 @@ config BR2_PACKAGE_PHP_EXT_SNMP
 
 config BR2_PACKAGE_PHP_EXT_SOCKETS
 	bool "sockets"
+	depends on BR2_INET_IPV6
 	help
 	  Sockets support
 
+comment "sockets support needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
+
 comment "Process Control"
 
 config BR2_PACKAGE_PHP_EXT_PCNTL
 	bool "PCNTL"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Process control support
 
diff --git a/package/php/php.mk b/package/php/php.mk
index 3e284f2..10c314f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.3.27
+PHP_VERSION = 5.5.7
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPT = INSTALL_ROOT=$(TARGET_DIR) install
+PHP_DEPENDENCIES = host-pkgconf
 PHP_LICENSE = PHP
 PHP_LICENSE_FILES = LICENSE
 PHP_CONF_OPT =  --mandir=/usr/share/man \
@@ -125,17 +126,6 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_READLINE),y)
 	PHP_DEPENDENCIES += readline
 endif
 
-### Legacy sqlite2 support
-ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
-	PHP_CONF_OPT += --with-sqlite
-ifneq ($(BR2_LARGEFILE),y)
-	PHP_CFLAGS += -DSQLITE_DISABLE_LFS
-endif
-ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE_UTF8),y)
-	PHP_CONF_OPT += --enable-sqlite-utf8
-endif
-endif
-
 ### Native MySQL extensions
 ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQL),y)
 	PHP_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
