From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Feb 2016 20:22:29 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/numactl: Fix uClibc compile
	breakage after musl compile fix
Message-ID: <1455304949-16808-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/316/3160fb32fbb6990b0bb268524dcea02a1f6880a7/
http://autobuild.buildroot.net/results/961/9616f09e7cbd020134ba72853acaa28a308432a3//
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: updated patch to consider improvements suggested by upstream

 .../0001-use-glibc-prereq-only-on-glibc.patch      | 34 ++++++++++++----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch b/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch
index 0158bd9..efb2870 100644
--- a/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch
+++ b/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch
@@ -1,4 +1,7 @@
-Use __GLIBC_PREREQ only when __GLIBC__ is defined
+From 3770bdc4fa7b9059db5cd2aa8bb09b50fa15e456 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 12 Feb 2016 19:25:02 +0100
+Subject: [PATCH 1/1] Fix usage of __GLIBC_PREREQ for non-glibc toolchains
 
 The way __GLIBC_PREREQ() is currently used means that it's evaluated
 even if __GLIBC__ is not defined. But obviously, __GLIBC_PREREQ will
@@ -8,28 +11,29 @@ libraries not defining __GLIBC__ such as the musl C library.
 Patch originally taken from:
 https://github.com/voidlinux/void-packages/blob/master/srcpkgs/numactl/patches/musl.patch
 
+Patch sent upstream: https://github.com/numactl/numactl/pull/4
+
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: Reworked to fix uClibc]
 [Thomas: improve patch description.]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ syscall.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
---- a/syscall.c.orig	2014-10-20 16:12:53.000000000 +0200
-+++ b/syscall.c	2015-06-22 08:13:22.729034702 +0200
-@@ -115,14 +115,16 @@
+diff --git a/syscall.c b/syscall.c
+index 4589b85..37782d9 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -115,7 +115,7 @@
  
  #endif
  
 -#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
-+#if defined(__GLIBC__)
-+# if __GLIBC_PREREQ(2,11)
++#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 11)
  
  /* glibc 2.11 seems to have working 6 argument sycall. Use the
     glibc supplied syscall in this case.
-    The version cut-off is rather arbitary and could be probably
-    earlier. */
- 
--#define syscall6 syscall
-+#  define syscall6 syscall
-+#endif
- #elif defined(__x86_64__)
- /* 6 argument calls on x86-64 are often buggy in both glibc and
-    asm/unistd.h. Add a working version here. */
+-- 
+2.7.0
+
-- 
2.7.0
