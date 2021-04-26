From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:12:47 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libgeos: use
 specific bug instead of BR2_nios2 to disable package
Message-ID: <20210426205011.CF38B85AFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef39cf7c53523b960cfaa31650c343d80ae94c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Let's use the _BUG_ form for disabling this package instead of BR2_nios2
architecture as we already use it for other packages.

Propagate this dependency to postgis. Also add the missing dependency on
bug 21464 to postgis.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout:
 - put 27597 after 21464 instead of before it;
 - propagate dependency to postgis;
 - mention the bugs in the comments.
]
(cherry picked from commit 72eba37e520ede9277a7a84cde82be992eb5639d)
[Peter: drop postgis logic, not in 2021.02.x]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeos/Config.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index bbcafe7740..ebe40bd1ff 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_LIBGEOS
 	bool "libgeos"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
 	  JTS Topology Suite (JTS). It aims to contain the complete
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-	depends on !BR2_nios2 || !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
+comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		   !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
+		   !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
