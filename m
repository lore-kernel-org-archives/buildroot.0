From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 5 Oct 2017 21:02:24 +0200
Subject: [Buildroot] [git commit] openntpd: fix musl build with older kernel
	headers
Message-ID: <20171005191254.45AAE80160@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56b0b5134dfe9e956f4b688a6ad8f3ec3ce4ce82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl provides its own SYS_getrandom definition, but not GRND_NONBLOCK.
This breaks the build with kernel headers older than v3.17. Add a patch
adding a local definition of GRND_NONBLOCK to fix the build.

The getentropy_linux.c file is in upstream tarball, but not in its git
repository. It originates from OpenBSD. For this reason the patch is
against the tarball, but not git formatted.

Fixes:
http://autobuild.buildroot.net/results/623/6235ddc095bc1984439e7339d590b11581a3e257/
http://autobuild.buildroot.net/results/648/648e7c91edcf893fa780de9bb44c05f5f842a2e8/
http://autobuild.buildroot.net/results/7da/7da71263a6e9b780031f1f6185c760d11dfc994e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openntpd/0002-fix-musl.patch | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/openntpd/0002-fix-musl.patch b/package/openntpd/0002-fix-musl.patch
new file mode 100644
index 0000000..e369d5a
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
