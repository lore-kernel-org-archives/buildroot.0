From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 22:00:23 +0200
Subject: [Buildroot] [git commit] package/gnu-efi: bump to version 3.0.10
Message-ID: <20191016200045.0756B812B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc8c8f300ebc67c35f0e039178db722d541c78eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...for-problem-with-undeclared-intptr_t-type.patch | 114 ---------------------
 ...s-don-t-override-ARCH-when-cross-compili.patch} |   0
 package/gnu-efi/gnu-efi.hash                       |   6 +-
 package/gnu-efi/gnu-efi.mk                         |   2 +-
 4 files changed, 4 insertions(+), 118 deletions(-)

diff --git a/package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch b/package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch
deleted file mode 100644
index 1d1b1f94b4..0000000000
--- a/package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 1a53d8f88a452847b25f9689f9a08dbcf82c86e4 Mon Sep 17 00:00:00 2001
-From: Esben Haabendal <esben@esben1.localdomain>
-Date: Fri, 15 Mar 2019 11:57:51 +0100
-Subject: [PATCH] Fix for problem with undeclared intptr_t type
-
-When building gnu-efi with old compilers with pre C90 compilers:
-
-In file included from gnu-efi-3.0.9/lib/../inc/efilib.h:25:0,
-                 from gnu-efi-3.0.9/lib/lib.h:24,
-                 from gnu-efi-3.0.9/lib/dpath.c:25:
-gnu-efi-3.0.9/lib/dpath.c: In function 'FileDevicePath':
-gnu-efi-3.0.9/lib/../inc/efilink.h:145:47: error: 'intptr_t' undeclared (first use in this function)
- #define EFI_FIELD_OFFSET(TYPE,Field) ((UINTN)(intptr_t)(&(((TYPE *) 0)->Field)))
-
-Problem introduced with commit a46a62b12b58139c31d4288384808365c4053bf2
-(Fix some types gcc doesn't like).
-
-Avoid this by adding intptr_t (and uintptr_t) typedefs for builds that does
-not include stdint.h.
-
-Signed-off-by: Esben Haabendal <esben@esben1.localdomain>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://sourceforge.net/p/gnu-efi/code/merge-requests/5]
----
- inc/aarch64/efibind.h  | 2 ++
- inc/arm/efibind.h      | 2 ++
- inc/ia32/efibind.h     | 2 ++
- inc/ia64/efibind.h     | 2 ++
- inc/mips64el/efibind.h | 2 ++
- inc/x86_64/efibind.h   | 2 ++
- 6 files changed, 12 insertions(+)
-
-diff --git a/inc/aarch64/efibind.h b/inc/aarch64/efibind.h
-index bdaa523..3c8cf96 100644
---- a/inc/aarch64/efibind.h
-+++ b/inc/aarch64/efibind.h
-@@ -27,6 +27,8 @@ typedef unsigned short      uint16_t;
- typedef short               int16_t;
- typedef unsigned char       uint8_t;
- typedef signed char         int8_t;   // unqualified 'char' is unsigned on ARM
-+typedef uint64_t            uintptr_t;
-+typedef int64_t             intptr_t;
- 
- #else
- #include <stdint.h>
-diff --git a/inc/arm/efibind.h b/inc/arm/efibind.h
-index 40a5a9c..7a22b9c 100644
---- a/inc/arm/efibind.h
-+++ b/inc/arm/efibind.h
-@@ -27,6 +27,8 @@ typedef unsigned short      uint16_t;
- typedef short               int16_t;
- typedef unsigned char       uint8_t;
- typedef signed char         int8_t;   // unqualified 'char' is unsigned on ARM
-+typedef uint32_t            uintptr_t;
-+typedef int32_t             intptr_t;
- 
- #else
- #include <stdint.h>
-diff --git a/inc/ia32/efibind.h b/inc/ia32/efibind.h
-index 1b11f10..dd01385 100644
---- a/inc/ia32/efibind.h
-+++ b/inc/ia32/efibind.h
-@@ -75,6 +75,8 @@ Revision History
-        typedef unsigned char       uint8_t;
-        typedef char                int8_t;
-     #endif
-+    typedef uint32_t            uintptr_t;
-+    typedef int32_t             intptr_t;
- #elif defined(__GNUC__)
-     #include <stdint.h>
- #endif
-diff --git a/inc/ia64/efibind.h b/inc/ia64/efibind.h
-index b415461..b9b2e62 100644
---- a/inc/ia64/efibind.h
-+++ b/inc/ia64/efibind.h
-@@ -62,6 +62,8 @@ Revision History
-         typedef unsigned char       uint8_t;
-         typedef char                int8_t;
-     #endif
-+    typedef uint64_t            uintptr_t;
-+    typedef int64_t             intptr_t;
- #elif defined(__GNUC__)
-     #include <stdint.h>
- #endif
-diff --git a/inc/mips64el/efibind.h b/inc/mips64el/efibind.h
-index 4adbca3..32241e5 100644
---- a/inc/mips64el/efibind.h
-+++ b/inc/mips64el/efibind.h
-@@ -29,6 +29,8 @@ typedef unsigned short      uint16_t;
- typedef short               int16_t;
- typedef unsigned char       uint8_t;
- typedef signed char         int8_t;   // unqualified 'char' is unsigned on ARM
-+typedef uint64_t            uintptr_t;
-+typedef int64_t             intptr_t;
- 
- #else
- #include <stdint.h>
-diff --git a/inc/x86_64/efibind.h b/inc/x86_64/efibind.h
-index 4309f9f..ae40595 100644
---- a/inc/x86_64/efibind.h
-+++ b/inc/x86_64/efibind.h
-@@ -84,6 +84,8 @@ Revision History
-        typedef unsigned char       uint8_t;
-        typedef char                int8_t;
-     #endif
-+    typedef uint64_t            uintptr_t;
-+    typedef int64_t             intptr_t;
- #elif defined(__GNUC__)
-     #include <stdint.h>
- #endif
--- 
-2.17.1
-
diff --git a/package/gnu-efi/0002-Make.defaults-don-t-override-ARCH-when-cross-compili.patch b/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
similarity index 100%
rename from package/gnu-efi/0002-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
rename to package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 9ac2b51fe3..bf9792b290 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5 32af17b917545a693e549af2439c4a99 gnu-efi-3.0.9.tar.bz2
-sha1 9b39e06206e63eba56d59a648a7e4f20aead6962 gnu-efi-3.0.9.tar.bz2
+md5 960a8379b6f95ee73d7778b70bf2a089 gnu-efi-3.0.10.tar.bz2
+sha1 a51b81eda97c0acbf3ac86123f298d3c0e396ce5 gnu-efi-3.0.10.tar.bz2
 # Locally computed
-sha256 6715ea7eae1c7e4fc5041034bd3f107ec2911962ed284a081e491646b12277f0  gnu-efi-3.0.9.tar.bz2
+sha256 f12082a3a5f0c3e38c67262a9f34245d139ac2cdfc0a0bdcf03c9b1f56fa4fed  gnu-efi-3.0.10.tar.bz2
 sha256 42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index fe3c8ac343..69618029f4 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.9
+GNU_EFI_VERSION = 3.0.10
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
