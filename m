From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu,  9 Jul 2015 18:22:01 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster variant
In-Reply-To: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
---
 .../mariadb-galera-01-fix_xtradb_cmakelist.patch   |  27 +++
 .../mariadb-galera-02-fix_innodb_cmakelist.patch   | 251 +++++++++++++++++++++
 package/mysql/Config.in                            |  43 +++-
 package/mysql/mariadb-galera-cluster.cnf           | 204 +++++++++++++++++
 package/mysql/mysql.hash                           |   2 +
 package/mysql/mysql.mk                             | 216 +++++++++++++++---
 6 files changed, 707 insertions(+), 36 deletions(-)
 create mode 100644 package/mysql/10.0.17/mariadb-galera-01-fix_xtradb_cmakelist.patch
 create mode 100644 package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch
 create mode 100644 package/mysql/mariadb-galera-cluster.cnf

diff --git a/package/mysql/10.0.17/mariadb-galera-01-fix_xtradb_cmakelist.patch b/package/mysql/10.0.17/mariadb-galera-01-fix_xtradb_cmakelist.patch
new file mode 100644
index 0000000..83eac77
--- /dev/null
+++ b/package/mysql/10.0.17/mariadb-galera-01-fix_xtradb_cmakelist.patch
@@ -0,0 +1,27 @@
+Do not perform test if the build is not requested anyway. The test may fail,
+preventing building the whole package.
+
+--- a/storage/xtradb/CMakeLists.txt	2014-10-30 16:24:33.160188627 +0100
++++ b/storage/xtradb/CMakeLists.txt	2014-10-30 16:25:09.060188829 +0100
+@@ -470,12 +470,13 @@
+   SET(WITH_INNOBASE_STORAGE_ENGINE TRUE)
+ ENDIF()
+ 
+-IF(XTRADB_OK)
+-  MYSQL_ADD_PLUGIN(xtradb ${INNOBASE_SOURCES} STORAGE_ENGINE
+-    DEFAULT
+-    RECOMPILE_FOR_EMBEDDED
+-    LINK_LIBRARIES ${ZLIB_LIBRARY} ${LINKER_SCRIPT})
+-ELSE()
+-  MESSAGE(FATAL_ERROR "Percona XtraDB is not supported on this platform")
++IF(NOT WITHOUT_XTRADB)
++  IF(XTRADB_OK)
++    MYSQL_ADD_PLUGIN(xtradb ${INNOBASE_SOURCES} STORAGE_ENGINE
++      DEFAULT
++      RECOMPILE_FOR_EMBEDDED
++      LINK_LIBRARIES ${ZLIB_LIBRARY} ${LINKER_SCRIPT})
++  ELSE()
++    MESSAGE(FATAL_ERROR "Percona XtraDB is not supported on this platform")
++  ENDIF()
+ ENDIF()
+-
diff --git a/package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch b/package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch
new file mode 100644
index 0000000..1ddec5d
--- /dev/null
+++ b/package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch
@@ -0,0 +1,251 @@
+Use CHECK_C_SOURCE_COMPILES instead of CHECK_C_SOURCE_RUNS in order to be
+cross-compile friendly.
+In buildroot another solution (maybe better, maybe not) could be to use
+BR2_ARCH_HAS_ATOMICS in order to determine the value of HAVE_IB_GCC_ATOMIC_BUILTINS_BYTE
+and likes.
+
+--- a/storage/innobase/CMakeLists.txt	2014-11-07 17:05:48.853208487 +0100
++++ b/storage/innobase/CMakeLists.txt	2014-11-07 17:11:38.061217839 +0100
+@@ -58,100 +58,99 @@
+ 
+ IF(NOT MSVC)
+ # either define HAVE_IB_GCC_ATOMIC_BUILTINS or not
+-IF(NOT CMAKE_CROSSCOMPILING)
+-  # workaround for gcc 4.1.2 RHEL5/x86, gcc atomic ops only work under -march=i686
+-  IF(CMAKE_SYSTEM_PROCESSOR STREQUAL "i686" AND CMAKE_COMPILER_IS_GNUCC AND
+-     CMAKE_C_COMPILER_VERSION VERSION_LESS "4.1.3")
+-    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=i686")
+-    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=i686")
+-  ENDIF()
+-  CHECK_C_SOURCE_RUNS(
+-  "
+-  int main()
+-  {
+-    long	x;
+-    long	y;
+-    long	res;
+-
+-    x = 10;
+-    y = 123;
+-    res = __sync_bool_compare_and_swap(&x, x, y);
+-    if (!res || x != y) {
+-      return(1);
+-    }
+-
+-    x = 10;
+-    y = 123;
+-    res = __sync_bool_compare_and_swap(&x, x + 1, y);
+-    if (res || x != 10) {
+-      return(1);
+-    }
+-    x = 10;
+-    y = 123;
+-    res = __sync_add_and_fetch(&x, y);
+-    if (res != 123 + 10 || x != 123 + 10) {
+-      return(1);
+-    }
+-    return(0);
+-  }"
+-  HAVE_IB_GCC_ATOMIC_BUILTINS
+-  )
+-  CHECK_C_SOURCE_RUNS(
+-  "
+-  int main()
+-  {
+-    long	res;
+-    char	c;
+-
+-    c = 10;
+-    res = __sync_lock_test_and_set(&c, 123);
+-    if (res != 10 || c != 123) {
+-      return(1);
+-    }
+-    return(0);
+-  }"
+-  HAVE_IB_GCC_ATOMIC_BUILTINS_BYTE
+-  )
+-  CHECK_C_SOURCE_RUNS(
+-  "#include<stdint.h>
+-  int main()
+-  {
+-    int64_t	x,y,res;
+-
+-    x = 10;
+-    y = 123;
+-    res = __sync_sub_and_fetch(&y, x);
+-    if (res != y || y != 113) {
+-      return(1);
+-    }
+-    res = __sync_add_and_fetch(&y, x);
+-    if (res != y || y != 123) {
+-      return(1);
+-    }
+-    return(0);
+-  }"
+-  HAVE_IB_GCC_ATOMIC_BUILTINS_64
+-  )
+-  CHECK_C_SOURCE_RUNS(
+-  "#include<stdint.h>
+-  int main()
+-  {
+-    __sync_synchronize();
+-    return(0);
+-  }"
+-  HAVE_IB_GCC_SYNC_SYNCHRONISE
+-  )
+-  CHECK_C_SOURCE_RUNS(
+-  "#include<stdint.h>
+-  int main()
+-  {
+-    __atomic_thread_fence(__ATOMIC_ACQUIRE);
+-    __atomic_thread_fence(__ATOMIC_RELEASE);
+-    return(0);
+-  }"
+-  HAVE_IB_GCC_ATOMIC_THREAD_FENCE
+-  )
+-ENDIF()
++
++# workaround for gcc 4.1.2 RHEL5/x86, gcc atomic ops only work under -march=i686
++IF(CMAKE_SYSTEM_PROCESSOR STREQUAL "i686" AND CMAKE_COMPILER_IS_GNUCC AND
++   CMAKE_C_COMPILER_VERSION VERSION_LESS "4.1.3")
++  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=i686")
++  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=i686")
++ENDIF()
++CHECK_C_SOURCE_COMPILES(
++"
++int main()
++{
++  long	x;
++  long	y;
++  long	res;
++
++  x = 10;
++  y = 123;
++  res = __sync_bool_compare_and_swap(&x, x, y);
++  if (!res || x != y) {
++    return(1);
++  }
++
++  x = 10;
++  y = 123;
++  res = __sync_bool_compare_and_swap(&x, x + 1, y);
++  if (res || x != 10) {
++    return(1);
++  }
++  x = 10;
++  y = 123;
++  res = __sync_add_and_fetch(&x, y);
++  if (res != 123 + 10 || x != 123 + 10) {
++    return(1);
++  }
++  return(0);
++}"
++HAVE_IB_GCC_ATOMIC_BUILTINS
++)
++CHECK_C_SOURCE_COMPILES(
++"
++int main()
++{
++  long	res;
++  char	c;
++
++  c = 10;
++  res = __sync_lock_test_and_set(&c, 123);
++  if (res != 10 || c != 123) {
++    return(1);
++  }
++  return(0);
++}"
++HAVE_IB_GCC_ATOMIC_BUILTINS_BYTE
++)
++CHECK_C_SOURCE_COMPILES(
++"#include<stdint.h>
++int main()
++{
++  int64_t	x,y,res;
++
++  x = 10;
++  y = 123;
++  res = __sync_sub_and_fetch(&y, x);
++  if (res != y || y != 113) {
++    return(1);
++  }
++  res = __sync_add_and_fetch(&y, x);
++  if (res != y || y != 123) {
++    return(1);
++  }
++  return(0);
++}"
++HAVE_IB_GCC_ATOMIC_BUILTINS_64
++)
++CHECK_C_SOURCE_COMPILES(
++"#include<stdint.h>
++int main()
++{
++  __sync_synchronize();
++  return(0);
++}"
++HAVE_IB_GCC_SYNC_SYNCHRONISE
++)
++CHECK_C_SOURCE_COMPILES(
++"#include<stdint.h>
++int main()
++{
++  __atomic_thread_fence(__ATOMIC_ACQUIRE);
++  __atomic_thread_fence(__ATOMIC_RELEASE);
++return(0);
++}"
++HAVE_IB_GCC_ATOMIC_THREAD_FENCE
++)
+ 
+ IF(HAVE_IB_GCC_ATOMIC_BUILTINS)
+  ADD_DEFINITIONS(-DHAVE_IB_GCC_ATOMIC_BUILTINS=1)
+@@ -173,28 +172,26 @@
+  ADD_DEFINITIONS(-DHAVE_IB_GCC_ATOMIC_THREAD_FENCE=1)
+ ENDIF()
+ 
+- # either define HAVE_IB_ATOMIC_PTHREAD_T_GCC or not
+-IF(NOT CMAKE_CROSSCOMPILING)
+-  CHECK_C_SOURCE_RUNS(
+-  "
+-  #include <pthread.h>
+-  #include <string.h>
+-
+-  int main() {
+-    pthread_t       x1;
+-    pthread_t       x2;
+-    pthread_t       x3;
+-
+-    memset(&x1, 0x0, sizeof(x1));
+-    memset(&x2, 0x0, sizeof(x2));
+-    memset(&x3, 0x0, sizeof(x3));
+-
+-    __sync_bool_compare_and_swap(&x1, x2, x3);
+-
+-    return(0);
+-  }"
+-  HAVE_IB_ATOMIC_PTHREAD_T_GCC)
+-ENDIF()
++# either define HAVE_IB_ATOMIC_PTHREAD_T_GCC or not
++CHECK_C_SOURCE_COMPILES(
++"
++#include <pthread.h>
++#include <string.h>
++
++int main() {
++  pthread_t       x1;
++  pthread_t       x2;
++  pthread_t       x3;
++
++  memset(&x1, 0x0, sizeof(x1));
++  memset(&x2, 0x0, sizeof(x2));
++  memset(&x3, 0x0, sizeof(x3));
++  __sync_bool_compare_and_swap(&x1, x2, x3);
++
++  return(0);
++}"
++HAVE_IB_ATOMIC_PTHREAD_T_GCC)
++
+ IF(HAVE_IB_ATOMIC_PTHREAD_T_GCC)
+   ADD_DEFINITIONS(-DHAVE_IB_ATOMIC_PTHREAD_T_GCC=1)
+ ENDIF()
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 7133892..a1a2d23 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -1,8 +1,17 @@
 config BR2_PACKAGE_MYSQL
