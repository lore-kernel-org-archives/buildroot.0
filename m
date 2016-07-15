From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 17:00:26 +0200
Subject: [Buildroot] [git commit] package/libfastjson: fix build without
	threads
Message-ID: <20160715150123.EE23582257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a70bc14b92b423f68f94df91dc356bae5955c0af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libfastjson is supposed to use the __sync_*4 atomic intrinsics, but alas
it is not using them because their ./configure decides they are not
available: it uses AC_TRY_RUN to check for them, and the default is to
decide they are not available, because of cross-compilation.

Besides, one of the source files was not including the generated
config.h, so even after fixing ./configure there was still a build
error.

The first patch is a backport from upstream to fix the missing
inclusion.

The second patch is switching AC_TRY_RUN over to AC_LINK_IFELSE, as the
only thing we're interested in is to check for the presence of the
atomic intrisics, and linking is enough for that.

Fixes:
    http://autobuild.buildroot.org/results/192/1923d0b570adba494f83747a9610ea6ec35f5223/
    http://autobuild.buildroot.org/results/23a/23ac0e742ed3a70ae4d038f8c9eadc23e708f671/
    and many others...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libfastjson/0001-fix-missing-config.h.patch    | 29 ++++++++
 .../0002-m4-fix-detection-of-atomics.patch         | 86 ++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/package/libfastjson/0001-fix-missing-config.h.patch b/package/libfastjson/0001-fix-missing-config.h.patch
new file mode 100644
index 0000000..8663e23
--- /dev/null
+++ b/package/libfastjson/0001-fix-missing-config.h.patch
@@ -0,0 +1,29 @@
+From 3e017fe8da1e821d4fcd801c75467c8ec2a81eb4 Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Tue, 19 Apr 2016 08:21:50 +0200
+Subject: [PATCH] fix missing config.h
+
+[yann.morin.1998 at free.fr: backport from upstream]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+ json_object_iterator.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/json_object_iterator.c b/json_object_iterator.c
+index 6ab3a85..fb51f6e 100644
+--- a/json_object_iterator.c
++++ b/json_object_iterator.c
+@@ -17,8 +17,8 @@
+ *******************************************************************************
+ */
+ 
++#include "config.h"
+ #include <stddef.h>
+-
+ #include "json.h"
+ #include "json_object_private.h"
+ #include "json_object_iterator.h"
+-- 
+2.7.4
+
diff --git a/package/libfastjson/0002-m4-fix-detection-of-atomics.patch b/package/libfastjson/0002-m4-fix-detection-of-atomics.patch
new file mode 100644
index 0000000..1fdbf19
--- /dev/null
+++ b/package/libfastjson/0002-m4-fix-detection-of-atomics.patch
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
