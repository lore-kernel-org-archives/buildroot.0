From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 25 Oct 2019 11:33:20 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/gnu-efi: fix efilink
Message-ID: <20191025173320.78781-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
In file included from /home/buildroot/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/efi/efilib.h:25,
                 from ../src/boot/efi/measure.c:6:
/home/buildroot/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/efi/efilink.h:5:10: fatal error: stdint.h: No such file or directory
 #include <stdint.h>
          ^~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...evert-efilink-fix-build-with-gcc-4.8.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch

diff --git a/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch b/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..5a08c24254
--- /dev/null
+++ b/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,38 @@
+From 1f7b2e5bd6603b30202a66b6317a41e2be85742b Mon Sep 17 00:00:00 2001
+From: Esben Haabendal <esben@haabendal.dk>
+Date: Tue, 26 Mar 2019 13:37:02 +0100
+Subject: [PATCH] Revert "efilink: fix build with gcc 4.8"
+
+This reverts commit 6335e5c697c57d8b5854b8202de3733bcb151ca6, as it breaks
+gcc builds with '-nostdinc' flag.
+
+The fix in 1a53d8f88a452847b25f9689f9a08dbcf82c86e4
+(Fix for problem with undeclared intptr_t type), which is also merged
+fixes the same problem, without causing breakage.
+
+Signed-off-by: Esben Haabendal <esben@haabendal.dk>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/gnu-efi/code/merge-requests/6/]
+---
+ inc/efilink.h | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/inc/efilink.h b/inc/efilink.h
+index b69a6fd..cc5aa2d 100644
+--- a/inc/efilink.h
++++ b/inc/efilink.h
+@@ -1,10 +1,6 @@
+ #ifndef _EFI_LINK_H
+ #define _EFI_LINK_H
+ 
+-#if defined(__GNUC__)
+-#include <stdint.h>
+-#endif
+-
+ /*++
+ 
+ Copyright (c) 1998  Intel Corporation
+-- 
+2.20.1
+
-- 
2.20.1
