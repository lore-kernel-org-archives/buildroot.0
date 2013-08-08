From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Thu, 8 Aug 2013 16:08:05 +0530
Subject: [Buildroot] [PATCH] uclibc: arc: Add susv3 legacy alias bcmp
Message-ID: <1375958285-7814-1-git-send-email-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the building of screen package for ARC

Reported-by: Mischa Jonker <mjonker@synopsys.com>
Cc: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 .../uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch  | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch

diff --git a/package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch b/package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch
new file mode 100644
index 0000000..e0884ea
--- /dev/null
+++ b/package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch
@@ -0,0 +1,37 @@
+From 0594ba53b9b8d9a1ac409fd187e4d1ba8f2e7f2a Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <vgupta@synopsys.com>
+Date: Thu, 8 Aug 2013 15:41:51 +0530
+Subject: [PATCH] ARC: SuSv3 legacy support: Add "bcmp" alias for memcmp
+
+Although uClibc provides this already as UCLIBC_SUSV3_LEGACY_MACROS,
+that however requires UCLIBC_SUSV3_LEGACY to be switched off, causing a
+bunch of other things to be not available (usleep)
+
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+---
+ libc/string/arc/memcmp.S | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libc/string/arc/memcmp.S b/libc/string/arc/memcmp.S
+index 0c7c345..cb25990 100644
+--- a/libc/string/arc/memcmp.S
++++ b/libc/string/arc/memcmp.S
+@@ -1,6 +1,7 @@
+ /* Copyright (C) 2007 ARC International (UK) LTD */
+ 
+ #include <bits/asm.h>
++#include <features.h>
+ 
+ #ifdef __LITTLE_ENDIAN__
+ #define WORD2 r2
+@@ -115,3 +116,7 @@ ENTRY(memcmp)
+ 	j_s.d	[blink]
+ 	mov	r0,0
+ ENDFUNC(memcmp)
++
++#ifdef __UCLIBC_SUSV3_LEGACY__
++strong_alias(memcmp,bcmp)
++#endif
+-- 
+1.8.1.2
+
-- 
1.8.1.2
