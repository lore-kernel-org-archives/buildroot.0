From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 16:51:11 +0100
Subject: [Buildroot] [PATCH 02/10] package/go: refactor host/target
 dependencies
In-Reply-To: <1549381879-2207-1-git-send-email-angelo@amarulasolutions.com>
References: <1549381879-2207-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549381879-2207-3-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to better handling the host/target dependencies of packages, we
need to add the new configuration option BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS.
All golang target packages should depends on this options.
Host packages needs to depend instead on the already available
BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/go/Config.in.host | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index f619ca0..508f664 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
@@ -10,10 +10,16 @@ config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	# MIPS R6 support in Go has not yet been developed.
 	depends on !BR2_MIPS_CPU_MIPS64R6
 
-config BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	# Go doesn't support CGO linking on MIPS64x platforms
 	# See: https://github.com/karalabe/xgo/issues/46
 	depends on !BR2_mips64 && !BR2_mips64el
+
+config BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-- 
2.7.4
