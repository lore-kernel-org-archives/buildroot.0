From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 19 Jul 2014 11:35:33 -0300
Subject: [Buildroot] [PATCH 1/2] libmemcached: disable libtest
Message-ID: <1405780534-691-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows libmemcached to be enabled for musl and uClibc as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmemcached/Config.in                     |  6 ++--
 .../libmemcached-01-disable-tests.patch            | 32 ++++++++++++++++++++--
 package/php-memcached/Config.in                    |  6 ++--
 3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/package/libmemcached/Config.in b/package/libmemcached/Config.in
index e9dd2c4..4af2b3b 100644
--- a/package/libmemcached/Config.in
+++ b/package/libmemcached/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBMEMCACHED
 	bool "libmemcached"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_USES_GLIBC # posix spawn, va_list breakage
 	help
 	  libMemcached is an open source C/C++ client library and tools
 	  for the memcached server.
@@ -11,6 +10,5 @@ config BR2_PACKAGE_LIBMEMCACHED
 
 	  http://libmemcached.org/libMemcached.html
 
-comment "libmemcached needs a (e)glibc toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libmemcached needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmemcached/libmemcached-01-disable-tests.patch b/package/libmemcached/libmemcached-01-disable-tests.patch
index d7da101..6128306 100644
--- a/package/libmemcached/libmemcached-01-disable-tests.patch
+++ b/package/libmemcached/libmemcached-01-disable-tests.patch
@@ -4,9 +4,26 @@ with extra dependencies.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
 diff -Nura libmemcached-1.0.18.orig/Makefile.am libmemcached-1.0.18/Makefile.am
---- libmemcached-1.0.18.orig/Makefile.am	2014-07-19 08:43:15.127031040 -0300
-+++ libmemcached-1.0.18/Makefile.am	2014-07-19 08:48:11.327068987 -0300
-@@ -76,7 +76,6 @@
+--- libmemcached-1.0.18.orig/Makefile.am	2014-07-19 09:24:45.246418899 -0300
++++ libmemcached-1.0.18/Makefile.am	2014-07-19 09:25:12.701349345 -0300
+@@ -1,6 +1,6 @@
+ # vim:ft=automake
+ 
+-ACLOCAL_AMFLAGS= -I m4 -I libtest/m4
++ACLOCAL_AMFLAGS= -I m4
+ AM_YFLAGS= -d
+ 
+ # includes append to these:
+@@ -45,8 +45,6 @@
+ include libmemcached-1.0/include.am
+ else
+ 
+-include libtest/include.am
+-
+ include libhashkit-1.0/include.am
+ include libmemcached-1.0/include.am
+ 
+@@ -76,7 +74,6 @@
  include libmemcachedinternal/util/include.am
  include rpm/include.mk
  include support/include.am
@@ -14,3 +31,12 @@ diff -Nura libmemcached-1.0.18.orig/Makefile.am libmemcached-1.0.18/Makefile.am
  include util/include.am
  include win32/include.am
  
+@@ -103,7 +100,7 @@
+ 	@echo "Files that need to be either removed or checked in:"
+ 	@bzr unknowns
+ 
+-clean-local: clean-libtest-check clean-docs-check clean-rpm
++clean-local: clean-docs-check clean-rpm
+ 
+ 
+ lcov: lcov-clean check
diff --git a/package/php-memcached/Config.in b/package/php-memcached/Config.in
index c9f4b7d..cd97c15 100644
--- a/package/php-memcached/Config.in
+++ b/package/php-memcached/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PHP_MEMCACHED
 	bool "php-memcached"
 	depends on BR2_INSTALL_LIBSTDCPP # libmemcached
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmemcached
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libmemcached
 	select BR2_PACKAGE_PHP_EXT_SESSION
 	select BR2_PACKAGE_LIBMEMCACHED
 	select BR2_PACKAGE_ZLIB
@@ -12,6 +11,5 @@ config BR2_PACKAGE_PHP_MEMCACHED
 
 	  http://pecl.php.net/package/memcached
 
-comment "php-memcached needs a (e)glibc toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "php-memcached needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.5.5
