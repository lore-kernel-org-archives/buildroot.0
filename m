From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 26 Sep 2017 15:39:24 +0300
Subject: [Buildroot] [PATCH] flex: fix segfaults on glibc-2.26
Message-ID: <20170926123924.GA9085@latitude.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 2.26 of glibc no longer exports prototype for reallocarray
unless _GNU_SOURCE is defined. With no prototype, gcc assumes int
return type and truncates the pointer to 32bit on 64bit systems.

This shows up as segfault in stage1flex while building host-flex
on glibc-2.26 based 64-bit host systems.

The patch is taken as is from LEDE-project:
https://github.com/lede-project/source/commit/0fb14a2b1ab2f82ce63f4437b062229d73d90516

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 .../flex/0002-build-ac-use-system-extensions.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/flex/0002-build-ac-use-system-extensions.patch

diff --git a/package/flex/0002-build-ac-use-system-extensions.patch b/package/flex/0002-build-ac-use-system-extensions.patch
new file mode 100644
index 0000000000..7c3645c474
--- /dev/null
+++ b/package/flex/0002-build-ac-use-system-extensions.patch
@@ -0,0 +1,27 @@
+From 24fd0551333e7eded87b64dd36062da3df2f6380 Mon Sep 17 00:00:00 2001
+From: Explorer09 <explorer09@gmail.com>
+Date: Mon, 4 Sep 2017 10:47:33 +0800
+Subject: [PATCH] build: AC_USE_SYSTEM_EXTENSIONS in configure.ac.
+
+This would, e.g. define _GNU_SOURCE in config.h, enabling the
+reallocarray() prototype in glibc 2.26+ on Linux systems with that
+version of glibc.
+
+Fixes #241.
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
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
-- 
2.14.1
