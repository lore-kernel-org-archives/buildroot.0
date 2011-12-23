From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 23 Dec 2011 12:15:04 +0100
Subject: [Buildroot] [git commit] xapp_xman: fix dependencies
Message-ID: <20111223111717.54C2C8FC4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f83273eefb1f72194ee7a9e26d995e37cd53684
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xman needs libXaw, has optional Xprintutil support and doesn't have a
--disable-IPv6 option.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xman/Config.in    |    1 +
 package/x11r7/xapp_xman/xapp_xman.mk |    5 ++++-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xman/Config.in b/package/x11r7/xapp_xman/Config.in
index af9525b..4f4f067 100644
--- a/package/x11r7/xapp_xman/Config.in
+++ b/package/x11r7/xapp_xman/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XAPP_XMAN
 	bool "xman"
+	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  Manual page display program for the X Window System
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index e3f623e..2706d61 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -7,11 +7,14 @@ XAPP_XMAN_VERSION:=1.0.3
 XAPP_XMAN_SOURCE:=xman-$(XAPP_XMAN_VERSION).tar.bz2
 XAPP_XMAN_SITE:=http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAN_INSTALL_TARGET = YES
+XAPP_XMAN_DEPENDENCIES = xlib_libXaw
 
 XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
 		ac_cv_file__etc_man_config=no \
 		ac_cv_file__etc_manpath_config=no
 
-XAPP_XMAN_CONF_OPT = --disable-IPv6
+ifeq ($(BR2_PACKAGE_XLIB_LIBXPRINTUTIL),y)
+XAPP_XMAN_CONF_OPT += --enable-xprint
+endif
 
 $(eval $(call AUTOTARGETS))
