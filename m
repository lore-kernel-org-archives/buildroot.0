From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  8 May 2017 23:18:33 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/ltp-testsuite: add dependency on
	BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20170508211833.3462-1-romain.naour@gmail.com>
References: <20170508211833.3462-1-romain.naour@gmail.com>
Message-ID: <20170508211833.3462-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated in commit [1], sparc toolchains doesn't have
any of __sync_*() family of functions implementation.

When __sync_add_and_fetch() is missing, ltp fallback to a local
implementation of tst_atomic_add_return() specific for each
supported architecture.
But there is none for sparc.

So add a dependency on BR2_TOOLCHAIN_HAS_SYNC_4 except for
architectures where a specific implementation is provided
in ltp-testsuite.

Fixes:
http://autobuild.buildroot.net/results/d7c/d7c3b145a64ed3916b89ddb4090050f3b9205e37

[1] 6856e417da4f3aa77e2a814db2a89429af072f7d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: add a dependency on BR2_TOOLCHAIN_HAS_SYNC_4 except for arc, i386,
    powerpc, powerpc64, powerpc64le and x86_64
---
 package/ltp-testsuite/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index a7d3e58..efa21e2 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -3,6 +3,12 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	# Needs __sync*() built-ins for 4-byte data, except on a few
+	# architectures for which a specific implementation is provided
+	# in ltp-testsuite
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_arc || BR2_i386 \
+		|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le \
+		|| BR2_x86_64
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -13,5 +19,8 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 comment "ltp-testsuite needs a glibc or uClibc toolchain w/ NPTL"
 	depends on !BR2_nios2
+	depends on !BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_arc && !BR2_i386 \
+		&& !BR2_powerpc && !BR2_powerpc64 && !BR2_powerpc64le \
+		&& !BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
-- 
2.9.3
