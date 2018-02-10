From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Feb 2018 20:58:15 +0100
Subject: [Buildroot] [PATCH v2,1/1] domoticz: depends on NPTL
Message-ID: <20180210195815.20942-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost 1.66 uses pthread_condattr_setclock in
boost/asio/detail/impl/posix_event.ipp.

Boost is mostly a header-only library, in particular the asio stuff.
There are sub-options for the parts of Boost that are not purely
headers, but there are not any sub-options for the parts of Boost that
are just headers.

So, the options are either to add sub-options to Boost, or to make
Boost as a whole only available on NPTL toolchains. The latter is a bit
annoying as it would mean adding this dependency to all Boost reverse
dependencies, even those not using asio.

So, instead of updating boost, add a dependency to
BR2_TOOLCHAIN_HAS_THREADS_NPTL to domoticz. This is the best solution
that can be done today. It's not perfect, but it's good enough.

Fixes:
 - http://autobuild.buildroot.net/results/197baa15cbf7f4fc7b3ccc602515af3f375ed68f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Korsgaard and Thomas Petazzoni):
 - Add Thomas's explanation/opinion in commit message

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