+	bool "mysql"
+
+if BR2_PACKAGE_MYSQL
+choice
+	prompt "MySQL database system implementation"
+	default MYSQL_MYSQL
+
+config MYSQL_MYSQL
 	bool "MySQL"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
@@ -10,7 +19,35 @@ config BR2_PACKAGE_MYSQL
 
 	  http://www.mysql.com/
 
-if BR2_PACKAGE_MYSQL
+config MYSQL_MARIADB_GALERA
+	bool "mariadb-galera"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_GALERA
+	select BR2_PACKAGE_BASH # runtime dependency only
+	select BR2_PACKAGE_LSOF # runtime dependency only
+	select BR2_PACKAGE_PROCPS_NG # runtime dependency only
+	select BR2_PACKAGE_FINDUTILS # runtime dependency only
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC || BR2_PACKAGE_EGLIBC # spawn()
+	help
+	  MariaDB Galera Cluster.
+	  https://mariadb.com/kb/en/mariadb/what-is-mariadb-galera-cluster
+
+endchoice
+
+endif
+
+comment "MySQL needs a toolchain w/ C++, threads"
+depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "MariaDB needs an (e)glibc toolchain"
+depends on !BR2_TOOLCHAIN_BUILDROOT_GLIBC && !BR2_PACKAGE_EGLIBC # spawn()
+
+if MYSQL_MYSQL
 
 config BR2_PACKAGE_MYSQL_SERVER
 	bool "MySQL server"
