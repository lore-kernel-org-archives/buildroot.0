From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Sep 2017 12:13:23 +0300
Subject: [Buildroot] [PATCH 1/2] openntpd: fix musl build with older kernel
	headers
Message-ID: <fcd9c70d93d412866e9f973469a81acfffa1860a.1506676404.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl provides its own SYS_getrandom definition, but not GRND_NONBLOCK.
This breaks the build with kernel headers older than v3.17. Add a patch
adding a local definition of GRND_NONBLOCK to fix the build.

The getentropy_linux.c file is in upstream tarball, but not in its git
repository. It originates form OpenBSD. For this reason the patch is
against the tarball, but not git formatted.

Fixes:
http://autobuild.buildroot.net/results/623/6235ddc095bc1984439e7339d590b11581a3e257/
http://autobuild.buildroot.net/results/648/648e7c91edcf893fa780de9bb44c05f5f842a2e8/
http://autobuild.buildroot.net/results/7da/7da71263a6e9b780031f1f6185c760d11dfc994e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openntpd/0002-fix-musl.patch | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/openntpd/0002-fix-musl.patch

diff --git a/package/openntpd/0002-fix-musl.patch b/package/openntpd/0002-fix-musl.patch
new file mode 100644
index 000000000000..e369d5a8ae60
--- /dev/null
+++ b/package/openntpd/0002-fix-musl.patch
@@ -0,0 +1,38 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 29 Sep 2017 10:06:52 +0300
+Subject: [PATCH] Fix build with musl and older Linux kernel
+
+The musl libc carries its own copy of Linux system calls. When building
+with Linux headers older than v3.17, musl provides SYS_getrandom
+definition, but not GRND_NONBLOCK. This causes build failure for
+libressl and openntpd:
+
+getentropy_linux.c: In function 'getentropy_getrandom':
+getentropy_linux.c:205:42: error: 'GRND_NONBLOCK' undeclared (first use in this function)
+   ret = syscall(SYS_getrandom, buf, len, GRND_NONBLOCK);
+                                          ^~~~~~~~~~~~~
+
+Define GRND_NONBLOCK locally when its definition is missing to fix the
+build. There should be no run-time effect. Older kernels return ENOSYS
+for unsupported syscall().
+
+[ from upstream pull request with file location changed ]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/libressl-portable/openbsd/pull/82
+
+diff -Nuar openntpd-6.2p2-orig/compat/getentropy_linux.c openntpd-6.2p2/compat/getentropy_linux.c
+--- openntpd-6.2p2-orig/compat/getentropy_linux.c	2017-09-07 22:12:02.000000000 +0300
++++ openntpd-6.2p2/compat/getentropy_linux.c	2017-09-29 11:54:54.856245770 +0300
+@@ -194,6 +194,11 @@
+ }
+ 
+ #ifdef SYS_getrandom
++
++#ifndef GRND_NONBLOCK
++#define GRND_NONBLOCK   0x0001
++#endif
++
+ static int
+ getentropy_getrandom(void *buf, size_t len)
+ {
-- 
2.14.2
