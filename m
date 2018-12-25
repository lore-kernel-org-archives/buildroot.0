From: Kostya Porotchkin <kostap@marvell.com>
Date: Tue, 25 Dec 2018 09:09:26 +0000
Subject: [Buildroot] [EXT] Re: [PATCH] boot/mv-ddr-marvell: support
 custom GIT settings
In-Reply-To: <20181224185742.GF2703@scaer>
References: <20181224131814.20804-1-kostap@marvell.com>
 <20181224185742.GF2703@scaer>
Message-ID: <SN2PR18MB07361F184E2286FF9C3EB1B0CAB40@SN2PR18MB0736.namprd18.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Yann,

> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@gmail.com> On Behalf Of Yann E.
> MORIN
> Sent: Monday, December 24, 2018 20:58
> To: Kostya Porotchkin <kostap@marvell.com>
> Cc: buildroot at buildroot.org
> Subject: [EXT] Re: [Buildroot] [PATCH] boot/mv-ddr-marvell: support custom
> GIT settings
> 
> External Email
> 
> ----------------------------------------------------------------------
> Konstantin, All,
> 
> On 2018-12-24 15:18 +0200, kostap at marvell.com spake thusly:
> > From: Konstantin Porotchkin <kostap@marvell.com>
> >
> > Add support for custom repositories for mv-ddr-marvell sources.
> > This patch allows getting the mv-ddr-marvell package sources out of
> > user-defined repositories.
> > The configuration options are similar to uboot package - once the
> > BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT=y, the following
> configuration
> > entries are used for fetching the package sources:
> > BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_URL
> > BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_VERSION
> >
> > Change-Id: Ibdef65a3ccdfbe47123f27ab6ba311a75d66d50e
> 
> No need for this 'Change-Id' because it means nothing to us.
[KP] OK, I will strip it
> 
> > Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
> > ---
> >  boot/mv-ddr-marvell/Config.in         | 16 ++++++++++++++++
> >  boot/mv-ddr-marvell/mv-ddr-marvell.mk |  7 +++++++
> >  2 files changed, 23 insertions(+)
> >
> > diff --git a/boot/mv-ddr-marvell/Config.in
> > b/boot/mv-ddr-marvell/Config.in index 4ee8c95b2c..0a9ed7aca5 100644
> > --- a/boot/mv-ddr-marvell/Config.in
> > +++ b/boot/mv-ddr-marvell/Config.in
> > @@ -8,3 +8,19 @@ config BR2_TARGET_MV_DDR_MARVELL
> >  	  and 8040 SoCs.
> >
> >  	  https://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell/
> > +
> > +config BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT
> > +	bool "Custom Git repository"
> 
> I think I would prefer that we have a choice selection, like for U-Boot for
> example:
> 
>     choice
>         bool "mv-ddr-marvell version"
> 
>     config BR2_TARGET_MV_DDR_MARVELL_MARVELL
>         bool "Marvell github" # Maybe get a better prompt here?
> 
>     config BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT
>         bool "Custom Git repository"
> 
>     endchoice
[KP] OK, it's doable. I was less thinking about "menuconfig" when making this change, but it will be better to have a choice for such case.
> 
>     if BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT
> 
>     config BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_URL
>         string "URL of custom repository"
> 
>     config BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_VERSION
>         string "Custom repository version"
> 
>     endif # BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT
> 
> Otherwise, we usually frown upon adding custom location to packages. Is it
> customary for board integrators to have local adaptations to this, like there is
> for u-boot and the other bootloaders?
> 
> As I see you're an @marvell.com, do you need that to use an internal
> repository during development? If so, then why can't you just use the
> OVERRIDE_SRCDIR mechanism instead?
[KP] It is more than just a local repository. I have to allow CI server to automatically build test and release images from the current internal GIT trees.
I am trying to make the Buildroot a package manager for Marvell SDK releases. 

Regards
Kosta
> 
> Regards,
> Yann E. MORIN.
> 
> > +if BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT
> > +
> > +config BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_URL
> > +	string "URL of custom repository"
> > +
> > +config BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_VERSION
> > +	string "Custom repository version"
> > +	help
> > +	  Revision to use in the typical format used by Git
> > +	  E.G. a sha id, a tag, branch, ..
> > +
> > +endif
> > diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.mk
> > b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
> > index 8d508215f8..100aaccb5f 100644
> > --- a/boot/mv-ddr-marvell/mv-ddr-marvell.mk
> > +++ b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
> > @@ -4,9 +4,16 @@
> >  #
> >
> >
> ##########################################################
> ############
> > ##########
> >
> > +ifeq ($(BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT),y)
> > +MV_DDR_MARVELL_VERSION = $(call
> > +qstrip,$(BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_VERSION))
> > +MV_DDR_MARVELL_SITE = $(call
> > +qstrip,$(BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_URL))
> > +MV_DDR_MARVELL_SITE_METHOD = git
> > +BR_NO_CHECK_HASH_FOR += $(MV_DDR_MARVELL_SOURCE) else
> >  # This is the commit for mv_ddr-armada-18.09.2
> > MV_DDR_MARVELL_VERSION =
> 99d772547314f84921268d57e53d8769197d3e21
> >  MV_DDR_MARVELL_SITE = $(call
> > github,MarvellEmbeddedProcessors,mv-ddr-
> marvell,$(MV_DDR_MARVELL_VERSI
> > ON))
> > +endif
> >  MV_DDR_MARVELL_LICENSE = GPL-2.0+ or LGPL-2.1 with
> > freertos-exception-2.0, BSD-3-Clause, Marvell Commercial
> > MV_DDR_MARVELL_LICENSE_FILES = ddr3_init.c
> >
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> | conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
