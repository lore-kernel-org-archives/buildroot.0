From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Apr 2020 18:26:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.101
Message-ID: <20200403162617.1348330-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:
https://cgit.freedesktop.org/mesa/drm/commit/xf86drm.h?id=8c1185d22cb5ea09dea063bd4a0a4f8b64487919
https://cgit.freedesktop.org/mesa/drm/commit/xf86atomic.h?id=8c511950395ce496028bbc5ba30d9b9632690db6
https://cgit.freedesktop.org/mesa/drm/commit/meson.build?id=8de2696213d0f25a10a167b5fd6c312d6ce6a1af
https://cgit.freedesktop.org/mesa/drm/commit/tests/nouveau/threaded.c?id=cd77f114ca0073f609fc89d22390152945e73107

Renumbered remaining patches, use .xz tarball provided by upstream.
Removed md5 & sha1 hashes, not provided by upstream anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Add-ARM-support-into-xf86drm.h.patch | 56 -------------------
 ...001-meson.build-enable-static-build.patch} |  0
 ...-disable-nouveau-tests-for-static-b.patch} |  0
 ...require-CAS-support-in-libatomic_ops.patch | 32 -----------
 ...on.build-fix-intel-atomics-detection.patch | 35 ------------
 ... 0003-tests-amdgpu-needs-atomic_ops.patch} |  0
 ...uveau-threaded-adapt-ioctl-signature.patch | 37 ------------
 package/libdrm/libdrm.hash                    |  8 +--
 package/libdrm/libdrm.mk                      |  4 +-
 9 files changed, 5 insertions(+), 167 deletions(-)
 delete mode 100644 package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch
 rename package/libdrm/{0004-meson.build-enable-static-build.patch => 0001-meson.build-enable-static-build.patch} (100%)
 rename package/libdrm/{0005-tests-meson.build-disable-nouveau-tests-for-static-b.patch => 0002-tests-meson.build-disable-nouveau-tests-for-static-b.patch} (100%)
 delete mode 100644 package/libdrm/0002-xf86atomic-require-CAS-support-in-libatomic_ops.patch
 delete mode 100644 package/libdrm/0003-meson.build-fix-intel-atomics-detection.patch
 rename package/libdrm/{0007-tests-amdgpu-needs-atomic_ops.patch => 0003-tests-amdgpu-needs-atomic_ops.patch} (100%)
 delete mode 100644 package/libdrm/0006-tests-nouveau-threaded-adapt-ioctl-signature.patch

