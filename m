From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 09:18:03 +0100
Subject: [Buildroot] [PATCH v2] kmscube: Add new package
In-Reply-To: <CAOMZO5Dwdu5-+bV=TXA6=-wg+=W05BhE1eEYhzZk6zV71MUBdA@mail.gmail.com>
References: <1487011784-24966-1-git-send-email-festevam@gmail.com>
 <20170213223117.0125c14e@free-electrons.com>
 <CAOMZO5Dwdu5-+bV=TXA6=-wg+=W05BhE1eEYhzZk6zV71MUBdA@mail.gmail.com>
Message-ID: <20170214091803.70ab8d9a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 20:03:29 -0200, Fabio Estevam wrote:

> > PKG_CHECK_MODULES(EGL, egl)
> > PKG_CHECK_MODULES(GLES2, glesv2)

This code means that kmscube will only build fine if the pkg-config
files egl.pc and glesv2.pc are available.

> checking for DRM... yes
> checking for GBM... yes
> checking for EGL... yes
> checking for GLES2... yes
> 
> BR2_PACKAGE_MESA3D_OPENGL_EGL is selected by the Etnaviv mesa driver:
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV, which comes from a patch I
> sent today.
> 
> I don't have BR2_PACKAGE_MESA3D_OPENGL_ES option selected, but I do
> get "checking for GLES2... yes", so I am bit confused.
> 
> Is your suggestion to do something like this?
> 
> config BR2_PACKAGE_KMSCUBE
>  bool "kmscube"
>  depends on BR2_PACKAGE_MESA3D && BR2_PACKAGE_LIBDRM
>  depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
>  select BR2_PACKAGE_MESA3D_OPENGL_ES

I would do just:

	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
	depends on BR2_PACKAGE_MESA3D_OPENGL_ES

that is sufficient, and it's what glmark2/Config.in is doing (except
glmark2 is a bit more complicated since it also supports full OpenGL,
not only OpenGL ES).

The "depends on BR2_PACKAGE_MESA3D && BR2_PACKAGE_LIBDRM" are useless,
because if BR2_PACKAGE_MESA3D_OPENGL_EGL and
BR2_PACKAGE_MESA3D_OPENGL_ES are enabled, then surely mesa3d is
enabled. And mesa3d selects libdrm, so we're good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
