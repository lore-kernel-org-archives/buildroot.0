From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 Jul 2017 02:55:29 +0300
Subject: [Buildroot] [PATCH 2/4] webkitgtk: Add patches which allow building
	for ARMv8-A
In-Reply-To: <20170712235531.20444-1-aperez@igalia.com>
References: <20170712235531.20444-1-aperez@igalia.com>
Message-ID: <20170712235531.20444-3-aperez@igalia.com>
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
 ...ailure-to-build-when-the-compiler-specifica.patch | 20 ++++++++++++++++++++
 ...re-to-build-when-the-compiler-specifically-.patch | 20 ++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 package/webkitgtk/0001-bmalloc-Failure-to-build-when-the-compiler-specifica.patch
 create mode 100644 package/webkitgtk/0002-WTF-Failure-to-build-when-the-compiler-specifically-.patch

diff --git a/package/webkitgtk/0001-bmalloc-Failure-to-build-when-the-compiler-specifica.patch b/package/webkitgtk/0001-bmalloc-Failure-to-build-when-the-compiler-specifica.patch
new file mode 100644
index 0000000000..7d5f6c6b47
--- /dev/null
+++ b/package/webkitgtk/0001-bmalloc-Failure-to-build-when-the-compiler-specifica.patch
@@ -0,0 +1,20 @@
+bmalloc: Failure to build when the compiler specifically targets ARMv8-A / defines __ARM_ARCH_8A__
+
+Upstream, from https://bugs.webkit.org/show_bug.cgi?id=174424
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+diff --git a/Source/bmalloc/bmalloc/BPlatform.h b/Source/bmalloc/bmalloc/BPlatform.h
+index 45bbc249f59..597f7819d18 100644
+--- a/Source/bmalloc/bmalloc/BPlatform.h
++++ b/Source/bmalloc/bmalloc/BPlatform.h
+@@ -123,7 +123,8 @@
+ || defined(__ARM_ARCH_7S__)
+ #define BARM_ARCH_VERSION 7
+ 
+-#elif defined(__ARM_ARCH_8__)
++#elif defined(__ARM_ARCH_8__) \
++|| defined(__ARM_ARCH_8A__)
+ #define BARM_ARCH_VERSION 8
+ 
+ /* MSVC sets _M_ARM */
diff --git a/package/webkitgtk/0002-WTF-Failure-to-build-when-the-compiler-specifically-.patch b/package/webkitgtk/0002-WTF-Failure-to-build-when-the-compiler-specifically-.patch
new file mode 100644
index 0000000000..a1bf9738af
--- /dev/null
+++ b/package/webkitgtk/0002-WTF-Failure-to-build-when-the-compiler-specifically-.patch
@@ -0,0 +1,20 @@
+[WTF] Failure to build when the compiler specifically targets ARMv8-A / defines __ARM_ARCH_8A__
+
+Upstream, from https://bugs.webkit.org/show_bug.cgi?id=174425
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 3d02b9c8553..9511e9e4e51 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -242,7 +242,8 @@
+     || defined(__ARM_ARCH_7S__)
+ #define WTF_ARM_ARCH_VERSION 7
+ 
+-#elif defined(__ARM_ARCH_8__)
++#elif defined(__ARM_ARCH_8__) \
++    || defined(__ARM_ARCH_8A__)
+ #define WTF_ARM_ARCH_VERSION 8
+ 
+ /* MSVC sets _M_ARM */
-- 
2.13.2
