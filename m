From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Dec 2019 14:45:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: needs threads
Message-ID: <20191230134505.908878-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 656fc50b51c03891d34471fd39003355678f7fde added bitcoin without
adding the threads dependency from boost

Fixes:
 - http://autobuild.buildroot.org/results/8e824314d35e12678023f32650a90539a72c9bab

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bitcoin/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 3936cd3c79..1f08f9f26f 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
@@ -37,9 +38,10 @@ config BR2_PACKAGE_BITCOIN
 
 	  https://bitcoincore.org
 
-comment "bitcoin needs a toolchain w/ C++, wchar"
+comment "bitcoin needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "bitcoin needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
-- 
2.24.0
