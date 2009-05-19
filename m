From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 May 2009 17:32:45 +0200
Subject: [Buildroot] [git commit] mesa: needs C++ support
Message-ID: <20090519153514.5BC3D7786E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c1d6d8fc709f9ec1bf66bc92c6d492b00d2f7aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


mesa (and in turn xorg) needs C++ support.
Based on patch by Steffen Schulz <pepe_ml@gmx.net>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    6 +++---
 package/x11r7/mesa3d/Config.in |    1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 251888b..08b16ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -328,15 +328,15 @@ config BR2_PACKAGE_XSERVER_none
 	bool "none"
 config BR2_PACKAGE_XSERVER_xorg
 	bool "modular xorg"
-	depends on BR2_USE_WCHAR && BR2_LARGEFILE # && BR2_ENABLE_LOCALE
+	depends on BR2_USE_WCHAR && BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP # && BR2_ENABLE_LOCALE
 # depending on BR2_ENABLE_LOCALE gives a recursion error with dbus
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
 	depends on BR2_USE_WCHAR
 endchoice
 
-comment "xorg requires a toolchain with LOCALE, LARGEFILE and WCHAR support"
-	depends on !(BR2_USE_WCHAR && BR2_LARGEFILE && BR2_ENABLE_LOCALE)
+comment "xorg requires a toolchain with C++, LOCALE, LARGEFILE and WCHAR support"
+	depends on !(BR2_USE_WCHAR && BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE)
 comment "tinyx requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
 
diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index 19726cd..a875098 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_LIBDRM
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
 
-- 
1.6.0.6
