From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  3 Sep 2014 21:48:09 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: Add optional dependency
	xlib_libXxf86vm
Message-ID: <1409773691-13668-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xlib_libXxf86vm is an optional dependency for the DRI drivers,
quote from mesa3d/configure.ac:

    # add xf86vidmode if available
    PKG_CHECK_MODULES([XF86VIDMODE], [xxf86vm], HAVE_XF86VIDMODE=yes, HAVE_XF86VIDMODE=no)
    if test "$HAVE_XF86VIDMODE" = yes ; then
        dri_modules="$dri_modules xxf86vm"
    fi

Add the package as an optional dependency to have reproducable builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index aea78c3..c2f2b9b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -82,6 +82,9 @@ MESA3D_CONF_OPT += --enable-dri3
 else
 MESA3D_CONF_OPT += --disable-dri3
 endif
+ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
+MESA3D_DEPENDENCIES += xlib_libXxf86vm
+endif
 MESA3D_PROVIDES += libgl
 MESA3D_CONF_OPT += \
 	--enable-dri \
-- 
1.7.10.4
