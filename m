From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Oct 2019 09:52:43 +0100
Subject: [Buildroot] [PATCH 2/2] package/safeclib: bump to version 17102019
In-Reply-To: <20191029085243.9342-1-fontaine.fabrice@gmail.com>
References: <20191029085243.9342-1-fontaine.fabrice@gmail.com>
Message-ID: <20191029085243.9342-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Use official tarball (which contains a configure so drop autoreconf)
- Drop first and second patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Add-disable-doc-option.patch         | 59 ------------------
 ...0001-Define-_GNU_SOURCE-when-needed.patch} |  0
 ...flag-to-RETPOLINE-cflags-and-ldflags.patch | 62 -------------------
 package/safeclib/safeclib.hash                |  6 +-
 package/safeclib/safeclib.mk                  |  8 +--
 5 files changed, 8 insertions(+), 127 deletions(-)
 delete mode 100644 package/safeclib/0001-Add-disable-doc-option.patch
 rename package/safeclib/{0003-Define-_GNU_SOURCE-when-needed.patch => 0001-Define-_GNU_SOURCE-when-needed.patch} (100%)
 delete mode 100644 package/safeclib/0002-add-pic_flag-to-RETPOLINE-cflags-and-ldflags.patch

diff --git a/package/safeclib/0001-Add-disable-doc-option.patch b/package/safeclib/0001-Add-disable-doc-option.patch
deleted file mode 100644
index 5d71173f1e..0000000000
--- a/package/safeclib/0001-Add-disable-doc-option.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 0d56b6327f6b652511c3e4c72382f4dc4d194e10 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 15 Mar 2018 20:12:28 +0100
-Subject: [PATCH] Add --disable-doc option
-
-This option allows the user to disable man pages even if pod2man and
-doxygen programs are found
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream-status: Accepted (https://github.com/rurban/safeclib/commit/86404f0e2a7f2a9cad9c916b643594d4d07721d1)
----
- Makefile.am  |  2 ++
- configure.ac | 10 ++++++++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 0f65c5c1..ce1424bb 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -104,6 +104,7 @@ LIBTOOL_DISTCLEAN_FILES = \
- 	build-tools/test-driver
- DISTCLEANFILES = .version
- 
-+if ENABLE_DOC
- MAN1_SOURCES = doc/man/man1/check_for_unsafe_apis.1
- dist_man_MANS =
- if HAVE_POD2MAN
-@@ -560,6 +561,7 @@ clean-local:
- 	rm -rf $(builddir)/doc/html
- 	rm -rf $(builddir)/doc/man
- endif
-+endif
- 
- if ENABLE_GCOV
- gcov: check
-diff --git a/configure.ac b/configure.ac
-index 0e4e5eea..33ed7326 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -339,6 +339,16 @@ else
- 	AC_MSG_RESULT([no (default)])
- fi
- 
-+AC_ARG_ENABLE(doc,
-+	AS_HELP_STRING([--disable-doc],
-+	               [disable documentation @<:@default=no@:>@]),
-+	[case "${enableval}" in
-+	yes) enable_doc=true ;;
-+	no)  enable_doc=false ;;
-+	*)   AC_MSG_ERROR([bad value ${enableval} for --enable-doc]) ;;
-+	esac], [enable_doc=true])
-+AM_CONDITIONAL(ENABLE_DOC, test "x$enable_doc" = "xtrue")
-+
- dnl for windows dllimport. checking pic_flag DLL_EXPORT would be better,
- dnl but this is only enabled for the shared objs, and we need it in the config
- dnl for our tests.
--- 
-2.14.1
-
diff --git a/package/safeclib/0003-Define-_GNU_SOURCE-when-needed.patch b/package/safeclib/0001-Define-_GNU_SOURCE-when-needed.patch
similarity index 100%
rename from package/safeclib/0003-Define-_GNU_SOURCE-when-needed.patch
rename to package/safeclib/0001-Define-_GNU_SOURCE-when-needed.patch
diff --git a/package/safeclib/0002-add-pic_flag-to-RETPOLINE-cflags-and-ldflags.patch b/package/safeclib/0002-add-pic_flag-to-RETPOLINE-cflags-and-ldflags.patch
deleted file mode 100644
index f4f4eaab96..0000000000
--- a/package/safeclib/0002-add-pic_flag-to-RETPOLINE-cflags-and-ldflags.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 23ae79fe84a3fa5d995b8c6b9be70587e37a6cd8 Mon Sep 17 00:00:00 2001
-From: Reini Urban <rurban@cpan.org>
-Date: Mon, 26 Mar 2018 18:31:30 +0200
-Subject: [PATCH] add pic_flag to RETPOLINE cflags and ldflags
-
-This fixes the linke probe, and fixes #55.
-Also: libtool is stripping pic_flags from the shared link cmd.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/rurban/safeclib/commit/23ae79fe84a3fa5d995b8c6b9be70587e37a6cd8]
----
- configure.ac                    | 2 +-
- m4/ax_compiler_flags_cflags.m4  | 4 ++--
- m4/ax_compiler_flags_ldflags.m4 | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 33ed7326..10325dc6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4,7 +4,7 @@
- # 2017  Reini Urban <rurban@cpan.org>
- #
- # Copyright (c) 2012, 2013 Cisco Systems
--# Copyright (c) 2017 Reini Urban
-+# Copyright (c) 2017, 2018 Reini Urban
- # All rights reserved.
- #
- # Permission is hereby granted, free of charge, to any person
-diff --git a/m4/ax_compiler_flags_cflags.m4 b/m4/ax_compiler_flags_cflags.m4
-index 31e3ba8c..1dec00b2 100644
---- a/m4/ax_compiler_flags_cflags.m4
-+++ b/m4/ax_compiler_flags_cflags.m4
-@@ -66,12 +66,12 @@ AC_DEFUN([AX_COMPILER_FLAGS_CFLAGS],[
-     ])
- 
-     # retpoline: clang-7. Note: requires lld-7 linker support
--    AX_APPEND_COMPILE_FLAGS(["-mretpoline -DRETPOLINE"],
-+    AX_APPEND_COMPILE_FLAGS(["-mretpoline -DRETPOLINE $lt_prog_compiler_pic"],
-         [RETPOLINE_CFLAGS],[$ax_compiler_flags_test])
-     # or the equivalent gcc-7.3 variant
-     if test -z "$RETPOLINE_CFLAGS"; then
-         AX_APPEND_COMPILE_FLAGS(
--          ["-mindirect-branch=thunk-extern -mfunction-return=thunk-extern -mindirect-branch-register -DRETPOLINE"],
-+          ["-mindirect-branch=thunk-extern -mfunction-return=thunk-extern -mindirect-branch-register $lt_prog_compiler_pic -DRETPOLINE"],
-           [RETPOLINE_CFLAGS],[$ax_compiler_flags_test])
-     fi
- 
-diff --git a/m4/ax_compiler_flags_ldflags.m4 b/m4/ax_compiler_flags_ldflags.m4
-index d0287852..193f412e 100644
---- a/m4/ax_compiler_flags_ldflags.m4
-+++ b/m4/ax_compiler_flags_ldflags.m4
-@@ -66,7 +66,7 @@ AC_DEFUN([AX_COMPILER_FLAGS_LDFLAGS],[
-     dnl /usr/bin/ld: warning: -z retpolineplt ignored.
-     case $RETPOLINE_CFLAGS in
-         *-mretpoline*|*-mindirect-branch=thunk-extern*)
--            AX_APPEND_LINK_FLAGS([-Wl,-z,retpolineplt],
-+            AX_APPEND_LINK_FLAGS(["$RETPOLINE_CFLAGS -Wl,-z,retpolineplt"],
-                 [RETPOLINE_LDFLAGS],[$ax_compiler_flags_test])
-             if test -n "$RETPOLINE_LDFLAGS"; then
-                 AM_CFLAGS="$AM_CFLAGS $RETPOLINE_CFLAGS"
diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
index af5674da06..a827855b08 100644
--- a/package/safeclib/safeclib.hash
+++ b/package/safeclib/safeclib.hash
@@ -1,3 +1,5 @@
-# Locally computed:
-sha256	51f66832853322a4fbe677e196ab4c68317261829edb5e56725ed96a07ea50e6	safeclib-03032018.tar.gz
+# From https://github.com/rurban/safeclib/releases/tag/v17102019
+sha256	b8824429f4281a1fe8cf74ba020e26f4551005c8907f0b6f1e639fee68326159	libsafec-17102019.0-g5d92be.tar.bz2
+
+# Hash for license file
 sha256	c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b	COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 2dffa7229a..726b27f176 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SAFECLIB_VERSION = 03032018
-SAFECLIB_SITE = $(call github,rurban,safeclib,v$(SAFECLIB_VERSION))
+SAFECLIB_VERSION = 17102019
+SAFECLIB_SITE = \
+	https://github.com/rurban/safeclib/releases/download/v$(SAFECLIB_VERSION)
+SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).0-g5d92be.tar.bz2
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
-# From git
-SAFECLIB_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.23.0
