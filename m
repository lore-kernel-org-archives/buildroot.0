From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 20:48:47 +0200
Subject: [Buildroot] [PATCH v14 3/8] package/mesa3d: switch build system
 to meson
In-Reply-To: <20190921181053.8999-4-bernd.kuhls@t-online.de>
References: <20190921181053.8999-1-bernd.kuhls@t-online.de>
 <20190921181053.8999-4-bernd.kuhls@t-online.de>
Message-ID: <20274cb4-9aeb-3fa8-cd80-dc71a11e4a36@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 20:10, Bernd Kuhls wrote:
> @@ -73,16 +64,21 @@ MESA3D_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -mno-compact-eh"
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
> -MESA3D_CONF_OPTS += --enable-glx --disable-mangling
> +# Disable-mangling not yet supported by meson build system.
> +# glx:
> +#  dri          : dri based GLX requires at least one DRI driver || dri based GLX requires shared-glapi
> +#  xlib         : xlib conflicts with any dri driver
> +#  gallium-xlib : Gallium-xlib based GLX requires at least one gallium driver || Gallium-xlib based GLX requires softpipe or llvmpipe || gallium-xlib conflicts with any dri driver.

 I can't say I understand this bit... It sounds like -Dglx=dri will only work if
at least one DRI driver is selected (and then also the question is, will it work
at runtime if you use a non-DRI driver?). But we can enable OPENGL_GLX if only
Gallium drivers are selected.

> +MESA3D_CONF_OPTS += -Dglx=dri


[snip]
>  # Always enable OpenGL:
> -#   - it is needed for GLES (mesa3d's ./configure is a bit weird)
> -MESA3D_CONF_OPTS += --enable-opengl --enable-dri
> +#   - Building OpenGL ES without OpenGL is not supported, so always keep opengl enabled.
> +MESA3D_CONF_OPTS += -Dopengl=true

 Not related to this patch, but doesn't that mean that BR2_PACKAGE_HAS_LIBGL
should be selected unconditionally, and not only if
BR2_PACKAGE_MESA3D_OPENGL_GLX is selected?

 Regards,
 Arnout
