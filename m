From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 11:42:32 +0200
Subject: [Buildroot] [git commit branch/2020.11.x] package/rpm: security
 bump to version 4.16.1.3
Message-ID: <20210404092638.84C4D8B679@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6f4ee902e64210de58e91ae3e165b8d430fa890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

- Fix arbitrary data copied from signature header past signature
  checking (CVE-2021-3421)
- Fix signature check bypass with corrupted package (CVE-2021-20271)
- Fix missing bounds checks in headerImport() and headerCheck()
  (CVE-2021-20266)
- Fix missing sanity checks on header entry count and region data
  overlap
- Fix access past end of header if the last entry is string type
- Fix unsafe headerCopyLoad() still used in codebase

Drop all patches (already in version)

https://rpm.org/wiki/Releases/4.16.1.3.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 768152e2a61e629055f3f6e729782ad4d6e24397)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-lib-rpmdb-c-include-fcntl-h-for-O_.patch  | 29 --------
 .../0002-lib-rpmrc.c-include-fcntl.h-for-O_.patch  | 31 ---------
 ...heck-for-OpenMP-version-at-configure-time.patch | 78 ----------------------
 .../0004-configure-ac-fix-cross-compilation.patch  | 33 ---------
 .../0005-Really-disable-OpenMP-if-too-old.patch    | 26 --------
 package/rpm/rpm.hash                               |  4 +-
 package/rpm/rpm.mk                                 |  4 +-
 7 files changed, 3 insertions(+), 202 deletions(-)

