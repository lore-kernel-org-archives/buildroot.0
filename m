From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Sep 2017 12:13:24 +0300
Subject: [Buildroot] [PATCH 2/2] libressl: fix musl build with older kernel
	headers
In-Reply-To: <fcd9c70d93d412866e9f973469a81acfffa1860a.1506676404.git.baruch@tkos.co.il>
References: <fcd9c70d93d412866e9f973469a81acfffa1860a.1506676404.git.baruch@tkos.co.il>
Message-ID: <639a3f4f5d58b498ba75f4a206203bb041a8c3e7.1506676404.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl provides its own SYS_getrandom definition, but not GRND_NONBLOCK.
This breaks the build with kernel headers older than v3.17. Add a patch
adding a local definition of GRND_NONBLOCK to fix the build.

The following defconfig reproduces the build failure:

BR2_x86_pentium_mmx=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_KERNEL_HEADERS_3_12=y
BR2_PACKAGE_LIBRESSL=y

The getentropy_linux.c file is in upstream tarball, but not in its git
repository. It originates form OpenBSD. For this reason the patch is
against the tarball, but not git formatted.

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libressl/0002-fix-musl.patch | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/libressl/0002-fix-musl.patch

diff --git a/package/libressl/0002-fix-musl.patch b/package/libressl/0002-fix-musl.patch
new file mode 100644
index 000000000000..ddb953402d91
--- /dev/null
+++ b/package/libressl/0002-fix-musl.patch
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
-- 
2.14.2
