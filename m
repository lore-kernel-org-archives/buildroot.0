From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 11:42:47 +0200
Subject: [Buildroot] [PATCHv3 17/18] packages: refactor checks using
 BR_BUILDING
In-Reply-To: <20150425205257.GT4275@free.fr>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-18-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150425205257.GT4275@free.fr>
Message-ID: <20150426114247.0686ffc2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 25 Apr 2015 22:52:57 +0200, Yann E. MORIN wrote:

> >  # Checks to give errors that the user can understand
> > -ifeq ($(filter source,$(MAKECMDGOALS)),)
> > +ifeq ($(BR_BUILDING),y)
> >  ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
> 
> I think it would be good to have a single way we do those checks.
> 
> For example, compare at91bootstrap above and at91bootstrap3 here.
> The former is doing the BR2_BUILDING check and package-enabled check
> in a single ifeq, while the latter does it with two ifeq.
> 
> I don't really care which we use, but we should use the same everywhere.
> Maybe we could favour doing it with feq, for those packages that want to
> do multiple checks.
> 
> Applicable to the other packages, of course.

I don't quite agree. For at91bootstrap, there is only one check being
done, while for at91bootstrap3, two checks are being done.

So basically, the current code is:

ifeq ($(BR_BUILDING),y)
ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG)),)
$(error No at91bootstrap3 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG setting)
endif
endif

ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)),)
$(error No at91bootstrap3 configuration file specified, check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE setting)
endif
endif
endif

While you're proposing to unfactorize the BR_BUILDING test:

ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG)$(BR_BUILDING),yy)
ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG)),)
$(error No at91bootstrap3 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG setting)
endif
endif

ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG)$(BR_BUILDING),yy)
ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)),)
$(error No at91bootstrap3 configuration file specified, check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE setting)
endif
endif

I'm not sure in this case this is really better.

> > -ifeq ($(BR2_TARGET_XLOADER),y)
> > -# we NEED a board name unless we're at make source
> > -ifeq ($(filter source,$(MAKECMDGOALS)),)
> > +ifeq ($(BR2_TARGET_XLOADER)$(BR_BUILDING),y)
> 
> This is broken: it should be compared to 'yy', not a single 'y'.

Fixed in v4.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
