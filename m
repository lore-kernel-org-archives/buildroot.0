From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 Feb 2012 17:22:38 +0100
Subject: [Buildroot] [git commit] mesa3d: fix build
Message-ID: <20120206190750.46AC68FE09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d425d3334231340790677e6f6e8212901e6dc23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We build mesa3d with dri support, which doesn't work with static builds,
so disable it.

From configure.ac:

dri)
    # DRI must be shared, I think
    if test "$enable_static" = yes; then
        AC_MSG_ERROR([Can't use static libraries for DRI drivers])
    fi

At the same time fixup minor style issues (:= vs =, long lines).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mesa3d/mesa3d.mk |   26 +++++++++++++++++++++-----
 1 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 095d66d..1e9ec77 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -3,13 +3,29 @@
 # mesa3d
 #
 #############################################################
-MESA3D_VERSION:=7.6.1
-MESA3D_SOURCE:=MesaLib-$(MESA3D_VERSION).tar.gz
-MESA3D_SITE:=ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 
-MESA3D_CONF_OPT = --disable-egl --disable-glu --disable-glw --disable-glut --disable-gallium --with-driver=dri --with-dri-drivers=swrast
+MESA3D_VERSION = 7.6.1
+MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
+MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_INSTALL_STAGING = YES
 
-MESA3D_DEPENDENCIES = xproto_glproto xlib_libXxf86vm xlib_libXdamage xlib_libXfixes xproto_dri2proto libdrm expat
+MESA3D_CONF_OPT = \
+	--disable-egl \
+	--disable-glu \
+	--disable-glw \
+	--disable-glut \
+	--disable-gallium \
+	--with-driver=dri \
+	--with-dri-drivers=swrast \
+	--disable-static
+
+MESA3D_DEPENDENCIES = \
+	xproto_glproto \
+	xlib_libXxf86vm \
+	xlib_libXdamage \
+	xlib_libXfixes \
+	xproto_dri2proto \
+	libdrm \
+	expat
 
 $(eval $(call AUTOTARGETS))
