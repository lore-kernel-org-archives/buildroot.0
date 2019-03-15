From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sat, 16 Mar 2019 06:26:36 +0800
Subject: [Buildroot] [PATCH v4 1/2] package/gnu-efi: fix gnu-efi in projects
 using -nostdinc
Message-ID: <20190315222637.2937-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

This fixes the problem with undeclared intptr_t type for builds not including
stdint.h, without breaking builds using -nostdinc.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...roblem-with-undeclared-intptr_t-type.patch | 114 ++++++++++++++++++
 .../0001-efilink-fix-build-with-gcc-4.8.patch |  35 ------
 2 files changed, 114 insertions(+), 35 deletions(-)
 create mode 100644 package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch
 delete mode 100644 package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch

diff --git a/package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch b/package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch
new file mode 100644
index 0000000000..1d1b1f94b4
--- /dev/null
+++ b/package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch
@@ -0,0 +1,114 @@
+From 1a53d8f88a452847b25f9689f9a08dbcf82c86e4 Mon Sep 17 00:00:00 2001
+From: Esben Haabendal <esben@esben1.localdomain>
+Date: Fri, 15 Mar 2019 11:57:51 +0100
+Subject: [PATCH] Fix for problem with undeclared intptr_t type
+
+When building gnu-efi with old compilers with pre C90 compilers:
+
+In file included from gnu-efi-3.0.9/lib/../inc/efilib.h:25:0,
+                 from gnu-efi-3.0.9/lib/lib.h:24,
+                 from gnu-efi-3.0.9/lib/dpath.c:25:
+gnu-efi-3.0.9/lib/dpath.c: In function 'FileDevicePath':
+gnu-efi-3.0.9/lib/../inc/efilink.h:145:47: error: 'intptr_t' undeclared (first use in this function)
+ #define EFI_FIELD_OFFSET(TYPE,Field) ((UINTN)(intptr_t)(&(((TYPE *) 0)->Field)))
+
+Problem introduced with commit a46a62b12b58139c31d4288384808365c4053bf2
+(Fix some types gcc doesn't like).
+
+Avoid this by adding intptr_t (and uintptr_t) typedefs for builds that does
+not include stdint.h.
+
+Signed-off-by: Esben Haabendal <esben@esben1.localdomain>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/gnu-efi/code/merge-requests/5]
+---
+ inc/aarch64/efibind.h  | 2 ++
+ inc/arm/efibind.h      | 2 ++
+ inc/ia32/efibind.h     | 2 ++
+ inc/ia64/efibind.h     | 2 ++
+ inc/mips64el/efibind.h | 2 ++
+ inc/x86_64/efibind.h   | 2 ++
+ 6 files changed, 12 insertions(+)
+
+diff --git a/inc/aarch64/efibind.h b/inc/aarch64/efibind.h
+index bdaa523..3c8cf96 100644
+--- a/inc/aarch64/efibind.h
++++ b/inc/aarch64/efibind.h
+@@ -27,6 +27,8 @@ typedef unsigned short      uint16_t;
+ typedef short               int16_t;
+ typedef unsigned char       uint8_t;
+ typedef signed char         int8_t;   // unqualified 'char' is unsigned on ARM
++typedef uint64_t            uintptr_t;
++typedef int64_t             intptr_t;
+ 
+ #else
+ #include <stdint.h>
+diff --git a/inc/arm/efibind.h b/inc/arm/efibind.h
+index 40a5a9c..7a22b9c 100644
+--- a/inc/arm/efibind.h
++++ b/inc/arm/efibind.h
+@@ -27,6 +27,8 @@ typedef unsigned short      uint16_t;
+ typedef short               int16_t;
+ typedef unsigned char       uint8_t;
+ typedef signed char         int8_t;   // unqualified 'char' is unsigned on ARM
++typedef uint32_t            uintptr_t;
++typedef int32_t             intptr_t;
+ 
+ #else
+ #include <stdint.h>
+diff --git a/inc/ia32/efibind.h b/inc/ia32/efibind.h
+index 1b11f10..dd01385 100644
+--- a/inc/ia32/efibind.h
++++ b/inc/ia32/efibind.h
+@@ -75,6 +75,8 @@ Revision History
+        typedef unsigned char       uint8_t;
+        typedef char                int8_t;
+     #endif
++    typedef uint32_t            uintptr_t;
++    typedef int32_t             intptr_t;
+ #elif defined(__GNUC__)
+     #include <stdint.h>
+ #endif
+diff --git a/inc/ia64/efibind.h b/inc/ia64/efibind.h
+index b415461..b9b2e62 100644
+--- a/inc/ia64/efibind.h
++++ b/inc/ia64/efibind.h
+@@ -62,6 +62,8 @@ Revision History
+         typedef unsigned char       uint8_t;
+         typedef char                int8_t;
+     #endif
++    typedef uint64_t            uintptr_t;
++    typedef int64_t             intptr_t;
+ #elif defined(__GNUC__)
+     #include <stdint.h>
+ #endif
+diff --git a/inc/mips64el/efibind.h b/inc/mips64el/efibind.h
+index 4adbca3..32241e5 100644
+--- a/inc/mips64el/efibind.h
++++ b/inc/mips64el/efibind.h
+@@ -29,6 +29,8 @@ typedef unsigned short      uint16_t;
+ typedef short               int16_t;
+ typedef unsigned char       uint8_t;
+ typedef signed char         int8_t;   // unqualified 'char' is unsigned on ARM
++typedef uint64_t            uintptr_t;
++typedef int64_t             intptr_t;
+ 
+ #else
+ #include <stdint.h>
+diff --git a/inc/x86_64/efibind.h b/inc/x86_64/efibind.h
+index 4309f9f..ae40595 100644
+--- a/inc/x86_64/efibind.h
++++ b/inc/x86_64/efibind.h
+@@ -84,6 +84,8 @@ Revision History
+        typedef unsigned char       uint8_t;
+        typedef char                int8_t;
+     #endif
++    typedef uint64_t            uintptr_t;
++    typedef int64_t             intptr_t;
+ #elif defined(__GNUC__)
+     #include <stdint.h>
+ #endif
+-- 
+2.17.1
+
diff --git a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 57c78c9bd4..0000000000
--- a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6335e5c697c57d8b5854b8202de3733bcb151ca6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 18 Jan 2019 22:05:37 +0100
-Subject: [PATCH] efilink: fix build with gcc 4.8
-
-intptr_t is undefined without an include on stdint.h
-
-Fixes:
- - http://autobuild.buildroot.org/results/a0ca37b5ed27af445344e3ac49dc87bb17512c50
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://sourceforge.net/p/gnu-efi/code/merge-requests/3]
----
- inc/efilink.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/inc/efilink.h b/inc/efilink.h
-index cc5aa2d..b69a6fd 100644
---- a/inc/efilink.h
-+++ b/inc/efilink.h
-@@ -1,6 +1,10 @@
- #ifndef _EFI_LINK_H
- #define _EFI_LINK_H
- 
-+#if defined(__GNUC__)
-+#include <stdint.h>
-+#endif
-+
- /*++
- 
- Copyright (c) 1998  Intel Corporation
--- 
-2.14.1
-
-- 
2.17.1