@@ -18,7 +55,3 @@ config BR2_PACKAGE_MYSQL_SERVER
 	  Install the MySQL server on the target.
 
 endif
-
-comment "MySQL needs a toolchain w/ C++, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mysql/mariadb-galera-cluster.cnf b/package/mysql/mariadb-galera-cluster.cnf
new file mode 100644
index 0000000..c3eddaa
--- /dev/null
+++ b/package/mysql/mariadb-galera-cluster.cnf
@@ -0,0 +1,204 @@
+# MariaDB database server configuration file.
+#
+# You can copy this file to one of:
+# - "/etc/mysql/my.cnf" to set global options,
+# - "~/.my.cnf" to set user-specific options.
+# 
+# One can use all long options that the program supports.
+# Run program with --help to get a list of available options and with
+# --print-defaults to see which it would actually understand and use.
+#
+# For explanations see
+# http://dev.mysql.com/doc/mysql/en/server-system-variables.html
+
+# This will be passed to all mysql clients
+# It has been reported that passwords should be enclosed with ticks/quotes
+# escpecially if they contain "#" chars...
+# Remember to edit /etc/mysql/debian.cnf when changing the socket location.
+[client]
+port		= 3306
+socket		= /tmp/mysql.sock
+
+# Here is entries for some specific programs
+# The following values assume you have at least 32M ram
+
+# This was formally known as [safe_mysqld]. Both versions are currently parsed.
+[mysqld_safe]
+socket		= /tmp/mysql.sock
+nice		= 0
+
+[mysqld]
+#
+# * Basic Settings
+#
+user		= mysql
+pid-file	= /tmp/mysql.pid
+socket		= /tmp/mysql.sock
+port		= 3306
+basedir		= /usr
+datadir		= /var/lib/mysql
+tmpdir		= /tmp
+lc_messages_dir	= /usr/share/
+lc_messages	= en_US
+skip-external-locking
+
+# Don't use DNS as it may not be available
+skip-host-cache
+skip-name-resolve
+
+#
+# Instead of skip-networking the default is now to listen only on
+# localhost which is more compatible and is not less secure.
+#bind-address		= 127.0.0.1
+#
+# * Fine Tuning
+#
+max_connections		= 100
+connect_timeout		= 5
+wait_timeout		= 600
+max_allowed_packet	= 16M
+thread_cache_size       = 128
+sort_buffer_size	= 4M
+bulk_insert_buffer_size	= 16M
+tmp_table_size		= 32M
+max_heap_table_size	= 32M
+#
+# * MyISAM
+#
+# This replaces the startup script and checks MyISAM tables if needed
+# the first time they are touched. On error, make copy and try a repair.
+myisam_recover          = BACKUP
+key_buffer_size		= 64M
+#open-files-limit	= 2000
+table_open_cache	= 400
+myisam_sort_buffer_size	= 64M
+concurrent_insert	= 2
+read_buffer_size	= 2M
+read_rnd_buffer_size	= 1M
+#
+# * Query Cache Configuration
+#
+# Cache only tiny result sets, so we can fit more in the query cache.
+query_cache_limit		= 128K
+query_cache_size		= 16M
+# for more write intensive setups, set to DEMAND or OFF
+#query_cache_type		= DEMAND
+#
+# * Logging and Replication
+#
+# Both location gets rotated by the cronjob.
+# Be aware that this log type is a performance killer.
+# As of 5.1 you can enable the log at runtime!
+#general_log_file        = /var/lib/mysql/mysql.log
+#general_log             = 1
+#
+# Error logging goes to syslog due to /etc/mysql/conf.d/mysqld_safe_syslog.cnf.
+#
+# we do want to know about network errors and such
+log_warnings		= 2
+#
+# Enable the slow query log to see queries with especially long duration
+#slow_query_log[={0|1}]
+slow_query_log_file	= /var/lib/mysql/mariadb-slow.log
+long_query_time = 10
+#log_slow_rate_limit	= 1000
+log_slow_verbosity	= query_plan
+
+#log-queries-not-using-indexes
+#log_slow_admin_statements
+#
+# The following can be used as easy to replay backup logs or for replication.
+# note: if you are setting up a replication slave, see README.Debian about
+#       other settings you may need to change.
+#server-id		= 1
+#report_host		= master1
+#auto_increment_increment = 2
+#auto_increment_offset	= 1
+log_bin			= /var/lib/mysql/mariadb-bin
+log_bin_index		= /var/lib/mysql/mariadb-bin.index
+# not fab for performance, but safer
+#sync_binlog		= 1
+expire_logs_days	= 10
+max_binlog_size         = 100M
+# slaves
+#relay_log		= /var/lib/mysql/relay-bin
+#relay_log_index	= /var/lib/mysql/relay-bin.index
+#relay_log_info_file	= /var/lib/mysql/relay-bin.info
+#log_slave_updates
+#read_only
+#
+# If applications support it, this stricter sql_mode prevents some
+# mistakes like inserting invalid dates etc.
+#sql_mode		= NO_ENGINE_SUBSTITUTION,TRADITIONAL
+#
+# * InnoDB
+#
+# InnoDB is enabled by default with a 10MB datafile in /var/lib/mysql/.
+# Read the manual for more InnoDB related options. There are many!
+default_storage_engine	= InnoDB
+# you can't just change log file size, requires special procedure
+#innodb_log_file_size	= 50M
+innodb_buffer_pool_size	= 64M
+innodb_log_buffer_size	= 8M
+innodb_file_per_table	= 1
+innodb_open_files	= 400
+innodb_io_capacity	= 400
+innodb_flush_method	= O_DIRECT
+#
+# * Security Features
+#
+# Read the manual, too, if you want chroot!
+# chroot = /var/lib/mysql/
+#
+# For generating SSL certificates I recommend the OpenSSL GUI "tinyca".
+#
+# ssl-ca=/etc/mysql/cacert.pem
+# ssl-cert=/etc/mysql/server-cert.pem
+# ssl-key=/etc/mysql/server-key.pem
+
+#
+# * Galera-related settings
+#
+
+[galera]
+# Mandatory settings
+
+# use InnoDB instead of XtraDB
+ignore_builtin_innodb
+innodb_autoinc_lock_mode=2
+innodb_doublewrite=1
+
+plugin_load=innodb=ha_innodb.so
+plugin_dir=/usr/lib/plugin
+
+wsrep_provider=/usr/lib/libgalera_smm.so
+binlog_format=row
+default_storage_engine=InnoDB
+
+query_cache_size=0 # mandatory only for versions prior to 5.5.40-galera, 10.0.14-galera and 10.1.2
+wsrep_on=ON        # Enable wsrep replication
+#wsrep_cluster_name=
+#wsrep_cluster_address=
+wsrep_sst_method=rsync
+
+#
+# Optional setting
+#wsrep_slave_threads=1
+#innodb_flush_log_at_trx_commit=0
+
+[mysqldump]
+quick
+quote-names
+max_allowed_packet	= 16M
+
+[mysql]
+#no-auto-rehash	# faster start of mysql but no tab completition
+
+[isamchk]
+key_buffer		= 16M
+
+#
+# * IMPORTANT: Additional settings that can override those from this file!
+#   The files must end with '.cnf', otherwise they'll be ignored.
+#
+!includedir /etc/mysql/conf.d/
diff --git a/package/mysql/mysql.hash b/package/mysql/mysql.hash
index 84f3361..d9f3574 100644
--- a/package/mysql/mysql.hash
+++ b/package/mysql/mysql.hash
@@ -1,2 +1,4 @@
 # From https://downloads.mariadb.com/archives/mysql-5.1/mysql-5.1.73.tar.gz.md5
 md5	887f869bcc757957067b9198f707f32f	mysql-5.1.73.tar.gz
