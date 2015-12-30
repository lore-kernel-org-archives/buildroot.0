From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 17:16:08 +0100
Subject: [Buildroot] [git commit] openbox: add missing propagated
	dependencies from pango
Message-ID: <20151230161705.F0D4A8274C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=520c7287d4511865b4866bed0091a935dfa261fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pango needs atomics support and C++ support, and those dependencies
where not propagated to the new openbox package.

Should fix:

  http://autobuild.buildroot.org/results/d3b/d3b17335f2e5720a69b4635602fef30a5ae34660/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openbox/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/openbox/Config.in b/package/openbox/Config.in
index da781a5..f5475bf 100644
--- a/package/openbox/Config.in
+++ b/package/openbox/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_OPENBOX
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
+	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PANGO
@@ -17,7 +19,9 @@ config BR2_PACKAGE_OPENBOX
 
 	  http://openbox.org
 
-comment "openbox needs a toolchain w/ threads, wchar"
+comment "openbox needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
