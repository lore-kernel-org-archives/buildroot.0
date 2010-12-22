From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 14:07:08 +0100
Subject: [Buildroot] [PATCH 1/2] mysql_client: bump to 5.1.53 to fix abi
	check problem
In-Reply-To: <cover.1293023213.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293023213.git.thomas.petazzoni@free-electrons.com>
Message-ID: <243dd9354cc3dc616b7ef18a7b7fd69795e3c12b.1293023213.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MySQL 5.1.47 is affected by a bug in one test called the "ABI check",
which does not work with recent gcc versions. This bug is referenced
as http://bugs.mysql.com/bug.php?id=52514 in MySQL bug tracker.

Since it has been fixed in newer versions of MySQL, we simply bump the
version to the latest available in the 5.1.x series.

The patches have not changed, they have only been refreshed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ch => mysql_client-5.1.53-ac_cache_check.patch} |   17 ++++++++++-----
 ...l_client-5.1.53-configure-ps-cache-check.patch} |   22 +++++++++++--------
 ...sql_client-5.1.53-use-new-readline-iface.patch} |   12 +++++++---
 package/mysql_client/mysql_client.mk               |    2 +-
 4 files changed, 33 insertions(+), 20 deletions(-)
 rename package/mysql_client/{mysql_client-5.1.47-ac_cache_check.patch => mysql_client-5.1.53-ac_cache_check.patch} (91%)
 rename package/mysql_client/{mysql_client-5.1.47-configure-ps-cache-check.patch => mysql_client-5.1.53-configure-ps-cache-check.patch} (57%)
 rename package/mysql_client/{mysql_client-5.1.47-use-new-readline-iface.patch => mysql_client-5.1.53-use-new-readline-iface.patch} (70%)

diff --git a/package/mysql_client/mysql_client-5.1.47-ac_cache_check.patch b/package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch
similarity index 91%
rename from package/mysql_client/mysql_client-5.1.47-ac_cache_check.patch
rename to package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch
index 6bdfeae..c3b55ba 100644
--- a/package/mysql_client/mysql_client-5.1.47-ac_cache_check.patch
+++ b/package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch
@@ -6,9 +6,14 @@ cannot be performed when cross-compiling.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-diff -Naur mysql-5.1.47-old/storage/innodb_plugin/plug.in mysql-5.1.47-new/storage/innodb_plugin/plug.in
---- mysql-5.1.47-old/storage/innodb_plugin/plug.in	2010-05-20 09:55:10.000000000 -0700
-+++ mysql-5.1.47-new/storage/innodb_plugin/plug.in	2010-05-20 09:56:12.000000000 -0700
+---
+ storage/innodb_plugin/plug.in |   59 ++++++++++++++++++++++++++++--------------
+ 1 file changed, 40 insertions(+), 19 deletions(-)
+
+Index: mysql-5.1.53/storage/innodb_plugin/plug.in
+===================================================================
+--- mysql-5.1.53.orig/storage/innodb_plugin/plug.in
++++ mysql-5.1.53/storage/innodb_plugin/plug.in
 @@ -53,9 +53,10 @@
    esac
    AC_SUBST(INNODB_DYNAMIC_CFLAGS)
@@ -73,7 +78,7 @@ diff -Naur mysql-5.1.47-old/storage/innodb_plugin/plug.in mysql-5.1.47-new/stora
  
    AC_MSG_CHECKING(whether Solaris libc atomic functions are available)
    # either define HAVE_IB_SOLARIS_ATOMICS or not
-@@ -147,9 +157,10 @@
+@@ -148,9 +158,10 @@
  			    are available])
    )
  
