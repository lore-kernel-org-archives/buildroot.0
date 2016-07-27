From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:24:56 +0200
Subject: [Buildroot] [git commit] ipkg: fix MMU-less build
Message-ID: <20160727192521.7E84881963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7800ae9f6a5735909956ac20c82d2c99ccb68761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The code incorrectly tests for __ARCH_HAS_MMU__ which is true for
architecture that *may* have a MMU, instead of __ARCH_USE_MMU__ which
specifies if MMU support is really enabled. Add a patch making direct
use of HAVE_FORK that configure defines when fork() is detected.

Fixes:
http://autobuild.buildroot.net/results/6cf/6cf75e08795d9ab194ce4e882c0f4858bad979c3/
http://autobuild.buildroot.net/results/964/964d8f694bc7d05b35411eabfbadf40bbf6337ae/
http://autobuild.buildroot.net/results/0f2/0f2cddf89af3ad4330556acd04ab6cb080370e24/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipkg/0002-fix-nommu.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/ipkg/0002-fix-nommu.patch b/package/ipkg/0002-fix-nommu.patch
new file mode 100644
index 0000000..64cec1e
--- /dev/null
+++ b/package/ipkg/0002-fix-nommu.patch
@@ -0,0 +1,24 @@
+libbb: fix no MMU build
+
+uClibc-ng defines __ARCH_HAS_MMU__ for ARM or m68k because these
+architectures may potentially have MMU. The code should test for
+__ARCH_USE_MMU__, which indicates if the MMU is really in use. But
+since the configure script detects the presence of fork(), using
+HAVE_FORK directly is a better solution.
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
