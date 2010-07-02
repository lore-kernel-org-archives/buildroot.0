From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Jul 2010 14:04:34 +0200
Subject: [Buildroot] [git commit master 1/1] blackbox: needs iconv if !locale
Message-ID: <20100702120718.A7A9E8227D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ca3489da7cdad87979f3bb096bdd3c85b9b46f9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2101

At the same time fix dependencies so it can be built without a local
X server, and a comment is shown if C++ support isn't enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |   17 +++++++++--------
 package/blackbox/Config.in   |    5 +++++
 package/blackbox/blackbox.mk |    6 +++++-
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index a889324..7e95a3b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -13,14 +13,14 @@
 	New packages: cgilua, copas, coxpcall, ffmpeg, luafilesystem,
 	luasocket, rings, wsapi, xavante, xterm
 
-	Updated/fixed packages: berkeleydb, bash, busybox, cdrkit, dash,
-	dialog, diffutils, distcc, dmalloc, dnsmasq, dropbear, fbv,
-	file, gawk, gstreamer, gzip, intltool, ipsec-tools, iptables,
-	libart, libfuse, libgpg-error, libidn, liblockfile, links,
-	lmbench, lrzsz, make, module-init-tools, nbd, ncurses, netperf,
-	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
-	sdl_ttf, squashfs, tn5250, tremor, usbutils, xkeyboard-config,
-	xserver_xorg-server
+	Updated/fixed packages: berkeleydb, bash, blackbox, busybox,
+	cdrkit, dash, dialog, diffutils, distcc, dmalloc, dnsmasq,
+	dropbear, fbv, file, gawk, gstreamer, gzip, intltool,
+	ipsec-tools, iptables, libart, libfuse, libgpg-error, libidn,
+	liblockfile, links, lmbench, lrzsz, make, module-init-tools,
+	nbd, ncurses, netperf, ntfsprogs, openssl, php, qt, quagga,
+	sqlite, sdl, sdl_mixer, sdl_ttf, squashfs, tn5250, tremor,
+	usbutils, xkeyboard-config, xserver_xorg-server
 
 	Removed packages: modutils, portage, rxvt
 
@@ -51,6 +51,7 @@
 	#2035: ipsec-tools-0.7.2 fails to build with gcc-4.4.x
 	#2038: Bump ncurses to 5.7
 	#2095: make gconfig: undefined reference to symbol 'dlsym@@GLIBC_2.2.5'
+	#2101: blackbox depends on locale support
 	#2119: Tries to build kernel, although disabled in config
 	#2155: Compression lzo don't set for ubifs
 
diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index bf237c5..70f7eb4 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -2,8 +2,13 @@ config BR2_PACKAGE_BLACKBOX
 	bool "blackbox"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  Blackbox is a fast, lightweight window manager for the X
 	  Window System.
 
 	  http://blackboxwm.sourceforge.net/
+
+comment "blackbox requires a toolchain with C++ support enabled"
+	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index 41deb58..e3c8c34 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -14,6 +14,10 @@ BLACKBOX_INSTALL_TARGET:=YES
 BLACKBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
 
-BLACKBOX_DEPENDENCIES:=xserver_xorg-server
+BLACKBOX_DEPENDENCIES = xlib_libX11
+
+ifneq ($(BR2_ENABLE_LOCALE),y)
+BLACKBOX_DEPENDENCIES += libiconv
+endif
 
 $(eval $(call AUTOTARGETS,package,blackbox))
-- 
1.7.1
