From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Feb 2016 19:28:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/numactl: Fix uClibc compile
	breakage after musl compile fix
Message-ID: <1455301707-8995-1-git-send-email-bernd.kuhls@t-online.de>
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
 package/numactl/0001-use-glibc-prereq-only-on-glibc.patch | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch b/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch
index 0158bd9..4558b12 100644
--- a/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch
+++ b/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch
@@ -4,11 +4,15 @@ The way __GLIBC_PREREQ() is currently used means that it's evaluated
 even if __GLIBC__ is not defined. But obviously, __GLIBC_PREREQ will
 not exist if __GLIBC__ is not defined, causing build failures on C
 libraries not defining __GLIBC__ such as the musl C library.
+UClibc pretends to be glibc so we need to exclude it from the check.
 
 Patch originally taken from:
 https://github.com/voidlinux/void-packages/blob/master/srcpkgs/numactl/patches/musl.patch
 
+Patch sent upstream: https://github.com/numactl/numactl/pull/4
+
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: Added uClibc exclusion]
 [Thomas: improve patch description.]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
@@ -19,7 +23,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  #endif
  
 -#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
-+#if defined(__GLIBC__)
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
 +# if __GLIBC_PREREQ(2,11)
  
  /* glibc 2.11 seems to have working 6 argument sycall. Use the
-- 
2.7.0