diff --git a/package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch b/package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch
deleted file mode 100644
index 3c00e9c73a..0000000000
--- a/package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2e3dd0040e676530f7e735fab335ff449b9b3f4d Mon Sep 17 00:00:00 2001
-From: Lauren Post <lauren.post@freescale.com>
-Date: Tue, 22 Mar 2016 22:08:25 +0100
-Subject: [PATCH] Add ARM support into xf86drm.h
-
-This provides support for Xorg interface.  Without this the vivante
-samples will hang during close requiring a reboot
-
-[Adapted from yocto project]
-Upstream-Status: Pending
-Signed-off-by: Lauren Post <lauren.post@freescale.com>
-Signed-off-by: Evan Kotara <evan.kotara@freescale.com>
-[Thomas: change CAS code to only be used on ARMv6/ARMv7, and not
-ARMv4/ARMv5, which don't support ldrex/strex. If no CAS implementation
-is provided libdrm falls back to a system call for locking/unlocking.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- xf86drm.h | 22 ++++++++++++++++++++++
- 1 file changed, 22 insertions(+)
-
-diff --git a/xf86drm.h b/xf86drm.h
-index 481d882..72341f6 100644
---- a/xf86drm.h
-+++ b/xf86drm.h
-@@ -469,6 +469,28 @@ do {	register unsigned int __old __asm("o0");		\
- 		: "cr0", "memory");			\
- 	} while (0)
- 
-+# elif defined (__ARM_ARCH_6__) || defined(__ARM_ARCH_6J__) \
-+	|| defined (__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__) \
-+	|| defined (__ARM_ARCH_6K__) || defined(__ARM_ARCH_6T2__) \
-+	|| defined (__ARM_ARCH_7__) || defined(__ARM_ARCH_7A__) \
-+	|| defined(__ARM_ARCH_7R__) || defined(__ARM_ARCH_7M__) \
-+	|| defined(__ARM_ARCH_7EM__)
-+       #undef DRM_DEV_MODE
-+       #define DRM_DEV_MODE     (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)
-+
-+       #define DRM_CAS(lock,old,new,__ret)             \
-+       do {                                            \
-+               __asm__ __volatile__ (                  \
-+                       "1: ldrex %0, [%1]\n"           \
-+                       "   teq %0, %2\n"               \
-+                       "   ite eq\n"                   \
-+                       "   strexeq %0, %3, [%1]\n"     \
-+                       "   movne   %0, #1\n"           \
-+               : "=&r" (__ret)                         \
-+               : "r" (lock), "r" (old), "r" (new)      \
-+               : "cc","memory");                       \
-+       } while (0)
-+
- #endif /* architecture */
- #endif /* __GNUC__ >= 2 */
- 
--- 
-2.6.4
-
diff --git a/package/libdrm/0004-meson.build-enable-static-build.patch b/package/libdrm/0001-meson.build-enable-static-build.patch
similarity index 100%
rename from package/libdrm/0004-meson.build-enable-static-build.patch
rename to package/libdrm/0001-meson.build-enable-static-build.patch
diff --git a/package/libdrm/0005-tests-meson.build-disable-nouveau-tests-for-static-b.patch b/package/libdrm/0002-tests-meson.build-disable-nouveau-tests-for-static-b.patch
similarity index 100%
rename from package/libdrm/0005-tests-meson.build-disable-nouveau-tests-for-static-b.patch
rename to package/libdrm/0002-tests-meson.build-disable-nouveau-tests-for-static-b.patch
diff --git a/package/libdrm/0002-xf86atomic-require-CAS-support-in-libatomic_ops.patch b/package/libdrm/0002-xf86atomic-require-CAS-support-in-libatomic_ops.patch
deleted file mode 100644
index ff920fb5a7..0000000000
--- a/package/libdrm/0002-xf86atomic-require-CAS-support-in-libatomic_ops.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7384f79f69fdb7b691cc5b0c28c301b3fe8b633e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 26 May 2016 10:46:57 +0200
-Subject: [PATCH] xf86atomic: require CAS support in libatomic_ops
-
-Since AO_compare_and_swap_full() is used by libdrm, AO_REQUIRE_CAS
-must be defined before including <atomic_ops.h> so that we are sure
-that CAS support will be provided. This is necessary to make sure that
-the AO_compare_and_swap_full() function will be provided on all
-architectures, including the ones that don't have built-in CAS support
-such as SPARCv8.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- xf86atomic.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/xf86atomic.h b/xf86atomic.h
-index 922b37d..d7017a5 100644
---- a/xf86atomic.h
-+++ b/xf86atomic.h
-@@ -58,6 +58,7 @@ typedef struct {
- #endif
- 
- #if HAVE_LIB_ATOMIC_OPS
-+#define AO_REQUIRE_CAS
- #include <atomic_ops.h>
- 
- #define HAS_ATOMIC_OPS 1
--- 
-2.7.4
-
diff --git a/package/libdrm/0003-meson.build-fix-intel-atomics-detection.patch b/package/libdrm/0003-meson.build-fix-intel-atomics-detection.patch
deleted file mode 100644
index 5d7cd5e4dd..0000000000
--- a/package/libdrm/0003-meson.build-fix-intel-atomics-detection.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 00f6ac3c24f36fa07fa93f4a89ee873edf125098 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 16 Jul 2018 23:01:40 +0200
-Subject: [PATCH] meson.build: fix intel atomics detection
-
-Use the stronger compiler.link() test (instead of the weaker
-compiler.compile()) to fix the intel atomics detection.
-
-Fixes false positive in case of sparc compile (buildroot toolchain).
-
-Upstream suggested: https://lists.freedesktop.org/archives/dri-devel/2018-July/183885.html
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9b443a5..3c8afb6 100644
---- a/meson.build
-+++ b/meson.build
-@@ -49,9 +49,10 @@ intel_atomics = false
- lib_atomics = false
-
- dep_atomic_ops = dependency('atomic_ops', required : false)
--if cc.compiles('''
-+if cc.links('''
-     int atomic_add(int *i) { return __sync_add_and_fetch (i, 1); }
-     int atomic_cmpxchg(int *i, int j, int k) { return __sync_val_compare_and_swap (i, j, k); }
-+    int main() { }
-     ''',
-     name : 'Intel Atomics')
-   intel_atomics = true
---
-2.18.0
-
diff --git a/package/libdrm/0007-tests-amdgpu-needs-atomic_ops.patch b/package/libdrm/0003-tests-amdgpu-needs-atomic_ops.patch
similarity index 100%
rename from package/libdrm/0007-tests-amdgpu-needs-atomic_ops.patch
rename to package/libdrm/0003-tests-amdgpu-needs-atomic_ops.patch
diff --git a/package/libdrm/0006-tests-nouveau-threaded-adapt-ioctl-signature.patch b/package/libdrm/0006-tests-nouveau-threaded-adapt-ioctl-signature.patch
deleted file mode 100644
index 80845709da..0000000000
--- a/package/libdrm/0006-tests-nouveau-threaded-adapt-ioctl-signature.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6c7b305869b941e52cb846cbed5e4a5c85d035d9 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 18 Jun 2018 15:07:03 +0100
-Subject: [PATCH] tests/nouveau/threaded: adapt ioctl signature
-
-POSIX says ioctl() has the signature (int, int, ...) but glibc has decided to
-use (int, unsigned long int, ...) instead.
-
-Use a #ifdef to adapt the replacement function as appropriate.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-[Taken from https://raw.githubusercontent.com/openembedded/openembedded-core/master/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- tests/nouveau/threaded.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/tests/nouveau/threaded.c b/tests/nouveau/threaded.c
-index 3669bcd..e1c27c0 100644
---- a/tests/nouveau/threaded.c
-+++ b/tests/nouveau/threaded.c
-@@ -36,7 +36,11 @@ static int failed;
- 
- static int import_fd;
- 
-+#ifdef __GLIBC__
- int ioctl(int fd, unsigned long request, ...)
-+#else
-+int ioctl(int fd, int request, ...)
-+#endif
- {
- 	va_list va;
- 	int ret;
--- 
-2.24.0
-
diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 7b50e66a91..4c9c4c4fed 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,3 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2019-October/240455.html
-md5 f47bc87e28198ba527e6b44ffdd62f65  libdrm-2.4.100.tar.bz2
-sha1 9f526909aba08b5658cfba3f7fde9385cad6f3b5  libdrm-2.4.100.tar.bz2
-sha256 c77cc828186c9ceec3e56ae202b43ee99eb932b4a87255038a80e8a1060d0a5d  libdrm-2.4.100.tar.bz2
-sha512 4d3a5556e650872944af52f49de395e0ce8ac9ac58530e39a34413e94dc56c231ee71b8b8de9fb944263515a922b3ebbf7ddfebeaaa91543c2604f9bcf561247  libdrm-2.4.100.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2020-April/261067.html
+sha256 ddf31baa8e49473624860bd166ce654dc349873f7a6c7b3305964249315c78a7  libdrm-2.4.101.tar.xz
+sha512 658cfc6f478b674b77b4613e1af9ce8f4fd2ace8a18e75729de254d14b7c1f5d67d4bfdb58744aea74abca0f6521326225f4156bd5cbeeed79ca3e025f657e8c  libdrm-2.4.101.tar.xz
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f7c9205744..4217fcc84c 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.100
-LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
+LIBDRM_VERSION = 2.4.101
+LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
 LIBDRM_INSTALL_STAGING = YES
-- 
2.25.0
