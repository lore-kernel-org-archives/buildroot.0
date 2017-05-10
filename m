From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:37:02 +0200
Subject: [Buildroot] [git commit] package/ltp-testsuite: introduce
	BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
Message-ID: <20170510214114.186CF826CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c514410ed1554ce7a86f87c061479fe979385b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ltp-testsuite needs __sync*() built-ins for 4-byte data, except on a few
architectures for which a specific implementation is provided in
ltp-testsuite source code.

To prepare for the introduction of this dependency, add
BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas: slightly adjust how the ARCH_SUPPORTS option is defined.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index a7d3e58..5c7152f 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,10 +1,15 @@
+config BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
+	bool
+	default y
+	# does not build on nios2, cachectl.h issue
+	depends on !BR2_nios2
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
@@ -12,6 +17,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	  http://linux-test-project.github.io
 
 comment "ltp-testsuite needs a glibc or uClibc toolchain w/ NPTL"
-	depends on !BR2_nios2
+	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
