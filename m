From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 23:05:30 +0100
Subject: [Buildroot] [git commit] package/mesa3d-demos: Disable glesv1
	support
Message-ID: <20151215221257.1447181E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b030363ab1bc74cad7ae2e22cf8ce43e52d64a1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only files enabled by glesv1 support are in src/egl/opengles1/

Quoting src/egl/opengles1/Makefile.am:

"# These programs aren't intended to be included with the normal distro."
"# They're not too interesting but they're good for testing."

Most of the files present in this directory contain

"#include <X11/Xlib.h>"

which breaks a wayland-only build because the build system does not take
care of the x11 dependency here. Since these files are "not too
interesting" anyway we just disable glesv1 support.

Fixes
http://autobuild.buildroot.net/results/b3e/b3ed3ee174a3ddce84bf64039eac39d4e6e75b71/

[Thomas: adapt on top of master.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-demos/mesa3d-demos.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index c0f889a..094239c 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -11,7 +11,10 @@ MESA3D_DEMOS_AUTORECONF = YES
 MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
 
-MESA3D_DEMOS_CONF_OPTS += --without-glut --disable-osmesa
+MESA3D_DEMOS_CONF_OPTS += \
+	--without-glut \
+	--disable-osmesa \
+	--disable-gles1
 
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
 MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu xlib_libX11 xlib_libXext
@@ -29,9 +32,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 MESA3D_DEMOS_DEPENDENCIES += libgles
-MESA3D_DEMOS_CONF_OPTS += --enable-gles1 --enable-gles2
+MESA3D_DEMOS_CONF_OPTS += --enable-gles2
 else
-MESA3D_DEMOS_CONF_OPTS += --disable-gles1 --disable-gles2
+MESA3D_DEMOS_CONF_OPTS += --disable-gles2
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
