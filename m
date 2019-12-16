From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 21:14:41 +0100
Subject: [Buildroot] [git commit] package/coreutils: bump version to 8.31
Message-ID: <20191216200839.D44098B674@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60063c380b38397526ea594fa1f39f9f5b956e56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.
Added patch to fix build error with uclibc.

Release notes:
https://lists.gnu.org/archive/html/coreutils/2019-03/msg00042.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-strtod_fix_clash_with_strtold.patch       | 64 ++++++++++++++++++++++
 package/coreutils/coreutils.hash                   |  4 +-
 package/coreutils/coreutils.mk                     |  2 +-
 3 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/0002-strtod_fix_clash_with_strtold.patch b/package/coreutils/0002-strtod_fix_clash_with_strtold.patch
new file mode 100644
index 0000000000..7033d3b856
--- /dev/null
+++ b/package/coreutils/0002-strtod_fix_clash_with_strtold.patch
@@ -0,0 +1,64 @@
+From 0562b040fa17f1722ba2b3096067b45d0582ca53 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 11 Mar 2019 16:40:29 -0700
+Subject: [PATCH] strtod: fix clash with strtold
+
+Problem reported for RHEL 5 by Jesse Caldwell (Bug#34817).
+* lib/strtod.c (compute_minus_zero, minus_zero):
+Simplify by remving the macro / external variable,
+and having just a function.  User changed.  This avoids
+the need for an external variable that might clash.
+
+Upstream-Status: Backport [rhel5]
+
+Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+
+Downloaded from
+http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
+
+This patch was committed to gnulib:
+http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=patch;h=3bd82a82cf4ba693d2c31c7b95aaec4e56dc92a4
+and will be included in the next release of coreutils.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ ChangeLog    |  9 +++++++++
+ lib/strtod.c | 11 +++++------
+ 2 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/lib/strtod.c b/lib/strtod.c
+index b9eaa51b4..69b1564e1 100644
+--- a/lib/strtod.c
++++ b/lib/strtod.c
+@@ -294,16 +294,15 @@ parse_number (const char *nptr,
+    ICC 10.0 has a bug when optimizing the expression -zero.
+    The expression -MIN * MIN does not work when cross-compiling
+    to PowerPC on Mac OS X 10.5.  */
+-#if defined __hpux || defined __sgi || defined __ICC
+ static DOUBLE
+-compute_minus_zero (void)
++minus_zero (void)
+ {
++#if defined __hpux || defined __sgi || defined __ICC
+   return -MIN * MIN;
+-}
+-# define minus_zero compute_minus_zero ()
+ #else
+-DOUBLE minus_zero = -0.0;
++  return -0.0;
+ #endif
++}
+ 
+ /* Convert NPTR to a DOUBLE.  If ENDPTR is not NULL, a pointer to the
+    character after the last one used in the number is put in *ENDPTR.  */
+@@ -479,6 +478,6 @@ STRTOD (const char *nptr, char **endptr)
+   /* Special case -0.0, since at least ICC miscompiles negation.  We
+      can't use copysign(), as that drags in -lm on some platforms.  */
+   if (!num && negative)
+-    return minus_zero;
++    return minus_zero ();
+   return negative ? -num : num;
+ }
+-- 
+2.20.1
+
diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index d55e25a86f..31dfbd73a9 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057  coreutils-8.30.tar.xz
+sha256 ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd  coreutils-8.31.tar.xz
+# Locally computed
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 55aa92e753..d312197e7e 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.30
+COREUTILS_VERSION = 8.31
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
