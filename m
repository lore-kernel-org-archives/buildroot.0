From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed,  5 Jul 2017 13:42:36 +0200
Subject: [Buildroot] [PATCH 1/1] libcodec2: Update to version 0.6. Change to
	cmake-package
Message-ID: <20170705114236.14906-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 0.6 version of libcodec2 switched buildsystem from autotools to cmake.
The patches in the libcodec2 directory were removed because they were
only relevant to the autotools build.  For the cmake package unittests
are disabled by default.
The download site was changed to http://files.freedv.org/codec2.
An option was added to be able to install examples to target.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 ...ative-compiler-to-build-generate_cookbook.patch | 153 ---------------------
 .../0002-Add-option-to-disable-unit-tests.patch    |  50 -------
 package/libcodec2/Config.in                        |  11 +-
 package/libcodec2/libcodec2.hash                   |   2 +-
 package/libcodec2/libcodec2.mk                     |  15 +-
 5 files changed, 20 insertions(+), 211 deletions(-)
 delete mode 100644 package/libcodec2/0001-Use-the-native-compiler-to-build-generate_cookbook.patch
 delete mode 100644 package/libcodec2/0002-Add-option-to-disable-unit-tests.patch

diff --git a/package/libcodec2/0001-Use-the-native-compiler-to-build-generate_cookbook.patch b/package/libcodec2/0001-Use-the-native-compiler-to-build-generate_cookbook.patch
deleted file mode 100644
index ede31dbc2a..0000000000
--- a/package/libcodec2/0001-Use-the-native-compiler-to-build-generate_cookbook.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From c7c769990bca3049bc389dcbd9985adaec134946 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 29 Aug 2015 11:59:18 +0200
-Subject: [PATCH] Use the native compiler to build generate_cookbook
-
-The generate_cookbook binary needs to be executed at build time. When
-cross-compiling, this means that it should be built with the native
-compiler rather than the cross-compiler.
-
-To achieve this, this commit imports the AX_CC_FOR_BUILD autoconf
-macro from the GNU Autoconf Archive project, and adjusts
-src/Makefile.am to use CC_FOR_BUILD to build generate_cookbook.
-
-Based on initial work by Bernd Kuhls.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am           |  1 +
- configure.ac          |  2 ++
- m4/ax_cc_for_build.m4 | 77 +++++++++++++++++++++++++++++++++++++++++++++++++++
- src/Makefile.am       |  3 ++
- 4 files changed, 83 insertions(+)
- create mode 100644 m4/ax_cc_for_build.m4
-
-diff --git a/Makefile.am b/Makefile.am
-index 4468bca..bd3ce01 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,6 +2,7 @@ AM_CFLAGS = -Isrc -fPIC -Wall -O3 -lm
- AUTOMAKE_OPTIONS = gnu 
- NAME = codec2
- AM_CPPFLAGS = $(AM_CFLAGS)
-+ACLOCAL_AMFLAGS = -I m4
- 
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = codec2.pc
-diff --git a/configure.ac b/configure.ac
-index 493c517..7520af6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4,10 +4,12 @@
- AC_PREREQ([2.59])
- AC_INIT(codec2, 0.2, david at rowetel.com)
- AM_INIT_AUTOMAKE
-+AC_CONFIG_MACRO_DIR([m4])
- 
- # Checks for programs.
- AC_PROG_CC
- AC_PROG_LIBTOOL
-+AX_CC_FOR_BUILD
- 
- # Checks for libraries.
- # FIXME: Replace `main' with a function in `-lm':
-diff --git a/m4/ax_cc_for_build.m4 b/m4/ax_cc_for_build.m4
-new file mode 100644
-index 0000000..c880fd0
---- /dev/null
-+++ b/m4/ax_cc_for_build.m4
-@@ -0,0 +1,77 @@
-+# ===========================================================================
-+#      http://www.gnu.org/software/autoconf-archive/ax_cc_for_build.html
-+# ===========================================================================
-+#
-+# SYNOPSIS
-+#
-+#   AX_CC_FOR_BUILD
-+#
-+# DESCRIPTION
-+#
-+#   Find a build-time compiler. Sets CC_FOR_BUILD and EXEEXT_FOR_BUILD.
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2010 Reuben Thomas <rrt@sc3d.org>
-+#   Copyright (c) 1999 Richard Henderson <rth@redhat.com>
-+#
-+#   This program is free software: you can redistribute it and/or modify it
-+#   under the terms of the GNU General Public License as published by the
-+#   Free Software Foundation, either version 3 of the License, or (at your
-+#   option) any later version.
-+#
-+#   This program is distributed in the hope that it will be useful, but
-+#   WITHOUT ANY WARRANTY; without even the implied warranty of
-+#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
-+#   Public License for more details.
-+#
-+#   You should have received a copy of the GNU General Public License along
-+#   with this program. If not, see <http://www.gnu.org/licenses/>.
-+#
-+#   As a special exception, the respective Autoconf Macro's copyright owner
-+#   gives unlimited permission to copy, distribute and modify the configure
-+#   scripts that are the output of Autoconf when processing the Macro. You
-+#   need not follow the terms of the GNU General Public License when using
-+#   or distributing such scripts, even though portions of the text of the
-+#   Macro appear in them. The GNU General Public License (GPL) does govern
-+#   all other use of the material that constitutes the Autoconf Macro.
-+#
-+#   This special exception to the GPL applies to versions of the Autoconf
-+#   Macro released by the Autoconf Archive. When you make and distribute a
-+#   modified version of the Autoconf Macro, you may extend this special
-+#   exception to the GPL to apply to your modified version as well.
-+
-+#serial 2
-+
-+dnl Get a default for CC_FOR_BUILD to put into Makefile.
-+AC_DEFUN([AX_CC_FOR_BUILD],
-+[# Put a plausible default for CC_FOR_BUILD in Makefile.
-+if test -z "$CC_FOR_BUILD"; then
-+  if test "x$cross_compiling" = "xno"; then
-+    CC_FOR_BUILD='$(CC)'
-+  else
-+    CC_FOR_BUILD=gcc
-+  fi
-+fi
-+AC_SUBST(CC_FOR_BUILD)
-+# Also set EXEEXT_FOR_BUILD.
-+if test "x$cross_compiling" = "xno"; then
-+  EXEEXT_FOR_BUILD='$(EXEEXT)'
-+else
-+  AC_CACHE_CHECK([for build system executable suffix], bfd_cv_build_exeext,
-+    [rm -f conftest*
-+     echo 'int main () { return 0; }' > conftest.c
-+     bfd_cv_build_exeext=
-+     ${CC_FOR_BUILD} -o conftest conftest.c 1>&5 2>&5
-+     for file in conftest.*; do
-+       case $file in
-+       *.c | *.o | *.obj | *.ilk | *.pdb) ;;
-+       *) bfd_cv_build_exeext=`echo $file | sed -e s/conftest//` ;;
-+       esac
-+     done
-+     rm -f conftest*
-+     test x"${bfd_cv_build_exeext}" = x && bfd_cv_build_exeext=no])
-+  EXEEXT_FOR_BUILD=""
-+  test x"${bfd_cv_build_exeext}" != xno && EXEEXT_FOR_BUILD=${bfd_cv_build_exeext}
-+fi
-+AC_SUBST(EXEEXT_FOR_BUILD)])dnl
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 1153b3c..719088d 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -77,6 +77,9 @@ CODEBOOKSGE= \
- 
- noinst_PROGRAMS = generate_codebook genlspdtcb
- 
-+generate_codebook$(EXEEXT_FOR_BUILD): generate_codebook.c
-+	$(CC_FOR_BUILD) -o $@ generate_codebook.c -lm
-+
- codebook.$(OBJEXT): codebook.c
- codebookd.$(OBJEXT): codebookd.c
- codebookdt.$(OBJEXT): codebookdt.c
--- 
-2.5.0
-
diff --git a/package/libcodec2/0002-Add-option-to-disable-unit-tests.patch b/package/libcodec2/0002-Add-option-to-disable-unit-tests.patch
deleted file mode 100644
index 7822702092..0000000000
--- a/package/libcodec2/0002-Add-option-to-disable-unit-tests.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 19db6244200b870317382294f14b7d561d55a64e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 29 Aug 2015 12:05:53 +0200
-Subject: [PATCH] Add option to disable unit tests
-
-The unittests require C++, while the rest of the library does not, so
-this commit implements a --{enable,disable}-unittests option to
-selectively enable the build of the unit tests. When not provided, the
-option defaults to yes so that the existing behavior is preserved.
-
-Based on initial work by Bernd Kuhls.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am  | 6 +++++-
- configure.ac | 5 +++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index bd3ce01..1da250b 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -95,4 +95,8 @@ src/codebook/lsp8.txt \
- src/codebook/lsp9.txt \
- src/codebook/lsp10.txt
- 
--SUBDIRS = src unittest
-+SUBDIRS = src
-+
-+if UNITTESTS
-+SUBDIRS += unittest
-+endif
-diff --git a/configure.ac b/configure.ac
-index 7520af6..55b7215 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -24,5 +24,10 @@ AC_CHECK_HEADERS([stdlib.h string.h])
- AC_FUNC_MALLOC
- AC_CHECK_FUNCS([floor pow sqrt])
- 
-+AC_ARG_ENABLE([unittests],
-+	AS_HELP_STRING([--disable-unittests], [Disable unittests]),
-+	[], [enable_unittests=yes])
-+AM_CONDITIONAL([UNITTESTS], [test "${enable_unittests}" = "yes"])
-+
- AC_CONFIG_FILES([Makefile src/Makefile unittest/Makefile codec2.pc])
- AC_OUTPUT
--- 
-2.5.0
-
diff --git a/package/libcodec2/Config.in b/package/libcodec2/Config.in
index b27aab1c70..9a9eb86533 100644
--- a/package/libcodec2/Config.in
+++ b/package/libcodec2/Config.in
@@ -2,6 +2,15 @@ config BR2_PACKAGE_LIBCODEC2
 	bool "libcodec2"
 	help
 	  Codec2 is an open source low bit rate speech codec designed
