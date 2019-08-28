From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 23:41:10 +0200
Subject: [Buildroot] [git commit] package/at: bump version
Message-ID: <20190903133623.40F7B8A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c961b8e772525090cafd3f26a0351951eb114a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mainly this allows to drop 3 patches because they have been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-Makefile.in-replace-IROOT-by-DESTDIR.patch} |  0
 ...c-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch | 34 -------------
 ...tch => 0002-Makefile.in-make-install-fix.patch} |  0
 ...avg.c-fix.patch => 0003-getloadavg.c-fix.patch} |  0
 package/at/0005-parsetime.l-include-config-h.patch | 16 ------
 .../at/0006-remove-glibc-__isleap-assumption.patch | 59 ----------------------
 package/at/at.hash                                 |  2 +-
 package/at/at.mk                                   |  2 +-
 8 files changed, 2 insertions(+), 111 deletions(-)

diff --git a/package/at/0002-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
similarity index 100%
rename from package/at/0002-Makefile.in-replace-IROOT-by-DESTDIR.patch
rename to package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
diff --git a/package/at/0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch b/package/at/0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
deleted file mode 100644
index e4276ac208..0000000000
--- a/package/at/0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e12c96cccab550eda31cf7bb1dedddd3670ffe69 Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Tue, 1 Dec 2009 17:22:22 +0100
-Subject: [PATCH 2/5] configure.ac: convert AC_TRY_COMPILE -> AC_COMPILE_IFELSE
-
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
----
- configure.ac |   10 +++++-----
- 1 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 997a37f..cab80ed 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -40,11 +40,11 @@ case "$host" in
- esac
- 
- AC_MSG_CHECKING(__attribute__((noreturn)))
--AC_TRY_COMPILE([], [void __attribute__((noreturn)) panic(void);],
--    AC_MSG_RESULT(yes)
--    AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1,
--              [Define to 1 if compiler supports __attribute__((noreturn))]),
--    AC_MSG_RESULT(no)
-+AC_COMPILE_IFELSE(
-+       [AC_LANG_PROGRAM([[]], [[void __attribute__((noreturn)) panic(void);]])],
-+       [AC_MSG_RESULT(yes)
-+        AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1, Define to 1 if compiler supports __attribute__((noreturn)))],
-+       [AC_MSG_RESULT(no)]
- )
- dnl Checks for libraries.
- 
--- 
-1.6.5.3
-
diff --git a/package/at/0003-Makefile.in-make-install-fix.patch b/package/at/0002-Makefile.in-make-install-fix.patch
similarity index 100%
rename from package/at/0003-Makefile.in-make-install-fix.patch
rename to package/at/0002-Makefile.in-make-install-fix.patch
diff --git a/package/at/0004-getloadavg.c-fix.patch b/package/at/0003-getloadavg.c-fix.patch
similarity index 100%
rename from package/at/0004-getloadavg.c-fix.patch
rename to package/at/0003-getloadavg.c-fix.patch
diff --git a/package/at/0005-parsetime.l-include-config-h.patch b/package/at/0005-parsetime.l-include-config-h.patch
deleted file mode 100644
index f4111ebf67..0000000000
--- a/package/at/0005-parsetime.l-include-config-h.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Make sure to include config.h so that NEEDS_* macros are properly
-taken into account. This was a problem for NEEDS_YYWRAP, which was set
-to 1 in config.h, but the corresponding code wasn't compiled in.
-
-Index: at-3.1.13/parsetime.l
-===================================================================
---- at-3.1.13.orig/parsetime.l
-+++ at-3.1.13/parsetime.l
-@@ -4,6 +4,7 @@
- #include <time.h>
- #include "y.tab.h"
- #include "parsetime.h"
-+#include "config.h"
- 
- char *last_token = NULL;
- char **my_argv;
diff --git a/package/at/0006-remove-glibc-__isleap-assumption.patch b/package/at/0006-remove-glibc-__isleap-assumption.patch
deleted file mode 100644
index 21522492c8..0000000000
--- a/package/at/0006-remove-glibc-__isleap-assumption.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 7f811d9c4ebc9444e613e251c31d6bf537a24dc1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 16:35:30 -0700
-Subject: [PATCH] remove glibc assumption
-
-glibc time.h header has an undocumented __isleap macro
-that we are using anf musl is missing it.
-Since it is undocumented & does not appear
-on any other libc, stop using it and just define the macro in
-locally  instead.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[patch from: http://patchwork.openembedded.org/patch/91893/ ]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
- parsetime.y | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/parsetime.y b/parsetime.y
-index 7005e88..324e6d3 100644
---- a/parsetime.y
-+++ b/parsetime.y
-@@ -8,6 +8,9 @@
- 
- #define YYDEBUG 1
- 
-+#define is_leap_year(y) \
-+    ((y) % 4 == 0 && ((y) % 100 != 0 || (y) % 400 == 0))
-+
- struct tm exectm;
- static int isgmt;
- static int yearspec;
-@@ -217,8 +220,8 @@ date            : month_name day_number
- 				 mnum == 12) && dnum > 31)
- 			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
- 			         mnum == 11) && dnum > 30)
--			    || (mnum ==  2 && dnum > 29 &&  __isleap(ynum+1900))
--			    || (mnum ==  2 && dnum > 28 && !__isleap(ynum+1900))
-+			    || (mnum ==  2 && dnum > 29 &&  is_leap_year(ynum+1900))
-+			    || (mnum ==  2 && dnum > 28 && !is_leap_year(ynum+1900))
- 			   )
- 			{
- 			    yyerror("Error in day of month");
-@@ -261,8 +264,8 @@ date            : month_name day_number
- 				 mnum == 12) && dnum > 31)
- 			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
- 			         mnum == 11) && dnum > 30)
--			    || (mnum ==  2 && dnum > 29 &&  __isleap(ynum+1900))
--			    || (mnum ==  2 && dnum > 28 && !__isleap(ynum+1900))
-+			    || (mnum ==  2 && dnum > 29 &&  is_leap_year(ynum+1900))
-+			    || (mnum ==  2 && dnum > 28 && !is_leap_year(ynum+1900))
- 			   )
- 			{
- 			    yyerror("Error in day of month");
--- 
-2.1.4
diff --git a/package/at/at.hash b/package/at/at.hash
index 530b1257c1..e20c00b3cd 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 f5c7c8226fab0bc4e2d16a55e04d4026f3452db51fc5cbcc4bb5a3c79a79f7ef  at-release_3.1.23.tar.gz
+sha256 9ae5761a1fb897cda3a6f14439bed33cda33c0eedfcee6866e3d2ebad67fbd2f  at-7c74fa1aece6bc6db351763dc012193d5d634b7e.tar.gz
 
 sha256 01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
 sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/at/at.mk b/package/at/at.mk
index 36aa8c7a42..e0517af294 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AT_VERSION = release/3.1.23
+AT_VERSION = 7c74fa1aece6bc6db351763dc012193d5d634b7e
 AT_SITE = https://salsa.debian.org/debian/at.git
 AT_SITE_METHOD = git
 # Tried to add missing deps for parsetime.l but still parallel build fails
