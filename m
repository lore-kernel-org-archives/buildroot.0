From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sat,  9 Jul 2011 08:58:45 -0500
Subject: [Buildroot] [PATCH v3] new package: mysql server and client v5.1
	and v5.5
Message-ID: <c1d1b97ceb1635fc54e2c0db266753a2b2aeb8ae.1310219911.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/mysql/Config.in                            |   88 +++++++++++
 .../mysql_client-5.1.53-ac_cache_check.patch       |  156 ++++++++++++++++++++
 ...ql_client-5.1.53-configure-ps-cache-check.patch |   39 +++++
 ...ysql_client-5.1.53-use-new-readline-iface.patch |   21 +++
 .../mysql-5.5.12/mysql-5.5.11-tool-path.patch      |   41 +++++
 package/mysql/mysql.mk                             |  150 +++++++++++++++++++
 package/mysql_client/Config.in                     |   10 --
 .../mysql_client-5.1.53-ac_cache_check.patch       |  156 --------------------
 ...ql_client-5.1.53-configure-ps-cache-check.patch |   39 -----
 ...ysql_client-5.1.53-use-new-readline-iface.patch |   21 ---
 package/mysql_client/mysql_client.mk               |   46 ------
 11 files changed, 495 insertions(+), 272 deletions(-)
 create mode 100644 package/mysql/Config.in
 create mode 100644 package/mysql/mysql-5.1.56/mysql_client-5.1.53-ac_cache_check.patch
 create mode 100644 package/mysql/mysql-5.1.56/mysql_client-5.1.53-configure-ps-cache-check.patch
 create mode 100644 package/mysql/mysql-5.1.56/mysql_client-5.1.53-use-new-readline-iface.patch
 create mode 100644 package/mysql/mysql-5.5.12/mysql-5.5.11-tool-path.patch
 create mode 100644 package/mysql/mysql.mk
 delete mode 100644 package/mysql_client/Config.in
 delete mode 100644 package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch
 delete mode 100644 package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch
 delete mode 100644 package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch
 delete mode 100644 package/mysql_client/mysql_client.mk

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
new file mode 100644
index 0000000..3dc0a2c
--- /dev/null
+++ b/package/mysql/Config.in
@@ -0,0 +1,88 @@
+config BR2_PACKAGE_MYSQL
+	bool "MySQL"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+	  MySQL client and optional server
+
+menu "MySQL options"
+depends on BR2_PACKAGE_MYSQL
+
+choice
+	prompt "MySQL Version"
+	default BR2_PACKAGE_MYSQL_51
+	help
+	  The version of MySQL
+
+config BR2_PACKAGE_MYSQL_51
+	bool "5.1.x"
+
+config BR2_PACKAGE_MYSQL_55
+	bool "5.5.x"
+
+endchoice
+
+config BR2_PACKAGE_MYSQL_SERVER
+	bool "Build the MySQL Server"
+	depends on BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_MYSQL
+	help
+	  MySQL server
+
+config BR2_PACKAGE_MYSQL_DATADIR
+	string "The MySQL data directory"
+	depends on BR2_PACKAGE_MYSQL_SERVER
+	default "/var/mysql"
+	help
+	  This directory will contain the database files
+
+config BR2_PACKAGE_MYSQL_STORAGE_ARCHIVE
+	bool "Archive Storage Engine"
+	depends on BR2_PACKAGE_MYSQL_SERVER
+	depends on BR2_PACKAGE_MYSQL_55
+
+config BR2_PACKAGE_MYSQL_STORAGE_BLACKHOLE
+	bool "Blackhole Storage Engine"
+	depends on BR2_PACKAGE_MYSQL_SERVER
+	depends on BR2_PACKAGE_MYSQL_55
+
+config BR2_PACKAGE_MYSQL_STORAGE_FEDERATED
+	bool "Federated Storage Engine"
+	depends on BR2_PACKAGE_MYSQL_SERVER
+	depends on BR2_PACKAGE_MYSQL_55
+
+config BR2_PACKAGE_MYSQL_STORAGE_INNOBASE
+	bool "Innobase Storage Engine"
+	default y
+	depends on BR2_PACKAGE_MYSQL_SERVER
+	depends on BR2_PACKAGE_MYSQL_55
+
+config BR2_PACKAGE_MYSQL_STORAGE_PARTITION
+	bool "Partition Storage Engine"
+	default y
+	depends on BR2_PACKAGE_MYSQL_SERVER
+	depends on BR2_PACKAGE_MYSQL_55
+
+config BR2_PACKAGE_MYSQL_STORAGE_PERFSCHEMA
+	bool "Perfschema Storage Engine"
+	default y
+	depends on BR2_PACKAGE_MYSQL_SERVER
+	depends on BR2_PACKAGE_MYSQL_55
+
+config BR2_PACKAGE_MYSQL_LOWMEM
+	depends on BR2_PACKAGE_MYSQL_51
+	bool "Compile for low memory consumption"
+
+config BR2_PACKAGE_MYSQL_EMBEDDED
+	bool "Build the embedded server (libmysqld)"
+
+config BR2_PACKAGE_MYSQL_NO_NDBBINLOG
+	bool "Disable ndb binlog"
+	
+config BR2_PACKAGE_MYSQL_REMOVE_TEST_PROGS
+	bool "Remove test programs"
+	
+endmenu
+
+comment "Mysql requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/mysql/mysql-5.1.56/mysql_client-5.1.53-ac_cache_check.patch b/package/mysql/mysql-5.1.56/mysql_client-5.1.53-ac_cache_check.patch
new file mode 100644
index 0000000..c3b55ba
--- /dev/null
+++ b/package/mysql/mysql-5.1.56/mysql_client-5.1.53-ac_cache_check.patch
@@ -0,0 +1,156 @@
+Patch borrowed from
+http://code.google.com/p/minimyth/source/browse/trunk/gar-minimyth/script/db/mysql/files/mysql-5.1.47-ac_cache_check.patch?r=6493.
+
+It allows to override through ac_cv_* variables various checks that
+cannot be performed when cross-compiling.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ storage/innodb_plugin/plug.in |   59 ++++++++++++++++++++++++++++--------------
+ 1 file changed, 40 insertions(+), 19 deletions(-)
+
+Index: mysql-5.1.53/storage/innodb_plugin/plug.in
+===================================================================
+--- mysql-5.1.53.orig/storage/innodb_plugin/plug.in
++++ mysql-5.1.53/storage/innodb_plugin/plug.in
+@@ -53,9 +53,10 @@
+   esac
+   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
+ 
+-  AC_MSG_CHECKING(whether GCC atomic builtins are available)
++  AC_CACHE_CHECK([whether GCC atomic builtins are available],
++                 [ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS],
+   # either define HAVE_IB_GCC_ATOMIC_BUILTINS or not
+-  AC_TRY_RUN(
++  [AC_TRY_RUN(
+     [
+       int main()
+       {
+@@ -95,18 +96,23 @@
+       }
+     ],
+     [
+-      AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS], [1],
+-                [GCC atomic builtins are available])
+       AC_MSG_RESULT(yes)
++      ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=yes
+     ],
+     [
+       AC_MSG_RESULT(no)
++      ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=no
+     ]
+-  )
++  )])
++  if test "x$ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS"= "xyes" ; then
++    AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS], [1],
++              [GCC atomic builtins are available])
++  fi
+ 
+-  AC_MSG_CHECKING(whether pthread_t can be used by GCC atomic builtins)
++  AC_CACHE_CHECK([whether pthread_t can be used by GCC atomic builtins],
++                 [ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC],
+   # either define HAVE_IB_ATOMIC_PTHREAD_T_GCC or not
+-  AC_TRY_RUN(
++  [AC_TRY_RUN(
+     [
+       #include <pthread.h>
+       #include <string.h>
+@@ -126,14 +132,18 @@
+       }
+     ],
+     [
+-      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_GCC], [1],
+-                [pthread_t can be used by GCC atomic builtins])
+       AC_MSG_RESULT(yes)
++      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=yes
+     ],
+     [
+       AC_MSG_RESULT(no)
++      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=no
+     ]
+-  )
++  )])
++  if test "x$ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC"= "xyes" ; then
++    AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_GCC], [1],
++              [pthread_t can be used by GCC atomic builtins])
++  fi
+ 
+   AC_MSG_CHECKING(whether Solaris libc atomic functions are available)
+   # either define HAVE_IB_SOLARIS_ATOMICS or not
+@@ -148,9 +158,10 @@
+ 			    are available])
+   )
+ 
+-  AC_MSG_CHECKING(whether pthread_t can be used by Solaris libc atomic functions)
++  AC_CACHE_CHECK([whether pthread_t can be used by Solaris libc atomic functions],
++                 [ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS],
+   # either define HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS or not
+-  AC_TRY_RUN(
++  [AC_TRY_RUN(
+     [
+       #include <pthread.h>
+       #include <string.h>
+@@ -181,28 +192,33 @@
+       }
+     ],
+     [
+-      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS], [1],
+-                [pthread_t can be used by solaris atomics])
+       AC_MSG_RESULT(yes)
++      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=yes
+     ],
+     [
+       AC_MSG_RESULT(no)
++      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=no
+     ]
+-  )
++  )])
++  if test "x$ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS"= "xyes" ; then
++    AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS], [1],
++              [pthread_t can be used by solaris atomics])
++  fi
+ 
+   # this is needed to know which one of atomic_cas_32() or atomic_cas_64()
+   # to use in the source
+   AC_CHECK_SIZEOF([pthread_t], [], [#include <pthread.h>])
+ 
+   # Check for x86 PAUSE instruction
+-  AC_MSG_CHECKING(for x86 PAUSE instruction)
++  AC_CACHE_CHECK([for x86 PAUSE instruction],
++                 [ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION],
+   # We have to actually try running the test program, because of a bug
+   # in Solaris on x86_64, where it wrongly reports that PAUSE is not
+   # supported when trying to run an application. See
+   # http://bugs.opensolaris.org/bugdatabase/printableBug.do?bug_id=6478684
+   # We use ib_ prefix to avoid collisoins if this code is added to
+   # mysql's configure.in.
+-  AC_TRY_RUN(
++  [AC_TRY_RUN(
+     [
+       int main() {
+         __asm__ __volatile__ ("pause");
+@@ -210,16 +226,21 @@
+       }
+     ],
+     [
+-      AC_DEFINE([HAVE_IB_PAUSE_INSTRUCTION], [1], [Does x86 PAUSE instruction exist])
+       AC_MSG_RESULT(yes)
++      ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION=yes
+     ],
+     [
+       AC_MSG_RESULT(no)
++      ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION=no
+     ],
+     [
+       AC_MSG_RESULT(no)
++      ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION=no
+     ]
+-  )
++  )])
++  if test "x$ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION"= "xyes" ; then
++    AC_DEFINE([HAVE_IB_PAUSE_INSTRUCTION], [1], [Does x86 PAUSE instruction exist])
++  fi
+   ])
+ 
+ # vim: set ft=config:
diff --git a/package/mysql/mysql-5.1.56/mysql_client-5.1.53-configure-ps-cache-check.patch b/package/mysql/mysql-5.1.56/mysql_client-5.1.53-configure-ps-cache-check.patch
new file mode 100644
index 0000000..336e80e
--- /dev/null
+++ b/package/mysql/mysql-5.1.56/mysql_client-5.1.53-configure-ps-cache-check.patch
@@ -0,0 +1,39 @@
+Patch borrowed from
+http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/mysql/files/configure-ps-cache-check.patch
+
+It allows to specify through ac_cv_FIND_PROC how ps should be used on
+the target to find the PID of a program.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.in |    9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+Index: mysql-5.1.53/configure.in
+===================================================================
+--- mysql-5.1.53.orig/configure.in
++++ mysql-5.1.53/configure.in
+@@ -462,8 +462,8 @@
+ # then Make, then shell.  The autoconf substitution uses single quotes, so 
+ # no unprotected single quotes should appear in the expression.
+ AC_PATH_PROG(PS, ps, ps)
+-AC_MSG_CHECKING("how to check if pid exists")
+-PS=$ac_cv_path_PS
++AC_CACHE_CHECK([how to check if pid exists], [ac_cv_FIND_PROC],
++[
+ # Linux style
+ if $PS wwwp $$ 2> /dev/null | grep -- "$0" > /dev/null
+ then
+@@ -502,8 +502,9 @@
+       AC_MSG_ERROR([Could not find the right ps and/or grep switches. Which OS is this?  See the Installation chapter in the Reference Manual.])
+   esac
+ fi
+-AC_SUBST(FIND_PROC)
+-AC_MSG_RESULT("$FIND_PROC")
++ac_cv_FIND_PROC="$FIND_PROC"
++])
++AC_SUBST([FIND_PROC], [$ac_cv_FIND_PROC])
+ 
+ # Check if a pid is valid
+ AC_PATH_PROG(KILL, kill, kill)
diff --git a/package/mysql/mysql-5.1.56/mysql_client-5.1.53-use-new-readline-iface.patch b/package/mysql/mysql-5.1.56/mysql_client-5.1.53-use-new-readline-iface.patch
new file mode 100644
index 0000000..c590656
--- /dev/null
+++ b/package/mysql/mysql-5.1.56/mysql_client-5.1.53-use-new-readline-iface.patch
@@ -0,0 +1,21 @@
+Tell MySQL to use the new readline interface even when an external
+readline is being used.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.in |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: mysql-5.1.53/configure.in
+===================================================================
+--- mysql-5.1.53.orig/configure.in
++++ mysql-5.1.53/configure.in
+@@ -2689,6 +2689,7 @@
+ 	    # this way we avoid linking commercial source with GPL readline
+ 	    readline_link="-lreadline"
+ 	    want_to_use_readline="yes"
++	    AC_DEFINE_UNQUOTED(USE_NEW_READLINE_INTERFACE, 1)
+ 	elif [test "$mysql_cv_libedit_interface" = "yes"]
+ 	then
+ 	    # Use libedit
diff --git a/package/mysql/mysql-5.5.12/mysql-5.5.11-tool-path.patch b/package/mysql/mysql-5.5.12/mysql-5.5.11-tool-path.patch
new file mode 100644
index 0000000..70f0e24
--- /dev/null
+++ b/package/mysql/mysql-5.5.12/mysql-5.5.11-tool-path.patch
@@ -0,0 +1,41 @@
+Make sure the binaries required for compilation are found in the current directory 
+and we don't have to add ./ to the path.
+
+Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
+
+diff -ruN mysql-5.5.11.orig//extra/CMakeLists.txt mysql-5.5.11/extra/CMakeLists.txt
+--- mysql-5.5.11.orig//extra/CMakeLists.txt	2011-03-31 08:36:18.000000000 -0500
++++ mysql-5.5.11/extra/CMakeLists.txt	2011-05-14 20:17:05.000000000 -0500
+@@ -33,7 +33,7 @@
+ 
+ ADD_CUSTOM_COMMAND(OUTPUT ${PROJECT_BINARY_DIR}/include/mysqld_error.h 
+                    ${PROJECT_BINARY_DIR}/sql/share/english/errmsg.sys
+-                   COMMAND comp_err
++                   COMMAND ./comp_err
+                     --charset=${PROJECT_SOURCE_DIR}/sql/share/charsets 
+                     --out-dir=${PROJECT_BINARY_DIR}/sql/share/
+                     --header_file=${PROJECT_BINARY_DIR}/include/mysqld_error.h 
+diff -ruN mysql-5.5.11.orig//scripts/CMakeLists.txt mysql-5.5.11/scripts/CMakeLists.txt
+--- mysql-5.5.11.orig//scripts/CMakeLists.txt	2011-03-31 08:36:18.000000000 -0500
++++ mysql-5.5.11/scripts/CMakeLists.txt	2011-05-14 20:18:12.000000000 -0500
+@@ -47,7 +47,7 @@
+ ADD_CUSTOM_COMMAND(
+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/mysql_fix_privilege_tables_sql.c
+   ${CAT_COMMAND}
+-  COMMAND comp_sql
++  COMMAND ./comp_sql
+   mysql_fix_privilege_tables
+   mysql_fix_privilege_tables.sql
+   mysql_fix_privilege_tables_sql.c
+diff -ruN mysql-5.5.11.orig//sql/CMakeLists.txt mysql-5.5.11/sql/CMakeLists.txt
+--- mysql-5.5.11.orig//sql/CMakeLists.txt	2011-03-31 08:36:18.000000000 -0500
++++ mysql-5.5.11/sql/CMakeLists.txt	2011-05-14 20:18:58.000000000 -0500
+@@ -189,7 +189,7 @@
+ 
+ ADD_CUSTOM_COMMAND(
+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
+-  COMMAND gen_lex_hash > lex_hash.h
++  COMMAND ./gen_lex_hash > lex_hash.h
+   DEPENDS gen_lex_hash
+ )
+ 
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
new file mode 100644
index 0000000..d87eeed
--- /dev/null
+++ b/package/mysql/mysql.mk
@@ -0,0 +1,150 @@
+#############################################################
+#
+# MySQL Server & Client
+#
+# MySQL is not very cross-compile friendly...
+# We first need to compile mysql-host in order to get the
+# binaries for gen_lex_hash, comp_sql and comp_err.
+# These binaries are required for the build process and need
+# to be compile for the host, not the target.
+#
+#############################################################
+
+ifeq ($(BR2_PACKAGE_MYSQL_51),y)
+	MYSQL_MAIN_VERSION = 5.1
+	MYSQL_VERSION = $(MYSQL_MAIN_VERSION).57
+endif
+
+ifeq ($(BR2_PACKAGE_MYSQL_55),y)
+	MYSQL_MAIN_VERSION = 5.5
+	MYSQL_VERSION = $(MYSQL_MAIN_VERSION).12
+endif
+
+MYSQL_SOURCE = mysql-$(MYSQL_VERSION).tar.gz
+MYSQL_SITE = http://mirror.services.wisc.edu/mysql/Downloads/MySQL-$(MYSQL_MAIN_VERSION)
+MYSQL_INSTALL_TARGET = YES
+MYSQL_INSTALL_STAGING = YES
+MYSQL_DEPENDENCIES = readline ncurses host-mysql
+MYSQL_AUTORECONF=YES
+HOST_MYSQL_AUTORECONF=YES
+
+# Generic section
+define MYSQL_REMOVE_TEST_PROGS
+	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
+endef
+
+define MYSQL_ADD_MYSQL_LIB_PATH
+	echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf
+endef
+
+ifeq ($(BR2_PACKAGE_MYSQL_REMOVE_TEST_PROGS),y)
+	MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_REMOVE_TEST_PROGS 
+endif
+
+MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_MYSQL_LIB_PATH
+
+MYSQL_POST_CONFIGURE_HOOKS += MYSQL_COPY_HOST_BINARIES
+
+define MYSQL_COPY_HOST_BINARIES
+	cp $(@D)/../host-mysql-$(MYSQL_VERSION)/sql/gen_lex_hash $(@D)/sql/
+	cp $(@D)/../host-mysql-$(MYSQL_VERSION)/scripts/comp_sql $(@D)/scripts/
+	cp $(@D)/../host-mysql-$(MYSQL_VERSION)/extra/comp_err $(@D)/extra/
+	# set the file dates far into the future to prevent recompilation
+	touch -t "203012120101" $(@D)/sql/gen_lex_hash
+	touch -t "203012120101" $(@D)/scripts/comp_sql
+	touch -t "203012120101" $(@D)/extra/comp_err
+endef
+
+define HOST_MYSQL_BUILD_CMDS
+	make -C $(@D)/vio
+	make -C $(@D)/mysys
+	make -C $(@D)/strings
+	make -C $(@D)/dbug
+	make -C $(@D)/regex
+	make -C $(@D)/sql gen_lex_hash
+	make -C $(@D)/scripts comp_sql
+	make -C $(@D)/extra comp_err
+endef
+
+# no need to really install anything, since we just need to copy
+# the 3 binaries required for the build process.
+define HOST_MYSQL_INSTALL_CMDS
+	exit 0
+endef
+
+# MySQL 5.1
+ifeq ($(BR2_PACKAGE_MYSQL_51),y)
+	HOST_MYSQL_CONF_OPT = \
+		--program-prefix="" \
+		--without-libedit \
+		--without-readline \
+		--without-docs \
+		--without-man \
+		--without-ndb-binlog
+
+	MYSQL_CONF_ENV = \
+		ac_cv_sys_restartable_syscalls=yes \
+		ac_cv_path_PS=/bin/ps \
+		ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null" \
+		ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=yes \
+		ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=no \
+		ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=yes \
+		mysql_cv_new_rl_interface=yes \
+		ac_cv_c_stack_direction=-1
+
+	MYSQL_CONF_OPT = \
+		--program-prefix="" \
+		--without-libedit \
+		--without-readline \
+		--enable-thread-safe-client \
+		$(if $(BR2_HAVE_DOCUMENTATION),,--without-docs --without-man) \
+		$(if $(BR2_PACKAGE_MYSQL_SERVER),,--without-server) \
+		$(if $(BR2_PACKAGE_MYSQL_LOWMEM),--with-low-memory) \
+		$(if $(BR2_PACKAGE_MYSQL_NO_NDBBINLOG),--without-ndb-binlog) \
+		$(if $(BR2_PACKAGE_MYSQL_EMBEDDED),--with-embedded-server) \
+		--localstatedir=$(BR2_PACKAGE_MYSQL_DATADIR)
+
+	ifeq ($(BR2_PACKAGE_OPENSSL),y)
+		MYSQL_CONF_OPT += --with-ssl
+		MYSQL_DEPENDENCIES += openssl
+	endif
+
+$(eval $(call AUTOTARGETS,package,mysql))
+$(eval $(call AUTOTARGETS,package,mysql,host))
+
+endif
+
+# MySQL 5.5
+ifeq ($(BR2_PACKAGE_MYSQL_55),y)
+	HOST_MYSQL_CONF_OPT = \
+		-DSTACK_DIRECTION=1 \
+		-DWITH_LIBEDIT=OFF \
+		-DWITH_READLINE=OFF \
+		-DDISABLE_SHARED=ON \
+		-DMYSQL_DATADIR=$(BR2_PACKAGE_MYSQL_DATADIR)
+
+	MYSQL_CONF_OPT = \
+		-DSTACK_DIRECTION=1 \
+		-DWITH_LIBEDIT=OFF \
+		-DWITH_READLINE=OFF\
+		-DENABLE_DEBUG_SYNC=OFF \
+		$(if $(BR2_PACKAGE_MYSQL_SERVER),,-DWITHOUT_SERVER=ON) \
+		$(if $(BR2_PACKAGE_MYSQL_EMBEDDED),-DWITH_EMBEDDED_SERVER=ON) \
+		$(if $(BR2_PACKAGE_MYSQL_STORAGE_ARCHIVE),-DWITH_ARCHIVE_STORAGE_ENGINE=ON,-DWITH_ARCHIVE_STORAGE_ENGINE=OFF) \
+		$(if $(BR2_PACKAGE_MYSQL_STORAGE_BLACKHOLE),-DWITH_BLACKHOLE_STORAGE_ENGINE=ON,-DWITH_BLACKHOLE_STORAGE_ENGINE=OFF) \
+		$(if $(BR2_PACKAGE_MYSQL_STORAGE_FEDERATED),-DWITH_INNOBASE_STORAGE_ENGINE=ON,-DWITH_INNOBASE_STORAGE_ENGINE=OFF) \
+		$(if $(BR2_PACKAGE_MYSQL_STORAGE_FEDERATED),-DWITH_PARTITION_STORAGE_ENGINE=ON,-DWITH_PARTITION_STORAGE_ENGINE=OFF) \
+		$(if $(BR2_PACKAGE_MYSQL_STORAGE_FEDERATED),-DWITH_PERFSCHEMA_STORAGE_ENGINE=ON,-DWITH_PERFSCHEMA_STORAGE_ENGINE=OFF) \
+		-DINSTALL_LAYOUT=RPM \
+		-DSYSCONFDIR=/etc \
+		-DMYSQL_DATADIR=$(BR2_PACKAGE_MYSQL_DATADIR) 
+		
+	ifeq ($(BR2_PACKAGE_OPENSSL),y)
+		MYSQL_CONF_OPT += -DWITH_SSL=yes
+		MYSQL_DEPENDENCIES += openssl
+	endif
+
+$(eval $(call CMAKETARGETS,package,mysql))
+$(eval $(call CMAKETARGETS,package,mysql,host))
+
+endif
diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
deleted file mode 100644
index f07fdb4..0000000
--- a/package/mysql_client/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_MYSQL_CLIENT
-	bool "MySQL client"
-	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_READLINE
-	help
-	  MySQL client
-
-comment "Mysql client requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch b/package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch
deleted file mode 100644
index c3b55ba..0000000
--- a/package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-Patch borrowed from
-http://code.google.com/p/minimyth/source/browse/trunk/gar-minimyth/script/db/mysql/files/mysql-5.1.47-ac_cache_check.patch?r=6493.
-
-It allows to override through ac_cv_* variables various checks that
-cannot be performed when cross-compiling.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
----
- storage/innodb_plugin/plug.in |   59 ++++++++++++++++++++++++++++--------------
- 1 file changed, 40 insertions(+), 19 deletions(-)
-
-Index: mysql-5.1.53/storage/innodb_plugin/plug.in
-===================================================================
---- mysql-5.1.53.orig/storage/innodb_plugin/plug.in
-+++ mysql-5.1.53/storage/innodb_plugin/plug.in
-@@ -53,9 +53,10 @@
-   esac
-   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
- 
--  AC_MSG_CHECKING(whether GCC atomic builtins are available)
-+  AC_CACHE_CHECK([whether GCC atomic builtins are available],
-+                 [ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS],
-   # either define HAVE_IB_GCC_ATOMIC_BUILTINS or not
--  AC_TRY_RUN(
-+  [AC_TRY_RUN(
-     [
-       int main()
-       {
-@@ -95,18 +96,23 @@
-       }
-     ],
-     [
--      AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS], [1],
--                [GCC atomic builtins are available])
-       AC_MSG_RESULT(yes)
-+      ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=yes
-     ],
-     [
-       AC_MSG_RESULT(no)
-+      ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=no
-     ]
--  )
-+  )])
-+  if test "x$ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS"= "xyes" ; then
-+    AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS], [1],
-+              [GCC atomic builtins are available])
-+  fi
- 
--  AC_MSG_CHECKING(whether pthread_t can be used by GCC atomic builtins)
-+  AC_CACHE_CHECK([whether pthread_t can be used by GCC atomic builtins],
-+                 [ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC],
-   # either define HAVE_IB_ATOMIC_PTHREAD_T_GCC or not
--  AC_TRY_RUN(
-+  [AC_TRY_RUN(
-     [
-       #include <pthread.h>
-       #include <string.h>
-@@ -126,14 +132,18 @@
-       }
-     ],
-     [
--      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_GCC], [1],
--                [pthread_t can be used by GCC atomic builtins])
-       AC_MSG_RESULT(yes)
-+      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=yes
-     ],
-     [
-       AC_MSG_RESULT(no)
-+      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=no
-     ]
--  )
-+  )])
-+  if test "x$ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC"= "xyes" ; then
-+    AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_GCC], [1],
-+              [pthread_t can be used by GCC atomic builtins])
-+  fi
- 
-   AC_MSG_CHECKING(whether Solaris libc atomic functions are available)
-   # either define HAVE_IB_SOLARIS_ATOMICS or not
-@@ -148,9 +158,10 @@
- 			    are available])
-   )
- 
--  AC_MSG_CHECKING(whether pthread_t can be used by Solaris libc atomic functions)
-+  AC_CACHE_CHECK([whether pthread_t can be used by Solaris libc atomic functions],
-+                 [ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS],
-   # either define HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS or not
--  AC_TRY_RUN(
-+  [AC_TRY_RUN(
-     [
-       #include <pthread.h>
-       #include <string.h>
-@@ -181,28 +192,33 @@
-       }
-     ],
-     [
--      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS], [1],
--                [pthread_t can be used by solaris atomics])
-       AC_MSG_RESULT(yes)
-+      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=yes
-     ],
-     [
-       AC_MSG_RESULT(no)
-+      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=no
-     ]
--  )
-+  )])
-+  if test "x$ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS"= "xyes" ; then
-+    AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS], [1],
-+              [pthread_t can be used by solaris atomics])
-+  fi
- 
-   # this is needed to know which one of atomic_cas_32() or atomic_cas_64()
-   # to use in the source
-   AC_CHECK_SIZEOF([pthread_t], [], [#include <pthread.h>])
- 
-   # Check for x86 PAUSE instruction
--  AC_MSG_CHECKING(for x86 PAUSE instruction)
-+  AC_CACHE_CHECK([for x86 PAUSE instruction],
-+                 [ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION],
-   # We have to actually try running the test program, because of a bug
-   # in Solaris on x86_64, where it wrongly reports that PAUSE is not
-   # supported when trying to run an application. See
-   # http://bugs.opensolaris.org/bugdatabase/printableBug.do?bug_id=6478684
-   # We use ib_ prefix to avoid collisoins if this code is added to
-   # mysql's configure.in.
--  AC_TRY_RUN(
-+  [AC_TRY_RUN(
-     [
-       int main() {
-         __asm__ __volatile__ ("pause");
-@@ -210,16 +226,21 @@
-       }
-     ],
-     [
--      AC_DEFINE([HAVE_IB_PAUSE_INSTRUCTION], [1], [Does x86 PAUSE instruction exist])
-       AC_MSG_RESULT(yes)
-+      ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION=yes
-     ],
-     [
-       AC_MSG_RESULT(no)
-+      ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION=no
-     ],
-     [
-       AC_MSG_RESULT(no)
-+      ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION=no
-     ]
--  )
-+  )])
-+  if test "x$ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION"= "xyes" ; then
-+    AC_DEFINE([HAVE_IB_PAUSE_INSTRUCTION], [1], [Does x86 PAUSE instruction exist])
-+  fi
-   ])
- 
- # vim: set ft=config:
diff --git a/package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch b/package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch
deleted file mode 100644
index 336e80e..0000000
--- a/package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Patch borrowed from
-http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/mysql/files/configure-ps-cache-check.patch
-
-It allows to specify through ac_cv_FIND_PROC how ps should be used on
-the target to find the PID of a program.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
----
- configure.in |    9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-Index: mysql-5.1.53/configure.in
-===================================================================
---- mysql-5.1.53.orig/configure.in
-+++ mysql-5.1.53/configure.in
-@@ -462,8 +462,8 @@
- # then Make, then shell.  The autoconf substitution uses single quotes, so 
- # no unprotected single quotes should appear in the expression.
- AC_PATH_PROG(PS, ps, ps)
--AC_MSG_CHECKING("how to check if pid exists")
--PS=$ac_cv_path_PS
-+AC_CACHE_CHECK([how to check if pid exists], [ac_cv_FIND_PROC],
-+[
- # Linux style
- if $PS wwwp $$ 2> /dev/null | grep -- "$0" > /dev/null
- then
-@@ -502,8 +502,9 @@
-       AC_MSG_ERROR([Could not find the right ps and/or grep switches. Which OS is this?  See the Installation chapter in the Reference Manual.])
-   esac
- fi
--AC_SUBST(FIND_PROC)
--AC_MSG_RESULT("$FIND_PROC")
-+ac_cv_FIND_PROC="$FIND_PROC"
-+])
-+AC_SUBST([FIND_PROC], [$ac_cv_FIND_PROC])
- 
- # Check if a pid is valid
- AC_PATH_PROG(KILL, kill, kill)
diff --git a/package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch b/package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch
deleted file mode 100644
index c590656..0000000
--- a/package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Tell MySQL to use the new readline interface even when an external
-readline is being used.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
----
- configure.in |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: mysql-5.1.53/configure.in
-===================================================================
---- mysql-5.1.53.orig/configure.in
-+++ mysql-5.1.53/configure.in
-@@ -2689,6 +2689,7 @@
- 	    # this way we avoid linking commercial source with GPL readline
- 	    readline_link="-lreadline"
- 	    want_to_use_readline="yes"
-+	    AC_DEFINE_UNQUOTED(USE_NEW_READLINE_INTERFACE, 1)
- 	elif [test "$mysql_cv_libedit_interface" = "yes"]
- 	then
- 	    # Use libedit
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
deleted file mode 100644
index 9cd088c..0000000
--- a/package/mysql_client/mysql_client.mk
+++ /dev/null
@@ -1,46 +0,0 @@
-#############################################################
-#
-# MySQL 5.1 Client
-#
-#############################################################
-MYSQL_CLIENT_VERSION = 5.1.53
-MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
-MYSQL_CLIENT_SITE = http://downloads.mysql.com/archives/mysql-5.1/
-MYSQL_CLIENT_INSTALL_TARGET = YES
-MYSQL_CLIENT_INSTALL_STAGING = YES
-MYSQL_CLIENT_DEPENDENCIES = readline ncurses
-MYSQL_CLIENT_AUTORECONF=YES
-
-MYSQL_CLIENT_CONF_ENV = \
-	ac_cv_sys_restartable_syscalls=yes \
-	ac_cv_path_PS=/bin/ps \
-	ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null" \
-	ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=yes \
-	ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=no \
-	ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=yes \
-	mysql_cv_new_rl_interface=yes
-
-MYSQL_CLIENT_CONF_OPT = \
-	--program-prefix="" \
-	--without-ndb-binlog \
-	--without-server \
-	--without-docs \
-	--without-man \
-	--without-libedit \
-	--without-readline \
-	--with-low-memory \
-	--enable-thread-safe-client \
-	$(ENABLE_DEBUG)
-
-define MYSQL_CLIENT_REMOVE_TEST_PROGS
-	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
-endef
-
-define MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
-	echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf
-endef
-
-MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_REMOVE_TEST_PROGS
-MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
-
-$(eval $(call AUTOTARGETS,package,mysql_client))
-- 
1.6.4.2
