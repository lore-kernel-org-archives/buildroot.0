From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon,  5 Mar 2012 18:26:59 +0100
Subject: [Buildroot] [Patch v2 1/1] mysql_client : bump to latest 5.1.60
	version
Message-ID: <1330968419-20379-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updates mysql_client to the latest 5.1.60 version, the verion 5.1.53 patches have been renamed to 5.1.60 

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 .../mysql_client-5.1.53-ac_cache_check.patch       |  156 --------------------
 ...ql_client-5.1.53-configure-ps-cache-check.patch |   39 -----
 ...ysql_client-5.1.53-use-new-readline-iface.patch |   21 ---
 .../mysql_client-5.1.60-ac_cache_check.patch       |  156 ++++++++++++++++++++
 ...ql_client-5.1.60-configure-ps-cache-check.patch |   39 +++++
 ...ysql_client-5.1.60-use-new-readline-iface.patch |   21 +++
 package/mysql_client/mysql_client.mk               |    2 +-
 7 files changed, 217 insertions(+), 217 deletions(-)
 delete mode 100644 package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch
 delete mode 100644 package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch
 delete mode 100644 package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch
 create mode 100644 package/mysql_client/mysql_client-5.1.60-ac_cache_check.patch
 create mode 100644 package/mysql_client/mysql_client-5.1.60-configure-ps-cache-check.patch
 create mode 100644 package/mysql_client/mysql_client-5.1.60-use-new-readline-iface.patch

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
diff --git a/package/mysql_client/mysql_client-5.1.60-ac_cache_check.patch b/package/mysql_client/mysql_client-5.1.60-ac_cache_check.patch
new file mode 100644
index 0000000..c3b55ba
--- /dev/null
+++ b/package/mysql_client/mysql_client-5.1.60-ac_cache_check.patch
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
diff --git a/package/mysql_client/mysql_client-5.1.60-configure-ps-cache-check.patch b/package/mysql_client/mysql_client-5.1.60-configure-ps-cache-check.patch
new file mode 100644
index 0000000..336e80e
--- /dev/null
+++ b/package/mysql_client/mysql_client-5.1.60-configure-ps-cache-check.patch
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
diff --git a/package/mysql_client/mysql_client-5.1.60-use-new-readline-iface.patch b/package/mysql_client/mysql_client-5.1.60-use-new-readline-iface.patch
new file mode 100644
index 0000000..c590656
--- /dev/null
+++ b/package/mysql_client/mysql_client-5.1.60-use-new-readline-iface.patch
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
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 9addf33..f4dd09e 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -3,7 +3,7 @@
 # MySQL 5.1 Client
 #
 #############################################################
-MYSQL_CLIENT_VERSION = 5.1.53
+MYSQL_CLIENT_VERSION = 5.1.60
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
 MYSQL_CLIENT_SITE = http://downloads.mysql.com/archives/mysql-5.1/
 MYSQL_CLIENT_INSTALL_TARGET = YES
-- 
1.7.9