+# From: https://downloads.mariadb.org/interstitial/mariadb-galera-10.0.17/source/mariadb-galera-10.0.17.tar.gz
+sha1	 91b70d19fb687a58f0e40f50608071489743e54e	mariadb-galera-10.0.17.tar.gz
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 8718193..9abf50e 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -4,17 +4,24 @@
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
-
-MYSQL_CONF_ENV = \
+################################################################################
+#
+# mysql implementation
+#
+################################################################################
+
+
+MYSQL_MYSQL_VERSION_MAJOR = 5.1
+MYSQL_MYSQL_VERSION = $(MYSQL_MYSQL_VERSION_MAJOR).73
+MYSQL_MYSQL_SOURCE = mysql-$(MYSQL_MYSQL_VERSION).tar.gz
+MYSQL_MYSQL_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_MYSQL_VERSION_MAJOR)
+MYSQL_MYSQL_INSTALL_STAGING = YES
+MYSQL_MYSQL_DEPENDENCIES = readline ncurses
+MYSQL_MYSQL_AUTORECONF = YES
+MYSQL_MYSQL_LICENSE = GPLv2
+MYSQL_MYSQL_LICENSE_FILES = README COPYING
+
+MYSQL_MYSQL_CONF_ENV = \
 	ac_cv_sys_restartable_syscalls=yes \
 	ac_cv_path_PS=/bin/ps \
 	ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null" \
@@ -23,7 +30,7 @@ MYSQL_CONF_ENV = \
 	ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=yes \
 	mysql_cv_new_rl_interface=yes
 
