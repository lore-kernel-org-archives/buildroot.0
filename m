From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue,  4 Oct 2016 16:52:22 +0200
Subject: [Buildroot] [PATCH 1/2] fwts: new package
Message-ID: <1475592743-4058-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Firmware Test Suite (FWTS) is a test suite that performs sanity checks
on firmware. It is intended to identify BIOS and ACPI errors and if
appropriate it will try to explain the errors and give advice to help
workaround or fix firmware bugs.

libfdt (dtc) is an optional dependency as fwts checks for it during
configure, but will only disable a few tests (dt_base, dt_sysinfo) if it
is not available.

This has been build-tested in x86, x86_64 and aarch64 and run-tested in
x86_64 and aarch64 with EFI firmware.

This package has been limited to x86, x86_64 and aarch64 architectures
as it fails to build with linking errors related to ACPI functions when
building for other architectures. As it is less likely that this will be
used for the other architectures, they are disabled for now.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/Config.in                               |  1 +
 package/fwts/0001-build-do-not-use-Werror.patch | 69 +++++++++++++++++++++++++
 package/fwts/Config.in                          | 26 ++++++++++
 package/fwts/fwts.hash                          |  2 +
 package/fwts/fwts.mk                            | 16 ++++++
 5 files changed, 114 insertions(+)
 create mode 100644 package/fwts/0001-build-do-not-use-Werror.patch
 create mode 100644 package/fwts/Config.in
 create mode 100644 package/fwts/fwts.hash
 create mode 100644 package/fwts/fwts.mk

diff --git a/package/Config.in b/package/Config.in
index ef82b2e..333bec5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -76,6 +76,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/dt/Config.in"
 	source "package/duma/Config.in"
 	source "package/fio/Config.in"
+	source "package/fwts/Config.in"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
 	source "package/iozone/Config.in"
diff --git a/package/fwts/0001-build-do-not-use-Werror.patch b/package/fwts/0001-build-do-not-use-Werror.patch
new file mode 100644
index 0000000..5246fd6
--- /dev/null
+++ b/package/fwts/0001-build-do-not-use-Werror.patch
@@ -0,0 +1,69 @@
+From db480b9f3e3a5c6c12e9dd04e87c8dff9381b8e7 Mon Sep 17 00:00:00 2001
+From: Erico Nunes <nunes.erico@gmail.com>
+Date: Fri, 12 Aug 2016 23:11:56 +0200
+Subject: [PATCH] fwts: do not use -Werror
+
+Warnings come and go with various compiler versions, so using -Werror is
+prone to cause build failures with various compiler versions, especially
+newer versions that introduce new warnings.
+
+Remove use of -Werror.
+
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+---
+ configure.ac              | 2 +-
+ src/Makefile.am           | 2 +-
+ src/lib/src/Makefile.am   | 2 +-
+ src/utilities/Makefile.am | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e3e7512..64034fa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,5 +1,5 @@
+ 	  AC_INIT([fwts],[0.1],[fwts-devel at lists.ubuntu.com])
+-          AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])
++          AM_INIT_AUTOMAKE([-Wall foreign subdir-objects])
+           m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ 	  AC_CANONICAL_HOST
+ 	  AC_CONFIG_MACRO_DIR([m4])
+diff --git a/src/Makefile.am b/src/Makefile.am
+index bc23e8d..599765d 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -14,7 +14,7 @@ AM_CPPFLAGS = \
+ 	`pkg-config --silence-errors --cflags json` \
+ 	`pkg-config --silence-errors --cflags json-c` \
+ 	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
+-	-Wall -Werror -Wextra
++	-Wall -Wextra
+ 
+ bin_PROGRAMS = fwts
+ 
+diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
+index 1b8fd74..163c9ae 100644
+--- a/src/lib/src/Makefile.am
++++ b/src/lib/src/Makefile.am
+@@ -6,7 +6,7 @@ AM_CPPFLAGS = \
+ 	`pkg-config --silence-errors --cflags json-c`	\
+ 	`pkg-config --cflags glib-2.0 gio-2.0` 		\
+ 	-DDATAROOTDIR=\"$(datarootdir)\"		\
+-	-Wall -Werror -Wextra
++	-Wall -Wextra
+ 
+ pkglib_LTLIBRARIES = libfwts.la
+ 
+diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
+index 9a47980..14997df 100644
+--- a/src/utilities/Makefile.am
++++ b/src/utilities/Makefile.am
+@@ -1,4 +1,4 @@
+-AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
++AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
+ 	`pkg-config --silence-errors --cflags json` \
+ 	`pkg-config --silence-errors --cflags json-c`
+ 
+-- 
+2.7.4
+
diff --git a/package/fwts/Config.in b/package/fwts/Config.in
new file mode 100644
index 0000000..4e77d67
--- /dev/null
+++ b/package/fwts/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_FWTS
+	bool "fwts"
+	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_JSON_C
+	help
+	  Firmware Test Suite (FWTS) is a test suite that performs
+	  sanity checks on firmware. It is intended to identify BIOS and
+	  ACPI errors and if appropriate it will try to explain the
+	  errors and give advice to help workaround or fix firmware
+	  bugs.
+
+	  dtc (libfdt) is an optional dependency for fdt related tests.
+
+	  https://wiki.ubuntu.com/FirmwareTestSuite
+
+comment "fwts needs a glibc toolchain w/ wchar, threads"
+	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
new file mode 100644
index 0000000..a3e5758
--- /dev/null
+++ b/package/fwts/fwts.hash
@@ -0,0 +1,2 @@
+# Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
+sha256 4bab7a9daa6def8951b160e9f2c14b203459881d0a1279cb19329bec727c9f2d fwts-V16.09.00.tar.gz
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
new file mode 100644
index 0000000..7e548f1
--- /dev/null
+++ b/package/fwts/fwts.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# fwts
+#
+################################################################################
+
+FWTS_VERSION = V16.09.00
+FWTS_SITE = http://fwts.ubuntu.com/release
+FWTS_STRIP_COMPONENTS = 0
+FWTS_LICENSE = GPLv2, LGPL, Custom
+FWTS_LICENSE_FILES = debian/copyright
+FWTS_AUTORECONF = YES
+FWTS_DEPENDENCIES = host-pkgconf json-c libglib2 \
+	$(if $(BR2_PACKAGE_DTC),dtc)
+
+$(eval $(autotools-package))
-- 
2.7.4
