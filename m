From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Nov 2018 09:40:14 +0100
Subject: [Buildroot] [PATCH 1/1] bdwgc: bump to version 8.0.0
Message-ID: <20181102084014.7086-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove first patch (already in version):
  https://github.com/ivmai/bdwgc/commit/7c13fb8fccdebfa4bf9a11abf6fa1619c5902828
- Remove second patch (already in version)
- Update license hash: Update header copyright (add Ivan Maidanski), see
  https://github.com/ivmai/bdwgc/commit/3bd265a64b612af9d906b73394f2adb161bd0dec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-check-for-NO_GETCONTEXT-definition.patch | 28 ---------------
 ...s-unknown-error-in-brief_async_signa.patch | 35 -------------------
 package/bdwgc/bdwgc.hash                      |  4 +--
 package/bdwgc/bdwgc.mk                        |  2 +-
 4 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
 delete mode 100644 package/bdwgc/0002-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch

diff --git a/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
deleted file mode 100644
index 393ad9039a..0000000000
--- a/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-configure.ac: add check for NO_GETCONTEXT definition
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[yann.morin.1998 at free.fr: add a comment, change variable name, use
- AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
- Thomas)]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
---- bdwgc-7.2f.orig/configure.ac	2014-06-01 19:00:47.000000000 +0200
-+++ bdwgc-7.2f/configure.ac	2014-12-23 14:13:11.585716713 +0100
-@@ -365,6 +365,12 @@
-   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
- fi
- 
-+# Check for getcontext (uClibc can be configured without it, for example)
-+AC_CHECK_FUNCS([getcontext])
-+AS_IF([test "$ac_cv_func_getcontext" = "no"],
-+  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
-+   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
-+
- case "$host" in
- # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
- # and unnecessary everywhere.
diff --git a/package/bdwgc/0002-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch b/package/bdwgc/0002-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch
deleted file mode 100644
index e17ed84666..0000000000
--- a/package/bdwgc/0002-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 31eef02317d59b4d204624efbddaea641e861390 Mon Sep 17 00:00:00 2001
-From: Mikael Djurfeldt <mikael@djurfeldt.com>
-Date: Sun, 26 Feb 2017 20:09:56 +0100
-Subject: [PATCH] Fix 'size of tv is unknown' error in
- brief_async_signal_safe_sleep (musl) (fix commits 62097c3, 9f48082)
-
-Include <sys/time.h> to get struct timeval defined and select() declared.
-
-* pthread_stop_world.c [GC_ENABLE_SUSPEND_THREAD]: Include sys/time.h
-before GC_brief_async_signal_safe_sleep definition.
-
-Upstream status: upstream
-commit ffad61d3bbe86c09ffe062dab393fcb0e4940580
-
-[Romain: backported to 7.6.0]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- pthread_stop_world.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pthread_stop_world.c b/pthread_stop_world.c
-index dad1fdc..8c76944 100644
---- a/pthread_stop_world.c
-+++ b/pthread_stop_world.c
-@@ -391,6 +391,7 @@ STATIC void GC_restart_handler(int sig)
- #   ifndef GC_TIME_LIMIT
- #     define GC_TIME_LIMIT 50
- #   endif
-+#   include <sys/time.h>
- 
-     STATIC void GC_brief_async_signal_safe_sleep(void)
-     {
--- 
-2.9.4
-
diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 0ebc41c76d..6cc4674e62 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 bd112005563d787675163b5afff02c364fc8deb13a99c03f4e80fdf6608ad41e  gc-7.6.2.tar.gz
-sha256 9944acfcee6cca308d974933977c1608804f5ad4345aac7cb8608137104e3742  README.QUICK
+sha256 8f23f9a20883d00af2bff122249807e645bdf386de0de8cbd6cce3e0c6968f04  gc-8.0.0.tar.gz
+sha256 aeeaabbf44e67d413e18719f0c6ac9c23387ab0b33e7a15ee46cf59ddef12cc7  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 0d4c8014f4..8607234e5d 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 7.6.2
+BDWGC_VERSION = 8.0.0
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = http://www.hboehm.info/gc/gc_source
 BDWGC_INSTALL_STAGING = YES
-- 
2.17.1