-MYSQL_CONF_OPTS = \
+MYSQL_MYSQL_CONF_OPTS = \
 	--without-ndb-binlog \
 	--without-docs \
 	--without-man \
@@ -34,22 +41,22 @@ MYSQL_CONF_OPTS = \
 	--disable-mysql-maintainer-mode
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MYSQL_DEPENDENCIES += openssl
+MYSQL_MYSQL_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-MYSQL_DEPENDENCIES += zlib
+MYSQL_MYSQL_DEPENDENCIES += zlib
 endif
 
 ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
-MYSQL_DEPENDENCIES += host-mysql host-bison
-HOST_MYSQL_DEPENDENCIES = host-zlib host-ncurses
+MYSQL_MYSQL_DEPENDENCIES += host-mysql host-bison
+HOST_MYSQL_MYSQL_DEPENDENCIES = host-zlib host-ncurses
 
-HOST_MYSQL_CONF_OPTS = \
+HOST_MYSQL_MYSQL_CONF_OPTS = \
 	--with-embedded-server \
 	--disable-mysql-maintainer-mode
 
-MYSQL_CONF_OPTS += \
+MYSQL_MYSQL_CONF_OPTS += \
 	--localstatedir=/var/mysql \
 	--with-atomic-ops=up \
 	--with-embedded-server \
