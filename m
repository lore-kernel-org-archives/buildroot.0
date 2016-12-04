From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 22:41:00 +0100
Subject: [Buildroot] [PATCH 2/3] core: waf-package infra: add missing
 additional variables for each build step
In-Reply-To: <20161204212433.GC3433@free.fr>
References: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
 <1480885126-517-2-git-send-email-romain.naour@gmail.com>
 <20161204212433.GC3433@free.fr>
Message-ID: <20161204224100.26768191@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Dec 2016 22:24:34 +0100, Yann E. MORIN wrote:
> Romain, All,

> > -     $$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) build -j $$(PARALLEL_JOBS)
> > +     $$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
> > +             build -j $$(PARALLEL_JOBS) $$($(2)_MAKE_OPTS)  
> 
> I'm not against having variables named the same across packages, but
> here I think $(2)_BUILD_OPTS would be more appropriate.

ACK.

> > @@ -84,7 +85,8 @@ ifndef $(2)_INSTALL_STAGING_CMDS
> >  define $(2)_INSTALL_STAGING_CMDS
> >       cd $$(@D) && \
> >       $$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
> > -             install --destdir=$$(STAGING_DIR)
> > +             install --destdir=$$(STAGING_DIR) \
> > +             $$($(2)_INSTALL_STAGING_OPTS)  
> 
> Usually, those options entirely override the default ones. For example,
> if you provide FOO_INSTALL_STAGING_OPTS for an autotools package, then
> the default (just 'install') is lost:
> 
>     package/pkg-autotools.mk:
>     159 $(2)_INSTALL_STAGING_OPTS?  ?= DESTDIR=$$(STAGING_DIR) install
> 
> OTOH, I find this to be counter-intuitive for a user, and I would prefer
> the options to add rather than replace.

Agreed. I also find it super annoying that we have to replicate
DESTDIR=$$(STAGING_DIR) install. But in some cases, we *do* need to
override it.

Another thing that I dislike is that we have no way to pass an option
to all of the build and install steps.

> But consistency trumps it all, so we should do the same for waf
> packages:
> 
>     $(2)_INSTALL_STAGING_OPTS ?= install --destdir=$$(STAGING_DIR)

I agree. Even if the current situation is not 100% nice, I think a
rework of this current situation is a much broader effort. So let's
make the waf-package infrastructure be as similar as possible to the
other ones.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
