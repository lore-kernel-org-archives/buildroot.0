From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jan 2013 00:12:09 +0100
Subject: [Buildroot] [git commit] x11r7: move X.org server style option
Message-ID: <20130108232310.B6F939A6E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=940fcba1a5d86d7f3dd20b2ae953bb15eeb95042
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The selection between "modular" server and "Kdrive" server really
belongs as a sub-option of the X.org server itself, rather than as a
global x11r7 option. So we move it under the X.org server option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                     |   18 ------------------
 package/x11r7/xserver_xorg-server/Config.in |   18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 2aac5a2..dc84798 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -13,24 +13,6 @@ menuconfig BR2_PACKAGE_XORG7
 
 if BR2_PACKAGE_XORG7
 
-choice
-	prompt "X Window System server type"
-	default BR2_PACKAGE_XSERVER_tinyx
-	help
-	  Select the X Window System server to use
-
-config BR2_PACKAGE_XSERVER_xorg
-	bool "Modular X.org"
-	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
-
-comment 'X.org requires largefile and C++ support'
-	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
-
-config BR2_PACKAGE_XSERVER_tinyx
-	bool "TinyX"
-
-endchoice
-
 menu "X11R7 Servers"
 	source package/x11r7/xserver_xorg-server/Config.in
 endmenu
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 02c2828..bea0ffa 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -59,6 +59,24 @@ comment "xorg-xserver is BROKEN on AVR32"
 
 if BR2_PACKAGE_XSERVER_XORG_SERVER
 
+choice
+	prompt "X Window System server type"
+	default BR2_PACKAGE_XSERVER_tinyx
+	help
+	  Select the X Window System server to use
+
+config BR2_PACKAGE_XSERVER_xorg
+	bool "Modular X.org"
+	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
+
+comment "X.org requires largefile and C++ support"
+	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
+
+config BR2_PACKAGE_XSERVER_tinyx
+	bool "TinyX"
+
+endchoice
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR
     bool "Null root cursor"
     help
