From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  8 May 2017 21:08:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: disable for sparc
In-Reply-To: <20170508190819.28493-1-romain.naour@gmail.com>
References: <20170508190819.28493-1-romain.naour@gmail.com>
Message-ID: <20170508190819.28493-2-romain.naour@gmail.com>
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

Fixes:
http://autobuild.buildroot.net/results/d7c/d7c3b145a64ed3916b89ddb4090050f3b9205e37

[1] 6856e417da4f3aa77e2a814db2a89429af072f7d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/ltp-testsuite/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index a7d3e58..070374a 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	# missing __sync_*() family of functions
+	depends on !BR2_sparc
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -12,6 +14,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	  http://linux-test-project.github.io
 
 comment "ltp-testsuite needs a glibc or uClibc toolchain w/ NPTL"
-	depends on !BR2_nios2
+	depends on !BR2_nios2 && !BR2_sparc
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
-- 
2.9.3