@@ -69,12 +76,12 @@ MYSQL_CONF_OPTS += \
 # Debugging is only available for the server, so no need for
 # this if-block outside of the server if-block
 ifeq ($(BR2_ENABLE_DEBUG),y)
-MYSQL_CONF_OPTS += --with-debug=full
+MYSQL_MYSQL_CONF_OPTS += --with-debug=full
 else
-MYSQL_CONF_OPTS += --without-debug
+MYSQL_MYSQL_CONF_OPTS += --without-debug
 endif
 
-define HOST_MYSQL_BUILD_CMDS
+define HOST_MYSQL_MYSQL_BUILD_CMDS
 	$(MAKE) -C $(@D)/include my_config.h
 	$(MAKE) -C $(@D)/mysys libmysys.a
 	$(MAKE) -C $(@D)/strings libmystrings.a
@@ -84,41 +91,188 @@ define HOST_MYSQL_BUILD_CMDS
 	$(MAKE) -C $(@D)/sql gen_lex_hash
 endef
 
-define HOST_MYSQL_INSTALL_CMDS
+define HOST_MYSQL_MYSQL_INSTALL_CMDS
 	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
 endef
 
-define MYSQL_USERS
+define MYSQL_MYSQL_USERS
 	mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
 endef
 
-define MYSQL_ADD_FOLDER
+define MYSQL_MYSQL_ADD_FOLDER
 	$(INSTALL) -d $(TARGET_DIR)/var/mysql
 endef
 
-MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_FOLDER
+MYSQL_MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_FOLDER
 
-define MYSQL_INSTALL_INIT_SYSV
+define MYSQL_MYSQL_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/mysql/S97mysqld \
 		$(TARGET_DIR)/etc/init.d/S97mysqld
 endef
 
 else
-MYSQL_CONF_OPTS += \
+MYSQL_MYSQL_CONF_OPTS += \
 	--without-server
 endif
 
 
-define MYSQL_REMOVE_TEST_PROGS
+define MYSQL_MYSQL_REMOVE_TEST_PROGS
 	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
 endef
 
-define MYSQL_ADD_MYSQL_LIB_PATH
+define MYSQL_MYSQL_ADD_MYSQL_LIB_PATH
 	echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf
 endef
 
-MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_REMOVE_TEST_PROGS
-MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_MYSQL_LIB_PATH
+MYSQL_MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_MYSQL_REMOVE_TEST_PROGS
+MYSQL_MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_MYSQL_ADD_MYSQL_LIB_PATH
+
+################################################################################
+#
+# mariadb galera cluster implementation
+#
+################################################################################
+
+# According to MariaDB galera cluster documentation these options must be passed
+# to CMake:
+MYSQL_MARIADB_GALERA_CLUSTER_OPTS += "-DWITH_WSREP=1"
+MYSQL_MARIADB_GALERA_CLUSTER_OPTS += "-DWITH_INNODB_DISALLOW_WRITES=1"
+
+# msgpack causes trouble when cross-compiling:
+MYSQL_MARIADB_GALERA_EXTRA_OPTS += "-DGRN_WITH_MESSAGE_PACK=no"
+
+# Mroonga needs libstemmer. Some work still needs to be done before it can be
+# included in buildroot. Disable it for now.
+MYSQL_MARIADB_GALERA_EXTRA_OPTS += "-DWITHOUT_MROONGA=1"
+
+# This value is determined automatically during straight compile by compiling
+# and running a test code. You cannot do that during cross-compile. However the 
+# stack grows downward in most if not all modern systems. The only exception I
+# am aware of is PA-RISC which is not supported by buildroot. Therefore it makes
+# sense to hardcode the value. If an arch is added the stack of which grows up
+# one should expect unpredictable behavior at run time.
+MYSQL_MARIADB_GALERA_EXTRA_OPTS += "-DSTACK_DIRECTION=-1"
+
+# XTRADB requires atomics intrinsic. MariaDB package tests for them by compiling
+# and running C code which is not possible when cross-compiling. It is probably
+# probably possible to use BR2_ARCH_HAS_ATOMIC_INTRINSICS instead of compiling
+# and running some test code but for now we will just disable XTRADB.
+MYSQL_MARIADB_GALERA_EXTRA_OPTS += "-DWITHOUT_XTRADB=1"
+
+# Jemalloc was added for TokuDB. Since its configure script seems somewhat broken
+# when it comes to cross-compilation we shall disable it and also disable TokuDB.
+MYSQL_MARIADB_GALERA_EXTRA_OPTS += "-DWITH_JEMALLOC=no -DWITHOUT_TOKUDB=1"
+
+MYSQL_MARIADB_GALERA_VERSION = 10.0.17
+MYSQL_MARIADB_GALERA_SOURCE = mariadb-galera-$(MYSQL_MARIADB_GALERA_VERSION).tar.gz
+MYSQL_MARIADB_GALERA_SITE = https://downloads.mariadb.org/interstitial/mariadb-galera-$(MYSQL_MARIADB_GALERA_VERSION)/source/
+
+# In order to cross-compile mariadb galera cluster one should first natively
+# build in order to use some of the generated executables. They are then
+# included by import_executables.cmake which is generated during the native
+# build. Therefore host-mariadb-galera needs to be added to mariadb galera
+# dependencies and
+# -DIMPORT_EXECUTABLES=$(BUILD_DIR)/host-mariadb-galera/import_executables.cmake
+# must be passed to cmake
+MYSQL_MARIADB_GALERA_TARGET_BUILD_IMPORT += "-DIMPORT_EXECUTABLES=$(HOST_MYSQL_DIR)/import_executables.cmake"
+
+
+MYSQL_MARIADB_GALERA_INSTALL_STAGING = NO
+MYSQL_MARIADB_GALERA_INSTALL_TARGET = YES
+
+MYSQL_MARIADB_GALERA_DEPENDENCIES = \
+	host-mysql \
+	ncurses \
+	openssl \
+	zlib \
+	libaio \
+	libtool \
+	galera
+
+MYSQL_MARIADB_GALERA_CONF_OPTS = $(MYSQL_MARIADB_GALERA_EXTRA_OPTS)
+MYSQL_MARIADB_GALERA_CONF_OPTS += $(MYSQL_MARIADB_GALERA_TARGET_BUILD_IMPORT)
+HOST_MYSQL_MARIADB_GALERA_CONF_OPTS = $(MYSQL_MARIADB_GALERA_EXTRA_OPTS)
+
+# Options specific to Galera cluster
+MYSQL_MARIADB_GALERA_CONF_OPTS += $(MYSQL_MARIADB_GALERA_CLUSTER_OPTS)
+HOST_MYSQL_MARIADB_GALERA_CONF_OPTS += $(MYSQL_MARIADB_GALERA_CLUSTER_OPTS)
+
+# Post install configuration
+
+define MYSQL_MARIADB_GALERA_USERS
+	mysql 1000 mysql 1000 * /var/lib/mysql - - MySQL Server
+endef
+
+define MYSQL_MARIADB_GALERA_INSTALL_CNF
+	mkdir -p $(TARGET_DIR)/etc/mysql/conf.d
+	install -m 644 package/mysql/mariadb-galera-cluster.cnf $(TARGET_DIR)/etc/mysql/my.cnf
+endef
+
+MYSQL_MARIADB_GALERA_POST_INSTALL_TARGET_HOOKS += MYSQL_MARIADB_GALERA_INSTALL_CNF
 
