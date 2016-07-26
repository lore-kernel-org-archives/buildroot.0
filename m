From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Jul 2016 14:08:20 +0300
Subject: [Buildroot] [PATCH] ipkg: fix no MMU musl build
Message-ID: <8aa4f13e1f931315ebfe037e16c7e5761c6f97eb.1469531300.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current code uses vfork() instead of fork() only when __UCLIBC__ is defined.
This breaks musl MMU-less build. Add a patch making direct use of HAVE_FORK
that configure defines when fork() is detected.

Fixes:
http://autobuild.buildroot.net/results/6cf/6cf75e08795d9ab194ce4e882c0f4858bad979c3/
http://autobuild.buildroot.net/results/964/964d8f694bc7d05b35411eabfbadf40bbf6337ae/
http://autobuild.buildroot.net/results/0f2/0f2cddf89af3ad4330556acd04ab6cb080370e24/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ipkg/0002-fix-musl-nommu.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/ipkg/0002-fix-musl-nommu.patch

diff --git a/package/ipkg/0002-fix-musl-nommu.patch b/package/ipkg/0002-fix-musl-nommu.patch
new file mode 100644
index 000000000000..4ef5474b98dc
--- /dev/null
+++ b/package/ipkg/0002-fix-musl-nommu.patch
@@ -0,0 +1,21 @@
+libbb: fix no MMU build with musl libc
+
+musl libc does not define __UCLIBC__. Since configure detects the presence of
+fork(), use HAVE_FORK directly.
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
