From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Jun 2014 10:02:50 +0300
Subject: [Buildroot] [PATCH] uclibc: fix build without LARGEFILE for xtensa
Message-ID: <0952b6a3333682b60256575e7f12e47c9d8cab13.1401778970.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default uClibc version for xtensa is broken when LARGEFILE is disabled.
Add a patch to fix this.

Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...-posix_fadvise-Fix-build-breakage-for-LFS.patch | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0002-libc-posix_fadvise-Fix-build-breakage-for-LFS.patch

diff --git a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0002-libc-posix_fadvise-Fix-build-breakage-for-LFS.patch b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0002-libc-posix_fadvise-Fix-build-breakage-for-LFS.patch
new file mode 100644
index 000000000000..b17ea5269dc0
--- /dev/null
+++ b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0002-libc-posix_fadvise-Fix-build-breakage-for-LFS.patch
@@ -0,0 +1,98 @@
+From patchwork Thu Jan  9 09:35:45 2014
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: libc: posix_fadvise: Fix build breakage for !LFS
+From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
+X-Patchwork-Id: 308533
+Message-Id: <1389260145-8810-1-git-send-email-vgupta@synopsys.com>
+To: <uclibc@uclibc.org>
+Cc: Francois.Bedard at synopsys.com, Vineet Gupta <Vineet.Gupta1@synopsys.com>, 
+ markos Chandras <markos.chandras@gmail.com>
+Date: Thu, 9 Jan 2014 15:05:45 +0530
+
+commit 00571b43df2e "libc: posix_fadvise: restore implementation for xtensa"
+enabled posix_fadvise() for all arches (it was just not generated
+before).
+
+However this also unearthed an issue introduced by ee84b8b400
+"linux: posix_fadvise: use new SYSCALL_ALIGN_64BIT" which is to
+referencing LFS'ish code (off64_t) w/o proper checks which causes build
+to break for !LFS.
+
+Fix this by calling posix_fadvise64() only for LFS case and open-code
+it's equivalent for !LFS.
+
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+Cc: Mike Frysinger <vapier@gentoo.org>
+Cc: Baruch Siach <baruch@tkos.co.il>
+Cc: Khem Raj <raj.khem@gmail.com>
+Cc: markos Chandras <markos.chandras@gmail.com>
+Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+
+---
+
+Patch status: sent upstream (http://patchwork.ozlabs.org/patch/308533/)
+
+libc/sysdeps/linux/common/posix_fadvise.c | 30 ++++++++++++++++++++++++------
+ 1 file changed, 24 insertions(+), 6 deletions(-)
+
+diff --git a/libc/sysdeps/linux/common/posix_fadvise.c b/libc/sysdeps/linux/common/posix_fadvise.c
+index 25c294178e5e..14bbeeea13bc 100644
+--- a/libc/sysdeps/linux/common/posix_fadvise.c
++++ b/libc/sysdeps/linux/common/posix_fadvise.c
+@@ -22,17 +22,34 @@
+ # include <endian.h>
+ # include <bits/wordsize.h>
+ 
+-# ifdef __NR_fadvise64_64
+-int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
+-# endif
++# if defined(__NR_fadvise64_64) && defined(__UCLIBC_HAS_LFS__)
++#include <_lfs_64.h>
+ 
++int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
+ int posix_fadvise(int fd, off_t offset, off_t len, int advice)
+ {
+-# ifdef __NR_fadvise64_64
+ 	return posix_fadvise64(fd, offset, len, advice);
+-# else
++}
++#else
++
++int posix_fadvise(int fd, off_t offset, off_t len, int advice)
++{
+ 	int ret;
+ 	INTERNAL_SYSCALL_DECL(err);
++
++# ifdef __NR_fadvise64_64
++#  if __WORDSIZE == 64
++	ret = INTERNAL_SYSCALL(fadvise64_64, err, 4, fd, offset, len, advice);
++#  else
++#   if defined(__UCLIBC_SYSCALL_ALIGN_64BIT__) || defined(__arm__)
++	ret = INTERNAL_SYSCALL(fadvise64_64, err, 6, fd, advice,
++			OFF_HI_LO (offset), OFF_HI_LO (len));
++#   else
++	ret = INTERNAL_SYSCALL(fadvise64_64, err, 6, fd,
++			OFF_HI_LO (offset), OFF_HI_LO (len), advice);
++#   endif
++#  endif
++# else  /* __NR_fadvise64 */
+ #  if __WORDSIZE == 64
+ 	ret = INTERNAL_SYSCALL(fadvise64, err, 4, fd, offset, len, advice);
+ #  else
+@@ -43,12 +60,13 @@ int posix_fadvise(int fd, off_t offset, off_t len, int advice)
+ #   endif
+ 			OFF_HI_LO (offset), len, advice);
+ #  endif
++#  endif
+ 	if (INTERNAL_SYSCALL_ERROR_P (ret, err))
+ 		return INTERNAL_SYSCALL_ERRNO (ret, err);
+ 	return 0;
+-#  endif
+ }
+ # if defined __UCLIBC_HAS_LFS__ && (!defined __NR_fadvise64_64 || __WORDSIZE == 64)
+ strong_alias(posix_fadvise,posix_fadvise64)
+ # endif
+ #endif
++#endif
-- 
2.0.0.rc2
