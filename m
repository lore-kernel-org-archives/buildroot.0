From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Tue,  5 Feb 2019 07:11:18 +0800
Subject: [Buildroot] [PATCH v2 2/2] gnu-efi: fix stdint include location
In-Reply-To: <1549321878-9108-1-git-send-email-james.hilliard1@gmail.com>
References: <1549321878-9108-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <1549321878-9108-2-git-send-email-james.hilliard1@gmail.com>
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
 .../0001-efilink-fix-build-with-gcc-4.8.patch      | 32 ++++++++++------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
index 57c78c9..7938a69 100644
--- a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
+++ b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
@@ -1,4 +1,4 @@
-From 6335e5c697c57d8b5854b8202de3733bcb151ca6 Mon Sep 17 00:00:00 2001
+From 4a00c8403a09634cc4fbff2421f2fa7af7b2c657 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 18 Jan 2019 22:05:37 +0100
 Subject: [PATCH] efilink: fix build with gcc 4.8
@@ -8,28 +8,26 @@ intptr_t is undefined without an include on stdint.h
 Fixes:
  - http://autobuild.buildroot.org/results/a0ca37b5ed27af445344e3ac49dc87bb17512c50
 
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
