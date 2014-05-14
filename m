From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 May 2014 19:35:17 +0200
Subject: [Buildroot] [PATCH] infra/pkg-virtual: validate only one
 provider provides an implementation
In-Reply-To: <537324F3.8010505@mind.be>
References: <20140513180945.GC3507@free.fr>
 <1400017670-2708-1-git-send-email-yann.morin.1998@free.fr>
 <537324F3.8010505@mind.be>
Message-ID: <20140514173517.GA3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-05-14 10:10 +0200, Arnout Vandecappelle spake thusly:
> On 13/05/14 23:47, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > BIG FAT NOTICE:
> >     This is *not* tested.
> >     This is only a track I'd like to further explore to fix the issue.
> > 
> > Currently, it is possible that more than one provider of a virtual package
> > is selected in the menuconfig.
> > 
> > This leads to autobuild failures, and we do not protect the user from
> > making a mistake in the configuration. The failure is then hard to
> > troubleshoot in any case.
> > 
> > We can't use kconfig constructs to prevent this, sicne kconfig does not
> > tell how many options did a select on another option.
> > 
> > This patch adds a new function that providers *must* call in their .mk
> > to ensure at most one provider is selected.
> 
>  I like it!

Hehe! :-)

[--SNIP--]
> > diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
> > index 617e5f2..66537bf 100644
> > --- a/package/pkg-virtual.mk
> > +++ b/package/pkg-virtual.mk
> > @@ -13,6 +13,15 @@
> >  #
> >  ################################################################################
> >  
> > +# Providers shall call this function with all the FEATURES they provide
> > +# 	$(eval $(call virt-provides,FEATURE[ FEATURE ...]))
> > +# where FEATURE has a corresponding BR2_PACKAGE_HAS_FEATURE
> > +define virt-provides
> 
>  Even better would be to make this part of generic-package, and add a
> PKG_PROVIDES = ... variable

Yes, that's what I was gonna go for in the end, since it is even easier
to write than the eval+call.

> > +$(foreach p,$(1),\
> > +ifneq ($$(BR2_PACKAGE_PROVIDES_$(p)),$(pkgname))$(sep)\
> 
>  We could throw in an UPPERCASE here so the caller can put it in lowercase.

Yes, good idea. This way, there would be consistency between the menu
prompt, and the content of FOO_PROVIDES.

> > +$$(error $(pkgname is trying to override $$(BR2_PACKAGE_PROVIDES_$(p)) to provide $(p)))$(sep)\
> > +endif$(sep))
> > +endef
> 
>  How about (assuming the PKG_PROVIDES path):
> 
> Before inner-generic-package:
> 
> --------------------------------
> # virt-provides-single <virt-pkg> <VIRT_PKG> <provider-pkg>
> define virt-provides-single
> ifneq ($$(BR2_PACKAGE_PROVIDES_$(2)),$(3))
> $$(error Configuration error: $(3) and $$(BR2_PACKAGE_PROVIDES_$(2))$(sep)\
> 	are both selected as providers for virtual package $(1).$(sep)\
> 	Only one of them should be selected. Please adapt your configuration.)
> endif
> endef
> --------------------------------
> 
> 
> Within inner-generic-package:
> 
> --------------------------------
> ifneq ($$($(2)_PROVIDES),)
> $$(foreach pkg,$$($(2)_PROVIDES),\
> 	$$(call virt-provides-single,$$(pkg),$$(call UPPERCASE,$$(pkg)),$(1)))
> endif
> --------------------------------
> 
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
> 
>  So this would become
> 
> RPI_USERLAND_PROVIDES = libegl libegles openvg openmax
> 
>  I'm thinking, with this approach, it may even be possible to remove the
> Config.in part of the providers. Ah, no it's not possible, because then you have
> the ordering problem that Yann already mentioned in another mail. Maybe it would
> be possible somehow to force the virtual packages to be evaluated only at the
> end, but I think that that's just going to complicate stuff unnecessarily.
> 
> 
>  Again, I'm pretty happy with what we have here.

OK, I'll go with that. Thanks for the suggestions! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
