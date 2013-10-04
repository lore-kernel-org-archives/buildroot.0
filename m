From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 21:42:44 +0200
Subject: [Buildroot] [git commit] uClibc: 0.9.33.2: Unbreak on avr32 after
	recent pread patches
Message-ID: <20131004194500.A6A4C9B92E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81de81bed0333e7b458018375bdea03ca4f4b42a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

avr32 only provides __NR_pread and not __NR_pread64, so the fallback
handling must be used.

Patch sent upstream:
http://lists.uclibc.org/pipermail/uclibc/2013-October/047967.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d_write.c-unbreak-on-archs-without-__NR_p.patch |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.33.2/uclibc-0054-common-pread_write.c-unbreak-on-archs-without-__NR_p.patch b/package/uclibc/0.9.33.2/uclibc-0054-common-pread_write.c-unbreak-on-archs-without-__NR_p.patch
new file mode 100644
index 0000000..b071493
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0054-common-pread_write.c-unbreak-on-archs-without-__NR_p.patch
@@ -0,0 +1,36 @@
+From 1f7602f1dde43b12bead54433934ae4ddefa8118 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Fri, 4 Oct 2013 21:09:09 +0200
+Subject: [PATCH-0.9.33] common/pread_write.c: unbreak on archs without __NR_pread64
+
+Some archs (avr32 in particular) still doesn't define __NR_pread64, so
+we should fall back to __NR_pread if it isn't available.
+
+The code nicely checks for it, but then ends up hard coding the syscall
+to use __NR_pread64 afterwards, rendering the check useless. Fix it by
+using the result of the test instead.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+Noticed when adding the pending patches for 0.9.33.3 to Buildroot:
+http://jenkins.free-electrons.com/job/buildroot/config=atstk100x_defconfig/116/console
+
+ libc/sysdeps/linux/common/pread_write.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/common/pread_write.c b/libc/sysdeps/linux/common/pread_write.c
+index b13de66..8562ab4 100644
+--- a/libc/sysdeps/linux/common/pread_write.c
++++ b/libc/sysdeps/linux/common/pread_write.c
+@@ -42,7 +42,7 @@ extern __typeof(pwrite64) __libc_pwrite64;
+ 
+ #include <bits/kernel_types.h>
+ 
+-# define __NR___syscall_pread __NR_pread64
++# define __NR___syscall_pread __NR_pread
+ static __inline__ _syscall5(ssize_t, __syscall_pread, int, fd, void *, buf,
+ 		size_t, count, off_t, offset_hi, off_t, offset_lo)
+ 
+-- 
+1.7.10.4
+
