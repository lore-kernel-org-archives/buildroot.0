From: Andreas Klinger <ak@it-klinger.de>
Date: Sun, 27 Dec 2020 13:37:48 +0100
Subject: [Buildroot] [PATCH] package/rt-tests: add config option to build
 without numactl
Message-ID: <20201227123747.GA15039@arbad>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rt-tests don't show up in config menu and is not build if
BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS is not available on the target
architecture. In such a case numactl is also not available what applies
for most small embedded targets.

This dependency was introduced with commit 7f50cbfb800e
("package/rt-tests: bump to version 1.8")

But rt-tests can also be build without numactl when passing NUMA=0 to
make. This possibility is documented on
https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/rt-tests

Add an option BR2_PACKAGE_RT_TESTS_WITHOUT_NUMACTL to build without
numactl to the configuration menu.

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 package/rt-tests/Config.in   | 11 +++++++++--
 package/rt-tests/rt-tests.mk |  8 ++++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index cc9b14dccb..d2fffacde6 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_RT_TESTS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on !BR2_TOOLCHAIN_USES_MUSL # cyclictest
-	depends on BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
 	select BR2_PACKAGE_NUMACTL
 	help
 	  Set of utilities for testing the real-time behaviour of a
@@ -25,6 +24,15 @@ config BR2_PACKAGE_RT_TESTS
 
 	  https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/rt-tests
 
+config BR2_PACKAGE_RT_TESTS_WITHOUT_NUMACTL
+	bool "build without numactl"
+	default y if !BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_RT_TESTS
+	help
+	  Build rt-tests with NUMA=0 for allowing embedded systems to use
+	  it.
+	  Select this if you don't have numactl on your target.
+
 comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_PACKAGE_RT_TESTS
 	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -34,4 +42,3 @@ comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 3.14, dy
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 26c257213b..4c845cf070 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -9,13 +9,17 @@ RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
 RT_TESTS_VERSION = 1.9
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
-RT_TESTS_DEPENDENCIES = numactl
+
+ifeq ($(BR2_PACKAGE_RT_TESTS_WITHOUT_NUMACTL),y)
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
-- 
2.20.1
