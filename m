From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 14 Jul 2016 21:01:09 +0200
Subject: [Buildroot] [PATCH 3/3] package/rt-tests: disable for musl
	toolchains
In-Reply-To: <1468522869-3887-1-git-send-email-romain.naour@gmail.com>
References: <1468522869-3887-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1468522869-3887-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cyclictest program doesn't build with musl toolchains due to
several issues with a different implementation of the "struct sigevent"
from Glibc/uClibc and musl (similar to [1]).

The pi_stress program doesn't build with musl toolchains with the
following error since musl doesn't provide _POSIX_THREAD_PRIO_INHERIT
define even if musl have Priority Inheritance mutexes [2]:

src/pi_tests/pi_stress.c:78:2: error: #error "Can't run this test without PI Mutex support"
 #error "Can't run this test without PI Mutex support"

Since the fix for cyclictest is not trivial, disable rt-tests for musl
toolchains.

Fixes:
http://autobuild.buildroot.net/results/c27/c272ef7df6190cbb688e6db0b1ee210e6fbb472c

[1] https://bugs.mysql.com/bug.php?id=80322
[2] http://www.openwall.com/lists/musl/2016/03/18/6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/rt-tests/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 12e084e..08967ce 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RT_TESTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
+	depends on !BR2_TOOLCHAIN_USES_MUSL # cyclictest
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -27,6 +28,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
-comment "rt-tests needs a toolchain w/ NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
-- 
2.5.5
