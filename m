From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 13 Aug 2014 15:57:11 +0200
Subject: [Buildroot] [PATCH v2 3/3] php: add pdo_pgsql extension
In-Reply-To: <1407938231-22544-1-git-send-email-bos@je-eigen-domein.nl>
References: <1407938231-22544-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1407938231-22544-3-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds support for the PDO PostgreSQL extension to the PHP package.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/php/Config.ext | 10 ++++++++++
 package/php/php.mk     |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 078be8d..f0719bb 100644
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
+comment "PostgreSQL needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "SQLite3"
 	select BR2_PACKAGE_SQLITE
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
