From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 12 Nov 2013 14:26:19 +0100
Subject: [Buildroot] [PATCH 6/7] uclibc: remove ARC-specific patches
In-Reply-To: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1384262780-12743-7-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/uclibc/0.9.33-arc/fix-fstat-for-be.patch   |   32 -----------------
 .../uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch  |   37 --------------------
 package/uclibc/0.9.33-arc/fix-susv3-legacy.patch   |   36 -------------------
 .../0.9.33-arc/uclibc-arc-add-__kernel_long.patch  |   29 ---------------
 4 files changed, 134 deletions(-)
 delete mode 100644 package/uclibc/0.9.33-arc/fix-fstat-for-be.patch
 delete mode 100644 package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch
 delete mode 100644 package/uclibc/0.9.33-arc/fix-susv3-legacy.patch
 delete mode 100644 package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch

diff --git a/package/uclibc/0.9.33-arc/fix-fstat-for-be.patch b/package/uclibc/0.9.33-arc/fix-fstat-for-be.patch
deleted file mode 100644
index 2cdb517..0000000
--- a/package/uclibc/0.9.33-arc/fix-fstat-for-be.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f394d65c74631a0e715bac582b09c302ee84114f Mon Sep 17 00:00:00 2001
-From: Mischa Jonker <mjonker@synopsys.com>
-Date: Tue, 23 Jul 2013 17:59:04 +0200
-Subject: [PATCH] libc/sysdeps: Fix common-generic stat.h for BE part 2
-
-Previous patch only fixed the build. This patch fixes the behavior at
-run-time as well.
-
-It fixes "Value too large for defined data type" messages caused by
-fstat syscall wrapper returning -EOVERFLOW.
-
-Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
----
- libc/sysdeps/linux/common-generic/bits/stat.h |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/common-generic/bits/stat.h b/libc/sysdeps/linux/common-generic/bits/stat.h
-index 07716ab..945c408 100644
---- a/libc/sysdeps/linux/common-generic/bits/stat.h
-+++ b/libc/sysdeps/linux/common-generic/bits/stat.h
-@@ -63,8 +63,8 @@ struct stat
-     unsigned long long __pad4;
-     long __pad5;
-     long st_size;				/* Size of file, in bytes. */
--    int __pad6;
-     int st_blksize;				/* Optimal block size for I/O. */
-+    int __pad6;
-     long __pad7;
-     long st_blocks;				/* Number 512-byte blocks allocated */
- # endif /* __LITTLE_ENDIAN */
---
-1.7.9.5
diff --git a/package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch b/package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch
deleted file mode 100644
index e0884ea..0000000
--- a/package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 0594ba53b9b8d9a1ac409fd187e4d1ba8f2e7f2a Mon Sep 17 00:00:00 2001
-From: Vineet Gupta <vgupta@synopsys.com>
-Date: Thu, 8 Aug 2013 15:41:51 +0530
-Subject: [PATCH] ARC: SuSv3 legacy support: Add "bcmp" alias for memcmp
-
-Although uClibc provides this already as UCLIBC_SUSV3_LEGACY_MACROS,
-that however requires UCLIBC_SUSV3_LEGACY to be switched off, causing a
-bunch of other things to be not available (usleep)
-
-Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
----
- libc/string/arc/memcmp.S | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libc/string/arc/memcmp.S b/libc/string/arc/memcmp.S
-index 0c7c345..cb25990 100644
---- a/libc/string/arc/memcmp.S
-+++ b/libc/string/arc/memcmp.S
-@@ -1,6 +1,7 @@
- /* Copyright (C) 2007 ARC International (UK) LTD */
- 
- #include <bits/asm.h>
-+#include <features.h>
- 
- #ifdef __LITTLE_ENDIAN__
- #define WORD2 r2
-@@ -115,3 +116,7 @@ ENTRY(memcmp)
- 	j_s.d	[blink]
- 	mov	r0,0
- ENDFUNC(memcmp)
-+
-+#ifdef __UCLIBC_SUSV3_LEGACY__
-+strong_alias(memcmp,bcmp)
-+#endif
--- 
-1.8.1.2
-
diff --git a/package/uclibc/0.9.33-arc/fix-susv3-legacy.patch b/package/uclibc/0.9.33-arc/fix-susv3-legacy.patch
deleted file mode 100644
index a768024..0000000
--- a/package/uclibc/0.9.33-arc/fix-susv3-legacy.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3124ace804337d32974392e0a73a09cdc0d60fc8 Mon Sep 17 00:00:00 2001
-From: Mischa Jonker <mjonker@synopsys.com>
-Date: Mon, 15 Jul 2013 13:06:11 +0200
-Subject: [PATCH] ARC: Add alias 'index' to strcmp for susv3 legacy
- compatibility
-
-This fixes build errors for 'keyutils'
-
-Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
----
- libc/string/arc/strchr.S |    5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libc/string/arc/strchr.S b/libc/string/arc/strchr.S
-index b9f28c0..8d51aa4 100644
---- a/libc/string/arc/strchr.S
-+++ b/libc/string/arc/strchr.S
-@@ -1,6 +1,7 @@
- /* Copyright (C) 2007 ARC International (UK) LTD */
- 
- #include <bits/asm.h>
-+#include <features.h>
- 
- /* ARC700 has a relatively long pipeline and branch prediction, so we want
-    to avoid branches that are hard to predict.  On the other hand, the
-@@ -115,3 +116,7 @@ ENTRY(strchr)
- 	mov.mi	r0,0
- #endif /* ENDIAN */
- ENDFUNC(strchr)
-+
-+#ifdef __UCLIBC_SUSV3_LEGACY__
-+strong_alias(strchr,index)
-+#endif
--- 
-1.7.9.5
-
diff --git a/package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch b/package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch
deleted file mode 100644
index caebac1..0000000
--- a/package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 5164fb28e9205626211d0436933e6eb4960be582 Mon Sep 17 00:00:00 2001
-From: Mischa Jonker <mjonker@synopsys.com>
-Date: Wed, 10 Jul 2013 09:05:25 +0200
-Subject: [PATCH] ARC: libc/sysdeps: add __kernel_long and __kernel_ulong
-
-Linux 3.4 added these two types and updated various exported header
-files to use them. While other architectures were updated before,
-this was not the case for ARC.
-
-This fixes the build failure with Linux 3.10 headers.
-
-Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
----
- libc/sysdeps/linux/arc/bits/kernel_types.h |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libc/sysdeps/linux/arc/bits/kernel_types.h b/libc/sysdeps/linux/arc/bits/kernel_types.h
-index fd52e1c..fc28fa1 100755
---- a/libc/sysdeps/linux/arc/bits/kernel_types.h
-+++ b/libc/sysdeps/linux/arc/bits/kernel_types.h
-@@ -39,6 +39,8 @@ typedef	__kernel_uid_t		__kernel_old_uid_t;
- typedef __kernel_gid_t		__kernel_old_gid_t;
- typedef long long		__kernel_loff_t;
- typedef unsigned int		__kernel_old_dev_t;
-+typedef long			__kernel_long_t;
-+typedef unsigned long		__kernel_ulong_t;
-
- typedef struct {
- #ifdef __USE_ALL
-- 
1.7.9.5
