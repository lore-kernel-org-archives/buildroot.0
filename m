From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 13:52:59 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/uclibc: fix
 preadv/pwritev offset argument type
Message-ID: <20190526114748.BD4D6810B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f52b9c2922b9becd4e84dd724880f3e21a31ccc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

preadv/pwritev don't provide separate version for 64-bit wide off_t,
and default to 32-bit wide off_t, which results in a mismatch between
declaration and definition for user programs built with
-D_FILE_OFFSET_BITS=64.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7eb857f199e0510b3de6de80569c123ed22e23c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...3-preadv-pwritev-fix-offset-argument-type.patch | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch b/package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch
new file mode 100644
index 0000000000..ccc262b9c5
--- /dev/null
+++ b/package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch
@@ -0,0 +1,71 @@
+From 1077d5bebffacfd4b09896ed890fb45a5b3c6dc6 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 10 May 2019 07:13:19 -0700
+Subject: [PATCH] preadv/pwritev: fix offset argument type
+
+preadv/pwritev don't provide separate version for 64-bit wide off_t,
+and default to 32-bit wide off_t, which results in a mismatch between
+declaration and definition for user programs built with
+-D_FILE_OFFSET_BITS=64.
+Make offset argument of both functions __off64_t.
+This fixes test misc/tst-preadvwritev on xtensa.
+
+Backported from: 423e49023eeb ("preadv/pwritev: fix offset argument type")
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ include/sys/uio.h                   | 4 ++--
+ libc/sysdeps/linux/common/preadv.c  | 2 +-
+ libc/sysdeps/linux/common/pwritev.c | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/sys/uio.h b/include/sys/uio.h
+index aa766f9b1187..330426fec492 100644
+--- a/include/sys/uio.h
++++ b/include/sys/uio.h
+@@ -59,7 +59,7 @@ extern ssize_t writev (int __fd, const struct iovec *__iovec, int __count);
+    This function is a cancellation point and therefore not marked with
+    __THROW.  */
+ extern ssize_t preadv (int __fd, const struct iovec *__iovec, int __count,
+-		       off_t __offset) __wur;
++		       __off64_t __offset) __wur;
+ 
+ /* Write data pointed by the buffers described by IOVEC, which is a
+    vector of COUNT 'struct iovec's, to file descriptor FD at the given
+@@ -71,7 +71,7 @@ extern ssize_t preadv (int __fd, const struct iovec *__iovec, int __count,
+    This function is a cancellation point and therefore not marked with
+    __THROW.  */
+ extern ssize_t pwritev (int __fd, const struct iovec *__iovec, int __count,
+-			off_t __offset) __wur;
++			__off64_t __offset) __wur;
+ #endif	/* Use misc.  */
+ 
+ __END_DECLS
+diff --git a/libc/sysdeps/linux/common/preadv.c b/libc/sysdeps/linux/common/preadv.c
+index fd9dde4b999c..6a07d5df87e0 100644
+--- a/libc/sysdeps/linux/common/preadv.c
++++ b/libc/sysdeps/linux/common/preadv.c
+@@ -21,7 +21,7 @@
+ 
+ #ifdef __NR_preadv
+ ssize_t
+-preadv (int fd, const struct iovec *vector, int count, off_t offset)
++preadv (int fd, const struct iovec *vector, int count, __off64_t offset)
+ {
+   unsigned long pos_l, pos_h;
+ 
+diff --git a/libc/sysdeps/linux/common/pwritev.c b/libc/sysdeps/linux/common/pwritev.c
+index bef5bcf69b46..f07c40e6de3c 100644
+--- a/libc/sysdeps/linux/common/pwritev.c
++++ b/libc/sysdeps/linux/common/pwritev.c
+@@ -21,7 +21,7 @@
+ 
+ #ifdef __NR_pwritev
+ ssize_t
+-pwritev (int fd, const struct iovec *vector, int count, off_t offset)
++pwritev (int fd, const struct iovec *vector, int count, __off64_t offset)
+ {
+   unsigned long pos_l, pos_h;
+ 
+-- 
+2.11.0
+
