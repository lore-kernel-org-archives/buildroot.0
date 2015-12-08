From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 22:15:32 +0100
Subject: [Buildroot] [PATCH v7 13/33] package/efl/libefl: add
 OpenGL/OpenGLES support
In-Reply-To: <20151208124636.GL4188@free.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-14-git-send-email-romain.naour@openwide.fr>
 <20151208124636.GL4188@free.fr>
Message-ID: <20151208211532.GX4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-08 13:46 +0100, Yann E. MORIN spake thusly:
> On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> > Allow to enable graphic acceleration using OpenGL or
> > OpenGLES with efl libraries.
> > 
> > The full opengl option depend on X11, because full openGL means GLX,
> > which means X11.
> > 
> > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
[--SNIP--]
> > diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> > index 560a7b3..b0cb675 100644
> > --- a/package/efl/libefl/Config.in
> > +++ b/package/efl/libefl/Config.in
> > @@ -105,6 +105,34 @@ config BR2_PACKAGE_LIBEFL_X_XLIB
> >  	select BR2_PACKAGE_XLIB_LIBXTST
> >  	select BR2_PACKAGE_XPROTO_GLPROTO
> >  
> > +choice
> > +	bool "OpenGL support"
> > +	default BR2_PACKAGE_LIBEFL_OPENGL   if BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_XORG7
> > +	default BR2_PACKAGE_LIBEFL_OPENGLES if BR2_PACKAGE_HAS_LIBGLES
> > +	help
> > +	  libevas can be configured to use HW acceleration with OpenGL or
> > +	  OpenGLES.
> > +
> > +config BR2_PACKAGE_LIBEFL_OPENGL_NONE
> > +	bool "none"
> > +
> > +config BR2_PACKAGE_LIBEFL_OPENGL
> > +	bool "opengl"
> > +	depends on BR2_PACKAGE_HAS_LIBGL
> > +	depends on BR2_PACKAGE_XORG7
> 
> As an aferthought, and after playing around with the options in the
> menuconfig, I now wonder if it really makes sense to have full OpenGL
> support without X11 support (introduced in the previous patch)?
> 
> In which case we would probably write:
> 
>     config BR2_PACKAGE_LIBEFL_OPENGL
>         bool "opengl"
>         depends on BR2_PACKAGE_HAS_LIBGL
>         depends on BR2_PACKAGE_LIBEFL_X_XLIB
> 
>     comment "opengl support needs an opengl provider and X11 support"
>         depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_LIBEFL_X_XLIB
> 
> But then we reference "X11 support" which is directly hidden when Xorg
> is not enabled, so maybe add another comment in the X11 support patch:
> 
>     comment "X11 support needs Xorg"
>         depends on !BR2_PACKAGE_XORG7

Alternatively, we could keep the dependencies as you wrote them, but
add:

    config BR2_PACKAGE_LIBEFL_OPENGL
        bool "opengl"
        depends on BR2_PACKAGE_HAS_LIBGL
        depends on BR2_PACKAGE_XORG7
        select BR2_PACKAGE_LIBEFL_X_XLIB

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
