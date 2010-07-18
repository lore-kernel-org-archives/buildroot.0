From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jul 2010 21:30:15 +0200
Subject: [Buildroot] [git commit master 1/1] mysql_client: Bump to 5.1.47
	and fix build
Message-ID: <20100718200735.28CF882BA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ab7d4fb421d7d765f832cd4c7fd8cb10004b8a70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MySQL build has been broken for quite some time due to the ./configure
inability to find out how to use 'ps' to find the PID of a running
program. This commit bumps MySQL to the latest version and adds a few
patches to fix various build issues, including the 'ps' issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    8 +-
 .../mysql_client-5.1.47-ac_cache_check.patch       |  151 ++++++++++++++++++++
 ...ql_client-5.1.47-configure-ps-cache-check.patch |   35 +++++
 ...ysql_client-5.1.47-use-new-readline-iface.patch |   17 +++
 package/mysql_client/mysql_client.mk               |   18 ++-
 5 files changed, 220 insertions(+), 9 deletions(-)
 create mode 100644 package/mysql_client/mysql_client-5.1.47-ac_cache_check.patch
 create mode 100644 package/mysql_client/mysql_client-5.1.47-configure-ps-cache-check.patch
 create mode 100644 package/mysql_client/mysql_client-5.1.47-use-new-readline-iface.patch

diff --git a/CHANGES b/CHANGES
index bfa2d27..4f0ff49 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,10 +20,10 @@
 	gawk, gstreamer, gzip, intltool, ipsec-tools, iptables,
 	libart, libcgi, libfuse, libgpg-error, libidn, liblockfile,
 	libpng, links, linux-fusion, lmbench, lrzsz, make,
-	module-init-tools, nbd, ncurses, netperf, ntfsprogs, openssl,
-	php, qt, quagga, sqlite, sdl, sdl_mixer, sdl_sound, sdl_ttf,
-	squashfs, tn5250, tremor, usbutils, xkeyboard-config,
-	xserver_xorg-server, xvkbd
+	module-init-tools, mysql_client, nbd, ncurses, netperf,
+	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
+	sdl_sound, sdl_ttf, squashfs, tn5250, tremor, usbutils,
+	xkeyboard-config, xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
 
