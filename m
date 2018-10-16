From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Oct 2018 14:45:37 +0200
Subject: [Buildroot] [git commit] squid: requires C++11 toolchain
Message-ID: <20181016135755.E7692838EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b30cfc8eef3eef3d50347ad191c6dd90c32e591
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The squid changelog for version 4.0.1 mentions that "C++11 compiler
support is now mandatory". The code uses the std::map::emplace method
that gcc before 4.8 does not support.

Also fixes:
http://autobuild.buildroot.net/results/370/37093f8d3395850b2db5ed645f60d1c2df92768d/
http://autobuild.buildroot.net/results/921/92117726e7b4ede08dcc0e4fd1a85171fd17aeb8/
http://autobuild.buildroot.net/results/e67/e679ef90219c5e8f9c94ddcd7d3f9582f79ef751/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index aeffbc6579..50f65de433 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,12 +1,13 @@
-comment "squid needs a toolchain w/ C++ not affected by GCC bug 64735"
+comment "squid needs a toolchain w/ C++, gcc >= 4.8 not affected by bug 64735"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	# needs fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
