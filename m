From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2015 15:32:19 +0200
Subject: [Buildroot] [PATCH 2/3] Transformation of package
 'at91bootstrap3' to KConfig style.
In-Reply-To: <20150406122020.5ea2e6df@free-electrons.com>
References: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
 <1425850629-14725-2-git-send-email-mc5686@mclink.it>
 <20150406122020.5ea2e6df@free-electrons.com>
Message-ID: <20150406133219.GE4369@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Mauro, All,

On 2015-04-06 12:20 +0200, Thomas Petazzoni spake thusly:
> Adding our kconfig-package guys Yann and Thomas DS in Cc. See below for
> some comments.
> 
> On Sun,  8 Mar 2015 22:37:08 +0100, Mauro Condarelli wrote:
> > 
> > Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> > ---
> >  boot/at91bootstrap3/at91bootstrap3.mk |    9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> > index 098e7bf..37e1bdd 100644
> > --- a/boot/at91bootstrap3/at91bootstrap3.mk
> > +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> > @@ -46,7 +46,14 @@ define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
> >  	cp $(@D)/binaries/*.bin $(BINARIES_DIR)
> >  endef
> >  
> > -$(eval $(generic-package))
> > +ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
> > +AT91BOOTSTRAP3_KCONFIG_FILE = $(call qstrip,$(AT91BOOTSTRAP3_DEFCONFIG))
> > +else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
> > +AT91BOOTSTRAP3_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
> > +endif
> > +AT91BOOTSTRAP3_KCONFIG_EDITORS = menuconfig xconfig gconfig
> > +AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
> > +$(eval $(kconfig-package))
> 
> This is not going far enough: the kconfig-package infra is taking care
> of implementing the <pkg>_CONFIGURE_CMDS for you. So the following
> chunk of code should go away:
> 
> ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
> define AT91BOOTSTRAP3_CONFIGURE_CMDS
>         $(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D) $(AT91BOOTSTRAP3_DEFCONFIG)_defconfig
> endef
> else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
> define AT91BOOTSTRAP3_CONFIGURE_CMDS
>         cp $(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE) $(@D)/.config
> endef
> endif
> 
> and be replaced by a chunk of code that sets
> AT91BOOTSTRAP3_KCONFIG_FILE.

Indeed.

> However, while this is reasy to do for the
> BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG case, it is much more
> complicated for the BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG case. This
> is because we do not know the path to the defconfig file in the
> at91bootstrap3 source tree.
> 
> For the linux and barebox package, when a defconfig name is passed, its
> path in the linux or barebox source tree is easily found: it's
> arch/<ARCH>/configs/<name>_defconfig. But for at91bootstrap3, defconfig
> files are spread throughout the tree, in directories named after the
> board. There is no real way of inferring the location of the defconfig
> file just by looking at its name.
> 
> Therefore, I am not sure how we can initialize
> AT91BOOTSTRAP3_KCONFIG_FILE in such a situation.
> 
> Thomas DS, Yann, am I missing something?

Well, it looks like the defconfig files are all in sub-directories of
boards/ and that each defconfig is unique in name.

So, we could probably do something like:

    AT91BOOTSTRAP3_KCONFIG_FILE = boards/*/$(call qstrip,$(AT91BOOTSTRAP3_DEFCONFIG))_defconfig

This would be resolved by the 'cp' we do at the very begining, but is
not very robust (and would anyway warrant a big fat comment).

I'll see if that would work.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
