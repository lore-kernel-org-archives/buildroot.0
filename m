From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 May 2014 00:14:42 +0200
Subject: [Buildroot] [PATCH] infra/pkg-virtual: validate only one
 provider provides an implementation
In-Reply-To: <20140514000536.10ad4931@free-electrons.com>
References: <20140513180945.GC3507@free.fr>
 <1400017670-2708-1-git-send-email-yann.morin.1998@free.fr>
 <20140514000536.10ad4931@free-electrons.com>
Message-ID: <20140513221442.GD3507@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-14 00:05 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Tue, 13 May 2014 23:47:50 +0200, Yann E. MORIN wrote:
> 
> > +# Providers shall call this function with all the FEATURES they provide
> > +# 	$(eval $(call virt-provides,FEATURE[ FEATURE ...]))
> > +# where FEATURE has a corresponding BR2_PACKAGE_HAS_FEATURE
> > +define virt-provides
> > +$(foreach p,$(1),\
> > +ifneq ($$(BR2_PACKAGE_PROVIDES_$(p)),$(pkgname))$(sep)\
> > +$$(error $(pkgname is trying to override $$(BR2_PACKAGE_PROVIDES_$(p)) to provide $(p)))$(sep)\
> > +endif$(sep))
> > +endef
> >  
> >  ################################################################################
> >  # inner-virtual-package -- defines the dependency rules of the virtual
> > diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> > index f6e4443..86125f2 100644
> > --- a/package/rpi-userland/rpi-userland.mk
> > +++ b/package/rpi-userland/rpi-userland.mk
> > @@ -16,4 +16,7 @@ define RPI_USERLAND_POST_TARGET_CLEANUP
> >  endef
> >  RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
> >  
> > +# rpi-userland is a provider for those features:
> > +$(eval $(call virt-provides,LIBEGL LIBGLES OPENVG OPENMAX))
> > +
> >  $(eval $(cmake-package))
> 
> Just thinking out loud: isn't it possible to instead check if
> <pkg>_DEPENDENCIES for each virtual package contains only one word?

No, because FOO_DEPENDENCIES is set from _PROVIDES_FOO, which as a
kconfig option, can be only one word to begin with.

I've tried to remove _PROVIDES_FOO for the Config.in and move it into
the .mk, but then, as it is used to set FOO_DEPENDENCIES, it could be
empty at the time we define the virtual package, which would be
depndency-less, when the provider sorts after the virtual package.

Unless Thomas DS' patchset would allow to have depndencies evaluated as
second-expansion, in which case we could then define _PROVIDES_FOO in
the .mk instead of the Config.in (but we would still need to checit is
not already set, as this patch does.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
