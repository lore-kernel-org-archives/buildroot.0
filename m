From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Fri, 25 Oct 2013 09:06:54 +0200
Subject: [Buildroot] [PATCH 1/1] valgrind: add support for glibc 2.17 and
	2.18 Fixes:
	http://autobuild.buildroot.net/results/f086e65aca220bc9a5869f8fc8c1dca4d87ada7d/
Message-ID: <1382684814-28993-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 ...grind-add-support-for-glibc-2.17-and-2.18.patch |   48 ++++++++++++++++++++
 package/valgrind/valgrind.mk                       |    2 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch

diff --git a/package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch b/package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch
new file mode 100644
index 0000000..e1f8670
--- /dev/null
+++ b/package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch
@@ -0,0 +1,48 @@
+From 4aeda22b3469896df39d3f911575bf4bec266576 Mon Sep 17 00:00:00 2001
+From: Phil Eichinger <phil@zankapfel.net>
+Date: Wed, 23 Oct 2013 18:28:15 +0200
+Subject: [PATCH] Add support for glibc 2.17 and 2.18 Latest valgrind release
+ only allows glibc up to 2.16 This is a backport from
+ upstream supporting up to glibc 2.18 
+
+---
+ configure.in |   16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 1da3a2c..ccc60a0 100644
+--- a/configure.in
++++ b/configure.in
+@@ -906,6 +906,20 @@ case "${GLIBC_VERSION}" in
+ 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+ 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
++     2.17)
++	AC_MSG_RESULT(2.17 family)
++	AC_DEFINE([GLIBC_2_17], 1, [Define to 1 if you're using glibc 2.17.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
++     2.18)
++	AC_MSG_RESULT(2.18 family)
++	AC_DEFINE([GLIBC_2_18], 1, [Define to 1 if you're using glibc 2.18.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
+      darwin)
+ 	AC_MSG_RESULT(Darwin)
+ 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
+@@ -919,7 +933,7 @@ case "${GLIBC_VERSION}" in
+ 
+      *)
+ 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
+-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.16])
++	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.18])
+ 	AC_MSG_ERROR([or Darwin libc])
+ 	;;
+ esac
+-- 
+1.7.10.4
+
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index f40784e..953f929 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -9,7 +9,7 @@ VALGRIND_SITE    = http://valgrind.org/downloads/
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
-
+VALGRIND_AUTORECONF = YES
 VALGRIND_CONF_OPT = --disable-tls
 
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
-- 
1.7.10.4
