From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  9 May 2017 22:59:29 +0200
Subject: [Buildroot] [PATCH v3 3/3] package/ltp-testsuite: add dependency on
	BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20170509205929.8394-1-romain.naour@gmail.com>
References: <20170509205929.8394-1-romain.naour@gmail.com>
Message-ID: <20170509205929.8394-3-romain.naour@gmail.com>
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
v3: Fix comment dependency
    Rebase after newly introduced BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS (ThomasP)
v2: add a dependency on BR2_TOOLCHAIN_HAS_SYNC_4 except for arc, i386,
    powerpc, powerpc64, powerpc64le and x86_64
---
 package/ltp-testsuite/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 699a289..e0e7f62 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	bool
 	# does not build on nios2, cachectl.h issue
-	default y if !BR2_nios2
+	# Needs __sync*() built-ins for 4-byte data, except on a few
+	# architectures for which a specific implementation is provided
+	# in ltp-testsuite
+	default y if !BR2_nios2 || (BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_arc \
+		|| BR2_i386 || BR2_powerpc || BR2_powerpc64 \
+		|| BR2_powerpc64le || BR2_x86_64)
 
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
-- 
2.9.3
