From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Oct 2015 21:56:50 +0100
Subject: [Buildroot] [PATCH 04/21 v2] core: commonalise the bundled and
 br2-external %_defconfig rules
In-Reply-To: <562E8CCC.20505@mind.be>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <3b01a81ac78b8ca787b1e0308e819d8eb2ece1df.1445545973.git.yann.morin.1998@free.fr>
 <562E8CCC.20505@mind.be>
Message-ID: <20151026205650.GB3788@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-10-26 21:27 +0100, Arnout Vandecappelle spake thusly:
> On 22-10-15 22:33, Yann E. MORIN wrote:
> > The code for both cases is exactly the same, and only differs in the
> > location where defconfig files are looked for.
> > 
> > We use an intermediate macro to generate the corresponding rules,
> > because directly generating the rules is ugly and needs lots of escaping
> > and double-dollar-ing for the $(eval ...) and $(foreach ...) calls to
> > play nicely together.
> > 
> > Furthermore, that will be tremendously useful when we support multiple
> > br2-external trees.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> 
>  Bunch of small nits. I'm not giving it my reviewed-by yet because I'm not
> convinced that this change really makes things clearer, so it only really
> applies in function of the multi-external

Indeed, without the multi br2-external support, it is not that much
usefull.

> and for that I first have to see the whole series.

Of course. :-)

> > ---
> >  Makefile | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 60cea32..052f58a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -789,13 +789,12 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> >  	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
> >  
> >  # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
> 
>  This comment should go inside the define

Why? The macro only generates Makefile code, so we don;t care that
comment being replicated for both cases.

> > -%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
> > -	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
> > -		$< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
> > -
> > -%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
> > -	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
> > -		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
> > +define PERCENT_DEFCONFIG
> 
>  The macros we've added recently were all lowercase, and I like it that way.

OK.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
