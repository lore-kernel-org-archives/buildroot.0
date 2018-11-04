From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 11:42:05 +0100
Subject: [Buildroot] [git commit] package/php: add support for PostgreSQL
 (non-PDO)
Message-ID: <20181104104113.76C5B81412@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03d52226e2f02d642bf3d44ca299cc190cb0b253
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for example for phppgadmin.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: add missing BR2_USE_WCHAR dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/Config.ext | 13 +++++++++++++
 package/php/php.mk     |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 808551e77b..3082462b4f 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -117,6 +117,19 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 	help
 	  MySQL Improved extension support
 
+config BR2_PACKAGE_PHP_EXT_PGSQL
+	bool "PostgreSQL"
+	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # postgresql
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  PostgreSQL support
+
+comment "PostgreSQL extension needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
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
