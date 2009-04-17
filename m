From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 17 Apr 2009 18:17:33 +0000 (UTC)
Subject: [Buildroot] svn commit: [26137] trunk/buildroot/package/busybox
Message-ID: <20090417181734.55DA0771E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-17 18:17:33 +0000 (Fri, 17 Apr 2009)
New Revision: 26137

Log:
busybox: 1.14.0 fix for move_to_unaligned32 / dnsd.c on !x86

Added:
   trunk/buildroot/package/busybox/busybox-1.14.0-unaligned-fix.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.14.0-unaligned-fix.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.14.0-unaligned-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.14.0-unaligned-fix.patch	2009-04-17 18:17:33 UTC (rev 26137)
@@ -0,0 +1,28 @@
+[PATCH] fix move_to_unaligned32() for !x86
+
+get_unaligned() got changed into move_{from,to}_unaligned() in r24334, but
+the temporary variabled used to make sure we can take the address of the
+source argument for memcpy() got removed. Later on in r26068 dnsd.c got
+changed to call move_to_unaligned with htons/htonl as source breaking
+the build for !x86.
+
+Fix it by reintroducing the temporary variable.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/platform.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: busybox-1.14.0/include/platform.h
+===================================================================
+--- busybox-1.14.0.orig/include/platform.h
++++ busybox-1.14.0/include/platform.h
+@@ -173,7 +173,7 @@
+ /* performs reasonably well (gcc usually inlines memcpy here) */
+ #define move_from_unaligned16(v, u16p) (memcpy(&(v), (u16p), 2))
+ #define move_from_unaligned32(v, u32p) (memcpy(&(v), (u32p), 4))
+-#define move_to_unaligned32(u32p, v)   (memcpy((u32p), &(v), 4))
++#define move_to_unaligned32(u32p, v)   do { uint32_t __t = (v); memcpy((u32p), &__t, 4); } while (0)
+ #endif
+ 
+ /* ---- Networking ------------------------------------------ */
