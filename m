From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Dec 2015 19:22:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: virgl driver needs egl
 & drm
In-Reply-To: <1450630809-17381-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450630809-17381-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151220182234.GH3677@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-12-20 18:00 +0100, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/7b3/7b38131ebb6b20daec1a6d2c49b25c5300f319fe/
> http://autobuild.buildroot.net/results/61b/61b8b87f0460751257f480ef478e753635cab798/
> http://autobuild.buildroot.net/results/971/97154ea0e780623d23b20b6b9fcc5df6190875c9/
> http://autobuild.buildroot.net/results/dcf/dcf4e31e6b6eeadc7a2d7c87697f57d699673b9e/
> http://autobuild.buildroot.net/results/399/399cca80ada5798decc87bff69a3acc432e8f3d0/
> http://autobuild.buildroot.net/results/60f/60f63958b2310e00937c498ddf2a0295ff77683a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in | 1 +
>  package/mesa3d/mesa3d.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 40af2ef..dd6a8c6 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -79,6 +79,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
>  	bool "Gallium virgl driver"
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_OPENGL_EGL
>  	help
>  	  virgl is the 3D acceleration backend for the virtio-gpu
>  	  shipping with qemu.
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 195ccff..be11724 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -131,6 +131,10 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
>  MESA3D_PROVIDES += libegl
>  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
>  MESA3D_EGL_PLATFORMS = drm
> +else
> +ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
> +MESA3D_EGL_PLATFORMS = drm
> +endif

I'm not usre I like this. Having multiple code-paths that set the same
thing looks dubious to me.

At the very least, use else-ifeq construct, to gain one level of
imbrication:

    ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
    MESA3D_EGL_PLATFORMS = drm
    else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
    MESA3D_EGL_PLATFORMS = drm
    endif

However, I'd prefer if we could somehow commonalise this... But that can
be done later (IIRC, I have a series somewhere about that...)

When you fix the else-ifeq block, you can add my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I've also build-tested, but I'll send that tag on the new patch.

Regards,
Yann E. MORIN.

>  endif
>  ifeq ($(BR2_PACKAGE_WAYLAND),y)
>  MESA3D_DEPENDENCIES += wayland
> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
