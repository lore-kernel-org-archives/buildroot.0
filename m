From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Feb 2020 20:40:41 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: gbm needs a DRI driver or a
 Gallium driver w/ EGL
In-Reply-To: <20200219191013.17818-1-romain.naour@smile.fr>
References: <20200219191013.17818-1-romain.naour@smile.fr>
Message-ID: <20200222194041.GK17342@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-02-19 20:10 +0100, Romain Naour spake thusly:
> src/gbm/cd6bfad@@gbm at sha/main_backend.c.o: In function `_gbm_create_device':
> backend.c:(.text+0x38): undefined reference to `gbm_dri_backend'
> backend.c:(.text+0x40): undefined reference to `gbm_dri_backend'
> backend.c:(.text+0x74): undefined reference to `gbm_dri_backend'
> backend.c:(.text+0x78): undefined reference to `gbm_dri_backend'
> collect2: error: ld returned 1 exit status
> 
> This issue has been trigged since [1]:
> "package/mesa3d: add option to configure gbm support"
> 
> Before the patch, the gbm support was autodetected by meson and enabled
> only when at least one dri driver was enabled [2].
> 
> On the Buildroot side, the gbm support was explicitely enabled only when
> BR2_PACKAGE_MESA3D_OPENGL_EGL was set.
> 
> We have two cases:
> - At least one DRI driver.
> - No DRI driver but one Gallium w/ EGL enable (EGL selected or not by the
>   Gallium driver). In this case the meson build system set with_dri to true
>   (even if no DRI driver is enabled) to use the builtin:egl_dri2 [3].
> 
> The gbm's meson build system seems to handle the case where no dri driver is
> enabled [4] but it still use main/backend.c source file [6] that use
> gbm_dri_backend [7]. So with_dri2 must always be set.
> 
> Probably a missing check in meson.build:
> 
>  if with_gbm and not with_dri
>    error('GBM backend needs a dri driver or a gallium driver w/ EGL support.')
>  endif
> 
> Add a dependency on GBM option:
> 
>  depends on BR2_PACKAGE_MESA3D_DRI_DRIVER \
>          || (BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && BR2_PACKAGE_MESA3D_OPENGL_EGL)
> 
> Fixes:
> http://autobuild.buildroot.net/results/b9b6281983388dc22d929887d653da3db60f1f2c
> 
> [1] b6c051acf787c804e732bc58ba8d7e440701a168
> [2] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/meson.build#L348
> [3] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/meson.build#L212
> [4] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/src/gbm/meson.build#L37
> [5] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/src/gbm/meson.build#L24
> [6] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/src/gbm/main/backend.c#L38
> [7] http://lists.busybox.net/pipermail/buildroot/2020-February/274425.html
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

So, with the other patch you sent later (and that I already applied),
the conditions for gbm are now very strict, to the point where there is
only three conditions under wich it is freely selectable: one of the DRI
drivers is enabled, *and* OSMesa is enabled.

Now, gbm depends on Galium and EGL, but EGL forcibly selects GBM.

So the comment that states "gbm needs [...] gallium and EGL", alrhough
technically correct, is totally useless, because enabling EGL gives no
choice as it forcibly enables gbm.

I know mesa3d is complex, but our packaging of it really looks like it
is overly complicated for no good reasons. It evolved organically over
the years, and probably now is a good time for a full revamp of the
package.

Any taker?

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index dbfc59bad5..0788f47137 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -400,9 +400,15 @@ comment "OpenGL API Support"
>  
>  config BR2_PACKAGE_MESA3D_GBM
>  	bool "gbm"
> +	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER \
> +		|| (BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && BR2_PACKAGE_MESA3D_OPENGL_EGL)
>  	help
>  	  Enable Generic Buffer Management (gbm)
>  
> +comment "gbm support needs a dri driver or a gallium driver w/ EGL support."
> +	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER \
> +		|| !(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && BR2_PACKAGE_MESA3D_OPENGL_EGL)
> +
>  config BR2_PACKAGE_MESA3D_OPENGL_GLX
>  	bool "OpenGL GLX"
>  	depends on BR2_PACKAGE_XORG7
> -- 
> 2.21.1
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
