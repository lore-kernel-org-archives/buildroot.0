From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 17 Feb 2017 20:24:04 +0100
Subject: [Buildroot] [PATCH] uclibc: add fix for ARM specific static linking
	issues
Message-ID: <20170217192404.GA13561@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/fb14e37aaf453874d1c33e5ed73b9c751ace5ae3
  http://autobuild.buildroot.net/results/774a8dd489760bc213ac7cf3e8040cee6a4e2437

And hopefully all other static ARM issues with uClibc-ng.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
It would be nice if the autobuild ARM toolchains could be rebuild,
if the patch is accepted and applied.
---
 .../0002-arm-fix-static-linking-issues.patch       | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/uclibc/0002-arm-fix-static-linking-issues.patch

diff --git a/package/uclibc/0002-arm-fix-static-linking-issues.patch b/package/uclibc/0002-arm-fix-static-linking-issues.patch
new file mode 100644
index 0000000..5480b0d
--- /dev/null
+++ b/package/uclibc/0002-arm-fix-static-linking-issues.patch
@@ -0,0 +1,38 @@
+From 94810a91c48ac62daed55b4aec70d04a44c10795 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Thu, 16 Feb 2017 20:22:21 +0100
+Subject: [PATCH] arm: fix static linking issues
+
+As reported by Buildroot developers these files causing static
+linking issues. The original contribution with the ARM unwind-resume
+rework and GNU libc sync was made before the combined libc change.
+But the patch was applied later, after the libc change and
+it seems the test coverage for static linking didn't catch it in
+the regression testing. Remove the files.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libpthread/nptl/sysdeps/arm/pt-arm-unwind-resume.c | 2 --
+ libpthread/nptl/sysdeps/arm/rt-arm-unwind-resume.c | 1 -
+ 2 files changed, 3 deletions(-)
+ delete mode 100644 libpthread/nptl/sysdeps/arm/pt-arm-unwind-resume.c
+ delete mode 100644 libpthread/nptl/sysdeps/arm/rt-arm-unwind-resume.c
+
+diff --git a/libpthread/nptl/sysdeps/arm/pt-arm-unwind-resume.c b/libpthread/nptl/sysdeps/arm/pt-arm-unwind-resume.c
+deleted file mode 100644
+index fd0cec4..0000000
+--- a/libpthread/nptl/sysdeps/arm/pt-arm-unwind-resume.c
++++ /dev/null
+@@ -1,2 +0,0 @@
+-__asm__ (".set __libgcc_s_init, pthread_cancel_init");
+-#include <arm-unwind-resume.c>
+diff --git a/libpthread/nptl/sysdeps/arm/rt-arm-unwind-resume.c b/libpthread/nptl/sysdeps/arm/rt-arm-unwind-resume.c
+deleted file mode 100644
+index 2641dc5..0000000
+--- a/libpthread/nptl/sysdeps/arm/rt-arm-unwind-resume.c
++++ /dev/null
+@@ -1 +0,0 @@
+-#include <arm-unwind-resume.c>
+-- 
+2.1.4
+
-- 
2.1.4
