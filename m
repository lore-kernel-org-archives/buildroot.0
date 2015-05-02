From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2015 15:04:24 +0200
Subject: [Buildroot] [PATCH 22/30] package/matchbox: forcibly disable
 support for compositing
In-Reply-To: <5543E29B.6050400@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <65143442337102f480fc792f8f04505f6ab529dd.1429725549.git.yann.morin.1998@free.fr>
 <5543E29B.6050400@mind.be>
Message-ID: <20150502130424.GB13701@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 22:31 +0200, Arnout Vandecappelle spake thusly:
> On 22/04/15 20:09, Yann E. MORIN wrote:
> > Building with the experimental support for compositing is broken:
> > 
> >     /home/ymorin/dev/buildroot/O/host/usr/bin/arm-linux-gnueabihf-gcc
> >     -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> >     -Os -o matchbox-window-manager main.o wm.o base_client.o main_client.o
> >     toolbar_client.o toolbar_client_alt.o dockbar_client.o dialog_client.o
> >     select_client.o desktop_client.o ewmh.o misc.o client_common.o keys.o
> >     list.o stack.o composite-engine.o session.o mbtheme.o xml.o
> >     -lmb -lX11
> >     -L/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> >     -lXext -lXcomposite -lXdamage -lXfixes -lXrender
> >     -L/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> >     -lX11 -lexpat
> >     -L/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> >     -lXfixes
> >     composite-engine.o: In function `gaussian':
> >     /home/ymorin/dev/buildroot/O/build/matchbox-1.2/src/composite-engine.c:65:
> >     undefined reference to `exp'
> > 
> > That's because it forgets to link with -lm.
> > 
> > However, adding "MATCHBOX_CONF_ENV = -lm" does not solve the issue, as
> > it still does not link with -lm at all.
> > 
> > Furthermore, the package does not autoreconf, since it is missing the
> > gconf m4 macros, and Buildroot does not have a package for gconf, hence
> > we can not even patch Makefile.am and autoreconf.
> > 
> > Patching Makefile.in (in addition to .am) could be a solution, but
> > support for compositing is explicitly marked as being experimental.
> > 
> > So, just forcibly disable it altogether.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>  It kind of makes the previous patch redundant, but there you go...
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Right. I've squashed the two patches together, so compositing is
directly disabled without trying to fix it up first.

Thanks! :-)

Regards,
Yann E. MORIN.

> > ---
> >  package/matchbox/matchbox.mk | 13 +------------
> >  1 file changed, 1 insertion(+), 12 deletions(-)
> > 
> > diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> > index be94414..4ec3fb5 100644
> > --- a/package/matchbox/matchbox.mk
> > +++ b/package/matchbox/matchbox.mk
> > @@ -11,22 +11,11 @@ MATCHBOX_LICENSE = GPLv2+
> >  MATCHBOX_LICENSE_FILES = COPYING
> >  
> >  MATCHBOX_DEPENDENCIES = matchbox-lib
> > -MATCHBOX_CONF_OPTS = --enable-expat
> > +MATCHBOX_CONF_OPTS = --enable-expat --disable-composite
> >  
> >  # Workaround bug in configure script
> >  MATCHBOX_CONF_ENV = expat=yes
> >  
> > -ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE)$(BR2_PACKAGE_XLIB_LIBXFIXES)$(BR2_PACKAGE_XLIB_LIBXDAMAGE)$(BR2_PACKAGE_XLIB_LIBXRENDER),yyyy)
> > -MATCHBOX_CONF_OPTS += --enable-composite
> > -MATCHBOX_DEPENDENCIES += \
> > -	xlib_libXcomposite \
> > -	xlib_libXfixes \
> > -	xlib_libXdamage \
> > -	xlib_libXrender
> > -else
> > -MATCHBOX_CONF_OPTS += --disable-composite
> > -endif
> > -
> >  ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
> >  MATCHBOX_DEPENDENCIES += xlib_libXft
> >  endif
> > 
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
