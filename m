From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Mar 2014 22:21:35 +0200
Subject: [Buildroot] [PATCH 14/16] opengl: New virtual package
In-Reply-To: <1396296389-28821-15-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
 <1396296389-28821-15-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140331202135.GC5004@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-03-31 22:06 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in       |    4 ++++
>  package/opengl/Config.in       |    1 +
>  package/opengl/libgl/Config.in |    6 ++++++
>  package/opengl/libgl/libgl.mk  |   16 ++++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/opengl/libgl/Config.in
>  create mode 100644 package/opengl/libgl/libgl.mk
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 8ed0c07..d735e76 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -34,6 +34,7 @@ comment "DRI drivers need shared libdrm"
>  
>  config BR2_PACKAGE_MESA3D_DRIVER
>  	bool
> +	select BR2_PACKAGE_HAS_OPENGL_GL
>  
>  menu "Drivers"
>  
> @@ -106,6 +107,9 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
>  
>  endmenu
>  
> +config BR2_PACKAGE_PROVIDES_OPENGL_GL
> +	default "mesa3d" if BR2_PACKAGE_MESA3D_DRIVER
> +
>  config BR2_PACKAGE_PROVIDES_OPENGL_EGL
>  	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL

Hey! I'm already working on this! :-)

Are you on IRC? There is a very lengthy discussion on this topic right
now in the #buildroot channel. This would have been a nice occasion to
properly sync-up our work, and to avoid duplication...

(adding Paul in Cc, who's been very helpful on IRC on this topic.)

But anyway, this patch should be split in two:
  - a first patch to add the virtual package itself
  - a second patch to make mesa3d a provider to the virtual package

> diff --git a/package/opengl/Config.in b/package/opengl/Config.in
> index ed81835..02010a9 100644
> --- a/package/opengl/Config.in
> +++ b/package/opengl/Config.in
> @@ -1,4 +1,5 @@
>  source "package/opengl/libegl/Config.in"
> +source "package/opengl/libgl/Config.in"
>  source "package/opengl/libgles/Config.in"
>  source "package/opengl/libopenvg/Config.in"
>  source "package/opengl/libopenmax/Config.in"
> diff --git a/package/opengl/libgl/Config.in b/package/opengl/libgl/Config.in
> new file mode 100644
> index 0000000..5421c86
> --- /dev/null
> +++ b/package/opengl/libgl/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HAS_OPENGL_GL
> +	bool
> +
> +config BR2_PACKAGE_PROVIDES_OPENGL_GL
> +	depends on BR2_PACKAGE_HAS_OPENGL_GL
> +	string
> diff --git a/package/opengl/libgl/libgl.mk b/package/opengl/libgl/libgl.mk
> new file mode 100644
> index 0000000..66346d6
> --- /dev/null
> +++ b/package/opengl/libgl/libgl.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# libgl
> +#
> +################################################################################
> +
> +LIBGL_SOURCE =
> +LIBGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_GL))
> +
> +ifeq ($(BR2_PACKAGE_HAS_OPENGL_GL),y)
> +ifeq ($(LIBGL_DEPENDENCIES),)
> +$(error No libGL implementation selected. Configuration error.)
> +endif
> +endif
> +
> +$(eval $(generic-package))

Strange how this is so similar to what I've done here! Hehehe! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