-	  for communications quality speech between 1200 and 3200 bit/s.
+	  for communications quality speech between 700 and 3200 bit/s.
 
 	  http://rowetel.com/codec2.html
+
+if BR2_PACKAGE_LIBCODEC2
+
+config BR2_PACKAGE_LIBCODEC2_EXAMPLES
+	bool "libcodec2_examples"
+	help
+	  Install Codec2 examples.
+
+endif
diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
index ba12635250..6c8b93a2c0 100644
--- a/package/libcodec2/libcodec2.hash
+++ b/package/libcodec2/libcodec2.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7e5d5a93f34e3d6f663ec9beb586678074a531996a6398360a59946bfdfa49c2  libcodec2-392a55b4f3f8ad30d845ac6ae35e8b27343bb944.tar.gz
+sha256 57754bf3507a7ac9f9402cae054787a3572bea6a791137cdd5fa35f6c5af1144  codec2-0.6.tar.xz
diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
index 7329b9931b..7b70b24755 100644
--- a/package/libcodec2/libcodec2.mk
+++ b/package/libcodec2/libcodec2.mk
@@ -4,13 +4,16 @@
 #
 ################################################################################
 
-LIBCODEC2_VERSION = 392a55b4f3f8ad30d845ac6ae35e8b27343bb944
-LIBCODEC2_SITE = https://freeswitch.org/stash/scm/sd/libcodec2.git
-LIBCODEC2_SITE_METHOD = git
+LIBCODEC2_VERSION = 0.6
+LIBCODEC2_SITE = http://files.freedv.org/codec2
+LIBCODEC2_SOURCE = codec2-$(LIBCODEC2_VERSION).tar.xz
 LIBCODEC2_LICENSE = LGPL-2.1
 LIBCODEC2_LICENSE_FILES = COPYING
-LIBCODEC2_AUTORECONF = YES
 LIBCODEC2_INSTALL_STAGING = YES
-LIBCODEC2_CONF_OPTS = --disable-unittests
+LIBCODEC2_SUPPORTS_IN_SOURCE_BUILD = NO
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_LIBCODEC2_EXAMPLES),y)
+LIBCODEC2_CONF_OPTS += -DINSTALL_EXAMPLES=ON
+endif
+
+$(eval $(cmake-package))
-- 
2.11.0
