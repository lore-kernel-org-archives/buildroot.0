From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 12 Sep 2017 17:43:36 +0300
Subject: [Buildroot] [PATCH 1/1] flex: Fix segfault of stage1flex when host
	has glibc 2.26 or newer
Message-ID: <20170912144336.24931-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the host uses glibc 2.26 or newer, Flex will try to use the
newly-introduced reallocarray() function, but as it would not define
_GNU_SOURCE a segmentation fault would occur later on due to the
compiler assumming that the function is implicitly defined.

This issue manifests itself due to a crash of "stage1flex" during the
Flex bootstrap:

  ./stage1flex   -o stage1scan.c ./scan.l
  make[2]: *** [Makefile:1725: stage1scan.c] Segmentation fault (core dumped)

This imports the patch from the upstream Git repository, and adds flags
in the .mk file to rebuild the Autotools scripts and support files.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch | 35 ++++++++++++++++++++++
 package/flex/flex.mk                               |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 package/flex/0002-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch

diff --git a/package/flex/0002-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch b/package/flex/0002-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
new file mode 100644
index 0000000000..03ad1ced04
--- /dev/null
+++ b/package/flex/0002-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
@@ -0,0 +1,35 @@
+From ffa886a580929f26fd5e5a40c9c5334955c48553 Mon Sep 17 00:00:00 2001
+From: Explorer09 <explorer09@gmail.com>
+Date: Mon, 4 Sep 2017 10:47:33 +0800
+Subject: [PATCH] build: AC_USE_SYSTEM_EXTENSIONS in configure.ac.
+
+This would, e.g. define _GNU_SOURCE in config.h, enabling the
+reallocarray() prototype in glibc 2.26+ on Linux systems with that
+version of glibc.
+
+Fixes #241.
+
+Backported-from: 24fd0551333e7eded87b64dd36062da3df2f6380
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 55e774b..c879fe1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,8 +25,10 @@
+ # autoconf requirements and initialization
+ 
+ AC_INIT([the fast lexical analyser generator],[2.6.4],[flex-help at lists.sourceforge.net],[flex])
++AC_PREREQ([2.60])
+ AC_CONFIG_SRCDIR([src/scan.l])
+ AC_CONFIG_AUX_DIR([build-aux])
++AC_USE_SYSTEM_EXTENSIONS
+ LT_INIT
+ AM_INIT_AUTOMAKE([1.11.3 -Wno-portability foreign check-news std-options dist-lzip parallel-tests subdir-objects])
+ AC_CONFIG_HEADER([src/config.h])
+-- 
+2.14.1
+
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index b78269952e..b84732d383 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -11,6 +11,8 @@ FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
 FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
+FLEX_AUTORECONF = YES
+FLEX_GETTEXTIZE = YES
 HOST_FLEX_DEPENDENCIES = host-m4
 
 define FLEX_DISABLE_PROGRAM
-- 
2.14.1
