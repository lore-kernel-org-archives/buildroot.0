From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:42:24 +0100
Subject: [Buildroot] [git commit] fltk: replace dependency on X.org server
	with dependency on libraries
Message-ID: <20130112215437.6DD57996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e28272314b3e014e780ac44b9015da24292966a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fltk is a X client library, so it doesn't make sense for it to depend
on the X.org server. Instead, it depends on libX11, libXext and libXt,
so we use those libraries as fltk dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fltk/Config.in |    2 ++
 package/fltk/fltk.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/fltk/Config.in b/package/fltk/Config.in
index eff72b5..2085192 100644
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_FLTK
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
 	  A cross-platform C++ GUI toolkit for UNIX/Linux (X11),
 	  Microsoft Windows, and MacOS X.
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index a5dac37..3f192cd 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -11,6 +11,6 @@ FLTK_INSTALL_STAGING = YES
 FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_CONF_OPT = --enable-threads --with-x
-FLTK_DEPENDENCIES = xserver_xorg-server xlib_libXt
+FLTK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt
 
 $(eval $(autotools-package))
