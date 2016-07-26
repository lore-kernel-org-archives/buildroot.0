From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Jul 2016 15:27:32 +0300
Subject: [Buildroot] [PATCH] ipkg: fix ARM MMU-less build
Message-ID: <5593192e371e7a40e09e9b0189f3bfb2432a0e67.1469536052.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The code incorrectly tests for __ARCH_HAS_MMU__ which is true for the ARM
architecture, instead of __ARCH_USE_MMU__ which applies to this specific
build. Add a patch making direct use of HAVE_FORK that configure defines when
fork() is detected.

Fixes:
http://autobuild.buildroot.net/results/6cf/6cf75e08795d9ab194ce4e882c0f4858bad979c3/
http://autobuild.buildroot.net/results/964/964d8f694bc7d05b35411eabfbadf40bbf6337ae/
http://autobuild.buildroot.net/results/0f2/0f2cddf89af3ad4330556acd04ab6cb080370e24/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ipkg/0002-fix-arm-nommu.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/ipkg/0002-fix-arm-nommu.patch

diff --git a/package/ipkg/0002-fix-arm-nommu.patch b/package/ipkg/0002-fix-arm-nommu.patch
new file mode 100644
index 000000000000..42279a958cc1
--- /dev/null
+++ b/package/ipkg/0002-fix-arm-nommu.patch
@@ -0,0 +1,22 @@
+libbb: fix ARM no MMU build
+
+uClibc-ng defines __ARCH_HAS_MMU__ for ARM because the architecture may
+potentially have MMU. The code should test for __ARCH_USE_MMU__. But since
+configure detects the presence of fork(), use HAVE_FORK directly.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: no active upstream
+
+diff -Nuar ipkg-0.99.163-orig/libbb/libbb.h ipkg-0.99.163/libbb/libbb.h
+--- ipkg-0.99.163-orig/libbb/libbb.h	2006-02-06 10:13:02.000000000 +0200
++++ ipkg-0.99.163/libbb/libbb.h	2016-07-26 13:50:09.296988855 +0300
+@@ -341,7 +341,7 @@
+ #define CONSOLE_DEV "/dev/console"
+ 
+ /* Cope with mmu-less systems somewhat gracefully */
+-#if defined(__UCLIBC__) && !defined(__ARCH_HAS_MMU__)
++#if !defined(HAVE_FORK)
+ #define fork	vfork
+ #endif
+ 
-- 
2.8.1
