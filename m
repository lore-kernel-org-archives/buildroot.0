From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 15:02:42 +0200
Subject: [Buildroot] [git commit] package/rt-tests: disable for too old
	toolchains
Message-ID: <20160716130250.48E757FC6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9fa6c00b1213fd038f2aed52057f22c7e18fd4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rt-tests doesn't build with some "old" toolchains due to missing local
syscall number definition for the new kernel deadline scheduler on some
architectures. Upsteam added __NR_sched_setattr and __NR_sched_setattr
definition only for common architectures (x86, x86_64, arm) and tile if
not already defined [1].

Instead of adding missing syscall number, avoid building rt-tests
with toolchain compiled with too old kernel headers (i.e
!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14)

At runtime, a 3.14 kernel must be used otherwise these syscall are not
available.

[1]
https://kernel.googlesource.com/pub/scm/utils/rt-tests/rt-tests.git/+/ef2dee4232b7cae594ef7ecb7230c4bd18cea3f3

Fixes:
http://autobuild.buildroot.net/results/6fa/6facaeb10588bdf3ff029b882a8ae6ffba815cdc

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rt-tests/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 08967ce..b39856d 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # deadline scheduler syscall
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on !BR2_TOOLCHAIN_USES_MUSL # cyclictest
@@ -28,7 +29,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
-comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, dynamic library"
+comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 3.14, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	depends on BR2_USE_MMU
