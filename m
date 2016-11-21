From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 21 Nov 2016 17:08:05 +0300
Subject: [Buildroot] [PATCH] mpfr: Fix obsolete ARC asm constraints
Message-ID: <1479737285-3329-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"mpfr" library build was failing due to obsolete ARC asm constraints.

This commit replaces obsolete "J" constraints with up-to-date "Cal"
ones in order to fix "mpfr" build for ARC.

Fixes:
http://autobuild.buildroot.net/results/579/579de571270ad562fbb1699224d557d16276704b//

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 .../0001-Fix-obsolete-ARC-asm-constraints.patch    | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch

diff --git a/package/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch b/package/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch
new file mode 100644
index 0000000..12590cf
--- /dev/null
+++ b/package/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch
@@ -0,0 +1,37 @@
+mpfr-longlong.h: Fix obsolete ARC asm constraints
+
+This patch replaces obsolete ARC "J" asm constraint with
+up-to-date "Cal" constraint.
+The patch should be applied to upstream "mpfr" library and
+after that it should be removed from buildroot as soon as 
+mpfr version with current fix will come up.
+
+Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+---
+Index: /src/mpfr-longlong.h
+===================================================================
+--- /src/mpfr-longlong.h	(revision 10963)
++++ /src/mpfr-longlong.h	(working copy)
+@@ -416,17 +416,17 @@
+ 	   : "=r" (sh),							\
+ 	     "=&r" (sl)							\
+ 	   : "r"  ((USItype) (ah)),					\
+-	     "rIJ" ((USItype) (bh)),					\
++	     "rICal" ((USItype) (bh)),					\
+ 	     "%r" ((USItype) (al)),					\
+-	     "rIJ" ((USItype) (bl)))
++	     "rICal" ((USItype) (bl)))
+ #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
+   __asm__ ("sub.f\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
+ 	   : "=r" (sh),							\
+ 	     "=&r" (sl)							\
+ 	   : "r" ((USItype) (ah)),					\
+-	     "rIJ" ((USItype) (bh)),					\
++	     "rICal" ((USItype) (bh)),					\
+ 	     "r" ((USItype) (al)),					\
+-	     "rIJ" ((USItype) (bl)))
++	     "rICal" ((USItype) (bl)))
+ #endif
+ 
+ #if defined (__arm__) && (defined (__thumb2__) || !defined (__thumb__)) \
-- 
2.6.3
