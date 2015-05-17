From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 May 2015 16:15:39 +0200
Subject: [Buildroot] [PATCH 2/3] duma: not available for static only builds
In-Reply-To: <1431872140-765-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431872140-765-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1431872140-765-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.net/results/ccfc79586516a6ebb05badfad258aad0b6b9d2a2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/duma/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/duma/Config.in b/package/duma/Config.in
index 7679e64..b1f55fa 100644
--- a/package/duma/Config.in
+++ b/package/duma/Config.in
@@ -6,6 +6,9 @@ config BR2_PACKAGE_DUMA
 	# allocations. Non-MMU platforms cannot perform such
 	# things.
 	depends on BR2_USE_MMU
+	# duma works using LD_PRELOAD, so it always needs to build a
+	# shared library
+	depends on !BR2_STATIC_LIBS
 	help
 	  D.U.M.A. - Detect Unintended Memory Access. A fork of the
 	  Electric Fence library. Detects buffer overflow and
@@ -20,6 +23,7 @@ config BR2_PACKAGE_DUMA_NO_LEAKDETECTION
 
 endif # BR2_PACKAGE_DUMA
 
-comment "duma needs a toolchain w/ C++, threads"
+comment "duma needs a toolchain w/ C++, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
-- 
2.1.0
