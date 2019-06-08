From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jun 2019 20:59:02 +0200
Subject: [Buildroot] [git commit] package/openzwave: needs dynamic library
Message-ID: <20190608185942.3541F8A554@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b91a6cc49acb2594bb3d5a357b32af5ff916c095
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openzwave always builds and installs a dynamic library, so add a
dependency to !BR2_STATIC_LIBS. domoticz is the only package that uses
openzwave and it already depends on !BR2_STATIC_LIBS.

This behavior has not changed from 1.5 to 1.6 even if there is only a
build failure with 1.6.

Fixes:
 - http://autobuild.buildroot.org/results/f6c8c4072b2cd5b6e9aa548f41ab000e152f1add

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openzwave/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/openzwave/Config.in b/package/openzwave/Config.in
index d86d358723..f2a4ca5225 100644
--- a/package/openzwave/Config.in
+++ b/package/openzwave/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENZWAVE
 	bool "openzwave"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_TINYXML
 	help
@@ -12,6 +13,6 @@ config BR2_PACKAGE_OPENZWAVE
 
 	  http://www.openzwave.net
 
-comment "openzwave needs a toolchain w/ C++, threads, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR
+comment "openzwave needs a toolchain w/ C++, dynamic library, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
