From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jan 2021 02:22:41 -0800
Subject: [Buildroot] [PATCH 1/1] package/daemonize: new package
Message-ID: <20210124102241.1207866-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daemonize is a command line utility to run a program as a Unix daemon.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                             |  1 +
 ...de-setpgrp-to-enable-cross-compiling.patch | 55 +++++++++++++++++++
 package/daemonize/Config.in                   |  5 ++
 package/daemonize/daemonize.hash              |  1 +
 package/daemonize/daemonize.mk                | 12 ++++
 5 files changed, 74 insertions(+)
 create mode 100644 package/daemonize/0001-configure-override-setpgrp-to-enable-cross-compiling.patch
 create mode 100644 package/daemonize/Config.in
 create mode 100644 package/daemonize/daemonize.hash
 create mode 100644 package/daemonize/daemonize.mk

diff --git a/package/Config.in b/package/Config.in
index f42cc01032..b335aa4dd8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2413,6 +2413,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/daemon/Config.in"
+	source "package/daemonize/Config.in"
 	source "package/dc3dd/Config.in"
 	source "package/dcron/Config.in"
 	source "package/ddrescue/Config.in"
diff --git a/package/daemonize/0001-configure-override-setpgrp-to-enable-cross-compiling.patch b/package/daemonize/0001-configure-override-setpgrp-to-enable-cross-compiling.patch
new file mode 100644
index 0000000000..fd544f0441
--- /dev/null
+++ b/package/daemonize/0001-configure-override-setpgrp-to-enable-cross-compiling.patch
@@ -0,0 +1,55 @@
+From db172f4d7028c648f66f3c1db6202e6a5d62636d Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Sun, 24 Jan 2021 02:16:36 -0800
+Subject: [PATCH] configure: override setpgrp to enable cross-compiling
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ configure | 30 +-----------------------------
+ 1 file changed, 1 insertion(+), 29 deletions(-)
+
+diff --git a/configure b/configure
+index ab7c0d4..209e165 100755
+--- a/configure
++++ b/configure
+@@ -4147,36 +4147,8 @@ fi
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether setpgrp takes no argument" >&5
+ $as_echo_n "checking whether setpgrp takes no argument... " >&6; }
+-if ${ac_cv_func_setpgrp_void+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-  if test "$cross_compiling" = yes; then :
+-  as_fn_error $? "cannot check setpgrp when cross compiling" "$LINENO" 5
+-else
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-$ac_includes_default
+-int
+-main ()
+-{
+-/* If this system has a BSD-style setpgrp which takes arguments,
+-  setpgrp(1, 1) will fail with ESRCH and return -1, in that case
+-  exit successfully. */
+-  return setpgrp (1,1) != -1;
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_run "$LINENO"; then :
+-  ac_cv_func_setpgrp_void=no
+-else
+-  ac_cv_func_setpgrp_void=yes
+-fi
+-rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+-  conftest.$ac_objext conftest.beam conftest.$ac_ext
+-fi
++ac_cv_func_setpgrp_void=yes
+ 
+-fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_func_setpgrp_void" >&5
+ $as_echo "$ac_cv_func_setpgrp_void" >&6; }
+ if test $ac_cv_func_setpgrp_void = yes; then
+-- 
+2.30.0
+
diff --git a/package/daemonize/Config.in b/package/daemonize/Config.in
new file mode 100644
index 0000000000..f7f3288d9a
--- /dev/null
+++ b/package/daemonize/Config.in
@@ -0,0 +1,5 @@
+menuconfig BR2_PACKAGE_DAEMONIZE
+	bool "daemonize"
+	help
+	  Command line utility to run a daemon.
+
diff --git a/package/daemonize/daemonize.hash b/package/daemonize/daemonize.hash
new file mode 100644
index 0000000000..8bf58e96f4
--- /dev/null
+++ b/package/daemonize/daemonize.hash
@@ -0,0 +1 @@
+sha256  20c4fc9925371d1ddf1b57947f8fb93e2036eb9ccc3b43a1e3678ea8471c4c60  daemonize-1.7.8.tar.gz
diff --git a/package/daemonize/daemonize.mk b/package/daemonize/daemonize.mk
new file mode 100644
index 0000000000..9a86ae95d5
--- /dev/null
+++ b/package/daemonize/daemonize.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# daemonize
+#
+################################################################################
+
+DAEMONIZE_VERSION = 1.7.8
+DAEMONIZE_SITE = $(call github,bmc,daemonize,release-$(DAEMONIZE_VERSION))
+DAEMONIZE_LICENSE = BSD-3-Clause
+DAEMONIZE_LICENSE_FILES = LICENSE.md
+
+$(eval $(autotools-package))
-- 
2.30.0
