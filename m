From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Jan 2020 20:34:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/owfs: bump to version 3.2p3
Message-ID: <20200122193457.137688-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site to github to get latest release
- Drop patch (already in version) and so autoreconf
- Update hash of license files ($Id$ strings removed with
  https://github.com/owfs/owfs/commit/52b1059a5bc7efb6ac8891e7c2b90433d0bdd0f4)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-include-sys-sysmacros.h-for-major.patch | 50 -------------------
 package/owfs/owfs.hash                        |  9 ++--
 package/owfs/owfs.mk                          |  7 +--
 3 files changed, 5 insertions(+), 61 deletions(-)
 delete mode 100644 package/owfs/0001-include-sys-sysmacros.h-for-major.patch

diff --git a/package/owfs/0001-include-sys-sysmacros.h-for-major.patch b/package/owfs/0001-include-sys-sysmacros.h-for-major.patch
deleted file mode 100644
index dadf0276cd..0000000000
--- a/package/owfs/0001-include-sys-sysmacros.h-for-major.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0d5e4ba51d2b90a64f5d310d715ed367bbcc8996 Mon Sep 17 00:00:00 2001
-From: Tomasz Torcz <tomek@pipebreaker.pl>
-Date: Sat, 17 Mar 2018 12:56:04 +0100
-Subject: [PATCH] include <sys/sysmacros.h> for major()
-
-  Linux glibc ceased to include it in sys/types.h:
-https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 0d5e4ba51d2
-
- configure.ac                  | 2 +-
- module/owlib/src/include/ow.h | 6 +++++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 86751bf7cff7..d625d3f02b48 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -180,7 +180,7 @@ m4_include([src/scripts/m4/acx_pthread.m4])
- # Checks for header files.
- AC_HEADER_DIRENT
- AC_HEADER_STDC
--AC_CHECK_HEADERS([asm/types.h arpa/inet.h sys/ioctl.h sys/mkdev.h sys/socket.h sys/time.h sys/times.h sys/types.h sys/param.h sys/uio.h feature_tests.h fcntl.h netinet/in.h stdlib.h string.h strings.h sys/file.h syslog.h termios.h unistd.h limits.h stdint.h features.h getopt.h resolv.h semaphore.h])
-+AC_CHECK_HEADERS([asm/types.h arpa/inet.h sys/ioctl.h sys/mkdev.h sys/socket.h sys/sysmacros.h sys/time.h sys/times.h sys/types.h sys/param.h sys/uio.h feature_tests.h fcntl.h netinet/in.h stdlib.h string.h strings.h sys/file.h syslog.h termios.h unistd.h limits.h stdint.h features.h getopt.h resolv.h semaphore.h])
- AC_CHECK_HEADERS([linux/limits.h linux/types.h netdb.h dlfcn.h])
- AC_CHECK_HEADERS(sys/event.h sys/inotify.h)
- 
-diff --git a/module/owlib/src/include/ow.h b/module/owlib/src/include/ow.h
-index 9dbec5f31cf7..0a31055238b1 100644
---- a/module/owlib/src/include/ow.h
-+++ b/module/owlib/src/include/ow.h
-@@ -188,8 +188,12 @@
- #include <netdb.h>				/* for getaddrinfo */
- #endif							/* HAVE_NETDB_H */
- 
-+#ifdef HAVE_SYS_SYSMACROS_H
-+#include <sys/sysmacros.h>			/* for major() */
-+#endif							/* HAVE_SYS_SYSMACROS_H */
-+
- #ifdef HAVE_SYS_MKDEV_H
--#include <sys/mkdev.h>			/* for major() */
-+#include <sys/mkdev.h>			/* for major() on Solaris */
- #endif							/* HAVE_SYS_MKDEV_H */
- 
- #include <stddef.h> // for offsetof()
--- 
-2.18.0
-
diff --git a/package/owfs/owfs.hash b/package/owfs/owfs.hash
index eeea64368c..4c6b15a4e1 100644
--- a/package/owfs/owfs.hash
+++ b/package/owfs/owfs.hash
@@ -1,7 +1,4 @@
-# From https://sourceforge.net/projects/owfs/files/owfs/3.2p2/
-md5  f85e81837fe9ec273499a17f2f7a9143 owfs-3.2p2.tar.gz
-sha1 d04032696a3fba9f250a9a1d552361072a9f22ea  owfs-3.2p2.tar.gz
 # Locally calculated
-sha256 39535521a65a74bd36dc31726bcf04201f60f230a7944e9a63c393c318f5113c  owfs-3.2p2.tar.gz
-sha256 e484a24fa5d177576e1672306165f495633bd5f0daaf628d1ff5ecfc85bdc637  COPYING
-sha256 3879dcca586c08d1fe3325f3a0aec5b47d543100bc6b1dfb30bf24ec48675b10  COPYING.LIB
+sha256 b8d33eba57d4a2f6c8a11ff23f233e3248bd75a42c8219b058a888846edd8717  owfs-3.2p3.tar.gz
+sha256 1f0527ab035eefb5197c68633d06f50f5077c719d82a99344702ceaca29150b9  COPYING
+sha256 8a6601b893d5784d931b2ede64a406fac463acfbb7014914e27de4d6e68457c3  COPYING.LIB
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index fccc2efa58..7668735ff5 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-OWFS_VERSION = 3.2p2
-OWFS_SITE = http://downloads.sourceforge.net/project/owfs/owfs/$(OWFS_VERSION)
+OWFS_VERSION = 3.2p3
+OWFS_SITE = https://github.com/owfs/owfs/releases/download/v$(OWFS_VERSION)
 OWFS_DEPENDENCIES = host-pkgconf
 OWFS_CONF_OPTS = --disable-owperl --without-perl5 --disable-owtcl --without-tcl
 
-# We're patching configure.ac
-OWFS_AUTORECONF = YES
-
 # owtcl license is declared in module/ownet/c/src/include/ow_functions.h
 OWFS_LICENSE = GPL-2.0+, LGPL-2.0 (owtcl)
 OWFS_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.24.1
