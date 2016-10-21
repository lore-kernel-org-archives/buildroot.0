From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Sat, 22 Oct 2016 00:41:13 +0530
Subject: [Buildroot] [PATCH 1/2] libfastjson: bump version to 0.99.4
Message-ID: <1477077074-5602-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch and rename remaining one.

Also fixes:
  http://autobuild.buildroot.net/results/bfe/bfe8ebe3966324b16ca572bfba0a1a8ddc275db9

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 .../libfastjson/0001-fix-missing-config.h.patch    | 29 --------
 .../0001-m4-fix-detection-of-atomics.patch         | 86 ++++++++++++++++++++++
 .../0002-m4-fix-detection-of-atomics.patch         | 86 ----------------------
 package/libfastjson/libfastjson.hash               |  2 +-
 package/libfastjson/libfastjson.mk                 |  2 +-
 5 files changed, 88 insertions(+), 117 deletions(-)
 delete mode 100644 package/libfastjson/0001-fix-missing-config.h.patch
 create mode 100644 package/libfastjson/0001-m4-fix-detection-of-atomics.patch
 delete mode 100644 package/libfastjson/0002-m4-fix-detection-of-atomics.patch

diff --git a/package/libfastjson/0001-fix-missing-config.h.patch b/package/libfastjson/0001-fix-missing-config.h.patch
deleted file mode 100644
index 8663e23..0000000
--- a/package/libfastjson/0001-fix-missing-config.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3e017fe8da1e821d4fcd801c75467c8ec2a81eb4 Mon Sep 17 00:00:00 2001
-From: Rainer Gerhards <rgerhards@adiscon.com>
-Date: Tue, 19 Apr 2016 08:21:50 +0200
-Subject: [PATCH] fix missing config.h
-
-[yann.morin.1998 at free.fr: backport from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
- json_object_iterator.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json_object_iterator.c b/json_object_iterator.c
-index 6ab3a85..fb51f6e 100644
---- a/json_object_iterator.c
-+++ b/json_object_iterator.c
-@@ -17,8 +17,8 @@
- *******************************************************************************
- */
- 
-+#include "config.h"
- #include <stddef.h>
--
- #include "json.h"
- #include "json_object_private.h"
- #include "json_object_iterator.h"
--- 
-2.7.4
-
diff --git a/package/libfastjson/0001-m4-fix-detection-of-atomics.patch b/package/libfastjson/0001-m4-fix-detection-of-atomics.patch
new file mode 100644
index 0000000..1fdbf19
--- /dev/null
+++ b/package/libfastjson/0001-m4-fix-detection-of-atomics.patch
@@ -0,0 +1,86 @@
+From df087711cf7be55268a55e7820f4d928cb34c078 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 9 Jul 2016 20:44:36 +0200
+Subject: [PATCH] m4: fix detection of atomics
+
+In cross-compilation, it is impossible to run code at configure time to
+detect the target specifics.
+
+As such, AC_TRY_RUN fails miserably to detect reliably that atomic
+intrisics are present in a toolchain, and decides they are not just
+because this is cross-compilation.
+
+Instead of AC_TRY_RUN, use AC_LINK_IFELSE that does not need to actually
+run code, since all we're interested in is whether the intrisics are
+present (or not). Fix both the 32- and 64-bit variants, even if the
+latter is not used currently.
+
+Fixes build failures detected by the Buildroot autobuilders, like:
+    http://autobuild.buildroot.org/results/23a/23ac0e742ed3a70ae4d038f8c9eadc23e708f671/build-end.log
+    http://autobuild.buildroot.org/results/192/1923d0b570adba494f83747a9610ea6ec35f5223/build-end.log
+
+and many other cases, espcially on architectures where such intrisics are
+present, but where the toolchain does not have threads (and anyway, it
+is much more efficient to use the intrisics rather than use mutexes).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Patch sent upstream:
+    https://github.com/rsyslog/libfastjson/pull/109
+
+---
+ m4/atomic_operations.m4       | 6 ++----
+ m4/atomic_operations_64bit.m4 | 6 ++----
+ 2 files changed, 4 insertions(+), 8 deletions(-)
+
+diff --git a/m4/atomic_operations.m4 b/m4/atomic_operations.m4
+index ad0ee60..7d2bca6 100644
+--- a/m4/atomic_operations.m4
++++ b/m4/atomic_operations.m4
+@@ -9,9 +9,7 @@
+ #
+ AC_DEFUN([RS_ATOMIC_OPERATIONS],
+ [AC_CACHE_CHECK([whether the compiler provides atomic builtins], [ap_cv_atomic_builtins],
+-[AC_TRY_RUN([
+-int main()
+-{
++[AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[
+     unsigned long val = 1010, tmp, *mem = &val;
+ 
+     if (__sync_fetch_and_add(&val, 1010) != 1010 || val != 2020)
+@@ -44,7 +42,7 @@ int main()
+         return 1;
+ 
+     return 0;
+-}], [ap_cv_atomic_builtins=yes], [ap_cv_atomic_builtins=no], [ap_cv_atomic_builtins=no])])
++]])], [ap_cv_atomic_builtins=yes], [ap_cv_atomic_builtins=no])])
+ 
+ if test "$ap_cv_atomic_builtins" = "yes"; then
+     AC_DEFINE(HAVE_ATOMIC_BUILTINS, 1, [Define if compiler provides atomic builtins])
+diff --git a/m4/atomic_operations_64bit.m4 b/m4/atomic_operations_64bit.m4
+index 9fbef0a..d01a977 100644
+--- a/m4/atomic_operations_64bit.m4
++++ b/m4/atomic_operations_64bit.m4
+@@ -9,9 +9,7 @@
+ #
+ AC_DEFUN([RS_ATOMIC_OPERATIONS_64BIT],
+ [AC_CACHE_CHECK([whether the compiler provides atomic builtins for 64 bit data types], [ap_cv_atomic_builtins_64],
+-[AC_TRY_RUN([
+-int main()
+-{
++[AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[
+     unsigned long long val = 1010, tmp, *mem = &val;
+ 
+     if (__sync_fetch_and_add(&val, 1010) != 1010 || val != 2020)
+@@ -44,7 +42,7 @@ int main()
+         return 1;
+ 
+     return 0;
+-}], [ap_cv_atomic_builtins_64=yes], [ap_cv_atomic_builtins_64=no], [ap_cv_atomic_builtins_64=no])])
++]])], [ap_cv_atomic_builtins_64=yes], [ap_cv_atomic_builtins_64=no])])
+ 
+ if test "$ap_cv_atomic_builtins_64" = "yes"; then
+     AC_DEFINE(HAVE_ATOMIC_BUILTINS64, 1, [Define if compiler provides 64 bit atomic builtins])
+-- 
+2.7.4
+
diff --git a/package/libfastjson/0002-m4-fix-detection-of-atomics.patch b/package/libfastjson/0002-m4-fix-detection-of-atomics.patch
deleted file mode 100644
index 1fdbf19..0000000
--- a/package/libfastjson/0002-m4-fix-detection-of-atomics.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From df087711cf7be55268a55e7820f4d928cb34c078 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 9 Jul 2016 20:44:36 +0200
-Subject: [PATCH] m4: fix detection of atomics
-
-In cross-compilation, it is impossible to run code at configure time to
-detect the target specifics.
-
-As such, AC_TRY_RUN fails miserably to detect reliably that atomic
-intrisics are present in a toolchain, and decides they are not just
-because this is cross-compilation.
-
-Instead of AC_TRY_RUN, use AC_LINK_IFELSE that does not need to actually
-run code, since all we're interested in is whether the intrisics are
-present (or not). Fix both the 32- and 64-bit variants, even if the
-latter is not used currently.
-
-Fixes build failures detected by the Buildroot autobuilders, like:
-    http://autobuild.buildroot.org/results/23a/23ac0e742ed3a70ae4d038f8c9eadc23e708f671/build-end.log
-    http://autobuild.buildroot.org/results/192/1923d0b570adba494f83747a9610ea6ec35f5223/build-end.log
-
-and many other cases, espcially on architectures where such intrisics are
-present, but where the toolchain does not have threads (and anyway, it
-is much more efficient to use the intrisics rather than use mutexes).
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Patch sent upstream:
-    https://github.com/rsyslog/libfastjson/pull/109
-
----
- m4/atomic_operations.m4       | 6 ++----
- m4/atomic_operations_64bit.m4 | 6 ++----
- 2 files changed, 4 insertions(+), 8 deletions(-)
-
-diff --git a/m4/atomic_operations.m4 b/m4/atomic_operations.m4
-index ad0ee60..7d2bca6 100644
---- a/m4/atomic_operations.m4
-+++ b/m4/atomic_operations.m4
-@@ -9,9 +9,7 @@
- #
- AC_DEFUN([RS_ATOMIC_OPERATIONS],
- [AC_CACHE_CHECK([whether the compiler provides atomic builtins], [ap_cv_atomic_builtins],
--[AC_TRY_RUN([
--int main()
--{
-+[AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[
-     unsigned long val = 1010, tmp, *mem = &val;
- 
-     if (__sync_fetch_and_add(&val, 1010) != 1010 || val != 2020)
-@@ -44,7 +42,7 @@ int main()
-         return 1;
- 
-     return 0;
--}], [ap_cv_atomic_builtins=yes], [ap_cv_atomic_builtins=no], [ap_cv_atomic_builtins=no])])
-+]])], [ap_cv_atomic_builtins=yes], [ap_cv_atomic_builtins=no])])
- 
- if test "$ap_cv_atomic_builtins" = "yes"; then
-     AC_DEFINE(HAVE_ATOMIC_BUILTINS, 1, [Define if compiler provides atomic builtins])
-diff --git a/m4/atomic_operations_64bit.m4 b/m4/atomic_operations_64bit.m4
-index 9fbef0a..d01a977 100644
---- a/m4/atomic_operations_64bit.m4
-+++ b/m4/atomic_operations_64bit.m4
-@@ -9,9 +9,7 @@
- #
- AC_DEFUN([RS_ATOMIC_OPERATIONS_64BIT],
- [AC_CACHE_CHECK([whether the compiler provides atomic builtins for 64 bit data types], [ap_cv_atomic_builtins_64],
--[AC_TRY_RUN([
--int main()
--{
-+[AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[
-     unsigned long long val = 1010, tmp, *mem = &val;
- 
-     if (__sync_fetch_and_add(&val, 1010) != 1010 || val != 2020)
-@@ -44,7 +42,7 @@ int main()
-         return 1;
- 
-     return 0;
--}], [ap_cv_atomic_builtins_64=yes], [ap_cv_atomic_builtins_64=no], [ap_cv_atomic_builtins_64=no])])
-+]])], [ap_cv_atomic_builtins_64=yes], [ap_cv_atomic_builtins_64=no])])
- 
- if test "$ap_cv_atomic_builtins_64" = "yes"; then
-     AC_DEFINE(HAVE_ATOMIC_BUILTINS64, 1, [Define if compiler provides 64 bit atomic builtins])
--- 
-2.7.4
-
diff --git a/package/libfastjson/libfastjson.hash b/package/libfastjson/libfastjson.hash
index 8531dac..427db9c 100644
--- a/package/libfastjson/libfastjson.hash
+++ b/package/libfastjson/libfastjson.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fcdca0c4702362de3db3f02c8da05f985b54a9eccd618af41730409b75d10a8f  libfastjson-v0.99.2.tar.gz
+sha256  03ef63dcc88417e71c19ce4436804159e3397e3a20d3529efef6a43c3bef5c8d  libfastjson-v0.99.4.tar.gz
diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
index ec5390c..b1cdd6a 100644
--- a/package/libfastjson/libfastjson.mk
+++ b/package/libfastjson/libfastjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFASTJSON_VERSION = v0.99.2
+LIBFASTJSON_VERSION = v0.99.4
 LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,$(LIBFASTJSON_VERSION))
 LIBFASTJSON_INSTALL_STAGING = YES
 # From git
-- 
2.6.2
