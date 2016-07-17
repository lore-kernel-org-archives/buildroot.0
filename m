From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 17:59:55 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/mesa3d: provides libgl not
 only with DRI drivers
In-Reply-To: <1468690971-19702-3-git-send-email-bernd.kuhls@t-online.de>
References: <1468690971-19702-1-git-send-email-bernd.kuhls@t-online.de>
 <1468690971-19702-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160717155955.GK3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-07-16 19:42 +0200, Bernd Kuhls spake thusly:
> This patch is a follow-up for
> https://github.com/buildroot/buildroot/commit/999d4a263118ab8581190d3e3c8bdc471896628f
> 
> libGL.so and support files are not only available with DRI drivers but
> also with Gallium drivers, in fact mesa3d can be built without any
> drivers enabled - unless X.org is enabled it will provide libGL.so.

I guess you meant: unless X.org is disabled, mesa3d will provide libGL.so.

I think this patch should got before the Vulkan one. Otherwise, with
only the Vulkan patch applied and not this one, this would create an
incorrect situation, whereby libGL is installed, but we're not saying
so.

Regards,
Yann E. MORIN.

> Tested using this defconfig:
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_XORG7=y
> 
> Fixes
> http://autobuild.buildroot.net/results/d97/d97a80e6de066a7dea08b284eab24fc44b11d661/
> 
> kodi-visualisation-waveforhue detects OpenGL installed by mesa3d but the
> kodi package itself does not select libglew before because mesa3d was
> not listed as a provider for libgl in the buildroot build system.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: rebased and included in Vulkan-driver patch series
> 
>  package/mesa3d/Config.in | 9 ++++-----
>  package/mesa3d/mesa3d.mk | 9 +++++----
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 4c4a273..0b141b8 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -6,6 +6,7 @@ menuconfig BR2_PACKAGE_MESA3D
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XPROTO_GLPROTO if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
> @@ -28,7 +29,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  
>  config BR2_PACKAGE_MESA3D_DRI_DRIVER
>  	select BR2_PACKAGE_MESA3D_DRIVER
> -	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
>  	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
>  	bool
> @@ -37,10 +37,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>  	bool
>  	select BR2_PACKAGE_MESA3D_DRIVER
>  
> -config BR2_PACKAGE_PROVIDES_LIBGL
> -	default "mesa3d" if BR2_PACKAGE_MESA3D_DRI_DRIVER && \
> -		BR2_PACKAGE_XORG7
> -
>  config BR2_PACKAGE_MESA3D_DRIVER
>  	bool
>  
> @@ -190,6 +186,9 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
>  
>  endif # BR2_PACKAGE_MESA3D_DRIVER
>  
> +config BR2_PACKAGE_PROVIDES_LIBGL
> +	default "mesa3d" if BR2_PACKAGE_XORG7
> +
>  config BR2_PACKAGE_PROVIDES_LIBEGL
>  	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
>  
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index a7a787a..c636a8a 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -111,10 +111,6 @@ endif
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
>  MESA3D_DEPENDENCIES += xlib_libXxf86vm
>  endif
> -# libGL is only provided for a full xorg stack
> -ifeq ($(BR2_PACKAGE_XORG7),y)
> -MESA3D_PROVIDES += libgl
> -endif
>  MESA3D_CONF_OPTS += \
>  	--enable-shared-glapi \
>  	--enable-driglx-direct \
> @@ -145,6 +141,11 @@ MESA3D_CONF_OPTS += --enable-opengl --enable-dri
>  # we do not need libva support in mesa3d, therefore disable this option
>  MESA3D_CONF_OPTS += --disable-va
>  
> +# libGL is only provided for a full xorg stack
> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +MESA3D_PROVIDES += libgl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
>  MESA3D_PROVIDES += libegl
>  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> -- 
> 2.8.1
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
