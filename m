From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 May 2012 11:27:21 +0200
Subject: [Buildroot] [PATCH 3/4] speex: make it compilable in Thumb-2 mode
In-Reply-To: <1336469242-1099-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1336469242-1099-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1336469242-1099-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes build failures such as
http://autobuild.buildroot.org/results/901e8fe6df0e568624f1ceffc1979c5010e19328/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/speex/speex-thumb2-support.patch |  220 ++++++++++++++++++++++++++++++
 1 file changed, 220 insertions(+)
 create mode 100644 package/speex/speex-thumb2-support.patch

diff --git a/package/speex/speex-thumb2-support.patch b/package/speex/speex-thumb2-support.patch
new file mode 100644
index 0000000..b6f7369
--- /dev/null
+++ b/package/speex/speex-thumb2-support.patch
@@ -0,0 +1,220 @@
+Make speex Thumb2 compatible
+
+Patch written by Michael Hope from Linaro, available at
+http://lists.xiph.org/pipermail/speex-dev/2010-November/008041.html.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff --git a/libspeex/filters_arm4.h b/libspeex/filters_arm4.h
+index 7a74042..6ec1f75 100644
+--- a/libspeex/filters_arm4.h
++++ b/libspeex/filters_arm4.h
+@@ -47,8 +47,10 @@ int normalize16(const spx_sig_t *x, spx_word16_t *y, spx_sig_t max_scale, int le
+ 
+          "\tldr %4, [%0], #4 \n"
+          "\tcmps %4, %1 \n"
++         "\tit gt \n"
+          "\tmovgt %1, %4 \n"
+          "\tcmps %4, %3 \n"
++         "\tit lt \n"
+          "\tmovlt %3, %4 \n"
+ 
+          "\tsubs %2, %2, #1 \n"
+@@ -56,6 +58,7 @@ int normalize16(const spx_sig_t *x, spx_word16_t *y, spx_sig_t max_scale, int le
+ 
+          "\trsb %3, %3, #0 \n"
+          "\tcmp %1, %3 \n"
++         "\tit lt \n"
+          "\tmovlt %1, %3 \n"
+    : "=r" (dead1), "=r" (max_val), "=r" (dead3), "=r" (dead4),
+    "=r" (dead5), "=r" (dead6)
+diff --git a/libspeex/fixed_arm4.h b/libspeex/fixed_arm4.h
+index b6981ca..b6218ca 100644
+--- a/libspeex/fixed_arm4.h
++++ b/libspeex/fixed_arm4.h
+@@ -69,72 +69,90 @@ static inline short DIV32_16(int a, int b)
+    __asm__ __volatile__ (
+          "\teor %5, %0, %1\n"
+          "\tmovs %4, %0\n"
++         "\tit mi \n"
+          "\trsbmi %0, %0, #0 \n"
+          "\tmovs %4, %1\n"
++         "\tit mi \n"
+          "\trsbmi %1, %1, #0 \n"
+          "\tmov %4, #1\n"
+ 
+          "\tsubs %3, %0, %1, asl #14 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #14 \n"
+ 
+          "\tsubs %3, %0, %1, asl #13 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #13 \n"
+ 
+          "\tsubs %3, %0, %1, asl #12 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #12 \n"
+ 
+          "\tsubs %3, %0, %1, asl #11 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #11 \n"
+ 
+          "\tsubs %3, %0, %1, asl #10 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #10 \n"
+ 
+          "\tsubs %3, %0, %1, asl #9 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #9 \n"
+ 
+          "\tsubs %3, %0, %1, asl #8 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #8 \n"
+ 
+          "\tsubs %3, %0, %1, asl #7 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #7 \n"
+ 
+          "\tsubs %3, %0, %1, asl #6 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #6 \n"
+          
+          "\tsubs %3, %0, %1, asl #5 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #5 \n"
+ 
+          "\tsubs %3, %0, %1, asl #4 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #4 \n"
+ 
+          "\tsubs %3, %0, %1, asl #3 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #2 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #2 \n"
+ 
+          "\tsubs %3, %0, %1, asl #1 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4, asl #1 \n"
+ 
+          "\tsubs %3, %0, %1 \n"
++         "\titt pl \n"
+          "\tmovpl %0, %3 \n"
+          "\torrpl %2, %2, %4 \n"
+ 
+          "\tmovs %5, %5, lsr #31 \n"
++         "\tit ne \n"
+          "\trsbne %2, %2, #0 \n"
+    : "=r" (dead1), "=r" (dead2), "=r" (res),
+    "=r" (dead3), "=r" (dead4), "=r" (dead5)
+diff --git a/libspeex/fixed_arm5e.h b/libspeex/fixed_arm5e.h
+index 9b4861c..bdadd02 100644
+--- a/libspeex/fixed_arm5e.h
++++ b/libspeex/fixed_arm5e.h
+@@ -97,72 +97,90 @@ static inline short DIV32_16(int a, int b)
+    __asm__ __volatile__ (
+          "\teor %5, %0, %1\n"
+          "\tmovs %4, %0\n"
++         "\tit mi \n"
+          "\trsbmi %0, %0, #0 \n"
+          "\tmovs %4, %1\n"
++         "\tit mi \n"
+          "\trsbmi %1, %1, #0 \n"
+          "\tmov %4, #1\n"
+ 
+          "\tsubs %3, %0, %1, asl #14 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #14 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #13 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #13 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #12 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #12 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #11 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #11 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #10 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #10 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #9 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #9 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #8 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #8 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #7 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #7 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #6 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #6 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #5 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #5 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #4 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #4 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #3 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #3 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #2 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #2 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1, asl #1 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4, asl #1 \n"
+          "\tmovpl %0, %3 \n"
+ 
+          "\tsubs %3, %0, %1 \n"
++         "\titt pl \n"
+          "\torrpl %2, %2, %4 \n"
+          "\tmovpl %0, %3 \n"
+          
+          "\tmovs %5, %5, lsr #31 \n"
++         "\tit ne \n"
+          "\trsbne %2, %2, #0 \n"
+    : "=r" (dead1), "=r" (dead2), "=r" (res),
+    "=r" (dead3), "=r" (dead4), "=r" (dead5)
-- 
1.7.9.5
