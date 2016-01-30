From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 10:18:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/numactl: fix musl build
In-Reply-To: <1454145490-11822-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454145490-11822-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454145490-11822-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/355/3555cd0abe68b6f0e2b2089af5ce26dbc4c73df6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/numactl/0001-musl.patch | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/numactl/0001-musl.patch

diff --git a/package/numactl/0001-musl.patch b/package/numactl/0001-musl.patch
new file mode 100644
index 0000000..1c9bf9e
--- /dev/null
+++ b/package/numactl/0001-musl.patch
@@ -0,0 +1,32 @@
+Fix musl build
+
+Downloaded from
+https://github.com/voidlinux/void-packages/blob/master/srcpkgs/numactl/patches/musl.patch
+and adjusted path
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+__GLIBC_PREREQ is only defined with glibc, so that only process it with __GLIBC__.
+
+--- a/syscall.c.orig	2014-10-20 16:12:53.000000000 +0200
++++ b/syscall.c	2015-06-22 08:13:22.729034702 +0200
+@@ -115,14 +115,16 @@
+ 
+ #endif
+ 
+-#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
++#if defined(__GLIBC__)
++# if __GLIBC_PREREQ(2,11)
+ 
+ /* glibc 2.11 seems to have working 6 argument sycall. Use the
+    glibc supplied syscall in this case.
+    The version cut-off is rather arbitary and could be probably
+    earlier. */
+ 
+-#define syscall6 syscall
++#  define syscall6 syscall
++#endif
+ #elif defined(__x86_64__)
+ /* 6 argument calls on x86-64 are often buggy in both glibc and
+    asm/unistd.h. Add a working version here. */
-- 
2.7.0.rc3
