From: Guo Ren <guoren@kernel.org>
Date: Mon, 27 May 2019 14:43:48 +0800
Subject: [Buildroot] [PATCH V2 2/9] arch/csky: Add ck860 and -mcpu
 compiler options
In-Reply-To: <20190526224336.7cc43e96@windsurf>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
 <1557305915-11247-2-git-send-email-guoren@kernel.org>
 <20190526224336.7cc43e96@windsurf>
Message-ID: <20190527064348.GA9516@guoren-Inspiron-7460>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx Thomas,

On Sun, May 26, 2019 at 10:43:36PM +0200, Thomas Petazzoni wrote:
> > Add ck860 support and move -mcpu into arch.mk.csky.
> 
> Adding ck860 support and moving -mcpu handling in arch.mk.csky are two
> independent things. Please make the move to arch.mk.csky first without
> ck860, as a cleanup, in a first patch, and then another patch does the
> addition of ck860 support.
Ok.

> 
> > +config BR2_ck860
> > +	bool "ck860"
> > +
> >  endchoice
> >  
> >  config BR2_CSKY_FPU
> >  	bool "Enable FPU coprocessor"
> > -	depends on BR2_ck810 || BR2_ck807
> > +	depends on BR2_ck810 || BR2_ck807 || BR2_ck860
> >  	help
> >  	  You can say N here if your C-SKY CPU doesn't have a
> >  	  Floating-Point Coprocessor or if you don't need FPU support
> > @@ -25,7 +28,7 @@ config BR2_CSKY_FPU
> >  
> >  config BR2_CSKY_VDSP
> >  	bool "Enable VDSP 3.0 enhanced instructions Co-processor"
> > -	depends on BR2_ck860
> > +	depends on BR2_CSKY_FPU
> 
> So in PATCH 1, VDSP is only for CK860, but now it's for all cores that
> have a FPU, which includes CK810 and CK807. It should be consistent
> from the start, i.e from the point where VDSP is introduced.
Ok, I'll made a independent patch for VDSP introduce.

> 
> > -config BR2_GCC_TARGET_CPU
> > -	default "ck610"		if (BR2_ck610 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
> > -	default "ck807"		if (BR2_ck807 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
> > -	default "ck807e"	if (BR2_ck807 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
> > -	default "ck807f"	if (BR2_ck807 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
> > -	default "ck807ef"	if (BR2_ck807 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
> > -	default "ck810"		if (BR2_ck810 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
> > -	default "ck810e"	if (BR2_ck810 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
> > -	default "ck810f"	if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
> > -	default "ck810ef"	if (BR2_ck810 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
> 
> This should go to the patch cleaning up the logic to use arch.mk.csky.
Ok.

> 
> 
> > diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
> > new file mode 100644
> > index 0000000..fb59ae2
> > --- /dev/null
> > +++ b/arch/arch.mk.csky
> > @@ -0,0 +1,26 @@
> > +#
> > +# Configure the GCC_TARGET_ARCH variable and append the
> > +# appropriate C-SKY ISA extensions.
> > +#
> > +
> > +ifeq ($(BR2_csky),y)
> > +
> > +ifeq ($(BR2_ck610),y)
> > +GCC_TARGET_CPU := ck610
> > +else ifeq ($(BR2_ck807),y)
> > +GCC_TARGET_CPU := ck807
> > +else ifeq ($(BR2_ck810),y)
> > +GCC_TARGET_CPU := ck810
> > +else ifeq ($(BR2_ck860),y)
> > +GCC_TARGET_CPU := ck860
> > +endif
> > +
> > +ifeq ($(BR2_CSKY_FPU),y)
> > +GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
> > +endif
> 
> Same.
> 
> > +ifeq ($(BR2_CSKY_VDSP),y)
> > +GCC_TARGET_CPU := $(GCC_TARGET_CPU)v
> > +endif
> 
> This should go to the patch adding the BR2_CSKY_VDSP option.
Yes.

Best Regards
 Guo Ren
