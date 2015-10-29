From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 29 Oct 2015 22:32:03 +0100
Subject: [Buildroot] [PATCH v3 2/4] mariadb-galera: new package
In-Reply-To: <1446154325-24088-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1446154325-24088-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1446154325-24088-3-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add mariadb galera as an alternative implementation of mysql.

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>

---

Changes v2 -> v3:
 - don't build the full host variant and remove all 
host dependencies
 - add SoB lines to patches
 - improve comment of patch #1 and submit upstream (suggested by Samuel
Martin)
 - improve comment of patch #2 and submit upstream (suggested by Samuel
Martin)
 - remove duplicated block in .mk (suggested by Samuel Martin)
 - fix comments indent and add depends on MMU in Config.in (suggested
 by Samuel Martin)

Changes v1 -> v2:
 - Change commit titles (suggested by Thomas Petazzoni)
 
 package/mariadb-galera/S97mysqld                   |  30 +++
 .../mariadb-galera-01-fix_xtradb_cmakelist.patch   |  31 ++++
 .../mariadb-galera-02-fix_innodb_cmakelist.patch   | 131 +++++++++++++
 package/mariadb-galera/mariadb-galera-cluster.cnf  | 204 +++++++++++++++++++++
 package/mariadb-galera/mariadb-galera.hash         |   2 +
 package/mariadb-galera/mariadb-galera.mk           |  99 ++++++++++
 6 files changed, 497 insertions(+)
 create mode 100644 package/mariadb-galera/S97mysqld
 create mode 100644 package/mariadb-galera/mariadb-galera-01-fix_xtradb_cmakelist.patch
 create mode 100644 package/mariadb-galera/mariadb-galera-02-fix_innodb_cmakelist.patch
 create mode 100644 package/mariadb-galera/mariadb-galera-cluster.cnf
 create mode 100644 package/mariadb-galera/mariadb-galera.hash
 create mode 100644 package/mariadb-galera/mariadb-galera.mk

