From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 18:01:46 +0100
Subject: [Buildroot] [git commit] package/rt-tests: bump version to 1.10
Message-ID: <20201229164522.4885E833C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5d65b469adacffe1d8be77872ed94250dd4098f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With 1.10, building without libnuma is no longer supported (upstream
commit 240938737e: rt-tests: cyclictest: Remove support for compiling
without NUMA)

So, revert 7e90744e6 (package/rt-tests: make numactl an optional
dependency) while bumping to rt-test 1.10.

Signed-off-by: Florian La Roche <Florian.LaRoche@gmail.com>
[yann.morin.1998 at free.fr: reintroduce dependency on numactl]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...oslat-Allow-build-for-not-supported-archs.patch | 52 ----------------------
 package/rt-tests/Config.in                         |  3 ++
 package/rt-tests/rt-tests.hash                     |  2 +-
 package/rt-tests/rt-tests.mk                       |  9 +---
 4 files changed, 6 insertions(+), 60 deletions(-)

diff --git a/package/rt-tests/0002-rt-tests-oslat-Allow-build-for-not-supported-archs.patch b/package/rt-tests/0002-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
deleted file mode 100644
index 96b36d60dd..0000000000
--- a/package/rt-tests/0002-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 165b597e3003c6870f5980e8902014d9344e6cf3 Mon Sep 17 00:00:00 2001
-From: Peter Xu <peterx@redhat.com>
-Date: Thu, 1 Oct 2020 14:47:26 -0400
-Subject: [PATCH] rt-tests: oslat: Allow build for not supported archs
-
-Now rt-tests won't build for archs other than x86/i386/ppc64 after oslat is
-merged.  Instead of failing the build, let's make it pass.  However, whenever
-oslat is executed, instead of running the real program, dump an error message,
-so that people can try to implement the frc() function for it when there's a
-real need for the new arch.
-
-Signed-off-by: Peter Xu <peterx@redhat.com>
-Signed-off-by: John Kacur <jkacur@redhat.com>
-
-[Taken from:
-https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/src/oslat/oslat.c?h=unstable/devel/latest&id=165b597e3003c6870f5980e8902014d9344e6cf3]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- src/oslat/oslat.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/src/oslat/oslat.c b/src/oslat/oslat.c
-index f1a82f2..a8b6155 100644
---- a/src/oslat/oslat.c
-+++ b/src/oslat/oslat.c
-@@ -69,7 +69,9 @@ static inline void frc(uint64_t *pval)
- 	__asm__ __volatile__("mfspr %0, 268\n" : "=r" (*pval));
- }
- # else
--#  error Need frc() for this platform.
-+#  define relax()          do { } while (0)
-+#  define frc(x)
-+#  define FRC_MISSING
- # endif
- #else
- # error Need to add support for this compiler.
-@@ -810,6 +812,12 @@ int main(int argc, char *argv[])
- 	int i, n_cores;
- 	cpu_set_t cpu_set;
- 
-+#ifdef FRC_MISSING
-+	printf("This architecture is not yet supported. "
-+	       "Please implement frc() function first for %s.\n", argv[0]);
-+	return 0;
-+#endif
-+
- 	CPU_ZERO(&cpu_set);
- 
- 	g.app_name = argv[0];
--- 
-2.20.1
-
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 21bf9e649b..cc9b14dccb 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_RT_TESTS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on !BR2_TOOLCHAIN_USES_MUSL # cyclictest
+	depends on BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
+	select BR2_PACKAGE_NUMACTL
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -32,3 +34,4 @@ comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 3.14, dy
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index 66834006d8..f56500c26e 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,4 +1,4 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/rt-tests/sha256sums.asc
-sha256 611c5a2b02964ab778e037ae16402e8d1cb8456628c7ca38d85a7548f33e52e3  rt-tests-1.9.tar.xz
+sha256 3740ad97b164a1cd77d9ee32bba23a4a0b2495a76468bcf40ff60b55c2a3a709  rt-tests-1.10.tar.xz
 # locally computed hash
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 7761beeb52..a8c3d54b9d 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -6,22 +6,17 @@
 
 RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
-RT_TESTS_VERSION = 1.9
+RT_TESTS_VERSION = 1.10
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_NUMACTL),y)
 RT_TESTS_DEPENDENCIES = numactl
-else
-RT_TESTS_MAKE_OPTS += NUMA=0
-endif
 
 define RT_TESTS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		CC="$(TARGET_CC)" \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		prefix=/usr \
-		$(RT_TESTS_MAKE_OPTS)
+		prefix=/usr
 endef
 
 define RT_TESTS_INSTALL_TARGET_CMDS