+define MYSQL_MARIADB_GALERA_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(@D)/support-files/mysql.server.sh \
+		$(TARGET_DIR)/etc/init.d/mysqld
+endef
+
+# generic options
+
+MYSQL_MARIADB_GALERA_AUTORECONF = NO
+MYSQL_MARIADB_GALERA_LICENSE = GPLv2
+MYSQL_MARIADB_GALERA_LICENSE_FILES = README COPYING COPYING.LESSER
+
+################################################################################
+#
+# meta package
+#
+################################################################################
+
+
+ifeq ($(MYSQL_MYSQL),y)
+	MYSQL_VERSION = $(MYSQL_MYSQL_VERSION)
+	MYSQL_SOURCE = $(MYSQL_MYSQL_SOURCE)
+	MYSQL_SITE = $(MYSQL_MYSQL_SITE)
+	MYSQL_INSTALL_STAGING = $(MYSQL_MYSQL_INSTALL_STAGING)
+	MYSQL_DEPENDENCIES = $(MYSQL_MYSQL_DEPENDENCIES)
+	MYSQL_AUTORECONF = $(MYSQL_MYSQL_AUTORECONF)
+	MYSQL_LICENSE = $(MYSQL_MYSQL_LICENSE)
+	MYSQL_LICENSE_FILES = $(MYSQL_MYSQL_LICENSE_FILES)
+	MYSQL_CONF_ENV = $(MYSQL_MYSQL_CONF_ENV)
+	MYSQL_CONF_OPTS = $(MYSQL_MYSQL_CONF_OPTS)
+
+	MYSQL_USERS = $(MYSQL_MYSQL_USERS)
+	MYSQL_POST_INSTALL_TARGET_HOOKS += $(MYSQL_MYSQL_POST_INSTALL_TARGET_HOOKS)
+
+	MYSQL_INSTALL_INIT_SYSV = $(MYSQL_MYSQL_INSTALL_INIT_SYSV)
+
+	HOST_MYSQL_DEPENDENCIES = $(HOST_MYSQL_MYSQL_DEPENDENCIES)
+	HOST_MYSQL_CONF_OPTS = $(HOST_MYSQL_MYSQL_CONF_OPTS)
+	HOST_MYSQL_BUILD_CMDS = $(HOST_MYSQL_MYSQL_BUILD_CMDS)
+	HOST_MYSQL_INSTALL_CMDS = $(HOST_MYSQL_MYSQL_INSTALL_CMDS)
+else ifeq ($(MYSQL_MARIADB_GALERA),y)
+	MYSQL_VERSION = $(MYSQL_MARIADB_GALERA_VERSION)
+	MYSQL_SOURCE = $(MYSQL_MARIADB_GALERA_SOURCE)
+	MYSQL_SITE = $(MYSQL_MARIADB_GALERA_SITE)
+	MYSQL_INSTALL_STAGING = $(MYSQL_MARIADB_GALERA_INSTALL_STAGING)
+	MYSQL_DEPENDENCIES = $(MYSQL_MARIADB_GALERA_DEPENDENCIES)
+	MYSQL_AUTORECONF = $(MYSQL_MARIADB_GALERA_AUTORECONF)
+	MYSQL_LICENSE = $(MYSQL_MARIADB_GALERA_LICENSE)
+	MYSQL_LICENSE_FILES = $(MYSQL_MARIADB_GALERA_LICENSE_FILES)
+	MYSQL_CONF_OPTS = $(MYSQL_MARIADB_GALERA_CONF_OPTS)
+
+	MYSQL_USERS = $(MYSQL_MARIADB_GALERA_USERS)
+	MYSQL_POST_INSTALL_TARGET_HOOKS += $(MYSQL_MARIADB_GALERA_POST_INSTALL_TARGET_HOOKS)
+
+	MYSQL_INSTALL_INIT_SYSV = $(MYSQL_MARIADB_GALERA_INSTALL_INIT_SYSV)
+
+	HOST_MYSQL_DEPENDENCIES = $(HOST_MYSQL_MARIADB_GALERA_DEPENDENCIES)
+	HOST_MYSQL_CONF_OPTS = $(HOST_MYSQL_MARIADB_GALERA_CONF_OPTS)
+endif
+
+ifeq ($(MYSQL_MYSQL),y)
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+else ifeq ($(MYSQL_MARIADB_GALERA),y)
+$(eval $(host-cmake-package))
+$(eval $(cmake-package))
+endif
-- 
1.9.1
