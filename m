From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jun 2018 20:45:06 +0200
Subject: [Buildroot] [PATCH 1/1] boost: fiber needs exception_ptr
Message-ID: <20180625184506.455-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fiber needs exception_ptr because context is a transient dependency of fiber
that needs exception_ptr.
An other option would be to make boost fiber depends on boost context
(https://www.boost.org/doc/libs/1_67_0/libs/fiber/doc/html/fiber/overview.html)

Fixes:
 - http://autobuild.buildroot.net/results/56509d315defb95d4ac6e278a9d40cd98f61baa7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index db69afa27f..aedc8be97a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -114,6 +114,7 @@ config BR2_PACKAGE_BOOST_FIBER
 	# mips support uses the "pause" instruction, only available
 	# since mips32r2/mips64r2.
 	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	help
 	  C++11 userland threads library.
@@ -121,6 +122,9 @@ config BR2_PACKAGE_BOOST_FIBER
 comment "boost-fiber needs a toolchain w/ NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
+comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 comment "boost-fiber needs a toolchain not affected by GCC bug 85180"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 
-- 
2.14.1
