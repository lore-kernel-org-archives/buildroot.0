From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jul 2013 21:20:02 +0200
Subject: [Buildroot] [git commit] uclibc: arc: fix fstat for big-endian
Message-ID: <20130726192311.EE5969ABCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb3d0e177f40e9cbb54827d565e778eda2c5a58d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes "Value too large for defined data type" messages caused by fstat
syscall wrapper returning -EOVERFLOW.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/0.9.33-arc/fix-fstat-for-be.patch |   32 ++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.33-arc/fix-fstat-for-be.patch b/package/uclibc/0.9.33-arc/fix-fstat-for-be.patch
new file mode 100644
index 0000000..2cdb517
--- /dev/null
+++ b/package/uclibc/0.9.33-arc/fix-fstat-for-be.patch
@@ -0,0 +1,32 @@
+From f394d65c74631a0e715bac582b09c302ee84114f Mon Sep 17 00:00:00 2001
+From: Mischa Jonker <mjonker@synopsys.com>
+Date: Tue, 23 Jul 2013 17:59:04 +0200
+Subject: [PATCH] libc/sysdeps: Fix common-generic stat.h for BE part 2
+
+Previous patch only fixed the build. This patch fixes the behavior at
+run-time as well.
+
+It fixes "Value too large for defined data type" messages caused by
+fstat syscall wrapper returning -EOVERFLOW.
+
+Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
+---
+ libc/sysdeps/linux/common-generic/bits/stat.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/common-generic/bits/stat.h b/libc/sysdeps/linux/common-generic/bits/stat.h
+index 07716ab..945c408 100644
+--- a/libc/sysdeps/linux/common-generic/bits/stat.h
++++ b/libc/sysdeps/linux/common-generic/bits/stat.h
+@@ -63,8 +63,8 @@ struct stat
+     unsigned long long __pad4;
+     long __pad5;
+     long st_size;				/* Size of file, in bytes. */
+-    int __pad6;
+     int st_blksize;				/* Optimal block size for I/O. */
++    int __pad6;
+     long __pad7;
+     long st_blocks;				/* Number 512-byte blocks allocated */
+ # endif /* __LITTLE_ENDIAN */
+--
+1.7.9.5
