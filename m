From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 14 Dec 2015 07:32:55 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/mesa3d-demos: Disable glesv1
	support
Message-ID: <1450074776-18055-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fixed patch description, git does not like "#" in comments ;) (Thomas)
    split 0001-demos-optional-gl.patch into seperate patch

 package/mesa3d-demos/mesa3d-demos.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 016095b..cfc5406 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -11,6 +11,8 @@ MESA3D_DEMOS_AUTORECONF = YES
 MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
 
+MESA3D_DEMOS_CONF_OPTS += --disable-gles1
+
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
 MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu xlib_libX11 xlib_libXext
 MESA3D_DEMOS_CONF_OPTS += --enable-gl --enable-x11
@@ -27,9 +29,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 MESA3D_DEMOS_DEPENDENCIES += libgles
-MESA3D_DEMOS_CONF_OPTS += --enable-gles1 --enable-gles2
+MESA3D_DEMOS_CONF_OPTS += --enable-gles2
 else
-MESA3D_DEMOS_CONF_OPTS += --disable-gles1 --disable-gles2
+MESA3D_DEMOS_CONF_OPTS += --disable-gles2
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
-- 
2.6.2
