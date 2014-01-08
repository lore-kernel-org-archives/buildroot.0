From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  8 Jan 2014 12:16:33 +0200
Subject: [Buildroot] [PATCH 2/4] uclibc: xtensa: restore posix_fadvise
In-Reply-To: <cover.1389168903.git.baruch@tkos.co.il>
References: <cover.1389168903.git.baruch@tkos.co.il>
Message-ID: <4530342fbc11d02c54250cb51da9009c2c83a33f.1389175037.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the correct fix to
http://autobuild.buildroot.net/results/79c/79cdb149d349ce9fe2dffbf53e3ff127a050ed24/.
Commit c3d690166c (e2fsprogs: fix posix_fadvise() signature mismatch) fixed the
build failure, but not the underlying problem. The e2fsprogs internal
posix_fadvise() is broken, and upstream has removed it entirely.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ..._fadvise-restore-implementation-for-xtens.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0002-linux-posix_fadvise-restore-implementation-for-xtens.patch

diff --git a/package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0002-linux-posix_fadvise-restore-implementation-for-xtens.patch b/package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0002-linux-posix_fadvise-restore-implementation-for-xtens.patch
new file mode 100644
index 0000000..3d4c999
--- /dev/null
+++ b/package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0002-linux-posix_fadvise-restore-implementation-for-xtens.patch
@@ -0,0 +1,68 @@
+From 0613b77cea6a01e4ad7d12977ae601a97e1ffdc5 Mon Sep 17 00:00:00 2001
+Message-Id: <0613b77cea6a01e4ad7d12977ae601a97e1ffdc5.1389164521.git.baruch@tkos.co.il>
+In-Reply-To: <7dbb2e43f34f53305d7807018865691c430efe5e.1389164521.git.baruch@tkos.co.il>
+References: <7dbb2e43f34f53305d7807018865691c430efe5e.1389164521.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 5 Jan 2014 11:44:02 +0200
+Subject: [PATCH 2/3] linux: posix_fadvise: restore implementation for xtensa
+
+Commit ee84b8b400 (linux: posix_fadvise: use new SYSCALL_ALIGN_64BIT)
+removed posix_fadvise implementation for xtensa, since xtensa does not
+define __NR_fadvise64. Reuse the ARM support code to restore xtensa support.
+
+This commit is based Mike Frysinger's suggested patch.
+
+Patch status: posted upstream
+(http://lists.uclibc.org/pipermail/uclibc/2014-January/048148.html)
+
+Cc: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ libc/sysdeps/linux/common/posix_fadvise.c | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/libc/sysdeps/linux/common/posix_fadvise.c b/libc/sysdeps/linux/common/posix_fadvise.c
+index e102ce7..25c2941 100644
+--- a/libc/sysdeps/linux/common/posix_fadvise.c
++++ b/libc/sysdeps/linux/common/posix_fadvise.c
+@@ -10,18 +10,25 @@
+ 
+ #include <sys/syscall.h>
+ 
+-#if defined(__NR_fadvise64) || defined(__NR_arm_fadvise64_64)
++#ifdef __NR_arm_fadvise64_64
++/* We handle the 64bit alignment issue which is why the arm guys renamed their
++ * syscall in the first place.  So rename it back.
++ */
++# define __NR_fadvise64_64 __NR_arm_fadvise64_64
++#endif
++
++#if defined(__NR_fadvise64) || defined(__NR_fadvise64_64)
+ # include <fcntl.h>
+ # include <endian.h>
+ # include <bits/wordsize.h>
+ 
+-# ifdef __NR_arm_fadvise64_64
++# ifdef __NR_fadvise64_64
+ int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
+ # endif
+ 
+ int posix_fadvise(int fd, off_t offset, off_t len, int advice)
+ {
+-# ifdef __NR_arm_fadvise64_64
++# ifdef __NR_fadvise64_64
+ 	return posix_fadvise64(fd, offset, len, advice);
+ # else
+ 	int ret;
+@@ -41,7 +48,7 @@ int posix_fadvise(int fd, off_t offset, off_t len, int advice)
+ 	return 0;
+ #  endif
+ }
+-# if defined __UCLIBC_HAS_LFS__ && ((!defined __NR_fadvise64_64 && !defined __NR_arm_fadvise64_64) || __WORDSIZE == 64)
++# if defined __UCLIBC_HAS_LFS__ && (!defined __NR_fadvise64_64 || __WORDSIZE == 64)
+ strong_alias(posix_fadvise,posix_fadvise64)
+ # endif
+ #endif
+-- 
+1.8.5.2
+
-- 
1.8.5.2