diff --git a/package/mysql_client/mysql_client-5.1.47-ac_cache_check.patch b/package/mysql_client/mysql_client-5.1.47-ac_cache_check.patch
new file mode 100644
index 0000000..6bdfeae
--- /dev/null
+++ b/package/mysql_client/mysql_client-5.1.47-ac_cache_check.patch
@@ -0,0 +1,151 @@
+Patch borrowed from
+http://code.google.com/p/minimyth/source/browse/trunk/gar-minimyth/script/db/mysql/files/mysql-5.1.47-ac_cache_check.patch?r=6493.
+
+It allows to override through ac_cv_* variables various checks that
+cannot be performed when cross-compiling.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff -Naur mysql-5.1.47-old/storage/innodb_plugin/plug.in mysql-5.1.47-new/storage/innodb_plugin/plug.in
+--- mysql-5.1.47-old/storage/innodb_plugin/plug.in	2010-05-20 09:55:10.000000000 -0700
++++ mysql-5.1.47-new/storage/innodb_plugin/plug.in	2010-05-20 09:56:12.000000000 -0700
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
+@@ -147,9 +157,10 @@
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
+@@ -180,28 +191,33 @@
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
+@@ -209,16 +225,21 @@
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
diff --git a/package/mysql_client/mysql_client-5.1.47-configure-ps-cache-check.patch b/package/mysql_client/mysql_client-5.1.47-configure-ps-cache-check.patch
new file mode 100644
index 0000000..d7bf628
--- /dev/null
+++ b/package/mysql_client/mysql_client-5.1.47-configure-ps-cache-check.patch
@@ -0,0 +1,35 @@
+Patch borrowed from
+http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/mysql/files/configure-ps-cache-check.patch
+
+It allows to specify through ac_cv_FIND_PROC how ps should be used on
+the target to find the PID of a program.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: mysql-4.1.22/configure.in
+===================================================================
+--- mysql-4.1.22.orig/configure.in	2009-01-28 16:33:28.000000000 +0000
++++ mysql-4.1.22/configure.in	2009-01-28 16:43:26.000000000 +0000
+@@ -471,8 +471,8 @@
+ 
+ # Lock for PS
+ AC_PATH_PROG(PS, ps, ps)
+-AC_MSG_CHECKING("how to check if pid exists")
+-PS=$ac_cv_path_PS
++AC_CACHE_CHECK([how to check if pid exists], [ac_cv_FIND_PROC],
++[
+ # Linux style
+ if $PS p $$ 2> /dev/null | grep $0 > /dev/null
+ then
+@@ -511,8 +511,9 @@
+       AC_MSG_ERROR([Could not find the right ps switches. Which OS is this ?. See the Installation chapter in the Reference Manual.])
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
diff --git a/package/mysql_client/mysql_client-5.1.47-use-new-readline-iface.patch b/package/mysql_client/mysql_client-5.1.47-use-new-readline-iface.patch
new file mode 100644
index 0000000..34bc035
--- /dev/null
+++ b/package/mysql_client/mysql_client-5.1.47-use-new-readline-iface.patch
@@ -0,0 +1,17 @@
+Tell MySQL to use the new readline interface even when an external
+readline is being used.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: mysql_client-5.1.47/configure.in
+===================================================================
+--- mysql_client-5.1.47.orig/configure.in	2010-07-15 23:49:35.000000000 +0200
++++ mysql_client-5.1.47/configure.in	2010-07-15 23:50:03.000000000 +0200
+@@ -2700,6 +2700,7 @@
+ 	    # this way we avoid linking commercial source with GPL readline
+ 	    readline_link="-lreadline"
+ 	    want_to_use_readline="yes"
++	    AC_DEFINE_UNQUOTED(USE_NEW_READLINE_INTERFACE, 1)
+ 	elif [test "$mysql_cv_libedit_interface" = "yes"]
+ 	then
+ 	    # Use libedit
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 4403653..377df89 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -3,23 +3,31 @@
 # MySQL 5.1 Client
 #
 #############################################################
-MYSQL_CLIENT_VERSION = 5.1.23-rc
+MYSQL_CLIENT_VERSION = 5.1.47
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
-MYSQL_CLIENT_SITE = http://mirrors.24-7-solutions.net/pub/mysql/Downloads/MySQL-5.1
+MYSQL_CLIENT_SITE = http://downloads.mysql.com/archives/mysql-5.1/
 MYSQL_CLIENT_INSTALL_TARGET = YES
 MYSQL_CLIENT_INSTALL_STAGING = YES
 MYSQL_CLIENT_DEPENDENCIES = readline ncurses
+MYSQL_CLIENT_AUTORECONF=YES
+
+MYSQL_CLIENT_CONF_ENV = \
+	ac_cv_sys_restartable_syscalls=yes \
+	ac_cv_path_PS=/bin/ps \
+	ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null" \
+	ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=yes \
+	ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=no \
+	ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=yes \
+	mysql_cv_new_rl_interface=yes
 
-MYSQL_CLIENT_CONF_ENV = ac_cv_sys_restartable_syscalls=yes
 MYSQL_CLIENT_CONF_OPT = \
 	--program-prefix="" \
 	--without-ndb-binlog \
 	--without-server \
 	--without-docs \
 	--without-man \
-	--without-readline \
 	--without-libedit \
-	--with-readline=$(STAGING_DIR)/usr \
+	--without-readline \
 	--with-low-memory \
 	--enable-thread-safe-client \
 	$(ENABLE_DEBUG)
-- 
1.7.1
