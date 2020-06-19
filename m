From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 19 Jun 2020 11:37:45 +0300
Subject: [Buildroot] [PATCH] stress-ng: bump to version 0.11.14
Message-ID: <4289a40f5c830717edc9c400b89408216152c9c2.1592555865.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable build for musl libc. glibc specific code is now behind __GNUC__.
Add a patch to fix collision with kernel defined struct sysinfo.

Drop attr dependency. Not used anymore.

Make keyutils an optional dependency. Detected at config time.

Enable static build now that keyutils is not a mandatory dependency.

Format hash file with two spaces delimiters.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...tress-ng.h-suppress-kernel-sysinfo.h.patch | 49 +++++++++++++++++++
 package/stress-ng/Config.in                   | 10 +---
 package/stress-ng/stress-ng.hash              |  4 +-
 package/stress-ng/stress-ng.mk                |  8 +--
 4 files changed, 58 insertions(+), 13 deletions(-)
 create mode 100644 package/stress-ng/0001-stress-ng.h-suppress-kernel-sysinfo.h.patch

diff --git a/package/stress-ng/0001-stress-ng.h-suppress-kernel-sysinfo.h.patch b/package/stress-ng/0001-stress-ng.h-suppress-kernel-sysinfo.h.patch
new file mode 100644
index 000000000000..cc8b1a1b67fb
--- /dev/null
+++ b/package/stress-ng/0001-stress-ng.h-suppress-kernel-sysinfo.h.patch
@@ -0,0 +1,49 @@
+From 8c223daf10319f15570a74ed83a1d655fdbd4a7b Mon Sep 17 00:00:00 2001
+Message-Id: <8c223daf10319f15570a74ed83a1d655fdbd4a7b.1592540443.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 19 Jun 2020 07:10:24 +0300
+Subject: [PATCH] stress-ng.h: suppress kernel sysinfo.h
+
+The kernel sysinfo.h (indirectly included from genetlink.h) defines
+struct sysinfo. This collides with musl libc definition of the same
+struct.
+
+Fixes this build issue:
+
+In file included from .../arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/kernel.h:5,
+                 from .../arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/netlink.h:5,
+                 from .../arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/genetlink.h:6,
+                 from stress-ng.h:464,
+                 from stress-access.c:25:
+.../arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/sysinfo.h:8:8: error: redefinition of ?struct sysinfo?
+ struct sysinfo {
+        ^~~~~~~
+In file included from stress-ng.h:389,
+                 from stress-access.c:25:
+.../arm-buildroot-linux-musleabihf/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
+ struct sysinfo {
+        ^~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/ColinIanKing/stress-ng/pull/69
+
+ stress-ng.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/stress-ng.h b/stress-ng.h
+index 1a662938c1d9..e8aa0efe7527 100644
+--- a/stress-ng.h
++++ b/stress-ng.h
+@@ -387,6 +387,8 @@
+ 
+ #if defined(HAVE_SYS_SYSINFO_H)
+ #include <sys/sysinfo.h>
++/* Suppress kernel sysinfo to avoid collision with musl */
++#define _LINUX_SYSINFO_H
+ #endif
+ 
+ #if defined(HAVE_SYS_SYSMACROS_H)
+-- 
+2.27.0
+
diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
index 4fcfa3554c76..64b473b75c90 100644
--- a/package/stress-ng/Config.in
+++ b/package/stress-ng/Config.in
@@ -1,16 +1,11 @@
 config BR2_PACKAGE_STRESS_NG
 	bool "stress-ng"
 	depends on BR2_USE_MMU # fork()
-	# disabled on musl: stress-malloc.c needs mallopt() and M_MMAP_THRESHOLD
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2 and ARC
 	depends on !BR2_nios2
 	depends on !BR2_arc
-	depends on !BR2_STATIC_LIBS # keyutils
-	select BR2_PACKAGE_KEYUTILS # stress-key.c needs keyutils.h
-	select BR2_PACKAGE_ATTR # stress-xattr.c needs xattr.h
 	help
 	  stress-ng will stress test a computer system in various
 	  selectable ways. It was designed to exercise various physical
@@ -19,8 +14,7 @@ config BR2_PACKAGE_STRESS_NG
 
 	  http://kernel.ubuntu.com/~cking/stress-ng/
 
-comment "stress-ng needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.3"
+comment "stress-ng needs a toolchain w/ headers >= 3.3"
 	depends on !BR2_nios2 && !BR2_arc
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3 \
-		|| BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index a2b9b9ef9522..9993c759bafb 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 85ae86587f605225cc736e1ddba6cc5fd129dfbba0f7d94df755e2e6ac5230e6 stress-ng-0.10.07.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+sha256  b21436fdbd9dc482a3fd95ae27cccf0097d0f226361ea3785215f7a4ad50136b  stress-ng-0.11.14.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 55e3d297bcb8..61bc07d60a68 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,18 +4,20 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.10.07
+STRESS_NG_VERSION = 0.11.14
 STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
 
-STRESS_NG_DEPENDENCIES = attr keyutils
-
 ifeq ($(BR2_PACKAGE_LIBBSD),y)
 STRESS_NG_DEPENDENCIES += libbsd
 endif
 
+ifeq ($(BR2_PACKAGE_KEYUTILS),y)
+STRESS_NG_DEPENDENCIES += keyutils
+endif
+
 define STRESS_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
-- 
2.27.0
