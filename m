From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 16:25:07 +0100
Subject: [Buildroot] [git commit] libmemcached: disable sanitizer
Message-ID: <20141113153637.CE005B444A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b79587b8254091d74298d76b78b22ff0579af973
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tests are flawed and we don't generally enable a dozen hardening
CFLAGS automatically. Fixes:
http://autobuild.buildroot.net/results/a84/a84ab4f0fdea6bbab971ba379e3066cddb25bfaa/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...isable-tests.patch => 0001-disable-tests.patch} |    0
 package/libmemcached/0002-disable-sanitizer.patch  |   25 ++++++++++++++++++++
 package/libmemcached/libmemcached.mk               |    2 +-
 3 files changed, 26 insertions(+), 1 deletions(-)

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
