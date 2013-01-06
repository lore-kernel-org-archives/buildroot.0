From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:21 +0100
Subject: [Buildroot] [PATCH 09/28] xlib_libX11: do not depend on
	bigreqsproto nor xcmiscproto
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <486cd706eb60bff58da00f26470d07495b998385.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_PACKAGE_XPROTO_BIGREQSPROTO option was selected by
xlib_libX11, but xlib_libX11 does not have this protocol package in
its DEPENDENCIES. In some builds, it leads to xproto_bigreqsproto to
be built as the last package, with no other package depending on it,
which doesn't make sense.

xproto_xcmiscproto was selected and part of DEPENDENCIES, but an
inspection of libX11 configure.ac and libX11 source code shows that it
does not depend on xcmiscproto at all.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libX11/Config.in      |    2 --
 package/x11r7/xlib_libX11/xlib_libX11.mk |    2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libX11/Config.in b/package/x11r7/xlib_libX11/Config.in
index e1189ff..3ad8d00 100644
--- a/package/x11r7/xlib_libX11/Config.in
+++ b/package/x11r7/xlib_libX11/Config.in
@@ -10,7 +10,5 @@ config BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
-	select BR2_PACKAGE_XPROTO_BIGREQSPROTO
-	select BR2_PACKAGE_XPROTO_XCMISCPROTO
 	help
 	  X.Org X11 library
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 75d172c..94107b2 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -8,7 +8,7 @@ XLIB_LIBX11_VERSION = 1.4.2
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_INSTALL_STAGING = YES
-XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_xcmiscproto host-xproto_xproto
+XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto host-xproto_xproto
 XLIB_LIBX11_CONF_OPT = \
 	--disable-malloc0returnsnull \
 	--with-xcb \
-- 
1.7.9.5
