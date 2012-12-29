From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Dec 2012 20:39:42 +0100
Subject: [Buildroot] [git commit] ruby: bump to version 1.9.3-p362
Message-ID: <20121229194003.355F097058@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a497e3d8c07d816ec5b8d612d4f7563dff9e756
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby-configure.patch |   30 ------------------------------
 package/ruby/ruby.mk              |   10 +++++-----
 2 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/package/ruby/ruby-configure.patch b/package/ruby/ruby-configure.patch
deleted file mode 100644
index 0077a67..0000000
--- a/package/ruby/ruby-configure.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-diff -Nura ruby-1.9.2-p0.orig/configure.in ruby-1.9.2-p0/configure.in
---- ruby-1.9.2-p0.orig/configure.in	2010-08-14 05:11:59.000000000 -0300
-+++ ruby-1.9.2-p0/configure.in	2010-11-04 15:46:22.478191926 -0300
-@@ -1410,7 +1410,25 @@
- fi
- 
- AC_FUNC_GETPGRP
--AC_FUNC_SETPGRP
-+
-+dnl AC_FUNC_SETPGRP does not work if cross compiling
-+dnl Instead, assume we will have a prototype for setpgrp if cross compiling.
-+if test "$cross_compiling" = no; then
-+  AC_FUNC_SETPGRP
-+else
-+  AC_CACHE_CHECK([whether setpgrp takes no argument], ac_cv_func_setpgrp_void,
-+    [AC_TRY_COMPILE([
-+#include <unistd.h>
-+], [
-+  if (setpgrp(1,1) == -1)
-+    exit (0);
-+  else
-+    exit (1);
-+], ac_cv_func_setpgrp_void=no, ac_cv_func_setpgrp_void=yes)])
-+if test $ac_cv_func_setpgrp_void = yes; then
-+  AC_DEFINE(SETPGRP_VOID, 1)
-+fi
-+fi
- 
- AC_C_BIGENDIAN
- AC_C_CONST
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index a5b8cde..ee1f9ed 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,15 +4,15 @@
 #
 #############################################################
 
-RUBY_VERSION = 1.9.2-p320
+RUBY_VERSION = 1.9.3-p362
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
-RUBY_AUTORECONF = YES
-HOST_RUBY_AUTORECONF = YES
-RUBY_DEPENDENCIES = host-ruby
-HOST_RUBY_DEPENDENCIES =
+RUBY_DEPENDENCIES = host-pkgconf host-ruby
+HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPT = --disable-install-doc --disable-rpath
 HOST_RUBY_CONF_OPT = --disable-install-doc --with-out-ext=curses,readline
+RUBY_LICENSE = Ruby
+RUBY_LICENSE_FILES = LEGAL
 
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