diff --git a/package/rpm/0001-lib-rpmdb-c-include-fcntl-h-for-O_.patch b/package/rpm/0001-lib-rpmdb-c-include-fcntl-h-for-O_.patch
deleted file mode 100644
index 1c0aa51bac..0000000000
--- a/package/rpm/0001-lib-rpmdb-c-include-fcntl-h-for-O_.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9395bdc64459357631111842e7a28304b4d76301 Mon Sep 17 00:00:00 2001
-From: Leo <thinkabit.ukim@gmail.com>
-Date: Wed, 30 Sep 2020 08:36:03 -0300
-Subject: [PATCH] lib/rpmdb.c: include fcntl.h for O_*
-
-Fixes compilation on musl, otherwise it fails with undefined references
-to various O_* symbols as mentioned here:
-
-https://www.man7.org/linux/man-pages/man0/fcntl.h.0p.html
-
-[Retrieved from:
-https://github.com/rpm-software-management/rpm/commit/9395bdc64459357631111842e7a28304b4d76301]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/rpmdb.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/rpmdb.c b/lib/rpmdb.c
-index 4c101569f..73187630b 100644
---- a/lib/rpmdb.c
-+++ b/lib/rpmdb.c
-@@ -8,6 +8,7 @@
- #include <utime.h>
- #include <errno.h>
- #include <dirent.h>
-+#include <fcntl.h>
- 
- #ifndef	DYING	/* XXX already in "system.h" */
- #include <fnmatch.h>
diff --git a/package/rpm/0002-lib-rpmrc.c-include-fcntl.h-for-O_.patch b/package/rpm/0002-lib-rpmrc.c-include-fcntl.h-for-O_.patch
deleted file mode 100644
index c5db7f0a69..0000000000
--- a/package/rpm/0002-lib-rpmrc.c-include-fcntl.h-for-O_.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8d446d33a705cb37420e1fda18379d7439ee841f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 25 Oct 2020 15:04:56 +0100
-Subject: [PATCH 2/2] lib/rpmrc.c: include fcntl.h for O_*
-
-Fixes compilation on musl, otherwise it fails with undefined references
-to various O_* symbols as mentioned here:
-
-https://www.man7.org/linux/man-pages/man0/fcntl.h.0p.html
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://github.com/rpm-software-management/rpm/pull/1413]
----
- lib/rpmrc.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/rpmrc.c b/lib/rpmrc.c
-index 78c4a6d42..8bfe7a0ab 100644
---- a/lib/rpmrc.c
-+++ b/lib/rpmrc.c
-@@ -1,5 +1,6 @@
- #include "system.h"
- 
-+#include <fcntl.h>
- #include <stdarg.h>
- #include <pthread.h>
- 
--- 
-2.28.0
-
diff --git a/package/rpm/0003-Check-for-OpenMP-version-at-configure-time.patch b/package/rpm/0003-Check-for-OpenMP-version-at-configure-time.patch
deleted file mode 100644
index 2292702e53..0000000000
--- a/package/rpm/0003-Check-for-OpenMP-version-at-configure-time.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 6a780f10c2b600cfc38f8b8f20cb7e40b979f541 Mon Sep 17 00:00:00 2001
-From: Michal Domonkos <mdomonko@redhat.com>
-Date: Tue, 4 Aug 2020 16:50:21 +0200
-Subject: [PATCH] Check for OpenMP version at configure time
-
-Only accept OpenMP >= 4.5, due to the "priority" clause that we use
-since commit 6f6f5e7, and also document that in the INSTALL file.
-
-If explicitly required with --enable-openmp, fail configuration if the
-version is not available.
-
-https://www.openmp.org/wp-content/uploads/openmp-4.5.pdf
-
-Resolves: #1315
-[Retrieved from:
-https://github.com/rpm-software-management/rpm/commit/6a780f10c2b600cfc38f8b8f20cb7e40b979f541]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- INSTALL      |  6 ++++++
- configure.ac | 25 +++++++++++++++++++++++--
- 2 files changed, 29 insertions(+), 2 deletions(-)
-
-diff --git a/INSTALL b/INSTALL
-index cfbe54a3e..7622b2efe 100644
---- a/INSTALL
-+++ b/INSTALL
-@@ -142,6 +142,12 @@ If you plan on using cryptographic signatures you will need a version
- of GPG, available from
-     http://www.gnupg.org/
- 
-+OpenMP multithreading support is automatically enabled if your C compiler has
-+support for OpenMP version 4.5 or higher (to disable, pass the --disable-openmp
-+option to configure).  For GCC, OpenMP 4.5 is fully supported since GCC 6.1,
-+which is available from
-+    http://www.gnu.org/
-+
- To compile RPM:
- --------------
- 
-diff --git a/configure.ac b/configure.ac
-index 1346ee704..35003619d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -167,11 +167,32 @@ AC_SUBST(WITH_LZMA_LIB)
- 
- # AC_OPENMP supports --enable/disable-openmp out of the box, but it doesn't
- # actually give us a way to conditionalize the build based on that. Argh.
-+# Version 4.5 (201511) introduced "priority" clause for tasks.
- OPENMP_CFLAGS=
- AC_OPENMP
- AS_IF([test "x$ac_cv_prog_c_openmp" != x &&
--       test "x$ac_cv_prog_c_openmp" != unsupported],[
--  AC_DEFINE(ENABLE_OPENMP, 1, [Enable multithreading support?])
-+       test "x$ac_cv_prog_c_openmp" != xunsupported],[
-+  old_CFLAGS=$CFLAGS
-+  CFLAGS="$CFLAGS $OPENMP_CFLAGS"
-+  AC_MSG_CHECKING([OpenMP is at least version 4.5])
-+  AC_RUN_IFELSE(
-+    [AC_LANG_PROGRAM(
-+      [#include <omp.h>],
-+      [#if _OPENMP < 201511
-+       exit(1);
-+       #endif
-+      ]
-+    )],
-+    [AC_MSG_RESULT([yes])
-+     AC_DEFINE(ENABLE_OPENMP, 1, [Enable multithreading support?])
-+    ],
-+    [AC_MSG_RESULT([no])
-+     if test "$enable_openmp" = "yes"; then
-+       AC_MSG_ERROR([OpenMP too old])
-+     fi
-+    ]
-+  )
-+  CFLAGS=$old_CFLAGS
- ])
- AC_SUBST(OPENMP_CFLAGS)
- 
diff --git a/package/rpm/0004-configure-ac-fix-cross-compilation.patch b/package/rpm/0004-configure-ac-fix-cross-compilation.patch
deleted file mode 100644
index 6a958b3aaf..0000000000
--- a/package/rpm/0004-configure-ac-fix-cross-compilation.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 13585fbbe83eb177b13d86c2d6f11ff41a68d07e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 10 Nov 2020 18:20:24 +0100
-Subject: [PATCH] configure.ac: fix cross-compilation
-
-Use AC_COMPILE_IFELSE as AC_RUN_IFELSE raises a build failure when
-cross-compiling
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/rpm-software-management/rpm/commit/13585fbbe83eb177b13d86c2d6f11ff41a68d07e]
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 38d3c286a..a83016449 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -175,11 +175,11 @@ AS_IF([test "x$ac_cv_prog_c_openmp" != x &&
-   old_CFLAGS=$CFLAGS
-   CFLAGS="$CFLAGS $OPENMP_CFLAGS"
-   AC_MSG_CHECKING([OpenMP is at least version 4.5])
--  AC_RUN_IFELSE(
-+  AC_COMPILE_IFELSE(
-     [AC_LANG_PROGRAM(
-       [#include <omp.h>],
-       [#if _OPENMP < 201511
--       exit(1);
-+       #error
-        #endif
-       ]
-     )],
diff --git a/package/rpm/0005-Really-disable-OpenMP-if-too-old.patch b/package/rpm/0005-Really-disable-OpenMP-if-too-old.patch
deleted file mode 100644
index 2628ccc538..0000000000
--- a/package/rpm/0005-Really-disable-OpenMP-if-too-old.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 662a367f427d653c6b8fbc7fbd1ace5ba120a25f Mon Sep 17 00:00:00 2001
-From: Michal Domonkos <mdomonko@redhat.com>
-Date: Thu, 3 Dec 2020 15:11:57 +0100
-Subject: [PATCH] Really disable OpenMP if too old
-
-Fix up for commit 6a780f1.
-
-[Retrieved from:
-https://github.com/rpm-software-management/rpm/pull/1455]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index c853cd9af..beb65ff8a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -187,6 +187,7 @@ AS_IF([test "x$ac_cv_prog_c_openmp" != x &&
-      AC_DEFINE(ENABLE_OPENMP, 1, [Enable multithreading support?])
-     ],
-     [AC_MSG_RESULT([no])
-+     OPENMP_CFLAGS=
-      if test "$enable_openmp" = "yes"; then
-        AC_MSG_ERROR([OpenMP too old])
-      fi
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index 7b2bd56d0a..9389f8290f 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.16.0.html
-sha256  ca5974e9da2939afb422598818ef187385061889ba766166c4a3829c5ef8d411  rpm-4.16.0.tar.bz2
+# From https://rpm.org/wiki/Releases/4.16.1.3.html
+sha256  513dc7f972b6e7ccfc9fc7f9c01d5310cc56ee853892e4314fa2cad71478e21d  rpm-4.16.1.3.tar.bz2
 
 # Hash for license file
 sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 351ae0994f..cb6f480e16 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RPM_VERSION_MAJOR = 4.16
-RPM_VERSION = $(RPM_VERSION_MAJOR).0
+RPM_VERSION = $(RPM_VERSION_MAJOR).1.3
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = \
@@ -19,8 +19,6 @@ RPM_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
-# We're patching configure.ac
-RPM_AUTORECONF = YES
 
 # Don't set --{dis,en}-openmp as upstream wants to abort the build if
 # --enable-openmp is provided and OpenMP is < 4.5:
