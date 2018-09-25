From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 23:19:48 +0200
Subject: [Buildroot] [git commit] domoticz: depends on gcc >= 4.8
Message-ID: <20180925211924.CFFDA88E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5208e9507f5fa33e7f584815d53dac551e449a63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sleep_for is not always defined with gcc <= 4.7, see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52680

To fix this issue, add a dependency to gcc >= 4.8

Fixes:
 - http://autobuild.buildroot.net/results/0dada8dd727f32a4500670f6620adb05943ed0b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/domoticz/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 530027f273..4c5338df0a 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_USE_MMU # mosquitto
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
 	depends on !BR2_STATIC_LIBS # mosquitto
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sleep_for
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -27,10 +28,11 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, NPTL, wchar, dynamic library"
+comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!(BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3)
