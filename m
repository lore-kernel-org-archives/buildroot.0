From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Sun, 19 Jan 2014 23:02:17 +0000
Subject: [Buildroot] [PATCH 1/2] Rename MySQL client package
Message-ID: <1390172539-5207-1-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Marcelo Guti?rrez(UTN/FRH)" <kuyurix@gmail.com>


Signed-off-by: Marcelo Guti?rrez(UTN/FRH) <kuyurix@gmail.com>
---
 Config.in.legacy                                   |    7 +
 package/Config.in                                  |    2 +-
 package/mysql/Config.in                            |   14 ++
 package/mysql/mysql-ac_cache_check.patch           |  156 ++++++++++++++++++++
 package/mysql/mysql-configure-ps-cache-check.patch |   39 +++++
 package/mysql/mysql-use-new-readline-iface.patch   |   21 +++
 package/mysql/mysql.mk                             |   48 ++++++
 7 files changed, 286 insertions(+), 1 deletion(-)
 create mode 100644 package/mysql/Config.in
 create mode 100644 package/mysql/mysql-ac_cache_check.patch
 create mode 100644 package/mysql/mysql-configure-ps-cache-check.patch
 create mode 100644 package/mysql/mysql-use-new-readline-iface.patch
 create mode 100644 package/mysql/mysql.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 597534e..31fad3e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -112,6 +112,13 @@ config BR2_PACKAGE_LIBNFC_LLCP
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_PACKAGE_MYSQL_CLIENT
+        bool "MySQL client renamed to MySQL"
+        select BR2_LEGACY
+        select BR2_PACKAGE_MYSQL
+        help
+	  The option has been renamed BR2_PACKAGE_MYSQL
+
 config BR2_PACKAGE_SQUASHFS3
 	bool "squashfs3 has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 749ffea..119e43a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -502,7 +502,7 @@ menu "Database"
 source "package/berkeleydb/Config.in"
 source "package/cppdb/Config.in"
 source "package/gdbm/Config.in"
-source "package/mysql_client/Config.in"
+source "package/mysql/Config.in"
 source "package/redis/Config.in"
 source "package/sqlcipher/Config.in"
 source "package/sqlite/Config.in"
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
new file mode 100644
index 0000000..229e050
--- /dev/null
+++ b/package/mysql/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_MYSQL
+	bool "MySQL"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+          The MySQL Open Source Database System
+	  http://www.mysql.com/
+
+comment "MySQL needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mysql/mysql-ac_cache_check.patch b/package/mysql/mysql-ac_cache_check.patch
new file mode 100644
index 0000000..c3b55ba
--- /dev/null
+++ b/package/mysql/mysql-ac_cache_check.patch
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
diff --git a/package/mysql/mysql-configure-ps-cache-check.patch b/package/mysql/mysql-configure-ps-cache-check.patch
new file mode 100644
index 0000000..336e80e
--- /dev/null
+++ b/package/mysql/mysql-configure-ps-cache-check.patch
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
diff --git a/package/mysql/mysql-use-new-readline-iface.patch b/package/mysql/mysql-use-new-readline-iface.patch
new file mode 100644
index 0000000..c590656
--- /dev/null
+++ b/package/mysql/mysql-use-new-readline-iface.patch
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
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
new file mode 100644
index 0000000..aaf6ba9
--- /dev/null
+++ b/package/mysql/mysql.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# mysql
+#
+################################################################################
+
+MYSQL_VERSION_MAJOR = 5.1
+MYSQL_VERSION = $(MYSQL_VERSION_MAJOR).70
+MYSQL_SOURCE = mysql-$(MYSQL_VERSION).tar.gz
+MYSQL_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_VERSION_MAJOR)
+MYSQL_INSTALL_STAGING = YES
+MYSQL_DEPENDENCIES = readline ncurses
+MYSQL_AUTORECONF = YES
+MYSQL_LICENSE = GPLv2
+MYSQL_LICENSE_FILES = README COPYING
+
+MYSQL_CONF_ENV = \
+	ac_cv_sys_restartable_syscalls=yes \
+	ac_cv_path_PS=/bin/ps \
+	ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null" \
+	ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=yes \
+	ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=no \
+	ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=yes \
+	mysql_cv_new_rl_interface=yes
+
+MYSQL_CONF_OPT = \
+	--without-ndb-binlog \
+	--without-server \
+	--without-docs \
+	--without-man \
+	--without-libedit \
+	--without-readline \
+	--with-low-memory \
+	--enable-thread-safe-client \
+	$(ENABLE_DEBUG)
+
+define MYSQL_REMOVE_TEST_PROGS
+	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
+endef
+
+define MYSQL_ADD_MYSQL_LIB_PATH
+	echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf
+endef
+
+MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_REMOVE_TEST_PROGS
+MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_MYSQL_LIB_PATH
+
+$(eval $(autotools-package))
-- 
1.7.10.4
