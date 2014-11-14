From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 14 Nov 2014 19:31:14 +0100
Subject: [Buildroot] [PATCH v3 3/4] evemu: bump version to 2.1.0
In-Reply-To: <1415989875-22535-1-git-send-email-ps.report@gmx.net>
References: <1415989875-22535-1-git-send-email-ps.report@gmx.net>
Message-ID: <1415989875-22535-3-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for details.

Change download url and source package format to enable usage of
upstream provided hash values.

Patches
- evemu-0001-SYN_MAX.patch
- evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
are obsolete as there is no more host side python script for event name generation.

Patches
- evemu-0002-configure.ac-add-disable-tests-option.patch
- evemu-0005-configure.ac-add-disable-python-bindings-option.patch
are committed upstream.

[1] http://lists.freedesktop.org/archives/input-tools/2014-November/001122.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v1:
  - change download url (as suggested by Vicente Olivert Riera)

Changes v1 -> v2:
  - no changes
---
 package/evemu/evemu-0001-SYN_MAX.patch             | 25 ------------
 ...002-configure.ac-add-disable-tests-option.patch | 44 ---------------------
 ...names-use-input.h-from-sysroot-instead-of.patch | 30 --------------
 ...ure.ac-add-disable-python-bindings-option.patch | 46 ----------------------
 package/evemu/evemu.mk                             | 12 ++----
 5 files changed, 3 insertions(+), 154 deletions(-)
 delete mode 100644 package/evemu/evemu-0001-SYN_MAX.patch
 delete mode 100644 package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch
 delete mode 100644 package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
 delete mode 100644 package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch

diff --git a/package/evemu/evemu-0001-SYN_MAX.patch b/package/evemu/evemu-0001-SYN_MAX.patch
deleted file mode 100644
index b128794..0000000
--- a/package/evemu/evemu-0001-SYN_MAX.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-[PATCH] make-event-names.py: fix SYN_MAX definition for modern kernel headers
-
-SYN_MAX has been exported to user space since 3.12 (52764fed5: Input: add
-SYN_MAX and SYN_CNT constants), so only define it locally if not already
-defined, otherwise the build breaks.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/make-event-names.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/make-event-names.py b/src/make-event-names.py
-index bc77f2c..2d0924d 100755
---- a/src/make-event-names.py
-+++ b/src/make-event-names.py
-@@ -92,7 +92,9 @@ def print_mapping_table(bits):
- 	print("#ifndef EVENT_NAMES_H")
- 	print("#define EVENT_NAMES_H")
- 	print("")
-+	print("#ifndef SYN_MAX")
- 	print("#define SYN_MAX 3 /* linux/input.h doesn't define that */")
-+	print("#endif")
- 	print("")
- 
- 	for prefix in prefixes:
diff --git a/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch b/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch
deleted file mode 100644
index c470c44..0000000
--- a/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 628835a5addbe3dbf49fbd221b3785518c7b26ac Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 27 Apr 2014 13:14:51 +0200
-Subject: [PATCH] configure.ac: add '--disable-tests' option
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- Makefile.am  | 2 +-
- configure.ac | 9 +++++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7b68f3d..a83b35f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,4 @@
--SUBDIRS = src tools python test
-+SUBDIRS = src tools python $(SUBDIR_TESTS)
- 
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = evemu.pc
-diff --git a/configure.ac b/configure.ac
-index 239811c..c7e16b3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -45,6 +45,15 @@ if test "x$XMLTO" = "x" || test "x$ASCIIDOC" = "x"; then
- 	AC_MSG_WARN([xmlto or asciidoc not found - cannot create man pages without it])
- fi
- 
-+AC_ARG_ENABLE([tests],
-+	AS_HELP_STRING([--disable-tests], [Disable running tests]))
-+
-+AS_IF([test "x$enable_tests" != "xno"], [
-+	SUBDIR_TESTS=test
-+])
-+
-+AC_SUBST([SUBDIR_TESTS])
-+
- AC_SUBST(AM_CFLAGS,
-          "-Wall -Wextra")
- 
--- 
-1.8.1.4
-
diff --git a/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch b/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
deleted file mode 100644
index 5ac3e74..0000000
--- a/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 6e0a0631d97b17a82f6ce1996bcb49ee2dbe1544 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 25 Apr 2014 22:30:06 +0200
-Subject: [PATCH] make-event-names: use input.h from sysroot (instead of host
- system version)
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/make-event-names.py | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/make-event-names.py b/src/make-event-names.py
-index 2d0924d..945d473 100755
---- a/src/make-event-names.py
-+++ b/src/make-event-names.py
-@@ -10,8 +10,10 @@ from __future__ import print_function
- import argparse
- import re
- import sys
-+import os
- 
--SOURCE_FILE = "/usr/include/linux/input.h"
-+# environment variable SYSROOT set by buildroot for cross-compilation
-+SOURCE_FILE = os.environ.get('SYSROOT', '') + "/usr/include/linux/input.h"
- 
- class Bits(object):
- 	pass
--- 
-1.8.1.4
-
diff --git a/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch b/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch
deleted file mode 100644
index 177d018..0000000
--- a/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4618fb3b788715c754872df5fed7bce0186f5089 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 27 Apr 2014 13:23:41 +0200
-Subject: [PATCH] configure.ac: add '--disable-python-bindings' option
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- Makefile.am  |  2 +-
- configure.ac | 11 +++++++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index a83b35f..fb87c76 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,4 @@
--SUBDIRS = src tools python $(SUBDIR_TESTS)
-+SUBDIRS = src tools $(SUBDIR_PYTHON_BINDINGS) $(SUBDIR_TESTS)
- 
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = evemu.pc
-diff --git a/configure.ac b/configure.ac
-index c7e16b3..72c5fdf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,6 +54,17 @@ AS_IF([test "x$enable_tests" != "xno"], [
- 
- AC_SUBST([SUBDIR_TESTS])
- 
-+AC_ARG_ENABLE([python-bindings],
-+	AS_HELP_STRING([--disable-python-bindings],
-+		 [Disable generation of python bindings]))
-+
-+AS_IF([test "x$enable_python_bindings" != "xno"], [
-+	SUBDIR_PYTHON_BINDINGS=python
-+])
-+
-+AC_SUBST([SUBDIR_PYTHON_BINDINGS])
-+
-+
- AC_SUBST(AM_CFLAGS,
-          "-Wall -Wextra")
- 
--- 
-1.8.1.4
-
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 368eb8a..0328d14 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 2.0.0
-EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
+EVEMU_VERSION = 2.1.0
+EVEMU_SITE = http://www.freedesktop.org/software/evemu
+EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
 EVEMU_LICENSE_FILES = COPYING COPYING.GPL3
 
@@ -14,19 +15,12 @@ EVEMU_LICENSE_FILES = COPYING COPYING.GPL3
 # which doesn't have all the needed modules enabled, breaking the build
 EVEMU_CONF_ENV = ac_cv_path_ASCIIDOC=""
 
-# needed for make-event-names.py to find sysroot provided input.h (instead
-# of host system version)
-EVEMU_MAKE_ENV = SYSROOT=$(STAGING_DIR)
-
 # disable tests generation because of C++ dependency
 EVEMU_CONF_OPTS += --disable-tests
 
 # Uses PKG_CHECK_MODULES() in configure.ac
 EVEMU_DEPENDENCIES = host-pkgconf libevdev
 
-# Needs Python for header file generation
-EVEMU_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
-
 # Check for target python
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 EVEMU_CONF_OPTS += --enable-python-bindings
-- 
1.8.1.4
