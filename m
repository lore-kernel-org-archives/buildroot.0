From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jun 2016 10:55:00 +0200
Subject: [Buildroot] [git commit] autofs: fix build for old glibc toolchains
Message-ID: <20160619085506.E12EE81DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1916084f2a22073baad26053e261757fea9b1e6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Autofs 5.1.2 switched to clock_gettime() unconditionally but didn't
check for the need of librt (glibc < 2.17) for it. Fixes:
http://autobuild.buildroot.net/results/0ab/0abd5476b39a6bd192b5e610006ed585ffb2e139/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...fs-build-check-for-clock_gettime-in-librt.patch | 62 ++++++++++++++++++++++
 package/autofs/autofs.mk                           |  2 +
 2 files changed, 64 insertions(+)

diff --git a/package/autofs/0002-autofs-build-check-for-clock_gettime-in-librt.patch b/package/autofs/0002-autofs-build-check-for-clock_gettime-in-librt.patch
new file mode 100644
index 0000000..ade6d1c
--- /dev/null
+++ b/package/autofs/0002-autofs-build-check-for-clock_gettime-in-librt.patch
@@ -0,0 +1,62 @@
+From a38ab6c0f2790e047fc64867865eb2a073135618 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sun, 19 Jun 2016 00:17:41 -0300
+Subject: [PATCH] autofs: build: check for clock_gettime in librt
+
+Glibc versions older than 2.17 define clock_gettime() in librt, so add a
+check for this.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: sent to autofs@ mailing list
+
+ Makefile.conf.in | 3 +++
+ Makefile.rules   | 2 ++
+ configure.in     | 4 ++++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/Makefile.conf.in b/Makefile.conf.in
+index cb53e66..2bc3202 100644
+--- a/Makefile.conf.in
++++ b/Makefile.conf.in
+@@ -11,6 +11,9 @@
+ DAEMON_CFLAGS  = @DAEMON_CFLAGS@
+ DAEMON_LDFLAGS = @DAEMON_LDFLAGS@
+ 
++# Glibc < 2.17 requires librt for clock_gettime()
++LIBCLOCK_GETTIME = @LIBCLOCK_GETTIME@
++
+ # Special parameters for glibc (libc 6)
+ LIBNSL    = @LIBNSL@
+ LIBRESOLV = @LIBRESOLV@
+diff --git a/Makefile.rules b/Makefile.rules
+index 6fa3e02..7d1af2e 100644
+--- a/Makefile.rules
++++ b/Makefile.rules
+@@ -56,6 +56,8 @@ endif
+ 
+ LIBS += $(LIBNSL)
+ 
++LIBS += $(LIBCLOCK_GETTIME)
++
+ # Standard rules
+ 
+ .SUFFIXES: .c .o .s .so
+diff --git a/configure.in b/configure.in
+index 25d7c4e..a4318e8 100644
+--- a/configure.in
++++ b/configure.in
+@@ -177,6 +177,10 @@ if test "$ac_cv_search_versionsort" = "no"; then
+ 		[Define if your C library does not provide versionsort])
+ fi
+ 
++# glibc < 2.17 needs librt for clock_gettime()
++AC_CHECK_LIB(rt, clock_gettime, LIBCLOCK_GETTIME="-lrt")
++AC_SUBST(LIBCLOCK_GETTIME)
++
+ #
+ # glibc/libc 6 new libraries
+ #
+-- 
+2.7.3
+
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 8206720..396cf85 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -10,6 +10,8 @@ AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPLv2+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
 AUTOFS_DEPENDENCIES = host-flex host-bison
+# For 0002-autofs-configure-check-for-clock_gettime-in-librt.patch
+AUTOFS_AUTORECONF = YES
 
 # autofs looks on the build machine for the path of modprobe, so tell
 # it explicitly where it will be located on the target.
