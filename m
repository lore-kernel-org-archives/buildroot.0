From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:40:09 +0200
Subject: [Buildroot] [git commit] wine: depend on shared libraries
Message-ID: <20180331204154.11FA58155B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89bdacb14ed458ee62a997a06255e5e19c480f78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even if --enable-static --disable-shared is passed, wine tries to
build a shared library, causing a build failure in a BR2_STATIC_LIBS=y
configuration:

/home/test/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_fini':
__uClibc_main.c:(.text.__uClibc_fini+0x10): undefined reference to `__fini_array_start'
/home/test/buildroot/output/host/lib/gcc/i686-buildroot-linux-uclibc/6.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/test/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(__uClibc_main.os): relocation R_386_GOTOFF again
st undefined hidden symbol `__fini_array_start' can not be used when making a shared object
/home/test/buildroot/output/host/lib/gcc/i686-buildroot-linux-uclibc/6.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld: final link failed: Bad value
collect2: error: ld returned 1 exit status
make[2]: *** [libwine.so.1.0] Error 1
make[2]: Leaving directory `/home/test/buildroot/output/build/wine-3.0/libs/wine'
make[1]: *** [libs/wine] Error 2

Since using wine in a static linking environment is fairly unlikely,
we simply mark the wine package unavailable on static-only
configurations.

Since we need to add a Config.in comment, we also introduced a
BR2_PACKAGE_WINE_ARCH_SUPPORTS hidden boolean, to share the
architecture dependencies definition between the wine config option
and the comment.

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
[Thomas:
 - add a comment in the Config.in file about the dependency
 - add BR2_PACKAGE_WINE_ARCH_SUPPORTS
 - extend the commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wine/Config.in | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index 627a9a71f4..9de8cf0f6d 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -1,11 +1,18 @@
-config BR2_PACKAGE_WINE
-	bool "wine"
+config BR2_PACKAGE_WINE_ARCH_SUPPORTS
+	bool
+	default y
 	# Wine only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
 	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \
 	           BR2_HOSTARCH = "aarch64"
 	# Wine has much CPU specific code and mostly makes sense on x86
 	depends on BR2_i386
+
+config BR2_PACKAGE_WINE
+	bool "wine"
+	depends on BR2_PACKAGE_WINE_ARCH_SUPPORTS
+	# Wine unconditionally builds shared libraries
+	depends on !BR2_STATIC_LIBS
 	help
 	  Wine is a compatibility layer capable of running Windows
 	  applications on Linux. Instead of simulating internal
@@ -15,3 +22,7 @@ config BR2_PACKAGE_WINE
 	  methods.
 
 	  http://www.winehq.org
+
+comment "wine needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_WINE_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS
