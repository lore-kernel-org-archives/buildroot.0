From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 12:14:39 -0400
Subject: [Buildroot] [PATCH v8 1/5] libselinux: bump to 2.7
Message-ID: <20171017161443.11855-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove patch as it's in this release.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
Changes v1 -> v2:
  - None

Changes v2 -> v3:
  - None

Changes v3 -> v4:
  - None

Changes v4 -> v5:
  - None

Changes v5 -> v6:
  - None

Changes v6 -> v7:
  - None

Changes v7 -> v8:
  - None

 ...src-regex.c-support-old-compilers-for-the.patch | 47 ----------------------
 package/libselinux/libselinux.hash                 |  4 +-
 package/libselinux/libselinux.mk                   |  4 +-
 3 files changed, 4 insertions(+), 51 deletions(-)
 delete mode 100644 package/libselinux/0001-libselinux-src-regex.c-support-old-compilers-for-the.patch

diff --git a/package/libselinux/0001-libselinux-src-regex.c-support-old-compilers-for-the.patch b/package/libselinux/0001-libselinux-src-regex.c-support-old-compilers-for-the.patch
deleted file mode 100644
index 3bda607512..0000000000
--- a/package/libselinux/0001-libselinux-src-regex.c-support-old-compilers-for-the.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e0803c0bdbb1abf06b6b5bb1b52fdb733505b8f7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 25 Jan 2017 22:41:02 +1300
-Subject: [PATCH] src/regex.c: support old compilers for the endian
- check
-
-libselinux 2.6 has added some code in regex.c that uses __BYTE_ORDER__
-to determine the system endianness. Unfortunately, this definition
-provided directly by the compiler doesn't exist in older gcc versions
-such as gcc 4.4.
-
-In order to address this, this commit extends the logic to use
-<endian.h> definitions if __BYTE_ORDER__ is not provided by the
-compiler. This allows libselinux to build properly with gcc 4.4.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/regex.c | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/src/regex.c b/src/regex.c
-index a3b427b..0c5ad27 100644
---- a/src/regex.c
-+++ b/src/regex.c
-@@ -13,7 +13,18 @@
- #endif
- 
- #ifndef __BYTE_ORDER__
--#error __BYTE_ORDER__ not defined. Unable to determine endianness.
-+
-+/* If the compiler doesn't define __BYTE_ORDER__, try to use the C
-+ * library <endian.h> header definitions. */
-+#include <endian.h>
-+#ifndef __BYTE_ORDER
-+#error Neither __BYTE_ORDER__ nor __BYTE_ORDER defined. Unable to determine endianness.
-+#endif
-+
-+#define __ORDER_LITTLE_ENDIAN __LITTLE_ENDIAN
-+#define __ORDER_BIG_ENDIAN __BIG_ENDIAN
-+#define __BYTE_ORDER__ __BYTE_ORDER
-+
- #endif
- 
- #ifdef USE_PCRE2
--- 
-2.7.4
-
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 76130b2dc0..3c60d5111d 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256 4ea2dde50665c202253ba5caac7738370ea0337c47b251ba981c60d24e1a118a libselinux-2.6.tar.gz
+# From: https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 d0fec0769b3ad60aa7baf9b9a4b7a056827769dc2dadda0dc0eb59b3d1c18c57 libselinux-2.7.tar.gz
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index f23eea4962..8ac8000de5 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 2.6
-LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
+LIBSELINUX_VERSION = 2.7
+LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
-- 
2.13.6
