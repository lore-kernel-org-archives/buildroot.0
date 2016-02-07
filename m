From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 19:15:46 +0100
Subject: [Buildroot] [git commit] package/numactl: fix musl build
Message-ID: <20160207181655.8184D7FAB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21ed7a92fe5a771911ef06f97522e504d0eebbc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/355/3555cd0abe68b6f0e2b2089af5ce26dbc4c73df6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: rename patch and improve its description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-use-glibc-prereq-only-on-glibc.patch      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch b/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch
new file mode 100644
index 0000000..0158bd9
--- /dev/null
+++ b/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch
@@ -0,0 +1,35 @@
+Use __GLIBC_PREREQ only when __GLIBC__ is defined
+
+The way __GLIBC_PREREQ() is currently used means that it's evaluated
+even if __GLIBC__ is not defined. But obviously, __GLIBC_PREREQ will
+not exist if __GLIBC__ is not defined, causing build failures on C
+libraries not defining __GLIBC__ such as the musl C library.
+
+Patch originally taken from:
+https://github.com/voidlinux/void-packages/blob/master/srcpkgs/numactl/patches/musl.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Thomas: improve patch description.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
