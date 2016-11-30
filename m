From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 16:14:47 +0100
Subject: [Buildroot] [git commit] uclibc: disable posix_madvise for noMMU
Message-ID: <20161130151601.908CB803D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0689e77eecb88dc204688e9db670d56e4366f83f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the madvise defines are disabled for noMMU targets,
architectures with MMU and noMMU support as ARM are failing to compile
in noMMU mode, since the defines are used internally in posix_madvise.c.

Disable compilation for posix_madvise() for noMMU.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...003-posix_madvise-not-available-for-noMMU.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/uclibc/0003-posix_madvise-not-available-for-noMMU.patch b/package/uclibc/0003-posix_madvise-not-available-for-noMMU.patch
new file mode 100644
index 0000000..008aac7
--- /dev/null
+++ b/package/uclibc/0003-posix_madvise-not-available-for-noMMU.patch
@@ -0,0 +1,30 @@
+From 9945c6d21797553e78cbef8034f6dd16b3824df5 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 28 Nov 2016 07:31:00 +0100
+Subject: [PATCH] posix_madvise not available for noMMU
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libc/sysdeps/linux/common/posix_madvise.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libc/sysdeps/linux/common/posix_madvise.c b/libc/sysdeps/linux/common/posix_madvise.c
+index 2f95bcb..541dabe 100644
+--- a/libc/sysdeps/linux/common/posix_madvise.c
++++ b/libc/sysdeps/linux/common/posix_madvise.c
+@@ -4,6 +4,7 @@
+ #include <sys/mman.h>
+ #include <sys/syscall.h>
+ 
++#ifdef __ARCH_USE_MMU__
+ #if defined __NR_madvise && defined __USE_XOPEN2K && defined __UCLIBC_HAS_ADVANCED_REALTIME__
+ int posix_madvise(void *addr, size_t len, int advice)
+ {
+@@ -23,3 +24,4 @@ int posix_madvise(void *addr, size_t len, int advice)
+ 	return INTERNAL_SYSCALL_ERRNO (result, err);
+ }
+ #endif
++#endif
+-- 
+2.1.4
+
