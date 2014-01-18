From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Sat, 18 Jan 2014 19:24:51 -0200
Subject: [Buildroot] [PATCH 2/2] Update MySQL client package
Message-ID: <CA+kK6Wt+nNbrUuOp1Ymq0KzRZfG5CAZQAa+9KK6w=S0mV+D16Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes v1 -> v2:
        - fix comments following new policy
        - rename patches
        - remove useless hook points
        - add the URL to the home of MySQL
        - add commit-log description to the patches
        - install host tools to $(HOST_DIR)/usr/bin
        - fix only builds the required program


Signed-off-by: Marcelo Guti?rrez(UTN/FRH) <kuyurix@gmail.com>
---
 package/mysql_client/Config.in                     |   20 +++++++--
 package/mysql_client/S60mysqld                     |   25 +++++++++++
 .../mysql_client-Fix-gen_lex_hash-execution.patch  |   28 ++++++++++++
 .../mysql_client-ac_stack_direction-is-unset.patch |   15 +++++++
 package/mysql_client/mysql_client.mk               |   47 +++++++++++++++++++-
 5 files changed, 130 insertions(+), 5 deletions(-)
 create mode 100644 package/mysql_client/S60mysqld
 create mode 100644
package/mysql_client/mysql_client-Fix-gen_lex_hash-execution.patch
 create mode 100644
package/mysql_client/mysql_client-ac_stack_direction-is-unset.patch

diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
index 543bed1..8ebe70f 100644
--- a/package/mysql_client/Config.in
+++ b/package/mysql_client/Config.in
@@ -1,13 +1,25 @@
-config BR2_PACKAGE_MYSQL_CLIENT
-       bool "MySQL client"
+config BR2_PACKAGE_MYSQL
+       bool "MySQL"
        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_USE_MMU # fork()
        depends on BR2_TOOLCHAIN_HAS_THREADS
        select BR2_PACKAGE_NCURSES
        select BR2_PACKAGE_READLINE
        help
-         MySQL client
+         The MySQL Open Source Database System
+         http://www.mysql.com/

-comment "MySQL client needs a toolchain w/ C++, threads"
+comment "MySQL server and MySQL client needs a toolchain w/ C++, threads"
        depends on BR2_USE_MMU
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_MYSQL
+
+config BR2_PACKAGE_MYSQL_CLIENT
+        bool "MySQL client"
+
+config BR2_PACKAGE_MYSQL_CLIENT_SERVER
+       bool "MySQL server"
+
+endif
+
diff --git a/package/mysql_client/S60mysqld b/package/mysql_client/S60mysqld
new file mode 100644
index 0000000..38e1c41
--- /dev/null
+++ b/package/mysql_client/S60mysqld
@@ -0,0 +1,25 @@
+#!/bin/sh
+#
+# Starts mysqld.
+#
+
+case "$1" in
+       start)
+               /usr/bin/mysqld_safe &
+               ;;
+       stop)
+               if test -f /var/lib/mysql/mysqld.pid ; then
+                       PID=`cat /var/lib/mysql/mysqld.pid`
+                       kill $PID
+               fi
+               ;;
+       restart)
+               $0 stop
+               $0 start
+               ;;
+       *)
+               echo "Usage: /etc/init.d/mysqld {start|stop|restart}"
+               ;;
+esac
+
+exit 0
diff --git a/package/mysql_client/mysql_client-Fix-gen_lex_hash-execution.patch
b/package/mysql_client/mysql_client-Fix-gen_lex_hash-execution.patch
new file mode 100644
index 0000000..377cabb
--- /dev/null
+++ b/package/mysql_client/mysql_client-Fix-gen_lex_hash-execution.patch
@@ -0,0 +1,28 @@
+When MySQL server is enabled, I first compile the tool with the host gcc
+and then copy into the "$(HOST_DIR)/usr/bin/" folder
+
+Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>
+
+--- mysql-5.1.70/sql/Makefile.am
++++ mysql-5.1.70.patch/sql/Makefile.am
+@@ -177,7 +177,7 @@
+ # this avoid the rebuild of the built files in a source dist
+ lex_hash.h:   gen_lex_hash.cc lex.h
+               $(MAKE) $(AM_MAKEFLAGS) gen_lex_hash$(EXEEXT)
+-              ./gen_lex_hash$(EXEEXT) > $@-t
++              gen_lex_hash$(EXEEXT) > $@-t
+               $(MV) $@-t $@
+
+ # For testing of udf_example.so
+
+--- mysql-5.1.70/sql/Makefile.in
++++ mysql-5.1.70.patch/sql/Makefile.in
+@@ -1310,7 +1310,7 @@
+ # this avoid the rebuild of the built files in a source dist
+ lex_hash.h:   gen_lex_hash.cc lex.h
+               $(MAKE) $(AM_MAKEFLAGS) gen_lex_hash$(EXEEXT)
+-              ./gen_lex_hash$(EXEEXT) > $@-t
++              gen_lex_hash$(EXEEXT) > $@-t
+               $(MV) $@-t $@
+
+ # We might have some stuff not built in this build, but that we want
to install
diff --git a/package/mysql_client/mysql_client-ac_stack_direction-is-unset.patch
b/package/mysql_client/mysql_client-ac_stack_direction-is-unset.patch
new file mode 100644
index 0000000..6fef0a9
--- /dev/null
+++ b/package/mysql_client/mysql_client-ac_stack_direction-is-unset.patch
@@ -0,0 +1,15 @@
+misc.m4: ac_cv_c_stack_direction is unset.
+
+Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>
+
+--- mysql-5.1.70.orig/config/ac-macros/misc.m4
++++ mysql-5.1.70/config/ac-macros/misc.m4
+@@ -477,7 +477,7 @@
+     exit(ptr_f(&a) < 0);
+   }
+   ], ac_cv_c_stack_direction=1, ac_cv_c_stack_direction=-1,
+-   ac_cv_c_stack_direction=)])
++   ac_cv_c_stack_direction=0)])
+  AC_DEFINE_UNQUOTED(STACK_DIRECTION, $ac_cv_c_stack_direction)
+ ])dnl
+
diff --git a/package/mysql_client/mysql_client.mk
b/package/mysql_client/mysql_client.mk
index bd4c565..127f65e 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -14,6 +14,15 @@ MYSQL_CLIENT_AUTORECONF = YES
 MYSQL_CLIENT_LICENSE = GPLv2
 MYSQL_CLIENT_LICENSE_FILES = README COPYING

