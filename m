From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:46:26 +0200
Subject: [Buildroot] [git commit] autofs: bump to version 5.1.3
Message-ID: <20170608194633.BBB778199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad7bdad0563ceec3fd06959e52e5525e42e5a25c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...fs-build-check-for-clock_gettime-in-librt.patch | 62 ----------------------
 ...dd-cache-variable-for-Linux-proc-filesyst.patch | 47 ----------------
 package/autofs/autofs.hash                         |  2 +-
 package/autofs/autofs.mk                           |  5 +-
 4 files changed, 2 insertions(+), 114 deletions(-)

diff --git a/package/autofs/0002-autofs-build-check-for-clock_gettime-in-librt.patch b/package/autofs/0002-autofs-build-check-for-clock_gettime-in-librt.patch
deleted file mode 100644
index ade6d1c..0000000
--- a/package/autofs/0002-autofs-build-check-for-clock_gettime-in-librt.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From a38ab6c0f2790e047fc64867865eb2a073135618 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sun, 19 Jun 2016 00:17:41 -0300
-Subject: [PATCH] autofs: build: check for clock_gettime in librt
-
-Glibc versions older than 2.17 define clock_gettime() in librt, so add a
-check for this.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: sent to autofs@ mailing list
-
- Makefile.conf.in | 3 +++
- Makefile.rules   | 2 ++
- configure.in     | 4 ++++
- 3 files changed, 9 insertions(+)
-
-diff --git a/Makefile.conf.in b/Makefile.conf.in
-index cb53e66..2bc3202 100644
---- a/Makefile.conf.in
-+++ b/Makefile.conf.in
-@@ -11,6 +11,9 @@
- DAEMON_CFLAGS  = @DAEMON_CFLAGS@
- DAEMON_LDFLAGS = @DAEMON_LDFLAGS@
- 
-+# Glibc < 2.17 requires librt for clock_gettime()
-+LIBCLOCK_GETTIME = @LIBCLOCK_GETTIME@
-+
- # Special parameters for glibc (libc 6)
- LIBNSL    = @LIBNSL@
- LIBRESOLV = @LIBRESOLV@
-diff --git a/Makefile.rules b/Makefile.rules
-index 6fa3e02..7d1af2e 100644
---- a/Makefile.rules
-+++ b/Makefile.rules
-@@ -56,6 +56,8 @@ endif
- 
- LIBS += $(LIBNSL)
- 
-+LIBS += $(LIBCLOCK_GETTIME)
-+
- # Standard rules
- 
- .SUFFIXES: .c .o .s .so
-diff --git a/configure.in b/configure.in
-index 25d7c4e..a4318e8 100644
---- a/configure.in
-+++ b/configure.in
-@@ -177,6 +177,10 @@ if test "$ac_cv_search_versionsort" = "no"; then
- 		[Define if your C library does not provide versionsort])
- fi
- 
-+# glibc < 2.17 needs librt for clock_gettime()
-+AC_CHECK_LIB(rt, clock_gettime, LIBCLOCK_GETTIME="-lrt")
-+AC_SUBST(LIBCLOCK_GETTIME)
-+
- #
- # glibc/libc 6 new libraries
- #
--- 
-2.7.3
-
diff --git a/package/autofs/0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch b/package/autofs/0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch
deleted file mode 100644
index 93f3f9c..0000000
--- a/package/autofs/0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From bb5cc9cee1963362fe56b4fac65fed4912da4215 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 30 Jul 2016 22:30:01 +0200
-Subject: [PATCH] configure: add cache variable for Linux proc filesystem check
-
-When cross-compiling, whether the /proc filesystem is available in the
-build environment does not give any indication as to whether it will
-be available in the execution environment.
-
-This commit therefore adjust the AF_LINUX_PROCFS macro to use
-AC_CACHE_CHECK(), so that an ac_cv_linux_procfs variable can be
-preseeded in the environment to force the result of this check.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- aclocal.m4 | 15 +++++----------
- 1 file changed, 5 insertions(+), 10 deletions(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index 2115204..333699c 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -80,16 +80,11 @@ dnl
- dnl Check for the Linux /proc filesystem
- dnl --------------------------------------------------------------------------
- AC_DEFUN(AF_LINUX_PROCFS,
--[AC_MSG_CHECKING(for Linux proc filesystem)
--if test "x`cat /proc/sys/kernel/ostype 2>&-`" = "xLinux"
--then
--	linux_procfs=yes
--else
--	linux_procfs=no
--fi
--AC_MSG_RESULT($linux_procfs)
--if test $linux_procfs = yes
--then
-+[AC_CACHE_CHECK([for Linux proc filesystem], [ac_cv_linux_procfs],
-+	[ac_cv_linux_procfs=no
-+	 test "x`cat /proc/sys/kernel/ostype 2>&-`" = "xLinux" && ac_cv_linux_procfs=yes])
-+ if test $ac_cv_linux_procfs = yes
-+ then
- 	AC_DEFINE(HAVE_LINUX_PROCFS, 1,
- 		[Define if you have the Linux /proc filesystem.])
- fi])
--- 
-2.7.4
-
diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index 72b1378..61e5882 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256 88b7de39088aead983e02072a7b753d5ee52ce419c8913f7a3d4ff5521313f0c  autofs-5.1.2.tar.xz
+sha256 e96eebfe3ed5fb1a30f4510f538198affde223e370c6dc2bed9780309272b1bf  autofs-5.1.3.tar.xz
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index f20a19a..148ab1b 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.2
+AUTOFS_VERSION = 5.1.3
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
 AUTOFS_DEPENDENCIES = host-flex host-bison
-# For 0002-autofs-configure-check-for-clock_gettime-in-librt.patch and
-# 0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch.
-AUTOFS_AUTORECONF = YES
 
 # autofs looks on the build machine for the path of modprobe, so tell
 # it explicitly where it will be located on the target.
