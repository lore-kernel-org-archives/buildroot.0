From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Nov 2014 08:11:57 -0300
Subject: [Buildroot] [PATCH] libmemcached: disable sanitizer
Message-ID: <1415877117-20736-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tests are flawed and we don't generally enable a dozen hardening
CFLAGS automatically. Fixes:
http://autobuild.buildroot.net/results/a84/a84ab4f0fdea6bbab971ba379e3066cddb25bfaa/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...isable-tests.patch => 0001-disable-tests.patch} |  0
 package/libmemcached/0002-disable-sanitizer.patch  | 25 ++++++++++++++++++++++
 package/libmemcached/libmemcached.mk               |  2 +-
 3 files changed, 26 insertions(+), 1 deletion(-)
 rename package/libmemcached/{libmemcached-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 create mode 100644 package/libmemcached/0002-disable-sanitizer.patch

diff --git a/package/libmemcached/libmemcached-01-disable-tests.patch b/package/libmemcached/0001-disable-tests.patch
similarity index 100%
rename from package/libmemcached/libmemcached-01-disable-tests.patch
rename to package/libmemcached/0001-disable-tests.patch
diff --git a/package/libmemcached/0002-disable-sanitizer.patch b/package/libmemcached/0002-disable-sanitizer.patch
new file mode 100644
index 0000000..108da22
--- /dev/null
+++ b/package/libmemcached/0002-disable-sanitizer.patch
@@ -0,0 +1,25 @@
+Disable sanitizer checks, they're busted.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libmemcached-1.0.18.orig/m4/ax_harden_compiler_flags.m4 libmemcached-1.0.18/m4/ax_harden_compiler_flags.m4
+--- libmemcached-1.0.18.orig/m4/ax_harden_compiler_flags.m4	2014-11-13 08:07:09.011614311 -0300
++++ libmemcached-1.0.18/m4/ax_harden_compiler_flags.m4	2014-11-13 08:07:52.406092440 -0300
+@@ -222,8 +222,6 @@
+ #         GCC 4.5 removed this.
+ #         _APPEND_COMPILE_FLAGS_ERROR([-Wunreachable-code])
+ 
+-          _SET_SANITIZE_FLAGS
+-
+           AS_IF([test "x$ax_enable_debug" = xno],
+             [AS_IF([test "x$ac_cv_vcs_checkout" = xyes],
+               [AS_IF([test "x${host_os}" != "xmingw"],
+@@ -337,8 +335,6 @@
+                 _APPEND_COMPILE_FLAGS_ERROR([-fstack-protector-all])
+                 ])])])])
+ 
+-          _SET_SANITIZE_FLAGS
+-
+           AS_IF([test "x$ac_cv_warnings_as_errors" = xyes],
+                 [AX_APPEND_FLAG([-Werror])])
+           AC_LANG_POP([C++])
diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index daeb283..d442b3c 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -13,7 +13,7 @@ LIBMEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' \
 LIBMEMCACHED_CONF_OPTS = --disable-dtrace
 LIBMEMCACHED_INSTALL_STAGING = YES
 LIBMEMCACHED_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBEVENT),libevent)
-# For libmemcached-01-disable-tests.patch
+# For 0001-disable-tests.patch and 0002-disable-sanitizer.patch
 LIBMEMCACHED_AUTORECONF = YES
 LIBMEMCACHED_LICENSE = BSD-3c
 LIBMEMCACHED_LICENSE_FILES = COPYING
-- 
2.0.4
