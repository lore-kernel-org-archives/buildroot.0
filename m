From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2014 09:21:57 +0100
Subject: [Buildroot] [git commit] uClibc: 0.9.33.2: revert pread/pwrite
	patches from upstream git
Message-ID: <20140205083511.5FBBB9C7F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ed1dc66166b7d1eefc0995f343a3502f5a7f15e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pread/pwrite handling on the 0.9.33 branch doesn't take into
consideration architectures with an ABI requiring natural alignment for
64bit arguments (afaik ARM EABI, MIPS O32, PPC, SH and Xtensa), causing
havoc.

The issue has been brought with the uClibc developers, but so far a fix is
not available - So lets revert the patches for now as they cause real
issues.

For further details, see:

http://lists.busybox.net/pipermail/buildroot/2014-January/087050.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../uclibc-0014-pread-pwrite-backport-fix.patch    |  219 --------------------
 .../uclibc-0021-pread-pwrite-fix-for-threads.patch |   37 ----
 ...e-handle-renamed-syscalls-in-common-ppc-x.patch |  114 ----------
 ...d_write.c-unbreak-on-archs-without-__NR_p.patch |   36 ----
 4 files changed, 0 insertions(+), 406 deletions(-)

diff --git a/package/uclibc/0.9.33.2/uclibc-0014-pread-pwrite-backport-fix.patch b/package/uclibc/0.9.33.2/uclibc-0014-pread-pwrite-backport-fix.patch
deleted file mode 100644
index e04607c..0000000
--- a/package/uclibc/0.9.33.2/uclibc-0014-pread-pwrite-backport-fix.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From 342a3d861fde5651ee53486addbacddcec6a0a58 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <natanael.copa@gmail.com>
-Date: Sat, 4 Aug 2012 19:32:45 +0200
-Subject: [PATCH] pread/pwrite: backport fix
-
-pread/pwrite syscalls has been renamed to pread64/pwrite in 2.6 kernel.
-
-There was a fallback function using lseek for kernels who did not have
-this syscall (pre 2.1.60). This is broken in many ways.
-
-uclibc have been using the broken fallback due to they forgot to rename
-pread syscall.
-
-This got detected with git-1.7.11 which introduced threaded index-pack
-which broke in similar ways a windows (msys).
-
-This issue in uclibc have been reported upstream and fixed in git master
-so this patch does not need to be upstreamed. It might be an idea to
-backport it properly for 0.9.33 branch though.
-
-Signed-off-by: Natanael Copa <natanael.copa@gmail.com>
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
----
- libc/sysdeps/linux/common/pread_write.c |  143 ++++---------------------------
- 1 file changed, 19 insertions(+), 124 deletions(-)
-
-diff --git a/libc/sysdeps/linux/common/pread_write.c b/libc/sysdeps/linux/common/pread_write.c
-index 88e6957..baf8691 100644
---- a/libc/sysdeps/linux/common/pread_write.c
-+++ b/libc/sysdeps/linux/common/pread_write.c
-@@ -17,6 +17,7 @@
- #include <unistd.h>
- #include <stdint.h>
- #include <endian.h>
-+#include <sysdep-cancel.h>
- 
- extern __typeof(pread) __libc_pread;
- extern __typeof(pwrite) __libc_pwrite;
-@@ -27,15 +28,17 @@ extern __typeof(pwrite64) __libc_pwrite64;
- 
- #include <bits/kernel_types.h>
- 
--#ifdef __NR_pread
--
--# define __NR___syscall_pread __NR_pread
-+# define __NR___syscall_pread __NR_pread64
- static __inline__ _syscall5(ssize_t, __syscall_pread, int, fd, void *, buf,
- 		size_t, count, off_t, offset_hi, off_t, offset_lo)
- 
- ssize_t __libc_pread(int fd, void *buf, size_t count, off_t offset)
- {
--	return __syscall_pread(fd, buf, count, __LONG_LONG_PAIR(offset >> 31, offset));
-+	int oldtype = LIBC_CANCEL_ASYNC ();
-+	int result = __syscall_pread(fd, buf, count, __LONG_LONG_PAIR(offset >> 31, offset));
-+	LIBC_CANCEL_RESET (oldtype);
-+	return result;
-+
- }
- weak_alias(__libc_pread,pread)
- 
-@@ -44,22 +47,24 @@ ssize_t __libc_pread64(int fd, void *buf, size_t count, off64_t offset)
- {
- 	uint32_t low = offset & 0xffffffff;
- 	uint32_t high = offset >> 32;
--	return __syscall_pread(fd, buf, count, __LONG_LONG_PAIR(high, low));
-+	int oldtype = LIBC_CANCEL_ASYNC ();
-+	int result = __syscall_pread(fd, buf, count, __LONG_LONG_PAIR(high, low));
-+	LIBC_CANCEL_RESET (oldtype);
-+	return result;
- }
- weak_alias(__libc_pread64,pread64)
- # endif /* __UCLIBC_HAS_LFS__  */
- 
--#endif /* __NR_pread */
--
--#ifdef __NR_pwrite
--
--# define __NR___syscall_pwrite __NR_pwrite
-+# define __NR___syscall_pwrite __NR_pwrite64
- static __inline__ _syscall5(ssize_t, __syscall_pwrite, int, fd, const void *, buf,
- 		size_t, count, off_t, offset_hi, off_t, offset_lo)
- 
- ssize_t __libc_pwrite(int fd, const void *buf, size_t count, off_t offset)
- {
--	return __syscall_pwrite(fd, buf, count, __LONG_LONG_PAIR(offset >> 31, offset));
-+	int oldtype = LIBC_CANCEL_ASYNC ();
-+	int result = __syscall_pwrite(fd, buf, count, __LONG_LONG_PAIR(offset >> 31, offset));
-+	LIBC_CANCEL_RESET (oldtype);
-+	return result;
- }
- weak_alias(__libc_pwrite,pwrite)
- 
-@@ -68,120 +73,10 @@ ssize_t __libc_pwrite64(int fd, const void *buf, size_t count, off64_t offset)
- {
- 	uint32_t low = offset & 0xffffffff;
- 	uint32_t high = offset >> 32;
--	return __syscall_pwrite(fd, buf, count, __LONG_LONG_PAIR(high, low));
--}
--weak_alias(__libc_pwrite64,pwrite64)
--# endif /* __UCLIBC_HAS_LFS__  */
--#endif /* __NR_pwrite */
--
--#if ! defined __NR_pread || ! defined __NR_pwrite
--
--static ssize_t __fake_pread_write(int fd, void *buf,
--		size_t count, off_t offset, int do_pwrite)
--{
--	int save_errno;
--	ssize_t result;
--	off_t old_offset;
--
--	/* Since we must not change the file pointer preserve the
--	 * value so that we can restore it later.  */
--	if ((old_offset=lseek(fd, 0, SEEK_CUR)) == (off_t) -1)
--		return -1;
--
--	/* Set to wanted position.  */
--	if (lseek(fd, offset, SEEK_SET) == (off_t) -1)
--		return -1;
--
--	if (do_pwrite == 1) {
--		/* Write the data.  */
--		result = write(fd, buf, count);
--	} else {
--		/* Read the data.  */
--		result = read(fd, buf, count);
--	}
--
--	/* Now we have to restore the position.  If this fails we
--	 * have to return this as an error.  */
--	save_errno = errno;
--	if (lseek(fd, old_offset, SEEK_SET) == (off_t) -1)
--	{
--		if (result == -1)
--			__set_errno(save_errno);
--		return -1;
--	}
--	__set_errno(save_errno);
--	return(result);
--}
--
--# ifdef __UCLIBC_HAS_LFS__
--
--static ssize_t __fake_pread_write64(int fd, void *buf,
--		size_t count, off64_t offset, int do_pwrite)
--{
--	int save_errno;
--	ssize_t result;
--	off64_t old_offset;
--
--	/* Since we must not change the file pointer preserve the
--	 * value so that we can restore it later.  */
--	if ((old_offset=lseek64(fd, 0, SEEK_CUR)) == (off64_t) -1)
--		return -1;
--
--	/* Set to wanted position.  */
--	if (lseek64(fd, offset, SEEK_SET) == (off64_t) -1)
--		return -1;
--
--	if (do_pwrite == 1) {
--		/* Write the data.  */
--		result = write(fd, buf, count);
--	} else {
--		/* Read the data.  */
--		result = read(fd, buf, count);
--	}
--
--	/* Now we have to restore the position. */
--	save_errno = errno;
--	if (lseek64(fd, old_offset, SEEK_SET) == (off64_t) -1) {
--		if (result == -1)
--			__set_errno (save_errno);
--		return -1;
--	}
--	__set_errno (save_errno);
-+	int oldtype = LIBC_CANCEL_ASYNC ();
-+	int result = __syscall_pwrite(fd, buf, count, __LONG_LONG_PAIR(high, low));
-+	LIBC_CANCEL_RESET (oldtype);
- 	return result;
- }
--# endif /* __UCLIBC_HAS_LFS__  */
--#endif /*  ! defined __NR_pread || ! defined __NR_pwrite */
--
--#ifndef __NR_pread
--ssize_t __libc_pread(int fd, void *buf, size_t count, off_t offset)
--{
--	return __fake_pread_write(fd, buf, count, offset, 0);
--}
--weak_alias(__libc_pread,pread)
--
--# ifdef __UCLIBC_HAS_LFS__
--ssize_t __libc_pread64(int fd, void *buf, size_t count, off64_t offset)
--{
--	return __fake_pread_write64(fd, buf, count, offset, 0);
--}
--weak_alias(__libc_pread64,pread64)
--# endif /* __UCLIBC_HAS_LFS__  */
--#endif /* ! __NR_pread */
--
--#ifndef __NR_pwrite
--ssize_t __libc_pwrite(int fd, const void *buf, size_t count, off_t offset)
--{
--	/* we won't actually be modifying the buffer,
--	 *just cast it to get rid of warnings */
--	return __fake_pread_write(fd, (void*)buf, count, offset, 1);
--}
--weak_alias(__libc_pwrite,pwrite)
--
--# ifdef __UCLIBC_HAS_LFS__
--ssize_t __libc_pwrite64(int fd, const void *buf, size_t count, off64_t offset)
--{
--	return __fake_pread_write64(fd, (void*)buf, count, offset, 1);
--}
- weak_alias(__libc_pwrite64,pwrite64)
- # endif /* __UCLIBC_HAS_LFS__  */
--#endif /* ! __NR_pwrite */
--- 
-1.7.10.4
-
diff --git a/package/uclibc/0.9.33.2/uclibc-0021-pread-pwrite-fix-for-threads.patch b/package/uclibc/0.9.33.2/uclibc-0021-pread-pwrite-fix-for-threads.patch
deleted file mode 100644
index 5b95dd8..0000000
--- a/package/uclibc/0.9.33.2/uclibc-0021-pread-pwrite-fix-for-threads.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b7cc54be07412f02ff464aa47a8871ba7a910e3e Mon Sep 17 00:00:00 2001
-From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Date: Tue, 8 Jan 2013 10:14:22 +0100
-Subject: [PATCH] pread/pwrite: fix for !threads
-
-This is done properly via cancel.h on master.
-
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
----
- libc/sysdeps/linux/common/pread_write.c |   11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/common/pread_write.c b/libc/sysdeps/linux/common/pread_write.c
-index baf8691..c142038 100644
---- a/libc/sysdeps/linux/common/pread_write.c
-+++ b/libc/sysdeps/linux/common/pread_write.c
-@@ -17,7 +17,16 @@
- #include <unistd.h>
- #include <stdint.h>
- #include <endian.h>
--#include <sysdep-cancel.h>
-+#ifdef __UCLIBC_HAS_THREADS_NATIVE__
-+#include "sysdep-cancel.h"
-+#else
-+/* No multi-thread handling enabled.  */
-+#define SINGLE_THREAD_P (1)
-+#define RTLD_SINGLE_THREAD_P (1)
-+#define LIBC_CANCEL_ASYNC()	0 /* Just a dummy value.  */
-+#define LIBC_CANCEL_RESET(val)	((void)(val)) /* Nothing, but evaluate it.  */
-+#define LIBC_CANCEL_HANDLED()	/* Nothing.  */
-+#endif
- 
- extern __typeof(pread) __libc_pread;
- extern __typeof(pwrite) __libc_pwrite;
--- 
-1.7.10.4
-
diff --git a/package/uclibc/0.9.33.2/uclibc-0032-pread-pwrite-handle-renamed-syscalls-in-common-ppc-x.patch b/package/uclibc/0.9.33.2/uclibc-0032-pread-pwrite-handle-renamed-syscalls-in-common-ppc-x.patch
deleted file mode 100644
index 6e6d881..0000000
--- a/package/uclibc/0.9.33.2/uclibc-0032-pread-pwrite-handle-renamed-syscalls-in-common-ppc-x.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 923e6f201b1d792cf069ca7f13c3715f4e9c9353 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Wed, 30 May 2012 01:15:03 -0400
-Subject: [PATCH] pread/pwrite: handle renamed syscalls in common/ppc/xtensa
- code
-
-Some arches got this fix, but many did not.  So copy the ifdef logic to
-the ones that missed it to fix behavior in linux-2.6+.
-
-URL: https://bugs.busybox.net/show_bug.cgi?id=5258
-Reported-by: David Laight <david.laight@aculab.com>
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
----
- libc/sysdeps/linux/common/pread_write.c  |   12 +++++++++++-
- libc/sysdeps/linux/powerpc/pread_write.c |   13 +++++++++++++
- libc/sysdeps/linux/xtensa/pread_write.c  |   14 ++++++++++++++
- 3 files changed, 38 insertions(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/common/pread_write.c b/libc/sysdeps/linux/common/pread_write.c
-index c142038..b13de66 100644
---- a/libc/sysdeps/linux/common/pread_write.c
-+++ b/libc/sysdeps/linux/common/pread_write.c
-@@ -35,6 +35,11 @@ extern __typeof(pread64) __libc_pread64;
- extern __typeof(pwrite64) __libc_pwrite64;
- #endif
- 
-+#ifdef __NR_pread64             /* Newer kernels renamed but it's the same.  */
-+# undef __NR_pread
-+# define __NR_pread __NR_pread64
-+#endif
-+
- #include <bits/kernel_types.h>
- 
- # define __NR___syscall_pread __NR_pread64
-@@ -64,7 +69,12 @@ ssize_t __libc_pread64(int fd, void *buf, size_t count, off64_t offset)
- weak_alias(__libc_pread64,pread64)
- # endif /* __UCLIBC_HAS_LFS__  */
- 
--# define __NR___syscall_pwrite __NR_pwrite64
-+#ifdef __NR_pwrite64             /* Newer kernels renamed but it's the same.  */
-+# undef __NR_pwrite
-+# define __NR_pwrite __NR_pwrite64
-+#endif
-+
-+# define __NR___syscall_pwrite __NR_pwrite
- static __inline__ _syscall5(ssize_t, __syscall_pwrite, int, fd, const void *, buf,
- 		size_t, count, off_t, offset_hi, off_t, offset_lo)
- 
-diff --git a/libc/sysdeps/linux/powerpc/pread_write.c b/libc/sysdeps/linux/powerpc/pread_write.c
-index 7f988d3..23f256f 100644
---- a/libc/sysdeps/linux/powerpc/pread_write.c
-+++ b/libc/sysdeps/linux/powerpc/pread_write.c
-@@ -20,6 +20,13 @@
- # define off64_t off_t
- #endif
- 
-+#ifdef __NR_pread64             /* Newer kernels renamed but it's the same.  */
-+# ifdef __NR_pread
-+#  error "__NR_pread and __NR_pread64 both defined???"
-+# endif
-+# define __NR_pread __NR_pread64
-+#endif
-+
- #ifdef __NR_pread
- extern __typeof(pread) __libc_pread;
- # define __NR___syscall_pread __NR_pread
-@@ -42,6 +49,12 @@ weak_alias(__libc_pread64,pread64)
- # endif /* __UCLIBC_HAS_LFS__  */
- #endif /* __NR_pread */
- 
-+#ifdef __NR_pwrite64            /* Newer kernels renamed but it's the same.  */
-+# ifdef __NR_pwrite
-+#  error "__NR_pwrite and __NR_pwrite64 both defined???"
-+# endif
-+# define __NR_pwrite __NR_pwrite64
-+#endif
- 
- #ifdef __NR_pwrite
- extern __typeof(pwrite) __libc_pwrite;
-diff --git a/libc/sysdeps/linux/xtensa/pread_write.c b/libc/sysdeps/linux/xtensa/pread_write.c
-index 71ba22b..bcf7dee 100644
---- a/libc/sysdeps/linux/xtensa/pread_write.c
-+++ b/libc/sysdeps/linux/xtensa/pread_write.c
-@@ -27,6 +27,13 @@ extern __typeof(pwrite64) __libc_pwrite64;
- 
- #include <bits/kernel_types.h>
- 
-+#ifdef __NR_pread64             /* Newer kernels renamed but it's the same.  */
-+# ifdef __NR_pread
-+#  error "__NR_pread and __NR_pread64 both defined???"
-+# endif
-+# define __NR_pread __NR_pread64
-+#endif
-+
- #ifdef __NR_pread
- 
- # define __NR___syscall_pread __NR_pread
-@@ -52,6 +59,13 @@ weak_alias(__libc_pread64,pread64)
- 
- #endif /* __NR_pread */
- 
-+#ifdef __NR_pwrite64            /* Newer kernels renamed but it's the same.  */
-+# ifdef __NR_pwrite
-+#  error "__NR_pwrite and __NR_pwrite64 both defined???"
-+# endif
-+# define __NR_pwrite __NR_pwrite64
-+#endif
-+
- #ifdef __NR_pwrite
- 
- # define __NR___syscall_pwrite __NR_pwrite
--- 
-1.7.10.4
-
diff --git a/package/uclibc/0.9.33.2/uclibc-0054-common-pread_write.c-unbreak-on-archs-without-__NR_p.patch b/package/uclibc/0.9.33.2/uclibc-0054-common-pread_write.c-unbreak-on-archs-without-__NR_p.patch
deleted file mode 100644
index b071493..0000000
--- a/package/uclibc/0.9.33.2/uclibc-0054-common-pread_write.c-unbreak-on-archs-without-__NR_p.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1f7602f1dde43b12bead54433934ae4ddefa8118 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 4 Oct 2013 21:09:09 +0200
-Subject: [PATCH-0.9.33] common/pread_write.c: unbreak on archs without __NR_pread64
-
-Some archs (avr32 in particular) still doesn't define __NR_pread64, so
-we should fall back to __NR_pread if it isn't available.
-
-The code nicely checks for it, but then ends up hard coding the syscall
-to use __NR_pread64 afterwards, rendering the check useless. Fix it by
-using the result of the test instead.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
-Noticed when adding the pending patches for 0.9.33.3 to Buildroot:
-http://jenkins.free-electrons.com/job/buildroot/config=atstk100x_defconfig/116/console
-
- libc/sysdeps/linux/common/pread_write.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/common/pread_write.c b/libc/sysdeps/linux/common/pread_write.c
-index b13de66..8562ab4 100644
---- a/libc/sysdeps/linux/common/pread_write.c
-+++ b/libc/sysdeps/linux/common/pread_write.c
-@@ -42,7 +42,7 @@ extern __typeof(pwrite64) __libc_pwrite64;
- 
- #include <bits/kernel_types.h>
- 
--# define __NR___syscall_pread __NR_pread64
-+# define __NR___syscall_pread __NR_pread
- static __inline__ _syscall5(ssize_t, __syscall_pread, int, fd, void *, buf,
- 		size_t, count, off_t, offset_hi, off_t, offset_lo)
- 
--- 
-1.7.10.4
-
