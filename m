From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2020 23:45:28 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add option to define custom
 dependencies
In-Reply-To: <2530327.UWAnRXb5oC@diego>
References: <20200425000629.2068191-1-heiko@sntech.de>
 <20200425211350.GR5035@scaer>
 <20200425232245.6e13c5a6@windsurf.home> <2530327.UWAnRXb5oC@diego>
Message-ID: <20200425214528.GT5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-04-25 23:31 +0200, Heiko St?bner spake thusly:
> Am Samstag, 25. April 2020, 23:22:45 CEST schrieb Thomas Petazzoni:
> > On Sat, 25 Apr 2020 23:13:50 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > My opinion on that patch is that i am definitely not in favour of it. If
> > > we go that route, then we would have to allow adding any such arbitrary
> > > dependencies to a wide range of packages.
> > 
> > Without necessarily strongly supporting Heiko's patch, I think it is
> > important to keep in mind that U-Boot is not a package like any others.
> > We offer version selection for U-Boot, custom Git/Subversion repo
> > selection, which we do not offer for other packages. U-Boot has
> > zillions of forks, support for gazillions platforms each with their own
> > funky requirements.
> > 
> > We've already added a BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS to pass custom
> > make options, adding the possibility to add custom dependencies would
> > go in the same direction.
> > 
> > I however agree that this kind of option is a good recipe for people to
> > do their own hacks on their side, instead of finding a proper way to do
> > it that can be upstreamed to Buildroot.
> > 
> > > Now, there are two situations:
> > > 
> > >   - the tool is already in Buildroot: add a new _NEEDS_FOO option like
> > >     we already have.
> > > 
> > >   - the tool is in a br2-external tre: this is in my opinion better
> > >     served by working on the evaluation-postpone changes Arnou and I
> > >     have been suggesting for quite a while now.
> > 
> > I think it would make sense to hear about what Heiko's use case exactly
> > is, this might help.
> 
> the use-case is:
> - a u-boot config fragment specifying key-dir and key-hint for signing
>   uboot parts - see [0]
> - our own package managing these (and other) keys
> - and thus us wanting to make sure the key package gets "build" before
>   u-boot itself
> 
> I'm not overly attached to my patch, but it somehow felt in line with
> also the config-fragment option, that allows including other random
> fragments into the board config file for the u-boot build.
> 
> So yes, the required package is in a br2-external tree. What is this
> "evaluation-postpone" thingy?

The basic idea is to postpone the evaluation of all the *-pacakage
macros to after all packages have indeed been parsed.

For example (just for the illustration sake, it would probably be a
little bit more complex, but not by far):

    define autotool-package
    $(1)_PKG_TYPE = autotools
    $(1)_PKG_NAME := $(pkgname)
    $(1)_PKG_DIR := $(pkgdir)
    # A very few other stuff, but really not much, even probably nothing
    REGISTERED_PACKAGES += $($(1)_PKG_NAME)
    endef

And so on for all the other infras.

And eventually, after all the packages are parsed, that is after
inclusion of all the br2-external trees, a little codde block that
iterates over all registered pacakges:

    $(foreach pkg, $(REGISTERED_PACKAGES), \
        $(eval $(call $(call UPPERCASE,$(pkg))-inner)))

Of course, that also need a bit of adaptation in all of the *-inner
infras, but that should be manageable.

The benefits of that would be for br2-external trees, giving them:

  - the ability to change the version

  - the ability to add new dependencies, add new configure options etc...
    it would even be possible to remove some dependencies or config
    options...

  - the ability to change the package infra, use an newer version using
    meson when we have an older usig autotools (or most probably the
    other way around...

  - the ability to even completely override the whole package

  - ...

This would be a single answer to all the problems that have been
reported when using br2-external trees.

Not that I am very happy to have to provide such a solution, but I
prefer a single, generic answer rather than a myriad of hacks every
where and ekse...

Regards,
Yann E. MORIN.

> 
> [0] https://patchwork.ozlabs.org/project/uboot/patch/20200421002333.111461-6-heiko at sntech.de/
> and other patches in that series
> 
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
