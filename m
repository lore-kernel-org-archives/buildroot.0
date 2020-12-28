From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:37:29 +0100
Subject: [Buildroot] [git commit] package/rt-tests: make numactl an optional
 dependency
Message-ID: <20201228212102.90AC88322F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e90744e6902cde8f22d495ca21f6449b644a5d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, rt-tests don't show up in menuconfig and cannot be built if
BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS is not available for the target
architecture. In such a case numactl is also not available what
applies for most small embedded targets.

This dependency was introduced with commit 7f50cbfb800e
("package/rt-tests: bump to version 1.8")

But rt-tests can also be build without numactl when passing NUMA=0 to make.
This possibility is documented on
https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/rt-tests

So this commit changes rt-tests to handle numactl as an optional
dependency.

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rt-tests/Config.in   | 3 ---
 package/rt-tests/rt-tests.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index cc9b14dccb..21bf9e649b 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -5,8 +5,6 @@ config BR2_PACKAGE_RT_TESTS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on !BR2_TOOLCHAIN_USES_MUSL # cyclictest
-	depends on BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
-	select BR2_PACKAGE_NUMACTL
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -34,4 +32,3 @@ comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 3.14, dy
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 26c257213b..7761beeb52 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -9,13 +9,19 @@ RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
 RT_TESTS_VERSION = 1.9
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
 RT_TESTS_DEPENDENCIES = numactl
+else
+RT_TESTS_MAKE_OPTS += NUMA=0
+endif
 
 define RT_TESTS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		CC="$(TARGET_CC)" \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		prefix=/usr
+		prefix=/usr \
+		$(RT_TESTS_MAKE_OPTS)
 endef
 
 define RT_TESTS_INSTALL_TARGET_CMDS
