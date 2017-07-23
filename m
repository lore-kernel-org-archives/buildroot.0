From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 12:13:17 +0200
Subject: [Buildroot] [PATCH 13/20] package/skeleton: make it a virtual
 package
In-Reply-To: <b922d29e-33d5-3310-feca-70fbc6ac93a7@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <3a434b0c0be62999b357b2ad81ab62bfed9e97d7.1500398733.git.yann.morin.1998@free.fr>
 <b922d29e-33d5-3310-feca-70fbc6ac93a7@mind.be>
Message-ID: <20170723101317.GC26998@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-07-23 01:36 +0200, Arnout Vandecappelle spake thusly:
> 
> 
> On 18-07-17 19:25, Yann E. MORIN wrote:
> > We now have two packages that can act as a skeleton, skeleton-common,
> > also known as our default skeleton, and skeleton-custom.
> > 
> > This means that the skeleton package can be a standard virtual package
> > now.
> > 
> > Well, except that, besides being a virtual package, it also provides
> > variables and macros that can be used by the other skeletons and/or the
> > init systems.
> 
>  I guess this is a left-over from when you hadn't moved everything to system.mk
> yet...

Arg, yes...

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>  On this patch, I do have kind of big comments.
> 
> [snip]
> > diff --git a/package/skeleton-custom/Config.in b/package/skeleton-custom/Config.in
> > index b12bd8f73c..601c3b247e 100644
> > --- a/package/skeleton-custom/Config.in
> > +++ b/package/skeleton-custom/Config.in
> > @@ -1,3 +1,6 @@
> >  config BR2_PACKAGE_SKELETON_CUSTOM
> >  	bool
> > -	select BR2_PACKAGE_SKELETON
> > +	select BR2_PACKAGE_HAS_SKELETON
> > +
> > +config BR2_PACKAGE_PROVIDES_SKELETON
> > +	default "skeleton-custom" if BR2_PACKAGE_SKELETON_CUSTOM
> 
>  In almost all virtual package providers, we do it like:
> 
> if BR2_PACKAGE_SKELETON_CUSTOM
> config BR2_PACKAGE_PROVIDES_SKELETON
> 	default "skeleton-custom"
> endif

> [snip]
> >  config BR2_PACKAGE_SKELETON
> >  	bool
> > -	help
> > -	  The basic skeleton for your rootfs.
> > +	default y
> 
>  For most virtual packages, we don't define the Kconfig symbol (e.g. there is no
> BR2_PACKAGE_EGL). Do we need it for skeleton?

We have it already for toolchain, another 'speical' package.

Having a package options ensures that:
  - the package is always enabled, even if none selects it,
  - the package appears in the graph-depends.

> > +
> > +config BR2_PACKAGE_HAS_SKELETON
> > +	bool
> 
>  We also don't really need this. It is used by packages that need the virtual
> package to check if there is a provider for it. But no package 'depends on'
> skeleton (or rather, all of them do), so we don't need this.

Technically, we do not need it. But I want to avoid scratching my head
if/when I have to revisit the virtual package infra, and the skeleton
stuff suddenly breaks for no reason.

This is a virtual package, let's make it a real virtual package. Let's
try not to be subtle.

> > +
> > +config BR2_PACKAGE_PROVIDES_SKELETON
> > +	string
> 
>  This one we do need :-)
> 
> [snip]
> > diff --git a/system/Config.in b/system/Config.in
> > index c27b013784..75b6a8edac 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -1,5 +1,9 @@
> >  menu "System configuration"
> >  
> > +# Note: usually, it is not possible to select a provider of a virtual
> > +# package.
> 
>  This is not true cryptodev, jpeg and mysql do exactly that. libressl/openssl
> will also do it that way. In fact, a choice is in a way the better way to do it,
> because then you're guaranteed not to have conflicting providers.

But then you disallow implementations from a br2-external tree, for
example for jpeg, a provider that has a hardware-accelerated libjpeg.

>  So this entire comment is wrong and can be removed. IMO.

No, the comment is true, when you look at a virtual package definition
in the manual. The way we do it for jpeg, cryptodev and mysql is that
we have a real package and a virtual package both in one, which have a
choice, and thus lift the limitation.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > But here we have an exception: there are only two providers
> > +# and they only get selected each by separate entries in this choice.
> > +# So this is a safe situation.
> >  choice
> >  	prompt "Root FS skeleton"
> >  
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
