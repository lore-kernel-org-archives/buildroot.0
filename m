From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 13:51:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix --with-egl-platforms
Message-ID: <20170611115128.8662-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Option --with-egl-platforms was deprecated over --with-platforms:
https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=7748c3f5eb1d98ca97d2cf6e516ff54a5d75130a

The deprecated option --with-egl-platforms now defaults to x11
https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=17.1#n1641

This default value is then used by --with-platforms
https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=17.1#n1659

which leads to a configure error if neither of the above options was
set when looking for x11 dependencies.

From now on we need to use --with-platforms in all cases.

Fixes
http://autobuild.buildroot.net/results/775/775aad481a99926749a13c9f10012dbb9b90ead9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c720ce2f9..a41427619 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -161,13 +161,15 @@ MESA3D_EGL_PLATFORMS += x11
 endif
 MESA3D_CONF_OPTS += \
 	--enable-gbm \
-	--enable-egl \
-	--with-egl-platforms=$(subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
+	--enable-egl
 else
 MESA3D_CONF_OPTS += \
 	--disable-egl
 endif
 
+MESA3D_CONF_OPTS += \
+	--with-platforms=$(subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
+
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
 MESA3D_PROVIDES += libgles
 MESA3D_CONF_OPTS += --enable-gles1 --enable-gles2
-- 
2.11.0
