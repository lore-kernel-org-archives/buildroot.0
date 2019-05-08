From: Guo Ren <guoren@kernel.org>
Date: Wed, 8 May 2019 10:31:04 +0800
Subject: [Buildroot] [PATCH 1/3] arch/csky: Add ck860 and vdsp compiler
 options
In-Reply-To: <20190507140150.7d970503@windsurf>
References: <1557222442-8484-1-git-send-email-guoren@kernel.org>
 <20190507140150.7d970503@windsurf>
Message-ID: <20190508023104.GA22555@guoren-Inspiron-7460>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx Thomas,

On Tue, May 07, 2019 at 02:01:50PM +0200, Thomas Petazzoni wrote:
> Hello Guo,
> 
> Thanks for this new csky related contribution. See below some comments.
> 
> On Tue,  7 May 2019 17:47:20 +0800
> guoren at kernel.org wrote:
> 
> > From: Guo Ren <ren_guo@c-sky.com>
> > 
> > The ck860 is C-SKY abiv2 cpu series and it could support SMP and vdsp
> > instructions set. Add the compiler options for them.
> > 
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > ---
> >  arch/Config.in.csky | 33 ++++++++++++++++++++-------------
> >  1 file changed, 20 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/Config.in.csky b/arch/Config.in.csky
> > index e88e4e2..bbff600 100644
> > --- a/arch/Config.in.csky
> > +++ b/arch/Config.in.csky
> > @@ -13,19 +13,26 @@ config BR2_ck807
> >  config BR2_ck810
> >  	bool "ck810"
> >  
> > +config BR2_ck860
> > +	bool "ck860"
> > +
> >  endchoice
> >  
> >  config BR2_CSKY_FPU
> >  	bool "Enable FPU coprocessor"
> > -	depends on BR2_ck810 || BR2_ck807
> > +	depends on BR2_ck807 || BR2_ck810 || BR2_ck860
> >  	help
> >  	  You can say N here if your C-SKY CPU doesn't have a
> >  	  Floating-Point Coprocessor or if you don't need FPU support
> >  	  for your user-space programs.
> >  
> > -config BR2_CSKY_DSP
> > -	bool "Enable DSP enhanced instructions"
> > -	depends on BR2_ck810 || BR2_ck807
> 
> Why is this option being removed ? This is not explained in the commit
> log.
In fact we haven't used BR2_CSKY_DSP in buildroot, and we change it to
VDSP instead. I'll add commnet in commit log.

> 
> > +config BR2_CSKY_VDSP
> > +	bool "Enable VDSP 3.0 enhanced instructions Co-processor"
> > +	depends on BR2_ck860
> > +
> > +config BR2_GCC_TARGET_FLOAT_ABI
> > +	default "soft"		if !BR2_CSKY_FPU
> > +	default "hard"		if BR2_CSKY_FPU
> 
> This should be in a separate patch, it's not a change that is directly
> related.
Ok

> 
> >  config BR2_ARCH
> >  	default "csky"
> > @@ -34,15 +41,15 @@ config BR2_ENDIAN
> >  	default "LITTLE"
> >  
> >  config BR2_GCC_TARGET_CPU
> > -	default "ck610"		if (BR2_ck610 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
> > -	default "ck807"		if (BR2_ck807 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
> > -	default "ck807e"	if (BR2_ck807 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
> > -	default "ck807f"	if (BR2_ck807 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
> > -	default "ck807ef"	if (BR2_ck807 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
> > -	default "ck810"		if (BR2_ck810 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
> > -	default "ck810e"	if (BR2_ck810 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
> > -	default "ck810f"	if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
> > -	default "ck810ef"	if (BR2_ck810 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
> > +	default "ck610"		if (BR2_ck610 && !BR2_CSKY_FPU && !BR2_CSKY_VDSP)
> > +	default "ck807"		if (BR2_ck807 && !BR2_CSKY_FPU && !BR2_CSKY_VDSP)
> > +	default "ck807f"	if (BR2_ck807 &&  BR2_CSKY_FPU && !BR2_CSKY_VDSP)
> > +	default "ck810"		if (BR2_ck810 && !BR2_CSKY_FPU && !BR2_CSKY_VDSP)
> > +	default "ck810f"	if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_VDSP)
> > +	default "ck860"		if (BR2_ck860 && !BR2_CSKY_FPU && !BR2_CSKY_VDSP)
> > +	default "ck860f"	if (BR2_ck860 &&  BR2_CSKY_FPU && !BR2_CSKY_VDSP)
> > +	default "ck860v"	if (BR2_ck860 && !BR2_CSKY_FPU &&  BR2_CSKY_VDSP)
> > +	default "ck860fv"	if (BR2_ck860 &&  BR2_CSKY_FPU &&  BR2_CSKY_VDSP)
> 
> Perhaps this is becoming too much, and we should adopt a solution
> similar to the one in arch/arch.mk.riscv. I.e, drop the
> BR2_GCC_TARGET_CPU definition from arch/Config.in.csky, and add a file
> arch/arch.mk.csky that contains:
> 
> ifeq ($(BR2_csky),y)
> 
> ifeq ($(BR2_ck610),y)
> GCC_TARGET_CPU := ck610
> else ifeq ($(BR2_ck807),y)
> GCC_TARGET_CPU := ck807
> else ifeq ($(BR2_ck810),y)
> GCC_TARGET_CPU := ck810
> else ifeq ($(BR2_ck860),y)
> GCC_TARGET_CPU := ck860
> endif
> 
> ifeq ($(BR2_CSKY_FPU),y)
> GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
> endif
> 
> ifeq ($(BR2_CSKY_VDSP),y)
> GCC_TARGET_CPU := $(GCC_TARGET_CPU)v
> endif
> 
> endif
> 
Ok.

Best Regards
 Guo Ren
