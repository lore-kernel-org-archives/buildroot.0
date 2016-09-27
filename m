From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 26 Sep 2016 18:53:03 -0700
Subject: [Buildroot] [RFC v3 2/3] mariadb: new package
In-Reply-To: <20160927015304.5937-1-bluemrp9@gmail.com>
References: <20160927015304.5937-1-bluemrp9@gmail.com>
Message-ID: <20160927015304.5937-3-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 DEVELOPERS                                         |   3 +
 package/Config.in                                  |   1 +
 .../mariadb/0001-add-extra-check-for-librt.patch   |  26 +++++
 ...ld-failure-when-HAVE_STACKTRACE-is-not-de.patch |  33 ++++++
 package/mariadb/Config.in                          |  32 ++++++
 package/mariadb/S97mysqld                          |  77 ++++++++++++++
 package/mariadb/mariadb.hash                       |   2 +
 package/mariadb/mariadb.mk                         | 113 +++++++++++++++++++++
 package/mariadb/mysqld.service                     |  13 +++
 package/oracle-mysql/Config.in                     |   1 +
 10 files changed, 301 insertions(+)
 create mode 100644 package/mariadb/0001-add-extra-check-for-librt.patch
 create mode 100644 package/mariadb/0002-prevent-build-failure-when-HAVE_STACKTRACE-is-not-de.patch
 create mode 100644 package/mariadb/Config.in
 create mode 100644 package/mariadb/S97mysqld
 create mode 100644 package/mariadb/mariadb.hash
 create mode 100644 package/mariadb/mariadb.mk
 create mode 100644 package/mariadb/mysqld.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 7a6ab9f..19e7f75 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1241,6 +1241,9 @@ F:	package/python-pysnmp-apps/
 F:	package/python-pysnmp-mibs/
 F:	package/python-tornado/
 
+N:	Ryan Coe <bluemrp9@gmail.com>
+F:	package/mariadb/
+
 N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
diff --git a/package/Config.in b/package/Config.in
index 5c5cb25..4e71ddb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -909,6 +909,7 @@ menu "Database"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
 	source "package/libpqxx/Config.in"
+	source "package/mariadb/Config.in"
 	source "package/mongodb/Config.in"
 	source "package/oracle-mysql/Config.in"
 	source "package/postgresql/Config.in"
