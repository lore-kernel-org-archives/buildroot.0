From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 22:34:23 +0200
Subject: [Buildroot] [git commit] autofs: add patch to force result of
	procfs check
Message-ID: <20160730203442.17450802AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a9b637d04185f9a5b4c73d663b726d3ce2da43b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The autofs configure script verifies on the build system if /proc is
provided by a Linux system. This might fail if /proc is not mounted,
but does ont mean that procfs will not be available in the target.

Therefore, this commit adds a patch improving the AF_LINUX_PROCFS
autoconf macro to allow passing an autoconf cache variable. autofs.mk
then uses that to force the fact that /proc will be available on the
target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...dd-cache-variable-for-Linux-proc-filesyst.patch | 47 ++++++++++++++++++++++
 package/autofs/autofs.mk                           |  6 ++-
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/package/autofs/0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch b/package/autofs/0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch
new file mode 100644
index 0000000..93f3f9c
--- /dev/null
+++ b/package/autofs/0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch
@@ -0,0 +1,47 @@
+From bb5cc9cee1963362fe56b4fac65fed4912da4215 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 30 Jul 2016 22:30:01 +0200
+Subject: [PATCH] configure: add cache variable for Linux proc filesystem check
+
+When cross-compiling, whether the /proc filesystem is available in the
+build environment does not give any indication as to whether it will
+be available in the execution environment.
+
+This commit therefore adjust the AF_LINUX_PROCFS macro to use
+AC_CACHE_CHECK(), so that an ac_cv_linux_procfs variable can be
+preseeded in the environment to force the result of this check.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ aclocal.m4 | 15 +++++----------
+ 1 file changed, 5 insertions(+), 10 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 2115204..333699c 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -80,16 +80,11 @@ dnl
+ dnl Check for the Linux /proc filesystem
+ dnl --------------------------------------------------------------------------
+ AC_DEFUN(AF_LINUX_PROCFS,
+-[AC_MSG_CHECKING(for Linux proc filesystem)
+-if test "x`cat /proc/sys/kernel/ostype 2>&-`" = "xLinux"
+-then
+-	linux_procfs=yes
+-else
+-	linux_procfs=no
+-fi
+-AC_MSG_RESULT($linux_procfs)
+-if test $linux_procfs = yes
+-then
++[AC_CACHE_CHECK([for Linux proc filesystem], [ac_cv_linux_procfs],
++	[ac_cv_linux_procfs=no
++	 test "x`cat /proc/sys/kernel/ostype 2>&-`" = "xLinux" && ac_cv_linux_procfs=yes])
++ if test $ac_cv_linux_procfs = yes
++ then
+ 	AC_DEFINE(HAVE_LINUX_PROCFS, 1,
+ 		[Define if you have the Linux /proc filesystem.])
+ fi])
+-- 
+2.7.4
+
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 396cf85..23e6836 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -10,14 +10,16 @@ AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPLv2+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
 AUTOFS_DEPENDENCIES = host-flex host-bison
-# For 0002-autofs-configure-check-for-clock_gettime-in-librt.patch
+# For 0002-autofs-configure-check-for-clock_gettime-in-librt.patch and
+# 0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch.
 AUTOFS_AUTORECONF = YES
 
 # autofs looks on the build machine for the path of modprobe, so tell
 # it explicitly where it will be located on the target.
 AUTOFS_CONF_ENV = \
 	ac_cv_path_KRB5_CONFIG=no \
-	ac_cv_path_MODPROBE=/sbin/modprobe
+	ac_cv_path_MODPROBE=/sbin/modprobe \
+	ac_cv_linux_procfs=yes
 
 # instead of looking in the PATH like any reasonable package, autofs
 # configure looks only in an hardcoded search path for host tools,
