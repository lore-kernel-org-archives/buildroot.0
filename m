From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Feb 2020 19:35:22 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: select gbm if no glx,
 no egl and no osmesa-classic
In-Reply-To: <20200222160101.107362-1-romain.naour@gmail.com>
References: <20200222160101.107362-1-romain.naour@gmail.com>
Message-ID: <20200222183522.GI17342@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-02-22 17:01 +0100, Romain Naour spake thusly:
> This issue has been trigged since [1]:
> "package/mesa3d: add option to configure gbm support"
> 
> Before the patch, the gbm support was autodetected by meson and enabled
> only when at least one dri driver was enabled [2].
> 
> On the Buildroot side, the gbm support was explicitely enabled only when
> BR2_PACKAGE_MESA3D_OPENGL_EGL was set.
> 
> Now, the gbm support is explicitely disabled but the meson build system
> check if at least one option OpenGL GLX or OpenGL EGL or GBM or
> OSMesa (classic) library is enabled [3].
> 
> The previous behavious was to enable GBM when GLX, EGL and OSMesa are
> disabled. So select GBM symbol for this case.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a14f329560f8022f7ba8ec43ad8eed84e005d226
> 
> [1] b6c051acf787c804e732bc58ba8d7e440701a168
> [2] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/meson.build#L348
> [3] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/meson.build#L449
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 0788f47137..1b4b281970 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -61,6 +61,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  config BR2_PACKAGE_MESA3D_DRI_DRIVER
>  	bool
>  	select BR2_PACKAGE_MESA3D_DRIVER
> +	select BR2_PACKAGE_MESA3D_GBM if \
> +		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
> +		!BR2_PACKAGE_MESA3D_OPENGL_EGL && \
> +		!BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
>  	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
>  		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
>  
> -- 
> 2.24.1
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
