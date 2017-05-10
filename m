From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:38:28 +0200
Subject: [Buildroot] [git commit] package/ltp-testsuite: refine architecture
	dependency
Message-ID: <20170510214114.291997F905@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=583f59702bdd2baa040a37eef061530973269880
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 5c7152f..4c00e40 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,6 +1,15 @@
 config BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	bool
-	default y
+	# Needs __sync*() built-ins for 4-byte data, except on a few
+	# architectures for which a specific implementation is
+	# provided in ltp-testsuite
+	default y if BR2_TOOLCHAIN_HAS_SYNC_4
+	default y if BR2_arc
+	default y if BR2_i386
+	default y if BR2_powerpc
+	default y if BR2_powepc64
+	default y if BR2_powerpc64le
+	default y if BR2_x86_64
 	# does not build on nios2, cachectl.h issue
 	depends on !BR2_nios2
 
