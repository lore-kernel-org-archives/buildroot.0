From: Mauro Condarelli <mc5686@mclink.it>
Date: Sun,  8 Mar 2015 22:37:09 +0100
Subject: [Buildroot] [PATCH 3/3] Added support for PHP/SQLite3 (non PDO).
In-Reply-To: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
References: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
Message-ID: <1425850629-14725-3-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/php/Config.ext |    6 ++++++
 package/php/php.mk     |    4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index daf16c7..57685b2 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -120,6 +120,12 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 	help
 	  MySQL Improved extension support
 
+config BR2_PACKAGE_PHP_EXT_SQLITE
+	bool "SQLite3"
+	select BR2_PACKAGE_SQLITE
+	help
+	  SQLite3 support
+
 config BR2_PACKAGE_PHP_EXT_PDO
 	bool "PDO"
 	help
diff --git a/package/php/php.mk b/package/php/php.mk
index dd52508..b5daeb6 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -154,6 +154,10 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQLI),y)
 	PHP_CONF_OPTS += --with-mysqli=$(STAGING_DIR)/usr/bin/mysql_config
 	PHP_DEPENDENCIES += mysql
 endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
+	PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += sqlite
+endif
 
 ### PDO
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO),y)
-- 
1.7.10.4
