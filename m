From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 11:44:01 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/rpm: don't set
 openmp
Message-ID: <20210404092634.78D47814D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a6e82e008a016d3b9fcda0803e11d202cc5e88c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Don't set openmp to fix a build failure with codesourcery toolchain that
doesn't have OpenMP >= 4.5 indeed upstream doesn't want to remove the
build failure if the user provides --enable-openmp and OpenMP is < 4.5:
https://github.com/rpm-software-management/rpm/pull/1433

Fixes:
 - http://autobuild.buildroot.org/results/05dd945d24e8684aad6a2343ba7f6f8a7cea8349

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 81b462a40571a902696e71afd5be153732c0e577)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...heck-for-OpenMP-version-at-configure-time.patch | 78 ++++++++++++++++++++++
 .../0004-configure-ac-fix-cross-compilation.patch  | 33 +++++++++
 .../0005-Really-disable-OpenMP-if-too-old.patch    | 26 ++++++++
 package/rpm/rpm.mk                                 | 11 ++-
 4 files changed, 142 insertions(+), 6 deletions(-)

diff --git a/package/rpm/0003-Check-for-OpenMP-version-at-configure-time.patch b/package/rpm/0003-Check-for-OpenMP-version-at-configure-time.patch
new file mode 100644
index 0000000000..2292702e53
--- /dev/null
+++ b/package/rpm/0003-Check-for-OpenMP-version-at-configure-time.patch
@@ -0,0 +1,78 @@
+From 6a780f10c2b600cfc38f8b8f20cb7e40b979f541 Mon Sep 17 00:00:00 2001
+From: Michal Domonkos <mdomonko@redhat.com>
+Date: Tue, 4 Aug 2020 16:50:21 +0200
+Subject: [PATCH] Check for OpenMP version at configure time
+
+Only accept OpenMP >= 4.5, due to the "priority" clause that we use
+since commit 6f6f5e7, and also document that in the INSTALL file.
+
+If explicitly required with --enable-openmp, fail configuration if the
+version is not available.
+
+https://www.openmp.org/wp-content/uploads/openmp-4.5.pdf
+
+Resolves: #1315
+[Retrieved from:
+https://github.com/rpm-software-management/rpm/commit/6a780f10c2b600cfc38f8b8f20cb7e40b979f541]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ INSTALL      |  6 ++++++
+ configure.ac | 25 +++++++++++++++++++++++--
+ 2 files changed, 29 insertions(+), 2 deletions(-)
+
+diff --git a/INSTALL b/INSTALL
+index cfbe54a3e..7622b2efe 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -142,6 +142,12 @@ If you plan on using cryptographic signatures you will need a version
+ of GPG, available from
+     http://www.gnupg.org/
+ 
++OpenMP multithreading support is automatically enabled if your C compiler has
++support for OpenMP version 4.5 or higher (to disable, pass the --disable-openmp
++option to configure).  For GCC, OpenMP 4.5 is fully supported since GCC 6.1,
++which is available from
++    http://www.gnu.org/
++
+ To compile RPM:
+ --------------
+ 
+diff --git a/configure.ac b/configure.ac
+index 1346ee704..35003619d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -167,11 +167,32 @@ AC_SUBST(WITH_LZMA_LIB)
+ 
+ # AC_OPENMP supports --enable/disable-openmp out of the box, but it doesn't
+ # actually give us a way to conditionalize the build based on that. Argh.
++# Version 4.5 (201511) introduced "priority" clause for tasks.
+ OPENMP_CFLAGS=
+ AC_OPENMP
+ AS_IF([test "x$ac_cv_prog_c_openmp" != x &&
+-       test "x$ac_cv_prog_c_openmp" != unsupported],[
+-  AC_DEFINE(ENABLE_OPENMP, 1, [Enable multithreading support?])
++       test "x$ac_cv_prog_c_openmp" != xunsupported],[
++  old_CFLAGS=$CFLAGS
++  CFLAGS="$CFLAGS $OPENMP_CFLAGS"
++  AC_MSG_CHECKING([OpenMP is at least version 4.5])
++  AC_RUN_IFELSE(
++    [AC_LANG_PROGRAM(
++      [#include <omp.h>],
++      [#if _OPENMP < 201511
++       exit(1);
++       #endif
++      ]
++    )],
++    [AC_MSG_RESULT([yes])
++     AC_DEFINE(ENABLE_OPENMP, 1, [Enable multithreading support?])
++    ],
++    [AC_MSG_RESULT([no])
++     if test "$enable_openmp" = "yes"; then
++       AC_MSG_ERROR([OpenMP too old])
++     fi
++    ]
++  )
++  CFLAGS=$old_CFLAGS
+ ])
+ AC_SUBST(OPENMP_CFLAGS)
+ 
diff --git a/package/rpm/0004-configure-ac-fix-cross-compilation.patch b/package/rpm/0004-configure-ac-fix-cross-compilation.patch
new file mode 100644
index 0000000000..6a958b3aaf
--- /dev/null
+++ b/package/rpm/0004-configure-ac-fix-cross-compilation.patch
@@ -0,0 +1,33 @@
+From 13585fbbe83eb177b13d86c2d6f11ff41a68d07e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Nov 2020 18:20:24 +0100
+Subject: [PATCH] configure.ac: fix cross-compilation
+
+Use AC_COMPILE_IFELSE as AC_RUN_IFELSE raises a build failure when
+cross-compiling
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/rpm-software-management/rpm/commit/13585fbbe83eb177b13d86c2d6f11ff41a68d07e]
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 38d3c286a..a83016449 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -175,11 +175,11 @@ AS_IF([test "x$ac_cv_prog_c_openmp" != x &&
+   old_CFLAGS=$CFLAGS
+   CFLAGS="$CFLAGS $OPENMP_CFLAGS"
+   AC_MSG_CHECKING([OpenMP is at least version 4.5])
+-  AC_RUN_IFELSE(
++  AC_COMPILE_IFELSE(
+     [AC_LANG_PROGRAM(
+       [#include <omp.h>],
+       [#if _OPENMP < 201511
+-       exit(1);
++       #error
+        #endif
+       ]
+     )],
diff --git a/package/rpm/0005-Really-disable-OpenMP-if-too-old.patch b/package/rpm/0005-Really-disable-OpenMP-if-too-old.patch
new file mode 100644
index 0000000000..2628ccc538
--- /dev/null
+++ b/package/rpm/0005-Really-disable-OpenMP-if-too-old.patch
@@ -0,0 +1,26 @@
+From 662a367f427d653c6b8fbc7fbd1ace5ba120a25f Mon Sep 17 00:00:00 2001
+From: Michal Domonkos <mdomonko@redhat.com>
+Date: Thu, 3 Dec 2020 15:11:57 +0100
+Subject: [PATCH] Really disable OpenMP if too old
+
+Fix up for commit 6a780f1.
+
+[Retrieved from:
+https://github.com/rpm-software-management/rpm/pull/1455]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index c853cd9af..beb65ff8a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -187,6 +187,7 @@ AS_IF([test "x$ac_cv_prog_c_openmp" != x &&
+      AC_DEFINE(ENABLE_OPENMP, 1, [Enable multithreading support?])
+     ],
+     [AC_MSG_RESULT([no])
++     OPENMP_CFLAGS=
+      if test "$enable_openmp" = "yes"; then
+        AC_MSG_ERROR([OpenMP too old])
+      fi
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 661409294b..351ae0994f 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -19,7 +19,12 @@ RPM_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
+# We're patching configure.ac
+RPM_AUTORECONF = YES
 
+# Don't set --{dis,en}-openmp as upstream wants to abort the build if
+# --enable-openmp is provided and OpenMP is < 4.5:
+# https://github.com/rpm-software-management/rpm/pull/1433
 RPM_CONF_OPTS = \
 	--disable-python \
 	--disable-rpath \
@@ -106,12 +111,6 @@ else
 RPM_CONF_OPTS += --disable-zstd
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
-RPM_CONF_OPTS += --enable-openmp
-else
-RPM_CONF_OPTS += --disable-openmp
-endif
-
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
