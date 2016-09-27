From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 26 Sep 2016 18:53:02 -0700
Subject: [Buildroot] [RFC v3 1/3] mysql: rename package to oracle-mysql
In-Reply-To: <20160927015304.5937-1-bluemrp9@gmail.com>
References: <20160927015304.5937-1-bluemrp9@gmail.com>
Message-ID: <20160927015304.5937-2-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/Config.in                                  |  2 +-
 .../0000-ac_cache_check.patch                      |  0
 .../0001-configure-ps-cache-check.patch            |  0
 .../0002-use-new-readline-iface.patch              |  0
 .../0003-ac_stack_direction-is-unset.patch         |  0
 .../0004-Fix-gen_lex_hash-execution.patch          |  0
 .../0005-bison_3_breaks_mysql_server_build.patch   |  0
 .../0006-no-force-static-build.patch               |  0
 .../0007-dont-install-in-mysql-directory.patch     |  0
 package/{mysql => oracle-mysql}/Config.in          | 12 ++--
 package/{mysql => oracle-mysql}/S97mysqld          |  0
 package/{mysql => oracle-mysql}/mysqld.service     |  0
 .../mysql.hash => oracle-mysql/oracle-mysql.hash}  |  0
 .../mysql.mk => oracle-mysql/oracle-mysql.mk}      | 66 +++++++++++-----------
 14 files changed, 40 insertions(+), 40 deletions(-)
 rename package/{mysql => oracle-mysql}/0000-ac_cache_check.patch (100%)
 rename package/{mysql => oracle-mysql}/0001-configure-ps-cache-check.patch (100%)
 rename package/{mysql => oracle-mysql}/0002-use-new-readline-iface.patch (100%)
 rename package/{mysql => oracle-mysql}/0003-ac_stack_direction-is-unset.patch (100%)
 rename package/{mysql => oracle-mysql}/0004-Fix-gen_lex_hash-execution.patch (100%)
 rename package/{mysql => oracle-mysql}/0005-bison_3_breaks_mysql_server_build.patch (100%)
 rename package/{mysql => oracle-mysql}/0006-no-force-static-build.patch (100%)
 rename package/{mysql => oracle-mysql}/0007-dont-install-in-mysql-directory.patch (100%)
 rename package/{mysql => oracle-mysql}/Config.in (65%)
 rename package/{mysql => oracle-mysql}/S97mysqld (100%)
 rename package/{mysql => oracle-mysql}/mysqld.service (100%)
 rename package/{mysql/mysql.hash => oracle-mysql/oracle-mysql.hash} (100%)
 rename package/{mysql/mysql.mk => oracle-mysql/oracle-mysql.mk} (65%)

diff --git a/package/Config.in b/package/Config.in
index fe3ac2c..5c5cb25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -910,7 +910,7 @@ menu "Database"
 	source "package/leveldb/Config.in"
 	source "package/libpqxx/Config.in"
 	source "package/mongodb/Config.in"
-	source "package/mysql/Config.in"
+	source "package/oracle-mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
 	source "package/sqlcipher/Config.in"
diff --git a/package/mysql/0000-ac_cache_check.patch b/package/oracle-mysql/0000-ac_cache_check.patch
similarity index 100%
rename from package/mysql/0000-ac_cache_check.patch
rename to package/oracle-mysql/0000-ac_cache_check.patch
diff --git a/package/mysql/0001-configure-ps-cache-check.patch b/package/oracle-mysql/0001-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql/0001-configure-ps-cache-check.patch
rename to package/oracle-mysql/0001-configure-ps-cache-check.patch
diff --git a/package/mysql/0002-use-new-readline-iface.patch b/package/oracle-mysql/0002-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql/0002-use-new-readline-iface.patch
rename to package/oracle-mysql/0002-use-new-readline-iface.patch
diff --git a/package/mysql/0003-ac_stack_direction-is-unset.patch b/package/oracle-mysql/0003-ac_stack_direction-is-unset.patch
similarity index 100%
rename from package/mysql/0003-ac_stack_direction-is-unset.patch
rename to package/oracle-mysql/0003-ac_stack_direction-is-unset.patch
diff --git a/package/mysql/0004-Fix-gen_lex_hash-execution.patch b/package/oracle-mysql/0004-Fix-gen_lex_hash-execution.patch
similarity index 100%
rename from package/mysql/0004-Fix-gen_lex_hash-execution.patch
rename to package/oracle-mysql/0004-Fix-gen_lex_hash-execution.patch
diff --git a/package/mysql/0005-bison_3_breaks_mysql_server_build.patch b/package/oracle-mysql/0005-bison_3_breaks_mysql_server_build.patch
similarity index 100%
rename from package/mysql/0005-bison_3_breaks_mysql_server_build.patch
rename to package/oracle-mysql/0005-bison_3_breaks_mysql_server_build.patch
diff --git a/package/mysql/0006-no-force-static-build.patch b/package/oracle-mysql/0006-no-force-static-build.patch
similarity index 100%
rename from package/mysql/0006-no-force-static-build.patch
rename to package/oracle-mysql/0006-no-force-static-build.patch
diff --git a/package/mysql/0007-dont-install-in-mysql-directory.patch b/package/oracle-mysql/0007-dont-install-in-mysql-directory.patch
similarity index 100%
rename from package/mysql/0007-dont-install-in-mysql-directory.patch
rename to package/oracle-mysql/0007-dont-install-in-mysql-directory.patch
diff --git a/package/mysql/Config.in b/package/oracle-mysql/Config.in
similarity index 65%
rename from package/mysql/Config.in
rename to package/oracle-mysql/Config.in
index 7133892..0622a13 100644
--- a/package/mysql/Config.in
+++ b/package/oracle-mysql/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_MYSQL
-	bool "MySQL"
+config BR2_PACKAGE_ORACLE_MYSQL
+	bool "oracle mysql"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -10,15 +10,15 @@ config BR2_PACKAGE_MYSQL
 
 	  http://www.mysql.com/
 
-if BR2_PACKAGE_MYSQL
+if BR2_PACKAGE_ORACLE_MYSQL
 
-config BR2_PACKAGE_MYSQL_SERVER
-	bool "MySQL server"
+config BR2_PACKAGE_ORACLE_MYSQL_SERVER
+	bool "oracle mysql server"
 	help
 	  Install the MySQL server on the target.
 
 endif
 
-comment "MySQL needs a toolchain w/ C++, threads"
+comment "oracle mysql needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mysql/S97mysqld b/package/oracle-mysql/S97mysqld
similarity index 100%
rename from package/mysql/S97mysqld
rename to package/oracle-mysql/S97mysqld
diff --git a/package/mysql/mysqld.service b/package/oracle-mysql/mysqld.service
similarity index 100%
rename from package/mysql/mysqld.service
rename to package/oracle-mysql/mysqld.service
diff --git a/package/mysql/mysql.hash b/package/oracle-mysql/oracle-mysql.hash
similarity index 100%
rename from package/mysql/mysql.hash
rename to package/oracle-mysql/oracle-mysql.hash
diff --git a/package/mysql/mysql.mk b/package/oracle-mysql/oracle-mysql.mk
similarity index 65%
rename from package/mysql/mysql.mk
rename to package/oracle-mysql/oracle-mysql.mk
index 7af4711..532cced 100644
--- a/package/mysql/mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -1,23 +1,23 @@
 ################################################################################
 #
-# mysql
+# oracle-mysql
 #
 ################################################################################
 
-MYSQL_VERSION_MAJOR = 5.1
-MYSQL_VERSION = $(MYSQL_VERSION_MAJOR).73
-MYSQL_SOURCE = mysql-$(MYSQL_VERSION).tar.gz
-MYSQL_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_VERSION_MAJOR)
-MYSQL_INSTALL_STAGING = YES
-MYSQL_DEPENDENCIES = readline ncurses
-MYSQL_AUTORECONF = YES
-MYSQL_LICENSE = GPLv2
-MYSQL_LICENSE_FILES = README COPYING
+ORACLE_MYSQL_VERSION_MAJOR = 5.1
+ORACLE_MYSQL_VERSION = $(ORACLE_MYSQL_VERSION_MAJOR).73
+ORACLE_MYSQL_SOURCE = mysql-$(ORACLE_MYSQL_VERSION).tar.gz
+ORACLE_MYSQL_SITE = http://downloads.skysql.com/archives/mysql-$(ORACLE_MYSQL_VERSION_MAJOR)
+ORACLE_MYSQL_INSTALL_STAGING = YES
+ORACLE_MYSQL_DEPENDENCIES = readline ncurses
+ORACLE_MYSQL_AUTORECONF = YES
+ORACLE_MYSQL_LICENSE = GPLv2
+ORACLE_MYSQL_LICENSE_FILES = README COPYING
 
 # Unix socket. This variable can also be consulted by other buildroot packages
 MYSQL_SOCKET = /run/mysql/mysql.sock
 
