From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2016 16:04:05 -0300
Subject: [Buildroot] [PATCH 1/8] package/mesa3d: introduce new Kconfig
 option to indicate full OpenGL support
In-Reply-To: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <57210D25.1060308@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/04/16 09:20, Bernd Kuhls wrote:

> Until this commit
> https://git.busybox.net/buildroot/commit/package/mesa3d?id=f1894ec95728806e09405d26663e0ea371afaeab
> having an enabled DRI driver meant that X.org & full OpenGL support is
> also present. This is no longer the case which makes is difficult for
> users and other packages to determine whether full OpenGL support is
> present or not.
>
> This patch adds a new Kconfig option BR2_PACKAGE_MESA3D_OPENGL_GL
> to indicate full OpenGL support and meaningful comments in
> mesa3d/Config.in to describe what is necessary to build with full
> OpenGL support.

Hi Bernd.
Just a few nits/doubts about this patch:

>   config BR2_PACKAGE_MESA3D_DRI_DRIVER
>   	select BR2_PACKAGE_MESA3D_DRIVER
>   	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_MESA3D_OPENGL_GL if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
>   	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
>   	bool

You select it here...

> -comment "Additional API Support"
> +comment "API Support"
> +
> +if BR2_PACKAGE_MESA3D_DRI_DRIVER
> +if BR2_PACKAGE_XORG7
> +
> +config BR2_PACKAGE_MESA3D_OPENGL_GL
> +	bool "OpenGL"
> +	help
> +	  This helper option is only visible when enabled and indicates
> +	  that Mesa3D contains full OpenGL support.
> +
> +endif
> +endif

However here it's not really an option is it?
I can understand showing it for clarity though.
Another nit is on EGL/GLES the logic is based on depends, however here 
you're using if/endif, might be good to match all of them (and since 
this isn't likely to grow i'd switch to depends).

Other than my comments above this is the correct approach at fixing the 
"not really opengl" scenario i've created ;)

Regards.