diff --git a/package/mariadb/0001-add-extra-check-for-librt.patch b/package/mariadb/0001-add-extra-check-for-librt.patch
new file mode 100644
index 0000000..aea7064
--- /dev/null
+++ b/package/mariadb/0001-add-extra-check-for-librt.patch
@@ -0,0 +1,26 @@
+From 31094bd1fcccba2fb8b234735bb9bf60ba4afa28 Mon Sep 17 00:00:00 2001
+From: Ryan Coe <bluemrp9@gmail.com>
+Date: Sun, 18 Sep 2016 16:35:59 -0700
+Subject: [PATCH 1/1] add extra check for librt
+
+Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
+---
+ configure.cmake | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.cmake b/configure.cmake
+index 896226de954f4642a238ca6a72e0930590dc1681..77ca485fb05e6b63bb69f9561b4eabfaa208a419 100644
+--- a/configure.cmake
++++ b/configure.cmake
+@@ -126,6 +126,9 @@ IF(UNIX)
+   IF(NOT LIBRT)
+     MY_SEARCH_LIBS(clock_gettime rt LIBRT)
+   ENDIF()
++  IF(NOT LIBRT)
++    MY_SEARCH_LIBS(posix_spawn_file_actions_addclose rt LIBRT)
++  ENDIF()
+   FIND_PACKAGE(Threads)
+
+   SET(CMAKE_REQUIRED_LIBRARIES
+--
+2.9.3
diff --git a/package/mariadb/0002-prevent-build-failure-when-HAVE_STACKTRACE-is-not-de.patch b/package/mariadb/0002-prevent-build-failure-when-HAVE_STACKTRACE-is-not-de.patch
new file mode 100644
index 0000000..ea07f88
--- /dev/null
+++ b/package/mariadb/0002-prevent-build-failure-when-HAVE_STACKTRACE-is-not-de.patch
@@ -0,0 +1,33 @@
+From 3a0d3c159c581a5202de75064836fc3b22e5a71c Mon Sep 17 00:00:00 2001
+From: Ryan Coe <bluemrp9@gmail.com>
+Date: Sat, 24 Sep 2016 18:19:44 -0700
+Subject: [PATCH 2/2] prevent build failure when HAVE_STACKTRACE is not defined
+
+Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
+---
+ sql/signal_handler.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sql/signal_handler.cc b/sql/signal_handler.cc
+index 9dd3e532d1e73bbb0bd0531c5ac8c7204df98f19..6379e6473de8356cce4764f075d817e24667839c 100644
+--- a/sql/signal_handler.cc
++++ b/sql/signal_handler.cc
+@@ -276,6 +276,7 @@ extern "C" sig_handler handle_fatal_signal(int sig)
+       "\"mlockall\" bugs.\n");
+   }
+ 
++#ifdef HAVE_STACKTRACE
+   if (print_invalid_query_pointer)
+   {
+     my_safe_printf_stderr(
+@@ -285,6 +286,7 @@ extern "C" sig_handler handle_fatal_signal(int sig)
+     my_write_stderr(thd->query(), MY_MIN(65536U, thd->query_length()));
+     my_safe_printf_stderr("\n\n");
+   }
++#endif
+ 
+ #ifdef HAVE_WRITE_CORE
+   if (test_flags & TEST_CORE_ON_SIGNAL)
+-- 
+2.9.3
+
diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
new file mode 100644
index 0000000..9d70b3e
--- /dev/null
+++ b/package/mariadb/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_MARIADB
+	bool "mariadb"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_ORACLE_MYSQL
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_READLINE
+	help
+	  MariaDB is one of the most popular database servers in the world.
+	  It's made by the original developers of MySQL and guaranteed to
+	  stay open source.
+
+	  http://www.mariadb.org/
+
+if BR2_PACKAGE_MARIADB
+
+config BR2_PACKAGE_MARIADB_SERVER
+	bool "mariadb server"
+	help
+	  Install the mariadb server on the target.
+
+endif
+
+comment "mariadb needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mariadb/S97mysqld b/package/mariadb/S97mysqld
new file mode 100644
index 0000000..62357fa
--- /dev/null
+++ b/package/mariadb/S97mysqld
@@ -0,0 +1,77 @@
+#!/bin/sh
+#
+# mysql
+#
+
+MYSQL_LIB="/var/lib/mysql"
+MYSQL_RUN="/run/mysql"
+MYSQL_PID="$MYSQL_RUN/mysqld.pid"
+MYSQL_BIN="/usr/bin"
+
+wait_for_ready() {
+	WAIT_DELAY=5
+	while [ $WAIT_DELAY -gt 0 ]; do
+		if $MYSQL_BIN/mysqladmin ping > /dev/null 2>&1; then
+			return 0
+		fi
+		sleep 1
+		: $((WAIT_DELAY -= 1))
+	done
+	return 1
+}
+
+start() {
+	if [ `ls -1 $MYSQL_LIB | wc -l` = 0 ] ; then
+		printf "Creating mysql system tables ... "
+		$MYSQL_BIN/mysql_install_db --basedir=/usr --user=mysql \
+			--datadir=$MYSQL_LIB > /dev/null 2>&1
+		if [ $? != 0 ]; then
+			echo "FAIL"
+			exit 1
+		fi
+		echo "OK"
+	fi
+
+	# mysqld runs as user mysql, but /run is only writable by root
+	# so create a subdirectory for mysql.
+	install -d -o mysql -g root -m 0755 $MYSQL_RUN
+
+	# We don't use start-stop-daemon because mysqld has its own
+	# wrapper script.
+	printf "Starting mysql ... "
+	$MYSQL_BIN/mysqld_safe --pid-file=$MYSQL_PID --user=mysql \
+		> /dev/null 2>&1 &
+	wait_for_ready
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping mysql ... "
+	if [ -f $MYSQL_PID ]; then
+		kill `cat $MYSQL_PID` > /dev/null 2>&1
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+	else
+		echo "FAIL"
+	fi
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	;;
+esac
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
new file mode 100644
index 0000000..f55ff6f
--- /dev/null
+++ b/package/mariadb/mariadb.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	 4ca45ac5e34418761868115ebc8c068d511fed08e283b2cac52559d63ba4aab5  mariadb-10.1.17.tar.gz
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
new file mode 100644
index 0000000..bac38c2
--- /dev/null
+++ b/package/mariadb/mariadb.mk
@@ -0,0 +1,113 @@
+################################################################################
+#
+# mariadb
+#
+################################################################################
+
+MARIADB_VERSION = 10.1.17
+MARIADB_SOURCE = mariadb-$(MARIADB_VERSION).tar.gz
+MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
+MARIADB_LICENSE = GPLv2 (server), GPLv2 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
+MARIADB_LICENSE_FILES = README COPYING COPYING.LESSER
+MARIADB_INSTALL_STAGING = YES
+
+MARIADB_DEPENDENCIES = \
+	host-mariadb \
+	ncurses \
+	openssl \
+	zlib \
+	libaio \
+	libxml2 \
+	readline
+
+# We won't need unit tests
+MARIADB_CONF_OPTS += -DWITH_UNIT_TESTS=0
+
+# Mroonga needs libstemmer. Some work still needs to be done before it can be
+# included in buildroot. Disable it for now.
+MARIADB_CONF_OPTS += -DWITHOUT_MROONGA=1
+
+# This value is determined automatically during straight compile by compiling
+# and running a test code. You cannot do that during cross-compile. However the
+# stack grows downward in most if not all modern systems. The only exception I
+# am aware of is PA-RISC which is not supported by buildroot. Therefore it makes
+# sense to hardcode the value. If an arch is added the stack of which grows up
+# one should expect unpredictable behavior at run time.
+MARIADB_CONF_OPTS += -DSTACK_DIRECTION=-1
+
+# Jemalloc was added for TokuDB. Since its configure script seems somewhat broken
+# when it comes to cross-compilation we shall disable it and also disable TokuDB.
+MARIADB_CONF_OPTS += -DWITH_JEMALLOC=no -DWITHOUT_TOKUDB=1
+
+# Make it explicit that we are cross-compiling
+MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
+
+ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
+MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
+else
+MARIADB_CONF_OPTS += -DWITHOUT_SERVER=ON
+endif
+
+MARIADB_CONF_OPTS += \
+	-DINSTALL_DOCDIR=share/doc/mariadb-$(MARIADB_VERSION) \
+	-DINSTALL_DOCREADMEDIR=share/doc/mariadb-$(MARIADB_VERSION) \
+	-DINSTALL_MANDIR=share/man \
+	-DINSTALL_MYSQLSHAREDIR=share/mysql \
+	-DINSTALL_MYSQLTESTDIR=share/mysql/test \
+	-DINSTALL_PLUGINDIR=lib/mysql/plugin \
+	-DINSTALL_SBINDIR=sbin \
+	-DINSTALL_SCRIPTDIR=bin \
+	-DINSTALL_SQLBENCHDIR=share/mysql/bench \
+	-DINSTALL_SUPPORTFILESDIR=share/mysql \
+	-DMYSQL_DATADIR=/var/lib/mysql \
+	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
+
+# Some helpers must be compiled for host in order to crosscompile mariadb for
+# the target. They are then included by import_executables.cmake which is
+# generated during the build of the host helpers. It is not necessary to build
+# the whole host package, only the "import_executables" target.
+# -DIMPORT_EXECUTABLES=$(HOST_MARIADB_BUILDDIR)/import_executables.cmake
+# must then be passed to cmake during target build.
+# see also https://mariadb.com/kb/en/mariadb/cross-compiling-mariadb/
+HOST_MARIADB_MAKE_OPTS = import_executables
+
+MARIADB_CONF_OPTS += \
+	-DIMPORT_EXECUTABLES=$(HOST_MARIADB_BUILDDIR)/import_executables.cmake
+
+# Don't install host-mariadb. We just need to build import_executable
+# Therefore only run 'true' and do nothing, not even the default action.
+HOST_MARIADB_INSTALL_CMDS = true
+
+ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
+define MARIADB_USERS
+	mysql -1 mysql -1 * /var/lib/mysql - - MySQL Server
+endef
+
+define MARIADB_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/mariadb/S97mysqld \
+		$(TARGET_DIR)/etc/init.d/S97mysqld
+endef
+
+define MARIADB_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/mariadb/mysqld.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mysqld.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/mysqld.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mysqld.service
+endef
+endif
+
+define MARIADB_POST_INSTALL
+	mkdir -p $(TARGET_DIR)/var/lib/mysql
+	$(INSTALL) -D -m 644 $(TARGET_DIR)/usr/share/mysql/my-small.cnf \
+		$(TARGET_DIR)/etc/mysql/my.cnf
+	# We don't need this on the target as it's only useful in staging
+	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
+	# Remove test suite
+	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
+endef
+
+MARIADB_POST_INSTALL_TARGET_HOOKS += MARIADB_POST_INSTALL
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
diff --git a/package/mariadb/mysqld.service b/package/mariadb/mysqld.service
new file mode 100644
index 0000000..cd30831
--- /dev/null
+++ b/package/mariadb/mysqld.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=MySQL database server
+
+[Service]
+ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
+ExecStart=/usr/bin/mysqld_safe
+Restart=always
+User=mysql
+RuntimeDirectory=mysql
+RuntimeDirectoryMode=0755
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/oracle-mysql/Config.in b/package/oracle-mysql/Config.in
index 0622a13..1c2d33b 100644
--- a/package/oracle-mysql/Config.in
+++ b/package/oracle-mysql/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_ORACLE_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
-- 
2.9.3
