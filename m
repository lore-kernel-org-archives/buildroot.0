From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 15 Jul 2013 13:48:11 +0200
Subject: [Buildroot] [PATCH] uclibc: arc: add patch to fix strcmp/index
	susv3 legacy
Message-ID: <1373888891-466-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes build errors for 'keyutils'

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/uclibc/0.9.33-arc/fix-susv3-legacy.patch |   36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/uclibc/0.9.33-arc/fix-susv3-legacy.patch

diff --git a/package/uclibc/0.9.33-arc/fix-susv3-legacy.patch b/package/uclibc/0.9.33-arc/fix-susv3-legacy.patch
new file mode 100644
index 0000000..a768024
--- /dev/null
+++ b/package/uclibc/0.9.33-arc/fix-susv3-legacy.patch
@@ -0,0 +1,36 @@
+From 3124ace804337d32974392e0a73a09cdc0d60fc8 Mon Sep 17 00:00:00 2001
+From: Mischa Jonker <mjonker@synopsys.com>
+Date: Mon, 15 Jul 2013 13:06:11 +0200
+Subject: [PATCH] ARC: Add alias 'index' to strcmp for susv3 legacy
+ compatibility
+
+This fixes build errors for 'keyutils'
+
+Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
+---
+ libc/string/arc/strchr.S |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libc/string/arc/strchr.S b/libc/string/arc/strchr.S
+index b9f28c0..8d51aa4 100644
+--- a/libc/string/arc/strchr.S
++++ b/libc/string/arc/strchr.S
+@@ -1,6 +1,7 @@
+ /* Copyright (C) 2007 ARC International (UK) LTD */
+ 
+ #include <bits/asm.h>
++#include <features.h>
+ 
+ /* ARC700 has a relatively long pipeline and branch prediction, so we want
+    to avoid branches that are hard to predict.  On the other hand, the
+@@ -115,3 +116,7 @@ ENTRY(strchr)
+ 	mov.mi	r0,0
+ #endif /* ENDIAN */
+ ENDFUNC(strchr)
++
++#ifdef __UCLIBC_SUSV3_LEGACY__
++strong_alias(strchr,index)
++#endif
+-- 
+1.7.9.5
+
-- 
1.7.9.5
