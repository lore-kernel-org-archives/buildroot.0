From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 17 Sep 2014 14:12:44 +0100
Subject: [Buildroot] [PATCH] mesa3d: Add missing dependencies
In-Reply-To: <87sijr8h2t.fsf@dell.be.48ers.dk>
References: <1410883118-57489-1-git-send-email-Vincent.Riera@imgtec.com>
 <87sijr8h2t.fsf@dell.be.48ers.dk>
Message-ID: <541988CC.1030805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/16/2014 09:07 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
>   > Add xcb-dri3, xcb-present and xshmfence to mesa3d's dependencies.
>   > Otherwise it will fail during the configure phase.
>
>   > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>
> hmm, but we also have optional dri3 support since:
>
> commit 1fcc621f0344c11ebaf7903545cd99d2f5b8ec9b
> Author: Bernd Kuhls <bernd.kuhls@t-online.de>
> Date:   Thu Jul 17 07:42:54 2014 +0200
>
>      package/mesa3d: Fix optional DRI3 support
>
> Looking at configure.ac, I think we should just disable dri support if
> no dri drivers are enabled, E.G.:
>
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index f986d0e..31bbacf 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -75,7 +75,7 @@ endif
>
>   ifeq ($(MESA3D_DRI_DRIVERS-y),)
>   MESA3D_CONF_OPT += \
> -       --without-dri-drivers
> +       --without-dri-drivers --disable-dri
>   else
>   ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
>   MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
>
> What do the mesa3d experts say?
>

Please use this defconfig if you want to reproduce the failure:

-----------------------------------------
BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_SQL=y
BR2_PACKAGE_QT5BASE_MYSQL=y
BR2_PACKAGE_QT5BASE_PSQL=y
BR2_PACKAGE_QT5BASE_TEST=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_LINUXFB=y
BR2_PACKAGE_QT5BASE_DIRECTFB=y
BR2_PACKAGE_QT5BASE_XCB=y
BR2_PACKAGE_QT5BASE_PRINTSUPPORT=y
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5BASE_TSLIB=y
BR2_PACKAGE_QT5CONNECTIVITY=y
BR2_PACKAGE_QT5ENGINIO=y
BR2_PACKAGE_QT5GRAPHICALEFFECTS=y
BR2_PACKAGE_QT5IMAGEFORMATS=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5QUICK1=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_QT5SENSORS=y
BR2_PACKAGE_QT5SERIALPORT=y
BR2_PACKAGE_QT5SVG=y
BR2_PACKAGE_QT5WEBKIT=y
BR2_PACKAGE_QT5WEBKIT_EXAMPLES=y
BR2_PACKAGE_QT5WEBSOCKETS=y
BR2_PACKAGE_QT5X11EXTRAS=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
-----------------------------------------

By the way, if you fix mesa3d and keep building the rest of the stuff, 
you will find a failure of qt5webkit like this one:

platform/graphics/opengl/Extensions3DOpenGLES.cpp:33:21: fatal error: 
EGL/egl.h: No such file or directory

It tries to include that file when the 3D_GRAPHICS macro is enabled, and 
that macro is enabled if Qt has opengl support. I don't know if there 
are more packages providing that file, but the only one I know is this one:

BR2_PACKAGE_MESA3D_OPENGL_EGL

-- 
Vincent
