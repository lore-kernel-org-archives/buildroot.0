From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Jul 2013 22:19:53 +0200
Subject: [Buildroot] [git commit] uclibc: arc: add patch to fix strcmp/index
	susv3 legacy
Message-ID: <20130715211528.5993A9A34B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd9c3e2bdaaea7bc54b2ea2c979a2ae061ed5149
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes build errors for 'keyutils'

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uclibc/0.9.33-arc/fix-susv3-legacy.patch |   36 ++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

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
