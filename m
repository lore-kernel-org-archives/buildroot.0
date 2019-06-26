From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 26 Jun 2019 14:58:57 +0200
Subject: [Buildroot] [PATCH v2 4/7] package/boost: remove gcc bug 85180
 dependency for boost-fiber option
In-Reply-To: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
References: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190626125900.48230-5-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_TOOLCHAIN_HAS_GCC_BUG_85180 dependency is already satisfied because
BR2_PACKAGE_BOOST_FIBER depends on
BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS that doesn't contain
BR2_microblaze and BR2_TOOLCHAIN_HAS_GCC_BUG_85180 depends right on
BR2_microblaze. So let's remove 'depends on
BR2_TOOLCHAIN_HAS_GCC_BUG_85180'.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
V1->V2:
* don't allow building boost context since it's not supported for
  Microblaze
---
 package/boost/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 4e6bbff6df..392d7424fb 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -136,7 +136,6 @@ config BR2_PACKAGE_BOOST_FIBER
 	# since mips32r2/mips64r2.
 	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
@@ -147,9 +146,9 @@ comment "boost-fiber needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
-comment "boost-fiber needs a toolchain not affected by GCC bug 64735, 85180"
+comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || BR2_TOOLCHAIN_HAS_GCC_BUG_85180
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
-- 
2.17.1
