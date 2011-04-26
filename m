From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Apr 2011 22:46:59 +0200
Subject: [Buildroot] [git commit] toolchain: bump mpc to version 0.9
Message-ID: <20110426213742.EBBFA82A20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2fed71e3de9ebca27afe5efa55a6dc308156983b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mpc/mpc-0.9-configure.patch |   69 +++++++++++++++++++++++++++++++++++
 package/mpc/mpc.mk                  |    4 ++-
 2 files changed, 72 insertions(+), 1 deletions(-)
 create mode 100644 package/mpc/mpc-0.9-configure.patch

diff --git a/package/mpc/mpc-0.9-configure.patch b/package/mpc/mpc-0.9-configure.patch
new file mode 100644
index 0000000..21dd242
--- /dev/null
+++ b/package/mpc/mpc-0.9-configure.patch
@@ -0,0 +1,69 @@
+
+Issue http://lists.gforge.inria.fr/pipermail/mpc-discuss/2011-February/000805.html
+Upstream patch https://gforge.inria.fr/scm/viewvc.php/trunk/configure.ac?root=mpc&r1=932&r2=936
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- trunk/configure.ac	2011/02/21 12:18:31	932
++++ trunk/configure.ac	2011/02/21 16:41:09	936
+@@ -33,7 +33,7 @@
+ AC_CANONICAL_HOST
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+-dnl Extra arguments to configure
++# Extra arguments to configure
+ AC_ARG_WITH([mpfr_include],
+             [AC_HELP_STRING([--with-mpfr-include=DIR],
+                             [MPFR include directory])],
+@@ -85,18 +85,19 @@
+              )
+ 
+ 
+-dnl Setup CC and CFLAGS
++# Setup CC and CFLAGS
++AC_PROG_CC
++AC_LANG(C)
+ 
+-dnl Check for user specification of CC or CFLAGS
++# Set up LibTool
++AC_PROG_LIBTOOL
++
++# Check for user specification of CC or CFLAGS
+ if test -n "$CFLAGS" || test -n "$CC" ; then
+    user_redefine_cc=yes
+ fi
+ 
+-# Check for programs
+-AC_PROG_CC
+-AC_LANG(C)
+-
+-dnl Check GMP Header
++# Check GMP Header
+ AC_MSG_CHECKING(for gmp.h)
+ AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+ #include "gmp.h"
+@@ -105,22 +106,19 @@
+  AC_MSG_ERROR([gmp.h can't be found, or is unusable.])
+ ])
+ 
+-dnl Check for GMP CFLAGS in gmp.h
++# Check for GMP CFLAGS in gmp.h
+ if test -z "$user_redefine_cc" ; then
+    MPC_GMP_CC_CFLAGS
+ fi
+ 
+ 
+-dnl Configs for Windows DLLs
++# Configs for Windows DLLs
+ case $host in
+   *-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2*)
+      MPC_WINDOWS
+ esac
+ 
+ 
+-dnl Finally set up LibTool
+-AC_PROG_LIBTOOL
+-
+ # Checks for header files.
+ AC_HEADER_STDC
+ AC_CHECK_HEADERS([complex.h locale.h inttypes.h stdint.h limits.h unistd.h sys/time.h])
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 8c6d486..b344f28 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,10 +4,12 @@
 #
 #############################################################
 
-MPC_VERSION = 0.8.2
+MPC_VERSION = 0.9
 MPC_SITE = http://www.multiprecision.org/mpc/download
 MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
+MPC_AUTORECONF = YES
+HOST_MPC_AUTORECONF = YES
 HOST_MPC_DEPENDENCIES = host-gmp host-mpfr
 
 $(eval $(call AUTOTARGETS,package,mpc))
-- 
1.7.3.4
