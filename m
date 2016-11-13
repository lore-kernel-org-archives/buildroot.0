From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Nov 2016 15:09:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Remove opengl headers
 files if opengl support is disabled
In-Reply-To: <20161106181100.10976-1-bernd.kuhls@t-online.de>
References: <20161106181100.10976-1-bernd.kuhls@t-online.de>
Message-ID: <20161113140918.GB3580@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Vicente, All,

On 2016-11-06 19:11 +0100, Bernd Kuhls spake thusly:
> Mesa3d used to install GL/gl.h & co. only if libGL.so was installed.
> 
> After this commit
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=13.0&id=a89faa2022fd995af2019c886b152b49a01f9392
> 
> this is no longer the case leading to misdetection of opengl support by
> vlc if mesa3d was built before:
> 
> http://git.videolan.org/?p=vlc.git;a=blob;f=configure.ac;h=c8900d216540816224e872bef46fbcc93d83ca41;hb=HEAD#l3010
> 
> This patch partly re-introduces a mechanism to clean unwanted files
> installed by mesa3d which was removed when bumping to 12.0.0:
> https://git.buildroot.net/buildroot/commit/package/mesa3d?id=ff3e522e748925f6be5732a6e5df6553468ca0a1
> 
> Fixes
> http://autobuild.buildroot.net/results/13e/13e7c0f5fc6ae8ba5e62b2597d188496c64090fd/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Mesa3d 13.0.0 is marked as being a "new development release". Why did we
switch to this version rather than stick to the stable 12.0.x series?

Besides, it breaks the build with wayland in various ways:

  - uses the wrong wayland-scanner:
    http://autobuild.buildroot.org/results/46c/46c179423cc18d5d17b7635f9f4e126343f9c86f/
    http://autobuild.buildroot.net/results/40a/40a8bb7c74730e41573fb15b4922340577a84860/

  - uses non-exitent wayland macros:
    http://pastebin.com/2pZ69wgQ

Care to have a look at how to fix this, please?

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/mesa3d.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index e17db5c..68df451 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -134,9 +134,15 @@ MESA3D_CONF_OPTS += --enable-opengl --enable-dri
>  # we do not need libva support in mesa3d, therefore disable this option
>  MESA3D_CONF_OPTS += --disable-va
>  
> +define MESA3D_REMOVE_OPENGL_HEADERS
> +	rm -rf $(STAGING_DIR)/usr/include/GL/
> +endef
> +
>  # libGL is only provided for a full xorg stack
>  ifeq ($(BR2_PACKAGE_XORG7),y)
>  MESA3D_PROVIDES += libgl
> +else
> +MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_HEADERS
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
> -- 
> 2.10.2
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
