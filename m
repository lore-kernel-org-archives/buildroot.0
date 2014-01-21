From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Tue, 21 Jan 2014 14:08:28 +0000
Subject: [Buildroot] [PATCH v2, 1/3] Rename MySQL client package
Message-ID: <1390313310-3453-1-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MySQL client package has been renamed to MySQL.

Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
Changes v1 -> v2:

	- fix leading tab, not spaces

 Config.in.legacy                                   |    7 +++++
 package/Config.in                                  |    2 +-
 package/{mysql_client => mysql}/Config.in          |    9 +++---
 .../mysql-ac_cache_check.patch}                    |    0
 .../mysql-configure-ps-cache-check.patch}          |    0
 .../mysql-use-new-readline-iface.patch}            |    0
 .../mysql_client.mk => mysql/mysql.mk}             |   32 ++++++++++----------
 7 files changed, 29 insertions(+), 21 deletions(-)
 rename package/{mysql_client => mysql}/Config.in (61%)
 rename package/{mysql_client/mysql_client-ac_cache_check.patch => mysql/mysql-ac_cache_check.patch} (100%)
 rename package/{mysql_client/mysql_client-configure-ps-cache-check.patch => mysql/mysql-configure-ps-cache-check.patch} (100%)
 rename package/{mysql_client/mysql_client-use-new-readline-iface.patch => mysql/mysql-use-new-readline-iface.patch} (100%)
 rename package/{mysql_client/mysql_client.mk => mysql/mysql.mk} (54%)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2fed2d8..abd39d9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -111,6 +111,13 @@ config BR2_PACKAGE_LIBNFC_LLCP
           to 'libllcp'. We have added a new package for 'libllcp' and bumped
           the version at the same time.
 
+config BR2_PACKAGE_MYSQL_CLIENT
+	bool "MySQL client renamed to MySQL"
+	select BR2_LEGACY
+	select BR2_PACKAGE_MYSQL
+	help
+	  The option has been renamed BR2_PACKAGE_MYSQL
+
 config BR2_PACKAGE_SQUASHFS3
 	bool "squashfs3 has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 8495cdd..74fbcda 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -503,7 +503,7 @@ menu "Database"
 source "package/berkeleydb/Config.in"
 source "package/cppdb/Config.in"
 source "package/gdbm/Config.in"
-source "package/mysql_client/Config.in"
+source "package/mysql/Config.in"
 source "package/redis/Config.in"
 source "package/sqlcipher/Config.in"
 source "package/sqlite/Config.in"
diff --git a/package/mysql_client/Config.in b/package/mysql/Config.in
similarity index 61%
rename from package/mysql_client/Config.in
rename to package/mysql/Config.in
index 543bed1..229e050 100644
--- a/package/mysql_client/Config.in
+++ b/package/mysql/Config.in
@@ -1,13 +1,14 @@
-config BR2_PACKAGE_MYSQL_CLIENT
-	bool "MySQL client"
+config BR2_PACKAGE_MYSQL
+	bool "MySQL"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
-	  MySQL client
+          The MySQL Open Source Database System
+	  http://www.mysql.com/
 
-comment "MySQL client needs a toolchain w/ C++, threads"
+comment "MySQL needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mysql_client/mysql_client-ac_cache_check.patch b/package/mysql/mysql-ac_cache_check.patch
similarity index 100%
rename from package/mysql_client/mysql_client-ac_cache_check.patch
rename to package/mysql/mysql-ac_cache_check.patch
diff --git a/package/mysql_client/mysql_client-configure-ps-cache-check.patch b/package/mysql/mysql-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql_client/mysql_client-configure-ps-cache-check.patch
rename to package/mysql/mysql-configure-ps-cache-check.patch
diff --git a/package/mysql_client/mysql_client-use-new-readline-iface.patch b/package/mysql/mysql-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql_client/mysql_client-use-new-readline-iface.patch
rename to package/mysql/mysql-use-new-readline-iface.patch
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql/mysql.mk
similarity index 54%
rename from package/mysql_client/mysql_client.mk
rename to package/mysql/mysql.mk
index bd4c565..aaf6ba9 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql/mysql.mk
@@ -1,20 +1,20 @@
 ################################################################################
 #
-# mysql_client
+# mysql
 #
 ################################################################################
 
-MYSQL_CLIENT_VERSION_MAJOR = 5.1
-MYSQL_CLIENT_VERSION = $(MYSQL_CLIENT_VERSION_MAJOR).70
-MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
-MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_CLIENT_VERSION_MAJOR)
-MYSQL_CLIENT_INSTALL_STAGING = YES
-MYSQL_CLIENT_DEPENDENCIES = readline ncurses
-MYSQL_CLIENT_AUTORECONF = YES
-MYSQL_CLIENT_LICENSE = GPLv2
-MYSQL_CLIENT_LICENSE_FILES = README COPYING
+MYSQL_VERSION_MAJOR = 5.1
+MYSQL_VERSION = $(MYSQL_VERSION_MAJOR).70
+MYSQL_SOURCE = mysql-$(MYSQL_VERSION).tar.gz
+MYSQL_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_VERSION_MAJOR)
+MYSQL_INSTALL_STAGING = YES
+MYSQL_DEPENDENCIES = readline ncurses
+MYSQL_AUTORECONF = YES
+MYSQL_LICENSE = GPLv2
+MYSQL_LICENSE_FILES = README COPYING
 
-MYSQL_CLIENT_CONF_ENV = \
+MYSQL_CONF_ENV = \
 	ac_cv_sys_restartable_syscalls=yes \
 	ac_cv_path_PS=/bin/ps \
 	ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null" \
@@ -23,7 +23,7 @@ MYSQL_CLIENT_CONF_ENV = \
 	ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=yes \
 	mysql_cv_new_rl_interface=yes
 
-MYSQL_CLIENT_CONF_OPT = \
+MYSQL_CONF_OPT = \
 	--without-ndb-binlog \
 	--without-server \
 	--without-docs \
@@ -34,15 +34,15 @@ MYSQL_CLIENT_CONF_OPT = \
 	--enable-thread-safe-client \
 	$(ENABLE_DEBUG)
 
-define MYSQL_CLIENT_REMOVE_TEST_PROGS
+define MYSQL_REMOVE_TEST_PROGS
 	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
 endef
 
-define MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
+define MYSQL_ADD_MYSQL_LIB_PATH
 	echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf
 endef
 
-MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_REMOVE_TEST_PROGS
-MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
+MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_REMOVE_TEST_PROGS
+MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_MYSQL_LIB_PATH
 
 $(eval $(autotools-package))
-- 
1.7.10.4
