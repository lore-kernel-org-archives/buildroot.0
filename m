From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 12 Jul 2021 22:24:34 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version 2.32.2
Message-ID: <20210712192434.2229658-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bugfix release, mainly solves a few issues with input events,
drag-and-drop, and a few crashes. Release notes:

  https://webkitgtk.org/2021/07/09/webkitgtk2.32.2-released.html

The patch for building against uClibc has been included in this release,
therefore "0001-Support-building-against-uClibc.patch" is removed.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...0001-Support-building-against-uClibc.patch | 82 -------------------
 package/webkitgtk/webkitgtk.hash              |  8 +-
 package/webkitgtk/webkitgtk.mk                |  2 +-
 3 files changed, 5 insertions(+), 87 deletions(-)
 delete mode 100644 package/webkitgtk/0001-Support-building-against-uClibc.patch

diff --git a/package/webkitgtk/0001-Support-building-against-uClibc.patch b/package/webkitgtk/0001-Support-building-against-uClibc.patch
deleted file mode 100644
index 7c0918a195..0000000000
--- a/package/webkitgtk/0001-Support-building-against-uClibc.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 624d3b6a99778443e35fb260bef50a3969df9215 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Wed, 26 May 2021 01:24:59 +0300
-Subject: [PATCH] Support building against uClibc
- https://bugs.webkit.org/show_bug.cgi?id=226244
-
-Reviewed by Michael Catanzaro.
-
-Source/JavaScriptCore:
-
-* assembler/MacroAssemblerARM64.cpp:
-(getauxval): Provide a fallback implementation of getauxval() for
-systems which do not provide <sys/auxv.h>, like those using uClibc
-as their C library.
-
-Source/WTF:
-
-* wtf/PlatformRegisters.h: Use the <sys/ucontext.h> header instead of
-<ucontext.h>, which is enough to gain access to the type definitions
-for CPU registers and is available on every libc. On the other hand,
-uClibc does not have <ucontext.h>, so this fixes the build in that
-case.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Backport from upstream:
-  - https://bugs.webkit.org/show_bug.cgi?id=226244
-  - https://trac.webkit.org/changeset/278302 (current svn, soon legacy)
-  - https://commits.webkit.org/238339 at main (future-proof for after the migration to git)
-]
-[yann.morin.1998 at free.fr: add upstream commit refs]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- .../assembler/MacroAssemblerARM64.cpp          | 18 ++++++++++++++++++
- Source/WTF/wtf/PlatformRegisters.h             |  2 +-
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
-index 9e5c5147ea0..d20e632d825 100644
---- a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
-+++ b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
-@@ -34,7 +34,25 @@
- 
- #if OS(LINUX)
- #include <asm/hwcap.h>
-+#if __has_include(<sys/auxv.h>)
- #include <sys/auxv.h>
-+#else
-+#include <linux/auxvec.h>
-+// Provide an implementation for C libraries which do not ship one.
-+static unsigned long getauxval(unsigned long type)
-+{
-+    char** env = environ;
-+    while (*env++) { /* no-op */ }
-+
-+    for (auto* auxv = reinterpret_cast<unsigned long*>(env); *auxv != AT_NULL; auxv += 2) {
-+        if (*auxv == type)
-+            return auxv[1];
-+    }
-+
-+    errno = ENOENT;
-+    return 0;
-+}
-+#endif
- #endif
- 
- namespace JSC {
-diff --git a/Source/WTF/wtf/PlatformRegisters.h b/Source/WTF/wtf/PlatformRegisters.h
-index d26ef985169..e7f15b7eb62 100644
---- a/Source/WTF/wtf/PlatformRegisters.h
-+++ b/Source/WTF/wtf/PlatformRegisters.h
-@@ -35,7 +35,7 @@
- #elif OS(WINDOWS)
- #include <windows.h>
- #else
--#include <ucontext.h>
-+#include <sys/ucontext.h>
- #endif
- 
- namespace WTF {
--- 
-2.31.1
-
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index d8bfa60fb8..dd950bbabe 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.32.1.tar.xz.sums
-md5  b12790ae1209e1d5848aeb4fb70994db  webkitgtk-2.32.1.tar.xz
-sha1  c8c507d3c98c891ea5bfcfb6407320959dc77a2b  webkitgtk-2.32.1.tar.xz
-sha256  136117317f70f66486f71b8edf5e46f8776403c5d8a296e914b11a36ef836917  webkitgtk-2.32.1.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.32.2.tar.xz.sums
+md5  6dbf813fefd79c551be47b1312f27cec  webkitgtk-2.32.2.tar.xz
+sha1  958777627972b18501e5520d0aba9e274a2b151f  webkitgtk-2.32.2.tar.xz
+sha256  1790f86975bdef957ba9a12fc09202de8f55c885ee38467afc50d2bdb7a6c5cd  webkitgtk-2.32.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index bee0d4f885..c3fbedf654 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.32.1
+WEBKITGTK_VERSION = 2.32.2
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.32.0
