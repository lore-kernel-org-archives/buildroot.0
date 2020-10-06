From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 23:05:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add missing depends and
 driver name to r100 driver
In-Reply-To: <20200209183441.130187-1-james.hilliard1@gmail.com>
References: <20200209183441.130187-1-james.hilliard1@gmail.com>
Message-ID: <20201006210518.GU11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-09 11:34 -0700, James Hilliard spake thusly:
> Propagate libdrm dependencies.
> 
> Add r100 to menu name to differentiate from r200 dri driver.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/mesa3d/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index ff39652508..788705544d 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -355,7 +355,9 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
>  	  Support for Nvidia-based GPUs.
>  
>  config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
> -	bool "DRI radeon driver"
> +	bool "DRI radeon r100 driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC

This was causing a circular dependency, as noticed by Thomas:

    package/gstreamer1/gstreamer1/Config.in:5:error: recursive dependency detected!
    package/gstreamer1/gstreamer1/Config.in:5:symbo l BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
    package/webkitgtk/Config.in:86:symbol BR2_PACKAGE_WEBKITGTK_MULTIMEDI   A depends on BR2_PACKAGE_WEBKITGTK
    package/webkitgtk/Config.in:23:symb ol BR2_PACKAGE_WEBKITGTK is selected by BR2_PACKAGE_MIDORI
    package/midori/Config.in:9:symbol BR2_PACKAGE_MIDORI depends on BR2_PACKAGE_LIBGTK3 
    package/libgtk3/Config.in:15:symbol BR2_PACKAGE_LIBGTK3 is selected b   y BR2_PACKAGE_VTE
    package/vte/Config.in:1:symbol BR2_PACKAGE_VTE depen    ds on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
    package/opengl/libegl/Config.in:4:symbol BR2_PACKAGE_HAS_LIBEGL_WAYLAND is selected by BR2_PACKAGE_MESA3D_OPENGL_   EGL
    package/mesa3d/Config.in:436:symbol BR2_PACKAGE_MESA3D_OPENGL_EGL   depends on BR2_PACKAGE_MESA3D_DRIVER
    package/mesa3d/Config.in:75:symbo   l BR2_PACKAGE_MESA3D_DRIVER is selected by BR2_PACKAGE_MESA3D_DRI_DRIVER
    package/mesa3d/Config.in:61:symbol BR2_PACKAGE_MESA3D_DRI_DRIVER is s   elected by BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
    package/mesa3d/Config.in:372:symbol BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON depends on BR2_PACKAGE_LIBDRM_HAS  _ATOMIC
    package/libdrm/Config.in:12:symbol BR2_PACKAGE_LIBDRM_HAS_ATOM  IC depends on BR2_PACKAGE_LIBDRM
    package/libdrm/Config.in:1:symbol BR2   _PACKAGE_LIBDRM is selected by BR2_PACKAGE_GST1_VAAPI
    package/gstreamer1/gst1-vaapi/Config.in:1:symbol BR2_PACKAGE_GST1_VAAPI depends on BR2_PAC  KAGE_GSTREAMER1

So, I dropped the dependency, like you already did in 00c1a8c34f7, and
pushed that fix to master.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_MESA3D_DRI_DRIVER
>  	select BR2_PACKAGE_LIBDRM_RADEON
>  	help
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
