From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Dec 2013 11:00:13 +0100
Subject: [Buildroot] [git commit] X.org: needs dynamic library support
Message-ID: <20131207100108.12E109BF66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a3089573439f77a4b752879cff925b4ff45938b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xlib_libX11, one of the main libraries of X.org, uses dlfcn.h and dlopen.
To avoid having to add a dependency on !BR2_PREFER_STATIC_LIB on tons of
packages, we promote this dependency to X.org itself (similar to how thread
support is handled in X.org).

Fixes
http://autobuild.buildroot.net/results/a47/a47c5d96f880af04b85bb6773e87d04f9d7c2864/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index a534df9..15e2f8b 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_XORG7
 	bool "X.org X Window System"
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB # dlopen in xlib_libX11
 	help
 	  Support for X11R7 libraries, servers, drivers, and/or
 	  applications in the target.
@@ -262,5 +263,5 @@ if BR2_PACKAGE_XORG7
 	endmenu
 endif
 
-comment "X.org needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "X.org needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
