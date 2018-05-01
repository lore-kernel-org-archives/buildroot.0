From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  1 May 2018 19:30:03 +0300
Subject: [Buildroot] [PATCH] bluez-alsa: needs NPTL
Message-ID: <8188b2c1ff0529d1b30581a7d7403ad344615dcd.1525192203.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bluez-alsa calls pthread_setname_np() which is only provided by the NPTL
pthread implementation.

Fixes:
http://autobuild.buildroot.net/results/707/707fd46921b1cfda90e9c30be33ca918f2d0cb00/
http://autobuild.buildroot.net/results/7a6/7a632c2b6b9021aa6edcd5126400de26e2b8ca42/

Cc: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bluez-alsa/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index 317762057c3d..f082f4b83821 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BLUEZ_ALSA
 	bool "bluez-alsa"
 	depends on !BR2_STATIC_LIBS # bluez5
 	depends on !BR2_PACKAGE_BLUEZ_UTILS # bluez5
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5
 	depends on BR2_USE_MMU # bluez5 -> dbus
@@ -28,8 +28,8 @@ config BR2_PACKAGE_BLUEZ_ALSA_HCITOP
 
 endif
 
-comment "bluez-alsa needs a toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+comment "bluez-alsa needs a toolchain w/ wchar, NPTL, headers >= 3.4, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-- 
2.17.0
