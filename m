From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 21:05:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: x11 needs EGL,
 GLX or a vulkan driver
In-Reply-To: <20191229131453.327907-2-fontaine.fabrice@gmail.com>
References: <20191229131453.327907-1-fontaine.fabrice@gmail.com>
 <20191229131453.327907-2-fontaine.fabrice@gmail.com>
Message-ID: <20200915210543.647f37bd@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Dec 2019 14:14:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> As specified in meson.build, x11 platform needs EGL, GLX or a vulkan
> driver:
> 
> if with_platform_x11
>   if with_any_vk or with_egl or (with_glx == 'dri' and with_dri_platform == 'drm')
>     pre_args += '-DHAVE_X11_PLATFORM'
>   endif
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e044609e603ca68695d842d08809fdcb35bc8127

This autobuilder failure seems related to the XvMC issue fixed by PATCH
1/2 in this series.

> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 844360950c..373fe7004c 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -87,6 +87,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_X11
>  	bool
>  	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBXCB
> +	select BR2_PACKAGE_MESA3D_OPENGL_EGL if !(BR2_PACKAGE_MESA3D_OPENGL_GLX || BR2_PACKAGE_MESA3D_VULKAN_DRIVER)

I am rather confused but this. How is having a Vulkan driver at the
same "level" as having either EGL or GLX ?

Shouldn't it be the responsibility of whoever selects
BR2_PACKAGE_MESA3D_NEEDS_X11 to define whether EGL or GLX is used. It
seems a bit "random" to me that EGL is selected if neither GLX nor a
Vulkan driver are enabled.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