-MYSQL_CONF_ENV = \
+ORACLE_MYSQL_CONF_ENV = \
 	ac_cv_sys_restartable_syscalls=yes \
 	ac_cv_path_PS=/bin/ps \
 	ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null" \
@@ -26,7 +26,7 @@ MYSQL_CONF_ENV = \
 	ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=yes \
 	mysql_cv_new_rl_interface=yes
 
-MYSQL_CONF_OPTS = \
+ORACLE_MYSQL_CONF_OPTS = \
 	--without-ndb-binlog \
 	--without-docs \
 	--without-man \
@@ -40,13 +40,13 @@ MYSQL_CONF_OPTS = \
 # host-mysql only installs what is needed to build mysql, i.e. the
 # gen_lex_hash tool, and it only builds the parts that are needed to
 # create this tool
-HOST_MYSQL_DEPENDENCIES = host-zlib host-ncurses
+HOST_ORACLE_MYSQL_DEPENDENCIES = host-zlib host-ncurses
 
-HOST_MYSQL_CONF_OPTS = \
+HOST_ORACLE_MYSQL_CONF_OPTS = \
 	--with-embedded-server \
 	--disable-mysql-maintainer-mode
 
-define HOST_MYSQL_BUILD_CMDS
+define HOST_ORACLE_MYSQL_BUILD_CMDS
 	$(MAKE) -C $(@D)/include my_config.h
 	$(MAKE) -C $(@D)/mysys libmysys.a
 	$(MAKE) -C $(@D)/strings libmystrings.a
@@ -56,22 +56,22 @@ define HOST_MYSQL_BUILD_CMDS
 	$(MAKE) -C $(@D)/sql gen_lex_hash
 endef
 
-define HOST_MYSQL_INSTALL_CMDS
+define HOST_ORACLE_MYSQL_INSTALL_CMDS
 	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash $(HOST_DIR)/usr/bin/
 endef
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MYSQL_DEPENDENCIES += openssl
+ORACLE_MYSQL_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-MYSQL_DEPENDENCIES += zlib
+ORACLE_MYSQL_DEPENDENCIES += zlib
 endif
 
-ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
-MYSQL_DEPENDENCIES += host-mysql host-bison
+ifeq ($(BR2_PACKAGE_ORACLE_MYSQL_SERVER),y)
+ORACLE_MYSQL_DEPENDENCIES += host-oracle-mysql host-bison
 
-MYSQL_CONF_OPTS += \
+ORACLE_MYSQL_CONF_OPTS += \
 	--localstatedir=/var/mysql \
 	--with-atomic-ops=up \
 	--with-embedded-server \
@@ -91,28 +91,28 @@ MYSQL_CONF_OPTS += \
 # Debugging is only available for the server, so no need for
 # this if-block outside of the server if-block
 ifeq ($(BR2_ENABLE_DEBUG),y)
-MYSQL_CONF_OPTS += --with-debug=full
+ORACLE_MYSQL_CONF_OPTS += --with-debug=full
 else
-MYSQL_CONF_OPTS += --without-debug
+ORACLE_MYSQL_CONF_OPTS += --without-debug
 endif
 
-define MYSQL_USERS
+define ORACLE_MYSQL_USERS
 	mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
 endef
 
-define MYSQL_ADD_FOLDER
+define ORACLE_MYSQL_ADD_FOLDER
 	$(INSTALL) -d $(TARGET_DIR)/var/mysql
 endef
 
-MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_FOLDER
+ORACLE_MYSQL_POST_INSTALL_TARGET_HOOKS += ORACLE_MYSQL_ADD_FOLDER
 
-define MYSQL_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/mysql/S97mysqld \
+define ORACLE_MYSQL_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/oracle-mysql/S97mysqld \
 		$(TARGET_DIR)/etc/init.d/S97mysqld
 endef
 
-define MYSQL_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/mysql/mysqld.service \
+define ORACLE_MYSQL_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/oracle-mysql/mysqld.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mysqld.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../usr/lib/systemd/system/mysqld.service \
@@ -120,16 +120,16 @@ define MYSQL_INSTALL_INIT_SYSTEMD
 endef
 
 else
-MYSQL_CONF_OPTS += \
+ORACLE_MYSQL_CONF_OPTS += \
 	--without-server
 endif
 
 
-define MYSQL_REMOVE_TEST_PROGS
+define ORACLE_MYSQL_REMOVE_TEST_PROGS
 	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
 endef
 
-MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_REMOVE_TEST_PROGS
+ORACLE_MYSQL_POST_INSTALL_TARGET_HOOKS += ORACLE_MYSQL_REMOVE_TEST_PROGS
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.3
