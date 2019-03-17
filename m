From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Mar 2019 18:28:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/zlog: bump to version
 ccf8c36e918d6f3c7e6fe9e36eedf8583014c5c9
Message-ID: <20190317172840.3511-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patches (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zlog/0001-fix-compiling-on-Buildroot.patch | 32 ------------------
 ...ove-Werror-and-avoid-build-failures-becau.patch | 38 ----------------------
 package/zlog/zlog.hash                             |  3 +-
 package/zlog/zlog.mk                               |  2 +-
 4 files changed, 3 insertions(+), 72 deletions(-)
 delete mode 100644 package/zlog/0001-fix-compiling-on-Buildroot.patch
 delete mode 100644 package/zlog/0002-compile-Remove-Werror-and-avoid-build-failures-becau.patch

diff --git a/package/zlog/0001-fix-compiling-on-Buildroot.patch b/package/zlog/0001-fix-compiling-on-Buildroot.patch
deleted file mode 100644
index 32aa7d6db7..0000000000
--- a/package/zlog/0001-fix-compiling-on-Buildroot.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a9f6a55bdb29a2bebc96a68ab53077906c25a9df Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Wed, 22 Jan 2014 15:04:42 +0100
-Subject: [PATCH] Fix compiling on Buildroot
-
-Buildroot always specifies -D_LARGEFILE_SOURCE, -D_LARGEFILE64_SOURCE,
--D_FILE_OFFSET_BITS=64, so define them only if they are not already
-defined.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- src/fmacros.h |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/src/fmacros.h b/src/fmacros.h
-index fa37948..059dfeb 100644
---- a/src/fmacros.h
-+++ b/src/fmacros.h
-@@ -14,7 +14,11 @@
- #define _XOPEN_SOURCE
- #endif
-
-+#ifndef _LARGEFILE_SOURCE
- #define _LARGEFILE_SOURCE
-+#endif
-+#ifndef _FILE_OFFSET_BITS
- #define _FILE_OFFSET_BITS 64
-+#endif
-
- #endif
---
-1.7.7
diff --git a/package/zlog/0002-compile-Remove-Werror-and-avoid-build-failures-becau.patch b/package/zlog/0002-compile-Remove-Werror-and-avoid-build-failures-becau.patch
deleted file mode 100644
index 0f1b912387..0000000000
--- a/package/zlog/0002-compile-Remove-Werror-and-avoid-build-failures-becau.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4a08c9e07fa8b7a1d6a76b927ea97e3eaa784845 Mon Sep 17 00:00:00 2001
-From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-Date: Sun, 26 Oct 2014 16:16:25 -0300
-Subject: [PATCH] compile: Remove -Werror and avoid build failures because of
- warnings
-
-Using -Werror on production is a bad idea, as otherwise harmless warnings
-get treated as errors breaking builds. This is currently the case with
-Nios-II architecture toolchain, warning about a deprecated macro:
-
-../usr/nios2-buildroot-linux-gnu/sysroot/usr/include/features.h:148:3:
-error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE" [-Werror=cpp]
- # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
-
-Instead of trying to fix the macro, let's fix the real issue here,
-and remove -Werror.
-
-Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
----
- src/makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/makefile b/src/makefile
-index 294dc08..4ac4c43 100644
---- a/src/makefile
-+++ b/src/makefile
-@@ -32,7 +32,7 @@ ZLOG_MINOR=2
- # Fallback to gcc when $CC is not in $PATH.
- CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
- OPTIMIZATION?=-O2
--WARNINGS=-Wall -Werror -Wstrict-prototypes -fwrapv
-+WARNINGS=-Wall -Wstrict-prototypes -fwrapv
- DEBUG?= -g -ggdb
- REAL_CFLAGS=$(OPTIMIZATION) -fPIC -pthread $(CFLAGS) $(WARNINGS) $(DEBUG)
- REAL_LDFLAGS=$(LDFLAGS) -pthread
--- 
-2.1.0
-
diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index 1de23c9a71..699f75c38e 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 d3afb1f0ce67df29f759da74235949370ac2818faf242f3f674cb48f9f4c57d3 zlog-6ddb9bbf3ff0123e701bf60996f351576ebe9c00.tar.gz
+sha256 b150ff725e5f9e839f41c0f3d2e8f0e3cc303aa51194be0bc34a3c3299acc059 zlog-ccf8c36e918d6f3c7e6fe9e36eedf8583014c5c9.tar.gz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index 8e005e4340..fedce12cbb 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLOG_VERSION = 6ddb9bbf3ff0123e701bf60996f351576ebe9c00
+ZLOG_VERSION = ccf8c36e918d6f3c7e6fe9e36eedf8583014c5c9
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = LGPL-2.1
 ZLOG_LICENSE_FILES = COPYING
-- 
2.14.1
