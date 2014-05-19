From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 May 2014 22:42:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkit: Fix OpenGL-related
 dependencies
In-Reply-To: <878upxjyhs.fsf@dell.be.48ers.dk>
References: <1400525369-32257-1-git-send-email-bernd.kuhls@t-online.de>
 <878upxjyhs.fsf@dell.be.48ers.dk>
Message-ID: <20140519204247.GD3508@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-05-19 22:37 +0200, Peter Korsgaard spake thusly:
> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
> 
>  > fixes
>  > http://autobuild.buildroot.net/results/27a/27a674c6a19a729fae5cc33de0360b2a061930c1/
> 
>  > This patch indeed fixes two problems based on the autobuilder-defconfig used.
> 
>  > 1) Add missing dependencies when opengl is detected by webkit to satisfy autobuilder:
> 
>  > checking which GPU acceleration backend to use... opengl
>  > checking for XCOMPOSITE... yes
>  > checking for XDAMAGE... no
>  > configure: error: Package requirements (xdamage) were not met:
> 
>  > 2) ... but opengl should not have been detected with the used defconfig:
>  > $ grep MESA .config
>  > BR2_PACKAGE_MESA3D=y
> 
>  > which will lead to a link error although webkit configure found all dependencies:
> 
>  > /home/br2/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.7.3/../../../../mips-linux-gnu/bin/ld: cannot find -lGL
> 
>  > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  > ---
>  >  package/webkit/webkit.mk |    7 +++++++
>  >  1 file changed, 7 insertions(+)
> 
>  > diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
>  > index 21b535f..c693de7 100644
>  > --- a/package/webkit/webkit.mk
>  > +++ b/package/webkit/webkit.mk
>  > @@ -48,4 +48,11 @@ WEBKIT_CONF_OPT += \
>  >  WEBKIT_CONF_OPT += --with-target=x11
>  >  WEBKIT_DEPENDENCIES += xlib_libXt
>  
>  > +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
>  > +WEBKIT_CONF_OPT += --with-acceleration-backend=opengl
>  > +WEBKIT_DEPENDENCIES += xlib_libXcomposite xlib_libXdamage
> 
> We have to select the corresponding symbols in Config.in as well to
> ensure Kconfig is in sync with the makefiles - E.G. something like:
> 
> select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_HAS_LIBGL
> select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_HAS_LIBGL
> 
> and then in the .mk:
> 
> WEBKIT_DEPENDENCIES += \
>        $(if $(BR_PACKAGE_XLIB_LIBXCOMPOSITE),xlib_libXcomposite) \
>        $(if $(BR_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)

Not that I dislike this, but we explicitly state in the manual that
multi-lines are prefered over single-lines:
    http://buildroot.net/downloads/manual/manual.html#writing-rules-config-in

Let's try to at least pretend we ourself respect our own rules. ;-)

Regards,
Yann E. MORIN.

> ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> WEBKIT_CONF_OPT += --with-acceleration-backend=opengl
> WEBKIT_DEPENDENCIES += libgl
> else
> WEBKIT_CONF_OPT += --with-acceleration-backend=none
> endif
> 
> I'm currently doing a test build to verify.
> 
> -- 
> Bye, Peter Korsgaard
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
