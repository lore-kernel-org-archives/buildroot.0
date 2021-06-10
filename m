From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Jun 2021 20:58:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/memcached: disable tests
Message-ID: <20210610185846.37863-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable tests to avoid the following build failure with -DNDEBUG which
is raised since commit 5a8c50fe05afacc3cbe8e7347e238da9f242fab0

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: testapp.o: in function `cache_redzone_test':
(.text+0x2f48): undefined reference to `cache_error'

Fixes:
 - http://autobuild.buildroot.org/results/c4ddd86bd4b74ba4e4857ee38e3a95bb9b019093

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-configure.ac-add-disable-tests.patch | 57 +++++++++++++++++++
 package/memcached/memcached.mk                |  3 +
 2 files changed, 60 insertions(+)
 create mode 100644 package/memcached/0001-configure.ac-add-disable-tests.patch

diff --git a/package/memcached/0001-configure.ac-add-disable-tests.patch b/package/memcached/0001-configure.ac-add-disable-tests.patch
new file mode 100644
index 0000000000..bbe73b7292
--- /dev/null
+++ b/package/memcached/0001-configure.ac-add-disable-tests.patch
@@ -0,0 +1,57 @@
+From c57efbce382bde6901859b79b222abfc9c3e1a87 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 10 Jun 2021 20:38:07 +0200
+Subject: [PATCH] configure.ac: add --disable-tests
+
+Add --disable-tests to avoid the following build failure with -DNDEBUG:
+
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: testapp.o: in function `cache_redzone_test':
+(.text+0x2f48): undefined reference to `cache_error'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c4ddd86bd4b74ba4e4857ee38e3a95bb9b019093
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  | 2 ++
+ configure.ac | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8ea4841..1d730b6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,8 @@
+ bin_PROGRAMS = memcached
+ pkginclude_HEADERS = protocol_binary.h
++if ENABLE_TESTS
+ noinst_PROGRAMS = memcached-debug sizes testapp timedrun
++endif
+ 
+ BUILT_SOURCES=
+ 
+diff --git a/configure.ac b/configure.ac
+index f497101..441d55b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -115,6 +115,9 @@ AC_ARG_ENABLE(static,
+ AC_ARG_ENABLE(unix_socket,
+   [AS_HELP_STRING([--disable-unix-socket], [Disable unix domain socket])])
+ 
++AC_ARG_ENABLE(tests,
++  [AS_HELP_STRING([--disable-tests], [Disable tests])],,enable_tests=yes)
++
+ dnl **********************************************************************
+ dnl DETECT_SASL_CB_GETCONF
+ dnl
+@@ -231,6 +234,7 @@ AM_CONDITIONAL([ENABLE_TLS],[test "$enable_tls" = "yes"])
+ AM_CONDITIONAL([ENABLE_ASAN],[test "$enable_asan" = "yes"])
+ AM_CONDITIONAL([ENABLE_STATIC],[test "$enable_static" = "yes"])
+ AM_CONDITIONAL([DISABLE_UNIX_SOCKET],[test "$enable_unix_socket" = "no"])
++AM_CONDITIONAL([ENABLE_TESTS],[test "$enable_tests" = "yes"])
+ 
+ 
+ AC_SUBST(DTRACE)
+-- 
+2.30.2
+
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 1c695411cd..2c5a77b906 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -12,6 +12,9 @@ MEMCACHED_CONF_OPTS = --disable-coverage
 MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
 MEMCACHED_CPE_ID_VENDOR = memcached
+# We're patching configure.ac
+MEMCACHED_AUTORECONF = YES
+MEMCACHED_CONF_OPTS = --disable-tests
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MEMCACHED_CONF_ENV += ac_cv_c_endian=big
-- 
2.30.2
