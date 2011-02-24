From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Feb 2011 09:43:52 +0100
Subject: [Buildroot] [git commit master 1/1] synergy: fix build
Message-ID: <20110224084448.E69E78F6C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c9253253c1cb80fb8574c3d313a129b64b4ad2a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3307

Synergy needs libXtst, a toolchain with wchar support and was missing
an include for exit().

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    5 +++--
 package/synergy/Config.in                |    6 ++++--
 package/synergy/synergy-1.3.1-exit.patch |   21 +++++++++++++++++++++
 package/synergy/synergy.mk               |    2 +-
 4 files changed, 29 insertions(+), 5 deletions(-)
 create mode 100644 package/synergy/synergy-1.3.1-exit.patch

diff --git a/CHANGES b/CHANGES
index 687561e..28e9941 100644
--- a/CHANGES
+++ b/CHANGES
@@ -13,8 +13,8 @@
 	makedevs, matchbox-fakekey, matchbox-startup-monitor, mdadm,
 	metacity, mpd, nasm, nfs-utils, olsr, openssl, popt,
 	pthread-stubs, quagga, rpm, samba, sdl, sdl_gfx, sdl_image,
-	sdl_mixer, sdl_sound, sdl_ttf, squashfs, taglib, tcpreplay,
-	tiff, wpa_supplicant, xcb-util,
+	sdl_mixer, sdl_sound, sdl_ttf, squashfs, synergy, taglib,
+	tcpreplay, tiff, wpa_supplicant, xcb-util,
 	xdriver_xf86-input-{acepad,aiptek,evdev,joystick,keyboard},
 	xdriver_xf86-input-{mouse,synaptics,void},
 	xdriver_xf86-video-{chips,dummy,geode,glide,intel,nv,wsfb},
@@ -29,6 +29,7 @@
 	#3205: Failing chmod when running "make" in buildroot (openssl)...
 	#3277: quagga fails to build with SNMP support
 	#3283: See why nfs-utils needs fakeroot, and convert to autotools
+	#3307: synergy fails to build due to missing XTest library
 
 2011.02-rc1, Released February 14th, 2011:
 
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index a2766b1..7d8c54e 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_SYNERGY
 	bool "synergy"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_XLIB_LIBXTST
 	help
 	  Synergy lets you easily share a single mouse and
 	  keyboard between multiple computers with different
@@ -10,5 +12,5 @@ config BR2_PACKAGE_SYNERGY
 
 	  http://synergy2.sourceforge.net/
 
-comment "synergy requires a toolchain with C++ support enabled"
-	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
+comment "synergy requires a toolchain with C++ and WCHAR support enabled"
+	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
diff --git a/package/synergy/synergy-1.3.1-exit.patch b/package/synergy/synergy-1.3.1-exit.patch
new file mode 100644
index 0000000..1eb665f
--- /dev/null
+++ b/package/synergy/synergy-1.3.1-exit.patch
@@ -0,0 +1,21 @@
+[PATCH] fix build issue in CArchDaemonUnix
+
+exit() needs #include <stdlib.h> for the prototype.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ lib/arch/CArchDaemonUnix.cpp |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: synergy-1.3.1/lib/arch/CArchDaemonUnix.cpp
+===================================================================
+--- synergy-1.3.1.orig/lib/arch/CArchDaemonUnix.cpp
++++ synergy-1.3.1/lib/arch/CArchDaemonUnix.cpp
+@@ -19,6 +19,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <errno.h>
++#include <stdlib.h>
+ 
+ //
+ // CArchDaemonUnix
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index f70806d..ce3f214 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -11,6 +11,6 @@ SYNERGY_AUTORECONF = NO
 SYNERGY_INSTALL_STAGING = NO
 SYNERGY_INSTALL_TARGET = YES
 
-SYNERGY_DEPENDENCIES = xserver_xorg-server
+SYNERGY_DEPENDENCIES = xserver_xorg-server xlib_libXtst
 
 $(eval $(call AUTOTARGETS,package,synergy))
-- 
1.7.3.4
