From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:19:50 +0200
Subject: [Buildroot] [git commit] php: add pdo_pgsql extension
Message-ID: <20140901132446.0C6859D5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=742f8efa08fc0f3fef2b1ea0c8ee283fced6bbab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for the PDO PostgreSQL extension to the PHP package.

[Thomas: slightly adjust Config.in comment to indicate that's it's the
"Postgresql driver" that needs (e)glibc and not just "Postgresql".]

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext |   10 ++++++++++
 package/php/php.mk     |    4 ++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 078be8d..cac2892 100644
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
+comment "PostgreSQL driver needs an (e)glibc toolchain"
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
