From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 15:45:29 +0200
Subject: [Buildroot] [git commit] poco: replace m68k support patch by
 upstream backport
Message-ID: <20180701134417.793D9836FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8dd945b2d31f310fdb010e0416edf5e2ea617f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The m68k fix was merged upstream, so let's backport the upstream
commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../poco/0002-Add-support-for-m68000-1856.patch    | 30 ++++++++++++++++++++++
 .../poco/0002-fix-m68k-double-conv-detect.patch    | 19 --------------
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/package/poco/0002-Add-support-for-m68000-1856.patch b/package/poco/0002-Add-support-for-m68000-1856.patch
new file mode 100644
index 0000000000..1cf99bf09c
--- /dev/null
+++ b/package/poco/0002-Add-support-for-m68000-1856.patch
@@ -0,0 +1,30 @@
+From e49753f7654dc62087e47731832d5992cc4d194e Mon Sep 17 00:00:00 2001
+From: Jochen Sprickerhof <github@jochen.sprickerhof.de>
+Date: Wed, 23 Aug 2017 16:50:51 +0200
+Subject: [PATCH] Add support for m68000 (#1856)
+
+Originally taken from
+
+https://github.com/google/double-conversion/commit/da11179623145f53b204105a93b8bbca431141da
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Foundation/src/utils.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
+index 69cea1aca..a7bda0171 100644
+--- a/Foundation/src/utils.h
++++ b/Foundation/src/utils.h
+@@ -65,6 +65,8 @@
+     defined(__AARCH64EL__) || \
+     defined(nios2) || defined(__nios2) || defined(__nios2__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
++#elif defined(__mc68000__)
++#undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+ // Windows uses a 64bit wide floating point stack.
+-- 
+2.14.4
+
diff --git a/package/poco/0002-fix-m68k-double-conv-detect.patch b/package/poco/0002-fix-m68k-double-conv-detect.patch
deleted file mode 100644
index 3ca03fc7be..0000000000
--- a/package/poco/0002-fix-m68k-double-conv-detect.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fixes compile for m68k.
-
-From upstream double-conversion commit da111796231:
-https://github.com/google/double-conversion/blob/master/double-conversion/utils.h
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur poco-poco-1.7.2-release.orig/Foundation/src/utils.h poco-poco-1.7.2-release/Foundation/src/utils.h
---- poco-poco-1.7.2-release.orig/Foundation/src/utils.h	2016-03-19 08:19:35.000000000 +0100
-+++ poco-poco-1.7.2-release/Foundation/src/utils.h	2016-08-11 02:55:02.827238119 +0200
-@@ -63,6 +63,8 @@
-     defined(__AARCH64EL__) || \
-     defined(nios2) || defined(__nios2) || defined(__nios2__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
-+#elif defined(__mc68000__)
-+#undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
- // Windows uses a 64bit wide floating point stack.
