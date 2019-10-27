From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:54:51 +0100
Subject: [Buildroot] [git commit] Revert "package/x11r7/xlib_libXvMC: remove
 xlib_libXv dependency"
Message-ID: <20191027104857.72AA57F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1141e2c4a806a508fdab902813ce17ec36befd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 52ac6d1c6bc625d8438539a7ff0f35d2057e9acc.

While looking at mesa3d package, I found this commit [1] about libxv
refering to an upstream commit [2].

The commit message is confusing "This library does not itself require
libXv for anything." but xv is still checked by the configure script
(pkg-config) and libXvMC still include Xvlib.h from XvMClib.h

In file included from XvMClibint.h:7:0,
                 from XvMC.c:5:
../include/X11/extensions/XvMClib.h:5:10: fatal error: X11/extensions/Xvlib.h:
No such file or directory
 #include <X11/extensions/Xvlib.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

So, xlib_libXv sill use xv library by including a header and using
XvImageFormatValues.

[1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=2dbf10ba3d129d59e1a6c0e46b24c20629b277c6
[2] https://gitlab.freedesktop.org/xorg/lib/libxvmc/commit/dd9ae03725990ee9c9336bca4b267dfbb696002f

Fixes:
http://autobuild.buildroot.org/results/305/3051f4fbc1ab725de542a550e4f9eeb3cae385b8

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libXvMC/Config.in       | 1 +
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXvMC/Config.in b/package/x11r7/xlib_libXvMC/Config.in
index 4be6e01774..5cc6ec766a 100644
--- a/package/x11r7/xlib_libXvMC/Config.in
+++ b/package/x11r7/xlib_libXvMC/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XLIB_LIBXVMC
 	bool "libXvMC"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXV
 	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org XvMC library
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 442c410b57..02959c2305 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -10,7 +10,7 @@ XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
 XLIB_LIBXVMC_LICENSE_FILES = COPYING
 XLIB_LIBXVMC_INSTALL_STAGING = YES
-XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
+XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xorgproto
 XLIB_LIBXVMC_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
