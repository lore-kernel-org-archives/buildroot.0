From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 21:11:46 +0200
Subject: [Buildroot] [git commit] uclibc: arc: Add susv3 legacy alias bcmp
Message-ID: <20130810191140.CD4A19B2C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b40ad28a54e17333fa380cf133e7f0ffc9834a46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the building of screen package for ARC

Reported-by: Mischa Jonker <mjonker@synopsys.com>
Cc: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch  |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

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
