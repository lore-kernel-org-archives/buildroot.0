From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 26 Jul 2009 07:16:24 +0200
Subject: [Buildroot] [PATCH] Fix naming mismatch between directfb and kernel
 on "fusion" version numbers
Message-ID: <4A6BE6A8.9080400@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

directfb expects FUSION_API_MAJOR_PROVIDED and FUSION_API_MINOR_REQUIRED
At least some kernel versions provides FUSION_API_MAJOR and FUSION_API_MINOR
Since the expected names are not defined, directfb will break with the
error message:

"../../../lib/fusion/types.h:42:2: error: #error Major version of Fusion
Kernel Module too low! Upgrade your kernel."

This patch will set XXX_PROVIDED from XXX.


diff -urN directfb-1.4.1-0rig//lib/fusion/types.h
directfb-1.4.1/lib/fusion/types.h
--- directfb-1.4.1-0rig//lib/fusion/types.h    2009-06-02
18:47:23.000000000 +0200
+++ directfb-1.4.1/lib/fusion/types.h    2009-07-26 07:07:40.000000000 +0200
@@ -38,6 +38,19 @@
 #define FUSION_API_MAJOR_REQUIRED 8
 #define FUSION_API_MINOR_REQUIRED 0
 
+#if    !defined(FUSION_API_MAJOR_PROVIDED)
+#if    defined(FUSION_API_MAJOR)
+#define    FUSION_API_MAJOR_PROVIDED    FUSION_API_MAJOR
+#endif
+#endif
+
+#if    !defined(FUSION_API_MINOR_PROVIDED)
+#if    defined(FUSION_API_MINOR)
+#define    FUSION_API_MINOR_PROVIDED    FUSION_API_MINOR
+#endif
+#endif
+
+
 #if FUSION_API_MAJOR_REQUIRED > FUSION_API_MAJOR_PROVIDED
 #error Major version of Fusion Kernel Module too low! Upgrade your kernel.
 #else


BR
Ulf Samuelsson
