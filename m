From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 23 Apr 2017 00:57:32 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.24
Message-ID: <20170422225732.GA21566@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes aarch64 C++ issue. Removes old implementations for fnmatch/regex.
Allow long double wrappers for all architectures.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...l.h-fix-a-missing-struct-timespec-definit.patch | 34 ----------------------
 package/uclibc/uClibc-ng.config                    |  2 --
 package/uclibc/uclibc.hash                         |  4 +--
 package/uclibc/uclibc.mk                           |  2 +-
 4 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 package/uclibc/0001-Revert-fcntl.h-fix-a-missing-struct-timespec-definit.patch

diff --git a/package/uclibc/0001-Revert-fcntl.h-fix-a-missing-struct-timespec-definit.patch b/package/uclibc/0001-Revert-fcntl.h-fix-a-missing-struct-timespec-definit.patch
deleted file mode 100644
index f481b8f..0000000
--- a/package/uclibc/0001-Revert-fcntl.h-fix-a-missing-struct-timespec-definit.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6d7cc87cb64dc8df20b0d1c7b3e3566f9ec5a3dc Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 4 Apr 2017 21:26:41 +0200
-Subject: [PATCH] Revert "fcntl.h: fix a missing `struct timespec` definition"
-
-This reverts commit 657c4a9d6c2e649d86307f46ce9d5e44192f6e7a, it breaks
-many packages in Buildroot:
-
-  http://autobuild.buildroot.net/results/fcd024f6658890861fd7165e15edc65f77a9d8e7/
-  http://autobuild.buildroot.net/results/431135d9f985f3b3f935cc29fe16728b2412dd3a/
-  etc.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- include/fcntl.h | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/include/fcntl.h b/include/fcntl.h
-index 5a73a98..adcd7ef 100644
---- a/include/fcntl.h
-+++ b/include/fcntl.h
-@@ -34,9 +34,6 @@ __BEGIN_DECLS
- 
- /* For XPG all symbols from <sys/stat.h> should also be available.  */
- #ifdef __USE_XOPEN
--# ifdef __USE_XOPEN2K8
--#  define __need_timespec
--# endif
- # include <sys/stat.h>
- #endif
- 
--- 
-2.7.4
-
diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 528bce9..6780ad6 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -30,8 +30,6 @@ UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
-# UCLIBC_HAS_REGEX_OLD is not set
-# UCLIBC_HAS_FNMATCH_OLD is not set
 UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GNU_GLOB=y
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index f5c49de..050a8eb 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
-# From http://www.uclibc-ng.org/
-sha256  a76ee9a69bce031d14cae22ce34527a856f724f888a6641bf53e6f07c6345c70        uClibc-ng-1.0.23.tar.xz
+# From https://uclibc-ng.org/
+sha256  b5bf5bea5d836b0a0724d94f2211b279df3f5bda18a95e02c728cbf4bd33e939        uClibc-ng-1.0.24.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 45bb6de..f47b3ec 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.23
+UCLIBC_VERSION = 1.0.24
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.1.4
