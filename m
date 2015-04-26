From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2015 16:18:15 +0200
Subject: [Buildroot] [PATCHv3 17/18] packages: refactor checks using
 BR_BUILDING
In-Reply-To: <20150426114247.0686ffc2@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-18-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150425205257.GT4275@free.fr>
 <20150426114247.0686ffc2@free-electrons.com>
Message-ID: <20150426141815.GC4809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-26 11:42 +0200, Thomas Petazzoni spake thusly:
> On Sat, 25 Apr 2015 22:52:57 +0200, Yann E. MORIN wrote:
> 
> > >  # Checks to give errors that the user can understand
> > > -ifeq ($(filter source,$(MAKECMDGOALS)),)
> > > +ifeq ($(BR_BUILDING),y)
> > >  ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
> > 
> > I think it would be good to have a single way we do those checks.
> > 
> > For example, compare at91bootstrap above and at91bootstrap3 here.
> > The former is doing the BR2_BUILDING check and package-enabled check
> > in a single ifeq, while the latter does it with two ifeq.
> > 
> > I don't really care which we use, but we should use the same everywhere.
> > Maybe we could favour doing it with feq, for those packages that want to
> > do multiple checks.
> > 
> > Applicable to the other packages, of course.
> 
> I don't quite agree. For at91bootstrap, there is only one check being
> done, while for at91bootstrap3, two checks are being done.
> 
> So basically, the current code is:
> 
> ifeq ($(BR_BUILDING),y)
> ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
> ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG)),)
> $(error No at91bootstrap3 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG setting)
> endif
> endif
> 
> ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
> ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)),)
> $(error No at91bootstrap3 configuration file specified, check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE setting)
> endif
> endif
> endif
> 
> While you're proposing to unfactorize the BR_BUILDING test:

I thionk I actually meant the other way around: always use two ifeq,
that is always factorise the check on BR_BUILDING. But there was some
typing errors in my comment, which I clarified in a further reply:
    http://lists.busybox.net/pipermail/buildroot/2015-April/126861.html

What I really meant is that I think it would be good to have a single
and uniform way of doing the checks, so we have sane examples on how to
do it. For example, you even had an issue with xloader that completely
broke the 'source' rule. ;-)

But I won;t be pedantic on this. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
