From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 May 2014 23:44:36 +0200
Subject: [Buildroot] [git commit] flann: disallow static library build
Message-ID: <20140513214539.321799CBE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=190b4e12b7ea2de783cf7ed54fa2207f45d66fa5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though flann build system uses CMake, it always tries to build a
shared library, even if BUILD_SHARED_LIBS=OFF is passed. It could
probably be fixed in flann's CMakeLists.txt, but that's not really
worth the effort if upstream doesn't support it.

Therefore, we simply disallow the flann package in purely static
builds.

Fixes:

  http://autobuild.buildroot.org/results/a4e/a4ec0e9f28cd12ce770718fb407bbb4dc93b528b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flann/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/flann/Config.in b/package/flann/Config.in
index 4b0b5a8..6185b12 100644
--- a/package/flann/Config.in
+++ b/package/flann/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FLANN
 	bool "flann"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  FLANN is a library for performing fast approximate nearest
 	  neighbor searches in high dimensional spaces. It contains a
@@ -20,5 +21,5 @@ config BR2_PACKAGE_FLANN_EXAMPLES
 
 endif
 
-comment "flann needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "flann needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
