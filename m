From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:57:37 +0200
Subject: [Buildroot] [PATCH 1/5] mesa: build statically because of DRI
	drivers
In-Reply-To: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3747c70f962d5b96288372a2ca369965c62a6bd2.1316465857.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autotargets infrastructure now passes --enable-static to all
packages. This works for most of them, except for Mesa:

configure: error: Can't use static libraries for DRI drivers
make[1]: *** [/home/test/outputs/mesa/build/mesa3d-7.6.1/.stamp_configured] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/mesa3d/mesa3d.mk |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index cb0690d..21fc4cc 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -8,7 +8,20 @@ MESA3D_SOURCE:=MesaLib-$(MESA3D_VERSION).tar.gz
 MESA3D_SITE:=ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 
 MESA3D_AUTORECONF = NO
-MESA3D_CONF_OPT = --disable-egl --disable-glu --disable-glw --disable-glut --disable-gallium --with-driver=dri --with-dri-drivers=swrast
+
+# Mesa DRI drivers cannot be built statically, so we must force
+# --disable-static even if the package infrastructure globally passes
+# --enable-static.
+MESA3D_CONF_OPT = 			\
+	--disable-egl			\
+	--disable-glu			\
+	--disable-glw			\
+	--disable-glut 			\
+	--disable-gallium 		\
+	--with-driver=dri 		\
+	--with-dri-drivers=swrast	\
+	--disable-static
+
 MESA3D_INSTALL_STAGING = YES
 
 MESA3D_DEPENDENCIES = xproto_glproto xlib_libXxf86vm xlib_libXdamage xlib_libXfixes xproto_dri2proto libdrm expat
-- 
1.7.4.1
