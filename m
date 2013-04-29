From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Apr 2013 23:00:56 +0200
Subject: [Buildroot] [git commit] xkeyboard-config: make available outside
	of X.org, reduce dependencies
Message-ID: <20130430081120.2FC3C97287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dde83bc4639a7bf80ddd0d66b9ea3a8cc0157d65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xkeyboard-connfig was selectable only if X.org was enabled. However,
weston, the reference implementation of the Wayland protocol, also
needs xkeyboard-config, so we have to make this package available
outside of the if BR2_PACKAGE_XORG7 ... endif conditional.

In addition to this, the xkeyboard-config currently pulls in
xapp_xkbcomp as a runtime dependency, but this dependency is only
needed with X.org. And it also pulls in xlib_libX11 and xproto_proto
as build-time dependencies. But in fact those ones are runtime
dependencies, and they are only needed under X.org. This helps
reducing the number of dependencies of xkeyboard-config in a
weston/wayland configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xkeyboard-config/Config.in           |    7 ++++---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    7 ++++++-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bdc1de1..f39ecf6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -155,6 +155,7 @@ source "package/x11r7/Config.in"
 comment "X libraries and helper libraries"
 source "package/liberation/Config.in"
 source "package/libsexy/Config.in"
+source "package/x11r7/xkeyboard-config/Config.in"
 
 comment "X Window managers"
 source "package/enlightenment/Config.in"
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 971ef37..f7487da 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -257,7 +257,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdata_xbitmaps/Config.in
 		source package/x11r7/xdata_xcursor-themes/Config.in
 		source package/x11r7/xcursor-transparent-theme/Config.in
-		source package/x11r7/xkeyboard-config/Config.in
 	endmenu
 endif
 
diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
index 640bb1d..5d1d6a7 100644
--- a/package/x11r7/xkeyboard-config/Config.in
+++ b/package/x11r7/xkeyboard-config/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_XKEYBOARD_CONFIG
 	bool "xkeyboard-config"
-	select BR2_PACKAGE_XAPP_XKBCOMP
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_XPROTO
+	# Runtime dependencies
+	select BR2_PACKAGE_XAPP_XKBCOMP if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XPROTO_XPROTO if BR2_PACKAGE_XORG7
 	help
 	  keyboard configuration database for X
 
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 78ed1ee..cdddd95 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -3,10 +3,15 @@
 # xkeyboard-config
 #
 #############################################################
+
 XKEYBOARD_CONFIG_VERSION = 2.6
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
-XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp xlib_libX11 xproto_xproto
+XKEYBOARD_CONFIG_LICENSE = MIT
+XKEYBAORD_CONFIG_LICENSE_FILES = COPYING
+
+XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp
+XKEYBOARD_CONFIG_CONF_OPT += --disable-runtime-deps
 
 $(eval $(autotools-package))
 
