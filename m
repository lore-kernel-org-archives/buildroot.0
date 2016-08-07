From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  8 Aug 2016 00:03:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/rt-tests: remove dependency on
	headers >= 3.14
In-Reply-To: <1470607398-8644-1-git-send-email-romain.naour@gmail.com>
References: <1470607398-8644-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1470607398-8644-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency on kernel headers >= 3.14 was added by
b9fa6c00b1213fd038f2aed52057f22c7e18fd4b since
librttest requires __NR_sched_setattr and
__NR_sched_getattr syscalls (rt-sched).

But a follow up patch allows to remove these syscalls
from librttest. So keep rt-tests package available
for old toolchains (pre 3.14) and remove pi-stress
program if necessary.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/rt-tests/Config.in   |  5 ++---
 package/rt-tests/rt-tests.mk | 10 +++++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index b39856d..08967ce 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # deadline scheduler syscall
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on !BR2_TOOLCHAIN_USES_MUSL # cyclictest
@@ -29,7 +28,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
-comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 3.14, dynamic library"
+comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 1433106..6e42de1 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -14,15 +14,19 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 RT_TESTS_DEPENDENCIES = python
 endif
 
-# Deadline scheduler syscalls are not defined on SuperH.
 # Remove pi_stress which depends on deadline scheduler syscalls.
-ifeq ($(BR2_sh),y)
 define RT_TESTS_REMOVE_RT_SCHED_API
 	$(SED) "s/rt-sched.o//" $(@D)/Makefile
 	$(SED) "s/pi_stress.c//" $(@D)/Makefile
 endef
-endif
+
+# Deadline scheduler syscalls are not defined on SuperH.
+# Deadline scheduler syscalls needs a toolchain w/ headers >= 3.14.
+ifeq ($(BR2_sh),y)
 RT_TESTS_POST_PATCH_HOOKS += RT_TESTS_REMOVE_RT_SCHED_API
+else ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14),)
+RT_TESTS_POST_PATCH_HOOKS += RT_TESTS_REMOVE_RT_SCHED_API
+endif
 
 define RT_TESTS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
-- 
2.5.5
