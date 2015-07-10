From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Jul 2015 00:24:50 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: Remove libGL
 headers/pkgconfig when OpenGL is disabled
In-Reply-To: <1433711482-32265-1-git-send-email-bernd.kuhls@t-online.de>
References: <1433711482-32265-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150710222450.GC5469@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-06-07 23:11 +0200, Bernd Kuhls spake thusly:
> mesa3d defaults to --enable-opengl due to its weird configure.ac:
> http://git.buildroot.net/buildroot/commit/package/mesa3d/mesa3d.mk?id=384d601d4ea2c41bb7928f756bfe88af4d38b38b
> 
> This leads to include/GL/*.h and lib/pkgconfig/gl.pc being installed to
> STAGING_DIR. These files are enough for other packages to wrongly assume
> that libGL.so is present, like vlc.
> 
> Fixes
> http://autobuild.buildroot.net/results/e63/e639dabfb260006acb8a204851b96f9275ce53a7/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: Instead of fixing vlc?s libGL detection let?s remove the superfluous
>     files installed by mesa3d (Yann)
> 
>  package/mesa3d/mesa3d.mk |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 4a419de..669eada 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -77,9 +77,16 @@ MESA3D_CONF_OPTS += \
>  	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
>  endif
>  
> +define MESA3D_REMOVE_OPENGL_PC
> +	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/dri.pc
> +	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
> +	rm -rf $(STAGING_DIR)/usr/include/GL/
> +endef
> +
>  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
>  MESA3D_CONF_OPTS += \
>  	--without-dri-drivers --without-dri --disable-dri3
> +MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
>  else
>  ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
>  MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
> @@ -102,7 +109,8 @@ endif
>  
>  # Always enable OpenGL:
>  #   - it is needed for GLES (mesa3d's ./configure is a bit weird)
> -#   - but if no DRI driver is enabled, then libgl is not built
> +#   - but if no DRI driver is enabled, then libgl is not built,
> +#     remove dri.pc and gl.pc in this case (MESA3D_REMOVE_OPENGL_PC)
>  MESA3D_CONF_OPTS += --enable-opengl
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
> -- 
> 1.7.10.4
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
