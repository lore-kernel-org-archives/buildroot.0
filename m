From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Mar 2014 00:57:28 +0100
Subject: [Buildroot] [PATCH 02/91] mesa3d: modularize and bump to
 version 10.0.4
In-Reply-To: <BLU0-SMTP4563F4DB1A0D9347C21F5F9D9610@phx.gbl>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP4563F4DB1A0D9347C21F5F9D9610@phx.gbl>
Message-ID: <20140329235728.GQ3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-03-29 21:56 +0100, Bernd Kuhls spake thusly:
[--SNIP--]
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 0ce168e..217528b 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
[--SNIP--]
> +menu "Additional API Support"
> +depends on BR2_PACKAGE_MESA3D_DRIVER
> +
> +config BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	bool "EGL"
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_HAS_OPENGL_EGL
> +	help
> +	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL applications
> +	  similar to GLX, for X, and WGL, for Windows.
> +
> +config BR2_PACKAGE_MESA3D_OPENGL_ES
> +	bool "OpenGL ES"
> +	select BR2_PACKAGE_HAS_OPENGL_ES
> +	help
> +	  Use the Khronos OpenGL ES APIs.  This is commonly used on embedded
> +	  systems and represents a subset of the OpenGL API.
> +
> +endmenu
> +
> +config BR2_PACKAGE_PROVIDES_OPENGL_EGL
> +	default "mesa3d"

Ah, but that is wrong! If BR2_PACKAGE_MESA3D_OPENGL_EGL is not selected,
then mesa3d can not be a provider of EGL!

This should have been:

    config BR2_PACKAGE_PROVIDES_OPENGL_EGL
        default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL

> +config BR2_PACKAGE_PROVIDES_OPENGL_ES
> +	default "mesa3d"

Ditto.

> +endif

I'm preparing a patch...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
