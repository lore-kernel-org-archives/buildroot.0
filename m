From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Apr 2011 22:46:59 +0200
Subject: [Buildroot] [git commit] toolchain: add inotify_init1 syscall
	support to uclibc 0.9.31
Message-ID: <20110426213743.9341882A20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4cf6ec229fe2876f058779f56ae735fe55125a03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add inotify_init1 system call support to uclibc 0.9.31.
Required for modern versions of udev.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uClibc/uClibc-0.9.31-add-inotify-init1.patch   |   64 ++++++++++++++++++++
 1 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-add-inotify-init1.patch

diff --git a/toolchain/uClibc/uClibc-0.9.31-add-inotify-init1.patch b/toolchain/uClibc/uClibc-0.9.31-add-inotify-init1.patch
new file mode 100644
index 0000000..cbec426
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31-add-inotify-init1.patch
@@ -0,0 +1,64 @@
+From a2e5630af426f85fdd8721b2820786d9bd2aa695 Mon Sep 17 00:00:00 2001
+From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Date: Tue, 1 Jun 2010 20:02:54 +0400
+Subject: [PATCH] inotify: add inotify_init1 system call support
+
+This patch introduces support for inotify_init1 system call, found
+since Linux 2.6.27.
+
+Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libc/sysdeps/linux/common/inotify.c     |    4 ++++
+ libc/sysdeps/linux/common/sys/inotify.h |   13 +++++++++++++
+ 2 files changed, 17 insertions(+), 0 deletions(-)
+
+diff --git a/libc/sysdeps/linux/common/inotify.c b/libc/sysdeps/linux/common/inotify.c
+index e5a6120..e35f043 100644
+--- a/libc/sysdeps/linux/common/inotify.c
++++ b/libc/sysdeps/linux/common/inotify.c
+@@ -15,6 +15,10 @@
+ _syscall0(int, inotify_init)
+ #endif
+ 
++#ifdef __NR_inotify_init1
++_syscall1(int, inotify_init1, int, flags)
++#endif
++
+ #ifdef __NR_inotify_add_watch
+ _syscall3(int, inotify_add_watch, int, fd, const char *, path, uint32_t, mask)
+ #endif
+diff --git a/libc/sysdeps/linux/common/sys/inotify.h b/libc/sysdeps/linux/common/sys/inotify.h
+index 0131db9..dc4e19d 100644
+--- a/libc/sysdeps/linux/common/sys/inotify.h
++++ b/libc/sysdeps/linux/common/sys/inotify.h
+@@ -22,6 +22,16 @@
+ #include <stdint.h>
+ 
+ 
++/* Flags for the parameter of inotify_init1.  */
++enum
++  {
++    IN_CLOEXEC = 02000000,
++#define IN_CLOEXEC IN_CLOEXEC
++    IN_NONBLOCK = 04000
++#define IN_NONBLOCK IN_NONBLOCK
++  };
++
++
+ /* Structure describing an inotify event.  */
+ struct inotify_event
+ {
+@@ -79,6 +89,9 @@ __BEGIN_DECLS
+ /* Create and initialize inotify instance.  */
+ extern int inotify_init (void) __THROW;
+ 
++/* Create and initialize inotify instance.  */
++extern int inotify_init1 (int __flags) __THROW;
++
+ /* Add watch of object NAME to inotify instance FD.  Notify about
+    events specified by MASK.  */
+ extern int inotify_add_watch (int __fd, const char *__name, uint32_t __mask)
+-- 
+1.7.3.4
+
-- 
1.7.3.4
