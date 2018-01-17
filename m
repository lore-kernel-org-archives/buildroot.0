From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 17 Jan 2018 18:55:00 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: depends on exception_ptr
Message-ID: <20180117175500.19177-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost 1.66 uses std::exception_ptr in boost/asio/impl/use_future.hpp
So add a dependency on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 for domoticz

Fixes:
 -
http://autobuild.buildroot.net/results/332f677493bf1d802f3700777219843eeba53c81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index c03f84ae44..34bf2521a2 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_SYSTEM
@@ -31,3 +32,6 @@ comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, threads, wchar, dynam
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!(BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3)
+
+comment "domoticz needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.14.1