@@ -86,7 +91,7 @@ diff -Naur mysql-5.1.47-old/storage/innodb_plugin/plug.in mysql-5.1.47-new/stora
      [
        #include <pthread.h>
        #include <string.h>
-@@ -180,28 +191,33 @@
+@@ -181,28 +192,33 @@
        }
      ],
      [
@@ -125,7 +130,7 @@ diff -Naur mysql-5.1.47-old/storage/innodb_plugin/plug.in mysql-5.1.47-new/stora
      [
        int main() {
          __asm__ __volatile__ ("pause");
-@@ -209,16 +225,21 @@
+@@ -210,16 +226,21 @@
        }
      ],
      [
diff --git a/package/mysql_client/mysql_client-5.1.47-configure-ps-cache-check.patch b/package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch
similarity index 57%
rename from package/mysql_client/mysql_client-5.1.47-configure-ps-cache-check.patch
rename to package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch
index d7bf628..336e80e 100644
--- a/package/mysql_client/mysql_client-5.1.47-configure-ps-cache-check.patch
+++ b/package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch
@@ -6,23 +6,27 @@ the target to find the PID of a program.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: mysql-4.1.22/configure.in
+---
+ configure.in |    9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+Index: mysql-5.1.53/configure.in
 ===================================================================
---- mysql-4.1.22.orig/configure.in	2009-01-28 16:33:28.000000000 +0000
-+++ mysql-4.1.22/configure.in	2009-01-28 16:43:26.000000000 +0000
-@@ -471,8 +471,8 @@
- 
- # Lock for PS
+--- mysql-5.1.53.orig/configure.in
++++ mysql-5.1.53/configure.in
+@@ -462,8 +462,8 @@
+ # then Make, then shell.  The autoconf substitution uses single quotes, so 
+ # no unprotected single quotes should appear in the expression.
  AC_PATH_PROG(PS, ps, ps)
 -AC_MSG_CHECKING("how to check if pid exists")
 -PS=$ac_cv_path_PS
 +AC_CACHE_CHECK([how to check if pid exists], [ac_cv_FIND_PROC],
 +[
  # Linux style
- if $PS p $$ 2> /dev/null | grep $0 > /dev/null
+ if $PS wwwp $$ 2> /dev/null | grep -- "$0" > /dev/null
  then
-@@ -511,8 +511,9 @@
-       AC_MSG_ERROR([Could not find the right ps switches. Which OS is this ?. See the Installation chapter in the Reference Manual.])
+@@ -502,8 +502,9 @@
+       AC_MSG_ERROR([Could not find the right ps and/or grep switches. Which OS is this?  See the Installation chapter in the Reference Manual.])
    esac
  fi
 -AC_SUBST(FIND_PROC)
diff --git a/package/mysql_client/mysql_client-5.1.47-use-new-readline-iface.patch b/package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch
similarity index 70%
rename from package/mysql_client/mysql_client-5.1.47-use-new-readline-iface.patch
rename to package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch
index 34bc035..c590656 100644
--- a/package/mysql_client/mysql_client-5.1.47-use-new-readline-iface.patch
+++ b/package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch
@@ -3,11 +3,15 @@ readline is being used.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: mysql_client-5.1.47/configure.in
+---
+ configure.in |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: mysql-5.1.53/configure.in
 ===================================================================
---- mysql_client-5.1.47.orig/configure.in	2010-07-15 23:49:35.000000000 +0200
-+++ mysql_client-5.1.47/configure.in	2010-07-15 23:50:03.000000000 +0200
-@@ -2700,6 +2700,7 @@
+--- mysql-5.1.53.orig/configure.in
++++ mysql-5.1.53/configure.in
+@@ -2689,6 +2689,7 @@
  	    # this way we avoid linking commercial source with GPL readline
  	    readline_link="-lreadline"
  	    want_to_use_readline="yes"
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 6a89a52..ccf7a2c 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -3,7 +3,7 @@
 # MySQL 5.1 Client
 #
 #############################################################
-MYSQL_CLIENT_VERSION = 5.1.47
+MYSQL_CLIENT_VERSION = 5.1.53
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
 MYSQL_CLIENT_SITE = http://downloads.mysql.com/archives/mysql-5.1/
 MYSQL_CLIENT_INSTALL_TARGET = YES
-- 
1.7.0.4
