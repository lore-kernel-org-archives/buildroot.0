From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 29 Jul 2017 16:16:39 +0300
Subject: [Buildroot] [PATCH v3 1/1] webkitgtk: Add patches which allow
	building for ARMv8-A
Message-ID: <20170729131639.28156-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The two added patches allow building WebKitGTK+ when the compiler
scpecifically targets ARMv8-A, and reports as such be pre-defining
__ARCH_ARM_8A__ instead of just __ARCH_ARM_8__. Both patches were
pulled from the corresponding upstream bug reports and edited to
remove the conflicting parts which edit the ChangeLog files.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

---
Changes v2 -> v3:
    - Remove hunks for ChangeLog edits, which are not present in releases.

Changes v1 -> v2:
    - Format upstream patches with "git format-patch -N"
---
 ...-to-build-when-the-compiler-specifically-.patch | 36 ++++++++++++++++++++++
 ...lure-to-build-when-the-compiler-specifica.patch | 36 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 package/webkitgtk/0001-WTF-Failure-to-build-when-the-compiler-specifically-.patch
 create mode 100644 package/webkitgtk/0002-bmalloc-Failure-to-build-when-the-compiler-specifica.patch

diff --git a/package/webkitgtk/0001-WTF-Failure-to-build-when-the-compiler-specifically-.patch b/package/webkitgtk/0001-WTF-Failure-to-build-when-the-compiler-specifically-.patch
new file mode 100644
index 0000000000..017771a07d
--- /dev/null
+++ b/package/webkitgtk/0001-WTF-Failure-to-build-when-the-compiler-specifically-.patch
@@ -0,0 +1,36 @@
+From 09d5520d910b63fba67bea1d8c71f5d426f345b7 Mon Sep 17 00:00:00 2001
+From: "aperez at igalia.com"
+ <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Wed, 12 Jul 2017 18:42:29 +0000
+Subject: [PATCH] [WTF] Failure to build when the compiler specifically targets
+ ARMv8-A / defines __ARM_ARCH_8A__
+ https://bugs.webkit.org/show_bug.cgi?id=174425
+
+Reviewed by Michael Catanzaro.
+
+* wtf/Platform.h: Also check for __ARCH_ARM_8A__ to detect ARMv8.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 219415 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+---
+ Source/WTF/wtf/Platform.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 44d929c333c..7dccb44fcbf 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -238,7 +238,8 @@
+     || defined(__ARM_ARCH_7S__)
+ #define WTF_ARM_ARCH_VERSION 7
+ 
+-#elif defined(__ARM_ARCH_8__)
++#elif defined(__ARM_ARCH_8__) \
++    || defined(__ARM_ARCH_8A__)
+ #define WTF_ARM_ARCH_VERSION 8
+ 
+ /* MSVC sets _M_ARM */
+-- 
+2.13.3
+
diff --git a/package/webkitgtk/0002-bmalloc-Failure-to-build-when-the-compiler-specifica.patch b/package/webkitgtk/0002-bmalloc-Failure-to-build-when-the-compiler-specifica.patch
new file mode 100644
index 0000000000..e1623bffa0
--- /dev/null
+++ b/package/webkitgtk/0002-bmalloc-Failure-to-build-when-the-compiler-specifica.patch
@@ -0,0 +1,36 @@
+From 07dab7fe552c53e7840e34d3c8bb1cc43a921706 Mon Sep 17 00:00:00 2001
+From: "aperez at igalia.com"
+ <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Wed, 12 Jul 2017 18:43:36 +0000
+Subject: [PATCH] bmalloc: Failure to build when the compiler specifically
+ targets ARMv8-A / defines __ARM_ARCH_8A__
+ https://bugs.webkit.org/show_bug.cgi?id=174424
+
+Reviewed by Michael Catanzaro.
+
+* bmalloc/BPlatform.h: Also check for __ARCH_ARM_8A__ to detect ARMv8.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 219416 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+---
+ Source/bmalloc/bmalloc/BPlatform.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Source/bmalloc/bmalloc/BPlatform.h b/Source/bmalloc/bmalloc/BPlatform.h
+index 8d768db63fb..400143a63fb 100644
+--- a/Source/bmalloc/bmalloc/BPlatform.h
++++ b/Source/bmalloc/bmalloc/BPlatform.h
+@@ -120,7 +120,8 @@
+ || defined(__ARM_ARCH_7S__)
+ #define BARM_ARCH_VERSION 7
+ 
+-#elif defined(__ARM_ARCH_8__)
++#elif defined(__ARM_ARCH_8__) \
++|| defined(__ARM_ARCH_8A__)
+ #define BARM_ARCH_VERSION 8
+ 
+ /* MSVC sets _M_ARM */
+-- 
+2.13.3
+
-- 
2.13.3
