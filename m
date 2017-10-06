From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Oct 2017 20:39:15 +0200
Subject: [Buildroot] [git commit] libressl: fix musl build with older kernel
	headers
Message-ID: <20171006184939.E64E881150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7adc268b58a1eea9967ed5c7a3b7b4471575d73a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl provides its own SYS_getrandom definition, but not GRND_NONBLOCK.
This breaks the build with kernel headers older than v3.17. Add a patch
adding a local definition of GRND_NONBLOCK to fix the build.

The following defconfig reproduces the build failure:

BR2_x86_pentium_mmx=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_KERNEL_HEADERS_3_12=y
BR2_PACKAGE_LIBRESSL=y

The getentropy_linux.c file is in upstream tarball, but not in its git
repository. It originates from OpenBSD. For this reason the patch is
against the tarball, but not git formatted.

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[Arnout: change filename to correspond to how git creates it]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ix-build-with-musl-and-older-Linux-kernel.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/libressl/0002-Fix-build-with-musl-and-older-Linux-kernel.patch b/package/libressl/0002-Fix-build-with-musl-and-older-Linux-kernel.patch
new file mode 100644
index 0000000..ddb9534
--- /dev/null
+++ b/package/libressl/0002-Fix-build-with-musl-and-older-Linux-kernel.patch
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
+diff -Nuar libressl-2.5.5-orig/crypto/compat/getentropy_linux.c libressl-2.5.5/crypto/compat/getentropy_linux.c
+--- libressl-2.5.5-orig/crypto/compat/getentropy_linux.c	2017-07-09 13:59:48.000000000 +0300
++++ libressl-2.5.5/crypto/compat/getentropy_linux.c	2017-09-29 10:03:32.447958829 +0300
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