+
+ifeq ($(BR2_PACKAGE_MYSQL_CLIENT_SERVER),y)
+MYSQL_CLIENT_DEPENDENCIES += host-mysql_client
+HOST_MYSQL_CLIENT_DEPENDENCIES =
+
+HOST_MYSQL_CLIENT_CONF_OPT = \
+       --with-embedded-server
+endif
+
 MYSQL_CLIENT_CONF_ENV = \
        ac_cv_sys_restartable_syscalls=yes \
        ac_cv_path_PS=/bin/ps \
@@ -25,15 +34,50 @@ MYSQL_CLIENT_CONF_ENV = \

 MYSQL_CLIENT_CONF_OPT = \
        --without-ndb-binlog \
-       --without-server \
        --without-docs \
        --without-man \
        --without-libedit \
        --without-readline \
+       --without-libedit \
+       --disable-dependency-tracking \
        --with-low-memory \
+       --with-atomic-ops=up \
        --enable-thread-safe-client \
+       --without-query-cache \
+       --without-plugin-partition \
+       --without-plugin-daemon_example \
+       --without-plugin-ftexample \
+       --without-plugin-archive \
+       --without-plugin-blackhole \
+       --without-plugin-example \
+       --without-plugin-federated \
+       --without-plugin-ibmdb2i \
+       --without-plugin-innobase \
+       --without-plugin-innodb_plugin \
+       --without-plugin-ndbcluster \
        $(ENABLE_DEBUG)

+ifeq ($(BR2_PACKAGE_MYSQL_CLIENT_SERVER),y)
+       MYSQL_CLIENT_CONF_OPT += --with-embedded-server
+
+define HOST_MYSQL_CLIENT_BUILD_CMDS
+       $(MAKE) -C $(@D)/include my_config.h
+       $(MAKE) -C $(@D)/mysys libmysys.a
+       $(MAKE) -C $(@D)/strings libmystrings.a
+       $(MAKE) -C $(@D)/vio libvio.a
+       $(MAKE) -C $(@D)/dbug libdbug.a
+       $(MAKE) -C $(@D)/regex libregex.a
+       $(MAKE) -C $(@D)/sql gen_lex_hash
+endef
+
+define HOST_MYSQL_CLIENT_INSTALL_CMDS
+       $(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
+endef
+
+else
+MYSQL_CLIENT_CONF_OPT += --without-server
+endif
+
 define MYSQL_CLIENT_REMOVE_TEST_PROGS
        rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
 endef
@@ -46,3 +90,4 @@ MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS +=
MYSQL_CLIENT_REMOVE_TEST_PROGS
 MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_ADD_MYSQL_LIB_PATH

 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
