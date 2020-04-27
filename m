From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 17:41:08 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add option to define custom
 dependencies
In-Reply-To: <44894d6d-ed79-9221-2838-5ce6971cb848@mind.be>
References: <20200425000629.2068191-1-heiko@sntech.de>
 <20200425153810.2e86813e@windsurf.home>
 <20200425211350.GR5035@scaer>
 <44894d6d-ed79-9221-2838-5ce6971cb848@mind.be>
Message-ID: <20200427174108.6f7f8e86@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Apr 2020 10:31:51 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > My opinion on that patch is that i am definitely not in favour of it. If
> > we go that route, then we would have to allow adding any such arbitrary
> > dependencies to a wide range of packages.  
> 
>  The key difference is that for U-Boot (and kernel) we don't just allow, but
> *expect* the user to specify some custom version. In that respect we differ
> wildly from almost all other projects (i.e. OpenWrt and yocto) that choose a
> single or very few kernel and U-Boot versions to work with.
> 
>  Because of this flexibility, we need to also allow stuff we consider ugly like
> custom git downloads and a custom directory (which we rejected but for which now
> I believe we really should have the option). So IMO this custom dependencies
> ugliness is the inevitable price we have to pay for that flexibility.

I agree.


> > So, I am definitely not in favour of adding such an option as the
> > proposed BR2_TARGET_UBOOT_CUSTOM_DEPENDENCIES.  
> 
> 
>  A few years ago, I was also of the opinion that new Config.in options should be
> treated with utmost suspicion. The main argument there is maintainability.
> However, "maintaining" a Config.in option is really not much of an effort. The
> .mk handling of it may be an effort, but in this case it's pretty simple as
> well. It would also be a problem if infra support was needed - but that's not
> the case here either.
> 
>  The only thing that I would like is a test of the functionality, because that's
> the main maintainance effort IMO: making sure that it doesn't break. In this
> case, the test is easy: we can just rewrite e.g. asus_tinker_rk3288_defconfig to
> set:
> 
> BR2_TARGET_UBOOT_NEEDS_DTC=y
> BR2_TARGET_UBOOT_CUSTOM_DEPENDENCIES="openssl"

Which should in fact be:

BR2_TARGET_UBOOT_CUSTOM_DEPENDENCIES="host-openssl"

so it's really not user-friendy it seems :-)

>  Bottom line: I'm in favour.

Thanks. Should I nevertheless introduce the PYLIBFDT_PYTHON3 and
PYELFTOOLS_PYTHON3 options, in addition to this ? Or do we for these
new use cases favor using only the CUSTOM_DEPENDENCIES solution ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
