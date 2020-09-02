From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 Sep 2020 08:17:51 +0200
Subject: [Buildroot] [PATCH v2, 1/3] package/openpgm: bump to version 5-3-128
Message-ID: <20200902061753.3668480-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop first patch (not needed since
  https://github.com/steve-o/openpgm/commit/e2ff9cf32df5a9037e956a6be1afe75391b1941d)
- Drop second and third patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Update zeromq package

 .../0001-Rename-openpgm-5.2.pc.in.patch       | 57 +++++++++++++++++++
 ...nerator.py-make-it-python3-compliant.patch | 42 --------------
 package/openpgm/0002-cross-compile.patch      | 38 -------------
 ...includes-to-fix-build-with-musl-libc.patch | 55 ------------------
 package/openpgm/openpgm.hash                  |  2 +-
 package/openpgm/openpgm.mk                    |  2 +-
 6 files changed, 59 insertions(+), 137 deletions(-)
 create mode 100644 package/openpgm/0001-Rename-openpgm-5.2.pc.in.patch
 delete mode 100644 package/openpgm/0001-version_generator.py-make-it-python3-compliant.patch
 delete mode 100644 package/openpgm/0002-cross-compile.patch
 delete mode 100644 package/openpgm/0003-Rework-headers-includes-to-fix-build-with-musl-libc.patch

diff --git a/package/openpgm/0001-Rename-openpgm-5.2.pc.in.patch b/package/openpgm/0001-Rename-openpgm-5.2.pc.in.patch
new file mode 100644
index 0000000000..76d61f3e8c
--- /dev/null
+++ b/package/openpgm/0001-Rename-openpgm-5.2.pc.in.patch
@@ -0,0 +1,57 @@
+From 240634b1afb968a051f8c68696eae2a582a02450 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 31 Aug 2020 20:16:25 +0200
+Subject: [PATCH] Rename openpgm-5.2.pc.in
+
+This will fix the following build failure:
+
+config.status: error: cannot find input file: `openpgm-5.3.pc.in'
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/steve-o/openpgm/pull/66]
+---
+ openpgm/pgm/openpgm-5.2.pc.in | 12 ------------
+ openpgm/pgm/openpgm-5.3.pc.in | 12 ++++++++++++
+ 2 files changed, 12 insertions(+), 12 deletions(-)
+ delete mode 100644 openpgm/pgm/openpgm-5.2.pc.in
+ create mode 100644 openpgm/pgm/openpgm-5.3.pc.in
+
+diff --git a/openpgm/pgm/openpgm-5.2.pc.in b/openpgm/pgm/openpgm-5.2.pc.in
+deleted file mode 100644
+index 9e30a6d..0000000
+--- a/openpgm/pgm/openpgm-5.2.pc.in
++++ /dev/null
+@@ -1,12 +0,0 @@
+-prefix=@prefix@
+-exec_prefix=@exec_prefix@
+-libdir=@libdir@
+-includedir=@includedir@
+-
+-Name: OpenPGM
+-Description: PGM Protocol Library.
+-Version: @PACKAGE_VERSION@
+-# packagers may wish to move @LIBS@ to Libs.private for platforms with
+-# versions of pkg-config that support static linking.
+-Libs: -L${libdir} -lpgm @LIBS@
+-Cflags: -I${includedir}/pgm- at VERSION_MAJOR@. at VERSION_MINOR@
+diff --git a/openpgm/pgm/openpgm-5.3.pc.in b/openpgm/pgm/openpgm-5.3.pc.in
+new file mode 100644
+index 0000000..9e30a6d
+--- /dev/null
++++ b/openpgm/pgm/openpgm-5.3.pc.in
+@@ -0,0 +1,12 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: OpenPGM
++Description: PGM Protocol Library.
++Version: @PACKAGE_VERSION@
++# packagers may wish to move @LIBS@ to Libs.private for platforms with
++# versions of pkg-config that support static linking.
++Libs: -L${libdir} -lpgm @LIBS@
++Cflags: -I${includedir}/pgm- at VERSION_MAJOR@. at VERSION_MINOR@
+-- 
+2.28.0
+
diff --git a/package/openpgm/0001-version_generator.py-make-it-python3-compliant.patch b/package/openpgm/0001-version_generator.py-make-it-python3-compliant.patch
deleted file mode 100644
index 97cff29df0..0000000000
--- a/package/openpgm/0001-version_generator.py-make-it-python3-compliant.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e04f5c20fc1536f8e6d4faf32f2f4657d441f7c8 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Mon, 14 Apr 2014 17:54:37 +0200
-Subject: [PATCH] version_generator.py: make it python3 compliant
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- openpgm/pgm/version_generator.py | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/openpgm/pgm/version_generator.py b/openpgm/pgm/version_generator.py
-index 2265480..c31376f 100755
---- a/openpgm/pgm/version_generator.py
-+++ b/openpgm/pgm/version_generator.py
-@@ -1,5 +1,7 @@
- #!/usr/bin/python
- 
-+from __future__ import print_function
-+
- import os
- import platform
- import time
-@@ -8,7 +10,7 @@ build_date = time.strftime ("%Y-%m-%d")
- build_time = time.strftime ("%H:%M:%S")
- build_rev = filter (str.isdigit, "$Revision: 1369 $")
- 
--print """
-+print("""
- /* vim:ts=8:sts=8:sw=4:noai:noexpandtab
-  * 
-  * OpenPGM version.
-@@ -47,6 +49,6 @@ const char* pgm_build_revision = "%s";
- 
- 
- /* eof */
--"""%(build_date, build_time, platform.system(), platform.machine(), build_rev)
-+"""%(build_date, build_time, platform.system(), platform.machine(), build_rev))
- 
- # end of file
--- 
-1.9.2
-
diff --git a/package/openpgm/0002-cross-compile.patch b/package/openpgm/0002-cross-compile.patch
deleted file mode 100644
index 07a24492e5..0000000000
--- a/package/openpgm/0002-cross-compile.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-configure.ac: cross-compilation fix
-
-This patch enables to configure the package when cross-compiling in a way
-recommended by Autoconf manual (see manual for version 2.69, Section 6.6
-Checking Runtime Behavior).
-
-Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
-
---- a/openpgm/pgm/configure.ac	2011-09-27 20:59:08.000000000 +0300
-+++ b/openpgm/pgm/configure.ac	2013-02-12 10:33:53.000000000 +0200
-@@ -272,14 +272,19 @@ uint32_t add32_with_carry (uint32_t a, u
- 	;;
- esac
- # ticket spinlock friendly: unaligned pointers & atomic ops (excl. Sun Pro)
--AC_MSG_CHECKING([for unaligned pointers])
--AC_RUN_IFELSE(
--	[AC_LANG_PROGRAM([[char* nezumi = "mouse";]],
--		[[short x = *(short*)(nezumi + 2)]])],
--	[AC_MSG_RESULT([yes])
--		pgm_unaligned_pointers=yes],
--	[AC_MSG_RESULT([no])
--		pgm_unaligned_pointers=no])
-+AC_CACHE_CHECK([if unaligned access fails], [ac_cv_lbl_unaligned_fail],
-+	[AC_RUN_IFELSE(
-+		[AC_LANG_PROGRAM([[char* nezumi = "mouse";]],
-+			[[short x = *(short*)(nezumi + 2)]])],
-+		[ac_cv_lbl_unaligned_fail=no],
-+		[ac_cv_lbl_unaligned_fail=yes],
-+		[ac_cv_lbl_unaligned_fail=yes])
-+	])
-+if test "$ac_cv_lbl_unaligned_fail" = yes; then
-+	pgm_unaligned_pointers=no
-+else
-+	pgm_unaligned_pointers=yes
-+fi
- AC_MSG_CHECKING([for intrinsic atomic ops])
- # AC_PREPROC_IFELSE not always portable
- AC_COMPILE_IFELSE(
diff --git a/package/openpgm/0003-Rework-headers-includes-to-fix-build-with-musl-libc.patch b/package/openpgm/0003-Rework-headers-includes-to-fix-build-with-musl-libc.patch
deleted file mode 100644
index 4d700fb4d6..0000000000
--- a/package/openpgm/0003-Rework-headers-includes-to-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 01128a2d8ad3288e8b96a908888049f186d156ee Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 21 May 2016 19:44:48 +0200
-Subject: [PATCH 1/1] Rework headers includes to fix build with musl libc
-
-Downloaded patch from
-http://git.alpinelinux.org/cgit/aports/plain/main/openpgm/openpgm-fix-includes.patch
-and adjusted paths by prefixing with "openpgm/pgm/"
-
-A build log with the compile error can be found here:
-http://autobuild.buildroot.net/results/854/854554827ead82f29b293ddceced6eb7fbfeec27/build-end.log
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(Patch sent upstream: https://github.com/steve-o/openpgm/pull/44)
----
- openpgm/pgm/include/impl/security.h | 3 ++-
- openpgm/pgm/include/pgm/types.h     | 1 +
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/openpgm/pgm/include/impl/security.h b/openpgm/pgm/include/impl/security.h
-index c2b3e3d..896316f 100644
---- a/openpgm/pgm/include/impl/security.h
-+++ b/openpgm/pgm/include/impl/security.h
-@@ -33,7 +33,6 @@
- #include <stdio.h>
- #include <stdarg.h>
- #include <sys/types.h>
--#include <sys/timeb.h>
- #include <impl/i18n.h>
- #include <impl/errno.h>
- #include <impl/string.h>
-@@ -41,6 +40,8 @@
- PGM_BEGIN_DECLS
- 
- #ifdef HAVE_FTIME
-+#include <sys/timeb.h>
-+
- static inline
- errno_t
- #	if   !defined( _WIN32 )
-diff --git a/openpgm/pgm/include/pgm/types.h b/openpgm/pgm/include/pgm/types.h
-index 4e41261..58731a3 100644
---- a/openpgm/pgm/include/pgm/types.h
-+++ b/openpgm/pgm/include/pgm/types.h
-@@ -27,6 +27,7 @@
- 
- #ifndef _MSC_VER
- #	include <sys/param.h>
-+#	include <sys/types.h>
- #endif
- #include <pgm/macros.h>
- 
--- 
-2.8.1
-
diff --git a/package/openpgm/openpgm.hash b/package/openpgm/openpgm.hash
index 472053173c..9d61bcdc96 100644
--- a/package/openpgm/openpgm.hash
+++ b/package/openpgm/openpgm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acc1545fd8060aa66b17327110e2859e451cfc685ebd3b2211619728e3471b66  openpgm-5-2-122.tar.gz
+sha256  8d707ef8dda45f4a7bc91016d7f2fed6a418637185d76c7ab30b306499c6d393  openpgm-5-3-128.tar.gz
 sha256  4a7d4ec71fa60969399fd4caad64d5a3003fee2775445f271a5a36a8ae743a29  openpgm/pgm/LICENSE
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index ec293b42df..ded06f3d9a 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPGM_VERSION = 5-2-122
+OPENPGM_VERSION = 5-3-128
 OPENPGM_SITE = $(call github,steve-o,openpgm,release-$(OPENPGM_VERSION))
 OPENPGM_LICENSE = LGPL-2.1+
 OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
-- 
2.28.0
