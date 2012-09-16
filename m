From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Sep 2012 22:28:36 +0200
Subject: [Buildroot] [PATCH] libmad: add Thumb2 patches from Debian
Message-ID: <1347827317-23343-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes recurrent libmad build failures reported by the
autobuilder. See:

  http://autobuild.buildroot.net/results/a10c943e74b6e67e69183a35b5762482e357a75f/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libmad/libmad-0.15.1b-thumb2-fixed-arm.patch   |   40 ++++++++++++++++++++
 .../libmad/libmad-0.15.1b-thumb2-imdct-arm.patch   |   20 ++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 package/libmad/libmad-0.15.1b-thumb2-fixed-arm.patch
 create mode 100644 package/libmad/libmad-0.15.1b-thumb2-imdct-arm.patch

diff --git a/package/libmad/libmad-0.15.1b-thumb2-fixed-arm.patch b/package/libmad/libmad-0.15.1b-thumb2-fixed-arm.patch
new file mode 100644
index 0000000..befda48
--- /dev/null
+++ b/package/libmad/libmad-0.15.1b-thumb2-fixed-arm.patch
@@ -0,0 +1,40 @@
+Fixes Thumb2-related build failure
+
+Patch below comes from the Debian libmad package.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+From: Dave Martin
+Subject: "rsc" doesnt exist anymore in thumb2
+
+diff --git a/fixed.h b/fixed.h
+index 4b58abf..ba4bc26 100644
+--- a/fixed.h
++++ b/fixed.h
+@@ -275,12 +275,25 @@ mad_fixed_t mad_f_mul_inline(mad_fixed_t x, mad_fixed_t y)
+ 	 : "+r" (lo), "+r" (hi)  \
+ 	 : "%r" (x), "r" (y))
+ 
++#ifdef __thumb__
++/* In Thumb-2, the RSB-immediate instruction is only allowed with a zero
++	operand.  If needed this code can also support Thumb-1 
++	(simply append "s" to the end of the second two instructions). */
++#  define MAD_F_MLN(hi, lo)  \
++    asm ("rsbs        %0, %0, #0\n\t"  \
++	 "sbc   %1, %1, %1\n\t"  \
++	 "sub   %1, %1, %2"  \
++	 : "+&r" (lo), "=&r" (hi)  \
++	 : "r" (hi)  \
++	 : "cc")
++#else /* ! __thumb__ */
+ #  define MAD_F_MLN(hi, lo)  \
+     asm ("rsbs	%0, %2, #0\n\t"  \
+ 	 "rsc	%1, %3, #0"  \
+-	 : "=r" (lo), "=r" (hi)  \
++	 : "=&r" (lo), "=r" (hi)  \
+ 	 : "0" (lo), "1" (hi)  \
+ 	 : "cc")
++#endif /* __thumb__ */
+ 
+ #  define mad_f_scale64(hi, lo)  \
+     ({ mad_fixed_t __result;  \
diff --git a/package/libmad/libmad-0.15.1b-thumb2-imdct-arm.patch b/package/libmad/libmad-0.15.1b-thumb2-imdct-arm.patch
new file mode 100644
index 0000000..414b9c8
--- /dev/null
+++ b/package/libmad/libmad-0.15.1b-thumb2-imdct-arm.patch
@@ -0,0 +1,20 @@
+Fixes Thumb2 related build failure
+
+Patch below comes from the Debian libmad package.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+From: Konstantinos Margaritis <markos@debian.org>
+Subject: use "adr" instead of "add" to make code ready for thumb2
+
+--- ./imdct_l_arm.S.orig	2010-02-25 13:25:23.000000000 +0100
++++ ./imdct_l_arm.S	2010-02-25 13:27:26.000000000 +0100
+@@ -468,7 +468,7 @@
+ 
+     @----
+ 
+-    add     r2, pc, #(imdct36_long_karray-.-8)  @ r2 = base address of Knn array (PIC safe ?)
++    adr     r2, imdct36_long_karray
+ 
+ 
+ loop:
-- 
1.7.9.5
