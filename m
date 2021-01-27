From: =?UTF-8?q?Geoffrey=20Le=20Gourri=C3=A9rec?= <geoffrey.legourrierec@gmail.com>
Date: Wed, 27 Jan 2021 12:56:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/uclibc: Patch with updated kernel
 time definitions
In-Reply-To: <20210127115648.15340-1-geoffrey.legourrierec@gmail.com>
References: <20210127115648.15340-1-geoffrey.legourrierec@gmail.com>
Message-ID: <20210127115648.15340-2-geoffrey.legourrierec@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building uclibc 1.0.37 for SuperH architecture with linux-headers 5.10.7
fails at libpthread level due to missing time-related data structures,
usually defined by the kernel. Make uclibc correctly define those types.

A previous patch in buildroot [1] fixed the symptom by tampering with
linux-headers inclusions, but analysis [2] done in collaboration with
Linux folks concluded that the issue lied in (voluntary) include guard
"preemption" in uclibc kernel_types.h.
However, kernel_types.h was not up to date with relevant 64-bit time
data structures, so defining those here was needed.

The present uclibc patch was mailed to uclibc-ng mailing list and got
a positive response; I am not able to give a link to the discussion,
as it has not appeared yet [3] (perhaps I'm not looking at the right
place ?)
So until the patch is merged upstream and we bump uclibc version, keep
our patch here.

[1] https://git.buildroot.net/buildroot/commit/?id=742f37de8d0e3797698411dfc6a63bd7e98aafe2
[2] https://patchwork.kernel.org/project/linux-sh/patch/20210123165652.10884-1-geoffrey.legourrierec at gmail.com/
[3] https://mailman.uclibc-ng.org/pipermail/devel/2021-January/thread.html

Signed-off-by: Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com>
---
 ...sh-Add-64-bit-time-types-from-kernel.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/uclibc/0001-arch-sh-Add-64-bit-time-types-from-kernel.patch

diff --git a/package/uclibc/0001-arch-sh-Add-64-bit-time-types-from-kernel.patch b/package/uclibc/0001-arch-sh-Add-64-bit-time-types-from-kernel.patch
new file mode 100644
index 0000000000..aec8fcda9f
--- /dev/null
+++ b/package/uclibc/0001-arch-sh-Add-64-bit-time-types-from-kernel.patch
@@ -0,0 +1,33 @@
+From 385f2b18ccde15f72a6e8aee4c960a5bc18481d7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Geoffrey=20Le=20Gourri=C3=A9rec?=
+ <geoffrey.legourrierec@gmail.com>
+Date: Tue, 26 Jan 2021 20:39:36 +0100
+Subject: [PATCH] arch/sh: Add 64-bit time types from kernel
+
+---
+ libc/sysdeps/linux/sh/bits/kernel_types.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libc/sysdeps/linux/sh/bits/kernel_types.h b/libc/sysdeps/linux/sh/bits/kernel_types.h
+index ac97261e6..90b2e66b6 100644
+--- a/libc/sysdeps/linux/sh/bits/kernel_types.h
++++ b/libc/sysdeps/linux/sh/bits/kernel_types.h
+@@ -21,6 +21,7 @@ typedef unsigned int	__kernel_size_t;
+ typedef int		__kernel_ssize_t;
+ typedef int		__kernel_ptrdiff_t;
+ typedef long		__kernel_time_t;
++typedef long long	__kernel_time64_t;
+ typedef long		__kernel_suseconds_t;
+ typedef long		__kernel_clock_t;
+ typedef int		__kernel_daddr_t;
+@@ -33,6 +34,7 @@ typedef unsigned short	__kernel_old_uid_t;
+ typedef unsigned short	__kernel_old_gid_t;
+ typedef __kernel_dev_t	__kernel_old_dev_t;
+ typedef long		__kernel_long_t;
++typedef __kernel_long_t	__kernel_old_time_t;
+ typedef unsigned long	__kernel_ulong_t;
+ typedef long long	__kernel_loff_t;
+ 
+-- 
+2.17.1
+
-- 
2.17.1
