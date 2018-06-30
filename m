From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:27:38 +0200
Subject: [Buildroot] [git commit] boost: make fiber module select the
 context module
Message-ID: <20180630203109.7FD027F96C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ede7241d50839d53ab0c845d2d099b07fa5aae1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boost fiber module uses the boost context module, so it should
select it.

Due to this, the boost fiber module inherits the dependencies of boost
context: it needs exception_ptr handling, and is only available on the
architectures where boost context is supported.

Fixes:

  http://autobuild.buildroot.net/results/56509d315defb95d4ac6e278a9d40cd98f61baa7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: use only one comment for both gcc bug dependencies.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index b390c6fce8..ac79bb345b 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -124,19 +124,24 @@ config BR2_PACKAGE_BOOST_EXCEPTION
 
 config BR2_PACKAGE_BOOST_FIBER
 	bool "boost-fiber"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	# mips support uses the "pause" instruction, only available
 	# since mips32r2/mips64r2.
 	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
+	select BR2_PACKAGE_BOOST_CONTEXT
 	help
 	  C++11 userland threads library.
 
 comment "boost-fiber needs a toolchain w/ NPTL"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
-comment "boost-fiber needs a toolchain not affected by GCC bug 85180"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85180
+comment "boost-fiber needs a toolchain not affected by GCC bug 64735, 85180"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
