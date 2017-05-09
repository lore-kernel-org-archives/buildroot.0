From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  9 May 2017 22:59:28 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/ltp-testsuite: introduce
	BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
In-Reply-To: <20170509205929.8394-1-romain.naour@gmail.com>
References: <20170509205929.8394-1-romain.naour@gmail.com>
Message-ID: <20170509205929.8394-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltp-testsuite needs __sync*() built-ins for 4-byte data, except on a few
architectures for which a specific implementation is provided in
ltp-testsuite source code.

To prepare for the introduction of this dependency, add
BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/ltp-testsuite/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index a7d3e58..699a289 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,10 +1,14 @@
+config BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
+	bool
+	# does not build on nios2, cachectl.h issue
+	default y if !BR2_nios2
+
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	# does not build, cachectl.h issue
-	depends on !BR2_nios2
+	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
@@ -12,6 +16,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	  http://linux-test-project.github.io
 
 comment "ltp-testsuite needs a glibc or uClibc toolchain w/ NPTL"
-	depends on !BR2_nios2
+	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
-- 
2.9.3
