From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 00:32:31 +0200
Subject: [Buildroot] [git commit] newt: not available for static only builds
Message-ID: <20150521223521.6A08981E12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bee6ae663f592f53d71f4dfb031281cb46dabb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a40/a400e1fe7291d3bd3171ad04ce5fd7ba235d39af/
http://autobuild.buildroot.net/results/ec3/ec38d0f1d1faa2a87321bab10f87772eb819adc9/
http://autobuild.buildroot.net/results/7cb/7cbc8cd265d527c7b56d57e511903b23a4a84489/

newt uses autoconf but not automake, and unconditionally tries to build a
.so file - So it doesn't work in static only builds.

The only reverse dependency is network-manager, which already depends on
glibc.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/newt/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/newt/Config.in b/package/newt/Config.in
index 1b3068a..a221615 100644
--- a/package/newt/Config.in
+++ b/package/newt/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NEWT
 	bool "newt"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # slang
+	depends on !BR2_STATIC_LIBS # unconditionally creates .so
 	select BR2_PACKAGE_SLANG
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -10,6 +11,6 @@ config BR2_PACKAGE_NEWT
 
 	  http://www.redhat.com/
 
-comment "newt needs a toolchain w/ wchar"
+comment "newt needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
