From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jun 2018 00:02:37 +0200
Subject: [Buildroot] [PATCH v2,3/3] boost: fiber selects context
In-Reply-To: <20180625220237.15217-1-fontaine.fabrice@gmail.com>
References: <20180625220237.15217-1-fontaine.fabrice@gmail.com>
Message-ID: <20180625220237.15217-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fiber needs exception_ptr because context is a dependency of fiber
that needs exception_ptr so select it

Fixes:
 - http://autobuild.buildroot.net/results/56509d315defb95d4ac6e278a9d40cd98f61baa7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS in a first patch
 - Replace coroutine dependency on context by a select in a second patch
 - Make fiber selects context instead of depending on it

 package/boost/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 1ffbbcf827..51b4e85f71 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -124,18 +124,27 @@ config BR2_PACKAGE_BOOST_EXCEPTION
 
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
 
+comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 comment "boost-fiber needs a toolchain not affected by GCC bug 85180"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
-- 
2.14.1
