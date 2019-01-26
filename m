From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sat, 26 Jan 2019 08:03:05 +0800
Subject: [Buildroot] [PATCH 1/1] gnu-efi: fix stdint include location
Message-ID: <1548460985-22568-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Some applications such as systemd-boot include efilink.h without a libc.
Move the stdint.h include to lib.h so that efilink.h can be used directly
without requiring a libc.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-efilink-fix-build-with-gcc-4.8.patch      | 35 ++++++++++------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
index 57c78c9..7dc8d8d 100644
--- a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
+++ b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
@@ -1,5 +1,5 @@
-From 6335e5c697c57d8b5854b8202de3733bcb151ca6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+From 92d0653f09aa44b24b9306fa9384f13d2c9f1a24 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
 Date: Fri, 18 Jan 2019 22:05:37 +0100
 Subject: [PATCH] efilink: fix build with gcc 4.8
 
@@ -8,28 +8,25 @@ intptr_t is undefined without an include on stdint.h
 Fixes:
  - http://autobuild.buildroot.org/results/a0ca37b5ed27af445344e3ac49dc87bb17512c50
 
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 [Upstream status:
-https://sourceforge.net/p/gnu-efi/code/merge-requests/3]
+https://sourceforge.net/p/gnu-efi/code/merge-requests/4]
 ---
- inc/efilink.h | 4 ++++
- 1 file changed, 4 insertions(+)
+ lib/lib.h | 1 +
+ 1 file changed, 1 insertion(+)
 
-diff --git a/inc/efilink.h b/inc/efilink.h
-index cc5aa2d..b69a6fd 100644
---- a/inc/efilink.h
-+++ b/inc/efilink.h
-@@ -1,6 +1,10 @@
- #ifndef _EFI_LINK_H
- #define _EFI_LINK_H
+diff --git a/lib/lib.h b/lib/lib.h
+index 37fbb95..7858cd0 100644
+--- a/lib/lib.h
++++ b/lib/lib.h
+@@ -18,6 +18,7 @@ Revision History
  
-+#if defined(__GNUC__)
+ #ifdef __GNUC__
+ #pragma GCC visibility push(hidden)
 +#include <stdint.h>
-+#endif
-+
- /*++
+ #endif
  
- Copyright (c) 1998  Intel Corporation
+ #include "efi.h"
 -- 
-2.14.1
+2.7.4
 
-- 
2.7.4
