From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Jan 2018 12:28:24 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: depends on NPTL
Message-ID: <20180120112824.12236-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost 1.66 uses pthread_condattr_setclock in
boost/asio/detail/impl/posix_event.ipp so add a dependency to
BR2_TOOLCHAIN_HAS_THREADS_NPTL

Fixes:
 - http://autobuild.buildroot.net/results/197baa15cbf7f4fc7b3ccc602515af3f375ed68f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 34bf2521a2..530027f273 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_USE_MMU # mosquitto
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
 	depends on !BR2_STATIC_LIBS # mosquitto
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3
@@ -26,10 +27,11 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, threads, wchar, dynamic library"
+comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!(BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3)
 
-- 
2.14.1