diff --git a/package/mariadb-galera/S97mysqld b/package/mariadb-galera/S97mysqld
new file mode 100644
index 0000000..6f25403
--- /dev/null
+++ b/package/mariadb-galera/S97mysqld
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		if [ ! -d /var/mysql/mysql ] ; then
+			echo "Creating MySQL system tables..."
+			mysql_install_db --user=mysql --ldata=/var/mysql
+		fi
+
+		# We don't use start-stop-daemon because mysqld has
+		# its own wrapper script.
+		echo -n "Starting mysql..."
+		/usr/bin/mysqld_safe --pid-file=/var/run/mysqld.pid &
+		echo "done."
+		;;
+	stop)
+		echo -n "Stopping mysql..."
+		if test -f /var/run/mysqld.pid ; then
+			kill `cat /var/run/mysqld.pid`
+		fi
+		echo "done."
+		;;
+	restart)
+		$0 stop
+		$0 start
+		;;
+	*)
+		echo "Usage: /etc/init.d/mysqld {start|stop|restart}"
+		;;
+esac
diff --git a/package/mariadb-galera/mariadb-galera-01-fix_xtradb_cmakelist.patch b/package/mariadb-galera/mariadb-galera-01-fix_xtradb_cmakelist.patch
new file mode 100644
index 0000000..3212894
--- /dev/null
+++ b/package/mariadb-galera/mariadb-galera-01-fix_xtradb_cmakelist.patch
@@ -0,0 +1,31 @@
+Do not test if XtraDB can be build if it is not requested. The test may fail,
+preventing building the whole package. Fixed in upstream git, will be fixed in
+release 10.1.9.
+See https://mariadb.atlassian.net/browse/MDEV-8883
+
+Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
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
diff --git a/package/mariadb-galera/mariadb-galera-02-fix_innodb_cmakelist.patch b/package/mariadb-galera/mariadb-galera-02-fix_innodb_cmakelist.patch
new file mode 100644
index 0000000..aeeb8e8
--- /dev/null
+++ b/package/mariadb-galera/mariadb-galera-02-fix_innodb_cmakelist.patch
@@ -0,0 +1,131 @@
+If CMAKE_CROSSCOMPILING is set then use CHECK_C_SOURCE_COMPILES instead of
+CHECK_C_SOURCE_RUNS.
+See:
+https://mariadb.atlassian.net/browse/MDEV-8883
+https://mariadb.atlassian.net/browse/MDEV-9002
+
+Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
+
+--- a/storage/innobase/CMakeLists.txt	2015-10-23 13:34:37.558116079 +0200
++++ b/storage/innobase/CMakeLists.txt	2015-10-23 14:54:38.602244647 +0200
+@@ -56,16 +56,23 @@
+ 
+ CHECK_FUNCTION_EXISTS(sched_getcpu  HAVE_SCHED_GETCPU)
+ 
++macro(CHECK_C_SOURCE_GENERIC source result)
++  IF(NOT CMAKE_CROSSCOMPILING)
++    CHECK_C_SOURCE_RUNS("${source}" ${result})
++  ELSE()
++    CHECK_C_SOURCE_COMPILES("${source}" ${result})
++  ENDIF()
++endmacro(CHECK_C_SOURCE_GENERIC)
++
+ IF(NOT MSVC)
+-# either define HAVE_IB_GCC_ATOMIC_BUILTINS or not
+-IF(NOT CMAKE_CROSSCOMPILING)
++  # either define HAVE_IB_GCC_ATOMIC_BUILTINS or not
+   # workaround for gcc 4.1.2 RHEL5/x86, gcc atomic ops only work under -march=i686
+   IF(CMAKE_SYSTEM_PROCESSOR STREQUAL "i686" AND CMAKE_COMPILER_IS_GNUCC AND
+-     CMAKE_C_COMPILER_VERSION VERSION_LESS "4.1.3")
++    CMAKE_C_COMPILER_VERSION VERSION_LESS "4.1.3")
+     SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=i686")
+     SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=i686")
+   ENDIF()
+-  CHECK_C_SOURCE_RUNS(
++  CHECK_C_SOURCE_GENERIC(
+   "
+   int main()
+   {
+@@ -96,7 +103,7 @@
+   }"
+   HAVE_IB_GCC_ATOMIC_BUILTINS
+   )
+-  CHECK_C_SOURCE_RUNS(
++  CHECK_C_SOURCE_GENERIC(
+   "
+   int main()
+   {
+@@ -112,7 +119,7 @@
+   }"
+   HAVE_IB_GCC_ATOMIC_BUILTINS_BYTE
+   )
+-  CHECK_C_SOURCE_RUNS(
++  CHECK_C_SOURCE_GENERIC(
+   "#include<stdint.h>
+   int main()
+   {
+@@ -132,7 +139,7 @@
+   }"
+   HAVE_IB_GCC_ATOMIC_BUILTINS_64
+   )
+-  CHECK_C_SOURCE_RUNS(
++  CHECK_C_SOURCE_GENERIC(
+   "#include<stdint.h>
+   int main()
+   {
+@@ -141,7 +148,7 @@
+   }"
+   HAVE_IB_GCC_SYNC_SYNCHRONISE
+   )
+-  CHECK_C_SOURCE_RUNS(
++  CHECK_C_SOURCE_GENERIC(
+   "#include<stdint.h>
+   int main()
+   {
+@@ -151,7 +158,6 @@
+   }"
+   HAVE_IB_GCC_ATOMIC_THREAD_FENCE
+   )
+-ENDIF()
+ 
+ IF(HAVE_IB_GCC_ATOMIC_BUILTINS)
+  ADD_DEFINITIONS(-DHAVE_IB_GCC_ATOMIC_BUILTINS=1)
+@@ -173,28 +179,27 @@
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
++# either define HAVE_IB_ATOMIC_PTHREAD_T_GCC or not
++CHECK_C_SOURCE_GENERIC(
++"
++#include <pthread.h>
++#include <string.h>
++
++int main() {
++pthread_t       x1;
++pthread_t       x2;
++pthread_t       x3;
++
++memset(&x1, 0x0, sizeof(x1));
++memset(&x2, 0x0, sizeof(x2));
++memset(&x3, 0x0, sizeof(x3));
++
++__sync_bool_compare_and_swap(&x1, x2, x3);
++
++return(0);
++}"
++HAVE_IB_ATOMIC_PTHREAD_T_GCC)
+ 
+-    __sync_bool_compare_and_swap(&x1, x2, x3);
+-
+-    return(0);
+-  }"
+-  HAVE_IB_ATOMIC_PTHREAD_T_GCC)
+-ENDIF()
+ IF(HAVE_IB_ATOMIC_PTHREAD_T_GCC)
+   ADD_DEFINITIONS(-DHAVE_IB_ATOMIC_PTHREAD_T_GCC=1)
+ ENDIF()
diff --git a/package/mariadb-galera/mariadb-galera-cluster.cnf b/package/mariadb-galera/mariadb-galera-cluster.cnf
new file mode 100644
index 0000000..c3eddaa
--- /dev/null
+++ b/package/mariadb-galera/mariadb-galera-cluster.cnf
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
diff --git a/package/mariadb-galera/mariadb-galera.hash b/package/mariadb-galera/mariadb-galera.hash
new file mode 100644
index 0000000..fdbb60e
--- /dev/null
+++ b/package/mariadb-galera/mariadb-galera.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha512	 46d007b48a6f03bf5242d771d96a07ebf3f35af9c32d74bed37fb1d72b493d66db2007ec134be7e9d9aca5b2ccb968049a347fb1cfd86d8cc2da1408ff32b5dc	mariadb-galera-10.0.21.tar.gz
diff --git a/package/mariadb-galera/mariadb-galera.mk b/package/mariadb-galera/mariadb-galera.mk
new file mode 100644
index 0000000..119ae6c
--- /dev/null
+++ b/package/mariadb-galera/mariadb-galera.mk
@@ -0,0 +1,99 @@
+################################################################################
+#
+# mariadb-galera
+#
+################################################################################
+
+MARIADB_GALERA_VERSION = 10.0.21
+MARIADB_GALERA_SOURCE = mariadb-galera-$(MARIADB_GALERA_VERSION).tar.gz
+MARIADB_GALERA_SITE = https://downloads.mariadb.org/interstitial/mariadb-galera-$(MARIADB_GALERA_VERSION)/source
+MARIADB_GALERA_LICENSE = GPLv2
+MARIADB_GALERA_LICENSE_FILES = README COPYING COPYING.LESSER
+
+# According to MariaDB galera cluster documentation these options must be passed
+# to CMake:
+MARIADB_GALERA_OPTS += "-DWITH_WSREP=1"
+MARIADB_GALERA_OPTS += "-DWITH_INNODB_DISALLOW_WRITES=1"
+
+# We won't need unit tests:
+MARIADB_GALERA_OPTS += "-DWITH_UNIT_TESTS=0"
+
+# msgpack causes trouble when cross-compiling:
+MARIADB_GALERA_OPTS += "-DGRN_WITH_MESSAGE_PACK=no"
+
+# Mroonga needs libstemmer. Some work still needs to be done before it can be
+# included in buildroot. Disable it for now.
+MARIADB_GALERA_OPTS += "-DWITHOUT_MROONGA=1"
+
+# This value is determined automatically during straight compile by compiling
+# and running a test code. You cannot do that during cross-compile. However the 
+# stack grows downward in most if not all modern systems. The only exception I
+# am aware of is PA-RISC which is not supported by buildroot. Therefore it makes
+# sense to hardcode the value. If an arch is added the stack of which grows up
+# one should expect unpredictable behavior at run time.
+MARIADB_GALERA_OPTS += "-DSTACK_DIRECTION=-1"
+
+# XTRADB requires atomics intrinsic. MariaDB package tests for them by compiling
+# and running C code which is not possible when cross-compiling. It is probably
+# probably possible to use BR2_ARCH_HAS_ATOMIC_INTRINSICS instead of compiling
+# and running some test code but for now we will just disable XTRADB.
+MARIADB_GALERA_OPTS += "-DWITHOUT_XTRADB=1"
+
+# Jemalloc was added for TokuDB. Since its configure script seems somewhat broken
+# when it comes to cross-compilation we shall disable it and also disable TokuDB.
+MARIADB_GALERA_OPTS += "-DWITH_JEMALLOC=no"
+MARIADB_GALERA_OPTS += "-DWITHOUT_TOKUDB=1"
+
+# Make it explicit that we are cross-compiling:
+MARIADB_GALERA_OPTS += "-DCMAKE_CROSSCOMPILING=1"
+
+MARIADB_GALERA_DEPENDENCIES = \
+	host-mariadb-galera \
+	ncurses \
+	openssl \
+	zlib \
+	libaio \
+	libxml2 \
+	libtool
+
+HOST_MARIADB_GALERA_DEPENDENCIES = 
+
+# Some helpers must be compiled for host in order to crosscompile mariadb for
+# the target. They are then included by import_executables.cmake which is
+# generated during the build of the host helpers. It is not necessary to build
+# the whole host package, only the "import_executables" target.
+# -DIMPORT_EXECUTABLES=$(BUILD_DIR)/host-mariadb-galera/import_executables.cmake
+# must then be passed to cmake during target build.
+HOST_MARIADB_GALERA_MAKE_OPTS = import_executables
+MARIADB_GALERA_IMPORT_EXECUTABLES += "-DIMPORT_EXECUTABLES=$(HOST_MARIADB_GALERA_BUILDDIR)/import_executables.cmake"
+
+HOST_MARIADB_GALERA_CONF_OPTS = $(MARIADB_GALERA_OPTS)
+HOST_MARIADB_GALERA_CONF_OPTS += $(MARIA_GALERA_HOST_OPTS)
+
+MARIADB_GALERA_CONF_OPTS = $(MARIADB_GALERA_OPTS)
+MARIADB_GALERA_CONF_OPTS += $(MARIADB_GALERA_IMPORT_EXECUTABLES)
+
+# Don't install host-mariadbg-galera. We just need to build import_executable
+# Therefore only run 'true' and do nothing, not even the default action.
+HOST_MARIADB_GALERA_INSTALL_CMDS = true
+
+# Post install configuration
+
+define MARIADB_GALERA_USERS
+	mysql 1000 mysql 1000 * /var/lib/mysql - - MySQL Server
+endef
+
+define MARIADB_GALERA_INSTALL_CNF
+	mkdir -p $(TARGET_DIR)/etc/mysql/conf.d
+	install -m 644 package/mariadb-galera/mariadb-galera-cluster.cnf $(TARGET_DIR)/etc/mysql/my.cnf
+endef
+
+MARIADB_GALERA_POST_INSTALL_TARGET_HOOKS += MARIADB_GALERA_INSTALL_CNF
+
+define MARIADB_GALERA_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(@D)/support-files/mysql.server.sh \
+		$(TARGET_DIR)/etc/init.d/mysqld
+endef
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
1.9.1
