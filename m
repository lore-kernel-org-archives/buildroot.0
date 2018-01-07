From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Jan 2018 20:08:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: bump version to 7.6.2
Message-ID: <20180107190831.4890-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:

0002-Fix-uClibc-build.patch
https://github.com/ivmai/bdwgc/commit/047230b71d421407ad2c8641ee4a87a1bd89145b

0003-configure-match-uclinux-pattern.patch
https://github.com/ivmai/bdwgc/commit/a628c90bdbf397465ac2ab2b11f14eb2e853651c

Renumbered remaining patches, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...tv-is-unknown-error-in-brief_async_signa.patch} |  0
 package/bdwgc/0002-Fix-uClibc-build.patch          | 42 ----------------------
 .../0003-configure-match-uclinux-pattern.patch     | 27 --------------
 package/bdwgc/bdwgc.hash                           |  3 +-
 package/bdwgc/bdwgc.mk                             |  2 +-
 5 files changed, 3 insertions(+), 71 deletions(-)
 rename package/bdwgc/{0003-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch => 0002-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch} (100%)
 delete mode 100644 package/bdwgc/0002-Fix-uClibc-build.patch
 delete mode 100644 package/bdwgc/0003-configure-match-uclinux-pattern.patch

diff --git a/package/bdwgc/0003-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch b/package/bdwgc/0002-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch
similarity index 100%
rename from package/bdwgc/0003-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch
rename to package/bdwgc/0002-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch
diff --git a/package/bdwgc/0002-Fix-uClibc-build.patch b/package/bdwgc/0002-Fix-uClibc-build.patch
deleted file mode 100644
index 55896eb199..0000000000
--- a/package/bdwgc/0002-Fix-uClibc-build.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8d3caf00db5d71ec19f03fbf96cecf6f70b4e868 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 28 May 2017 20:21:09 +0200
-Subject: [PATCH] Fix uClibc build
-
-uClibc defines __GLIBC__ but does not contain libc-version.h leading to
-a build error:
-
-./include/private/gcconfig.h:1426:72: fatal error: gnu/libc-version.h: No such file or directory
-
-Patch sent upstream: https://github.com/ivmai/bdwgc/pull/164
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/private/gcconfig.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/private/gcconfig.h b/include/private/gcconfig.h
-index d7912e9e..bf17dd63 100644
---- a/include/private/gcconfig.h
-+++ b/include/private/gcconfig.h
-@@ -1442,7 +1442,7 @@
- #         define GC_PREFETCH_FOR_WRITE(x) \
-             __asm__ __volatile__ ("prefetchw %0" : : "m"(*(char *)(x)))
- #       endif
--#       if defined(__GLIBC__)
-+#       if defined(__GLIBC__) && !defined(__UCLIBC__)
-           /* Workaround lock elision implementation for some glibc.     */
- #         define GLIBC_2_19_TSX_BUG
- #         include <gnu/libc-version.h> /* for gnu_get_libc_version() */
-@@ -2455,7 +2455,7 @@
-           /* FIXME: This seems to be fixed in GLibc v2.14.              */
- #         define GETCONTEXT_FPU_EXCMASK_BUG
- #       endif
--#       if defined(__GLIBC__)
-+#       if defined(__GLIBC__) && !defined(__UCLIBC__)
-           /* Workaround lock elision implementation for some glibc.     */
- #         define GLIBC_2_19_TSX_BUG
- #         include <gnu/libc-version.h> /* for gnu_get_libc_version() */
--- 
-2.11.0
-
diff --git a/package/bdwgc/0003-configure-match-uclinux-pattern.patch b/package/bdwgc/0003-configure-match-uclinux-pattern.patch
deleted file mode 100644
index b2c61982a4..0000000000
--- a/package/bdwgc/0003-configure-match-uclinux-pattern.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a628c90bdbf397465ac2ab2b11f14eb2e853651c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 6 Aug 2016 23:24:35 +0200
-Subject: [PATCH] configure: match uclinux pattern
-
-BDWGC does not recognize "uclinux" as a valid OS part of the target
-tuple which is used by some arm cortex-M toolchains.
-
-* configure.ac [$THREADS=pthreads] (GC_LINUX_THREADS, _REENTRANT): Define
-for hosts matching "*-*-*linux*" (instead of "*-*-linux*").
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 22353547..fa745b56 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -190,7 +190,7 @@ case "$THREADS" in
-         AC_DEFINE(THREAD_LOCAL_ALLOC)
-         AC_MSG_WARN("Explicit GC_INIT() calls may be required.");
-         ;;
--     *-*-linux* | *-*-nacl*)
-+     *-*-*linux* | *-*-nacl*)
-         AC_DEFINE(GC_LINUX_THREADS)
-         AC_DEFINE(_REENTRANT)
-         ;;
diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 4b41e1d85b..0ebc41c76d 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 a14a28b1129be90e55cd6f71127ffc5594e1091d5d54131528c24cd0c03b7d90  gc-7.6.0.tar.gz
+sha256 bd112005563d787675163b5afff02c364fc8deb13a99c03f4e80fdf6608ad41e  gc-7.6.2.tar.gz
+sha256 9944acfcee6cca308d974933977c1608804f5ad4345aac7cb8608137104e3742  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index e148f7223b..5603df8d9d 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 7.6.0
+BDWGC_VERSION = 7.6.2
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = http://www.hboehm.info/gc/gc_source
 BDWGC_INSTALL_STAGING = YES
-- 
2.11.0
