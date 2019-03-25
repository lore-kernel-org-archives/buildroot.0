From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2019 18:37:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/openpgm: bump to version
 fcc46a1184df3383224c036789c360d739777496
Message-ID: <20190325173750.3101-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove first patch, not needed since
  https://github.com/steve-o/openpgm/commit/e7528f8362a29b7156bee835938c1a8825734db5
- Remove second and third patches (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nerator.py-make-it-python3-compliant.patch | 42 --------------
 package/openpgm/0002-cross-compile.patch      | 38 -------------
 ...includes-to-fix-build-with-musl-libc.patch | 55 -------------------
 package/openpgm/openpgm.hash                  |  3 +-
 package/openpgm/openpgm.mk                    |  2 +-
 5 files changed, 3 insertions(+), 137 deletions(-)
 delete mode 100644 package/openpgm/0001-version_generator.py-make-it-python3-compliant.patch
 delete mode 100644 package/openpgm/0002-cross-compile.patch
 delete mode 100644 package/openpgm/0003-Rework-headers-includes-to-fix-build-with-musl-libc.patch

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
index f20e02a7fb..8eb38605c7 100644
--- a/package/openpgm/openpgm.hash
+++ b/package/openpgm/openpgm.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 ecd48fd0bcfd8351ce6dcf31b063dd8fe83d3dab41bca62a6ebd6880a88c4a69  openpgm-release-5-2-122.tar.gz
+sha256 6bfd66cf0f627b392b74938473e4acd027de6917869b04d986d591af7a34bf1d  openpgm-fcc46a1184df3383224c036789c360d739777496.tar.gz
+sha256 4a7d4ec71fa60969399fd4caad64d5a3003fee2775445f271a5a36a8ae743a29  openpgm/pgm/LICENSE
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index 8c85344b68..07a3424d88 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPGM_VERSION = release-5-2-122
+OPENPGM_VERSION = fcc46a1184df3383224c036789c360d739777496
 OPENPGM_SITE = $(call github,steve-o,openpgm,$(OPENPGM_VERSION))
 OPENPGM_LICENSE = LGPL-2.1+
 OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
-- 
2.20.1
