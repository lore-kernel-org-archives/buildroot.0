From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 18:03:08 +0200
Subject: [Buildroot] [PATCH 01/13] xorg: reorganize the selection of the
	X.org server type
In-Reply-To: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1956d0f6d640a1acff7ab09be99e890fc202839b.1247846597.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The selection of the X.org server type was really strange. The user
had to select between none, tinyx and modular. Now, the menuconfig
interface display a single item for X.org, that can be
selected/unselected. This entry contains a submenu, that allows to
select the type of the X.org server (tinyX or modular) and that allows
(as before) to enable/disable X.org libraries, drivers, etc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |   32 --------------------------------
 package/x11r7/Config.in |   31 ++++++++++++++++++++++++++++---
 2 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cb83563..7e7ca00 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -318,39 +318,7 @@ source "package/qtopia4/Config.in"
 
 #source "package/microwin/Config.in"
 
-
-choice
-	prompt "X Window System server"
-	default BR2_PACKAGE_XSERVER_none
-	help
-	  Select the X Window System server to use
-
-config BR2_PACKAGE_XSERVER_none
-	bool "none"
-config BR2_PACKAGE_XSERVER_xorg
-	bool "modular xorg"
-	depends on BR2_USE_WCHAR && BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP # && BR2_ENABLE_LOCALE
-# depending on BR2_ENABLE_LOCALE gives a recursion error with dbus
-config BR2_PACKAGE_XSERVER_tinyx
-	bool "tinyx"
-	depends on BR2_USE_WCHAR
-endchoice
-
-comment "xorg requires a toolchain with C++, LOCALE, LARGEFILE and WCHAR support"
-	depends on !(BR2_USE_WCHAR && BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE)
-comment "tinyx requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
-
-config BR2_X11_PREFIX
-	string
-	default "/usr/X11R6"	if BR2_PACKAGE_XSERVER_xorg
-	default "/usr"		if BR2_PACKAGE_XSERVER_tinyx
-	help
-	  X11 apps root location
-
-if !BR2_PACKAGE_XSERVER_none
 source "package/x11r7/Config.in"
-endif
 
 comment "X libraries and helper libraries"
 #XXX: maybe some of these should depend on !BR2_PACKAGE_XSERVER_none
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 0720e3f..7af62ee 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -10,9 +10,34 @@ help
 	applications in the target.
 
 if BR2_PACKAGE_XORG7
-	menu "X11R7 Servers"
-		source package/x11r7/xserver_xorg-server/Config.in
-	endmenu
+
+choice
+	prompt "X Window System server type"
+	default BR2_PACKAGE_XSERVER_tinyx
+	help
+	  Select the X Window System server to use
+
+config BR2_PACKAGE_XSERVER_xorg
+	bool "Modular X.org"
+	# depending on BR2_ENABLE_LOCALE gives a recursion error with dbus
+	depends on BR2_USE_WCHAR && BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP # && BR2_ENABLE_LOCALE
+
+config BR2_PACKAGE_XSERVER_tinyx
+	bool "TinyX"
+	depends on BR2_USE_WCHAR
+
+endchoice
+
+config BR2_X11_PREFIX
+	string
+	default "/usr/X11R6"	if BR2_PACKAGE_XSERVER_xorg
+	default "/usr"		if BR2_PACKAGE_XSERVER_tinyx
+	help
+	  X11 apps root location
+
+menu "X11R7 Servers"
+	source package/x11r7/xserver_xorg-server/Config.in
+endmenu
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/mesa3d/Config.in
-- 
1.6.0.4
