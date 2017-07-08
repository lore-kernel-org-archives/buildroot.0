From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Jul 2017 17:42:12 +0200
Subject: [Buildroot] [PATCH 1/4 v2] arch/arm: fix -mcpu default values
 for AArch64
In-Reply-To: <a03c7508-e112-9c25-f563-93f804018153@mind.be>
References: <cover.1499522760.git.yann.morin.1998@free.fr>
 <cbd726c5aa26ea8278c518508ba76efc5b796f7a.1499522760.git.yann.morin.1998@free.fr>
 <a03c7508-e112-9c25-f563-93f804018153@mind.be>
Message-ID: <20170708154212.GC3867@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-08 17:33 +0200, Arnout Vandecappelle spake thusly:
> On 08-07-17 16:08, Yann E. MORIN wrote:
> > We have to specify the -mcpu value, even in 64-bit mode.
> > 
> > For AArch64, +fp and +simd are the default, so they are totally useless.
> 
>  However, we typically want to be explicit about things, so when the +nofp and
> +nosimd are added we want these lines to return as well. Wouldn't it be better
> to just add the noXX variants in this patch?

When we talked about that with Thomas, he said he preferred we drop them
altogether.

Also, adding the no variants is not that easy, because it involves all
of 64-bit, vfpv8 and neon.

However, we do not have an option for noen on 64-bit for now. We can't
re-use the existing 32-bit neon option either, because some packages
expect that neon is the 32-bit variant.

So, it is a little bit more involved.

Since the no variants were not really working anyway for now, there is
yet no regression yet.

I also just decided to stay with just adding the big.LITTLE variants
rather than send another many-patches series like I'm used to.

>  That said, this patch actually fixes the !FP case so
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks!

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Baruch Siach <baruch@tkos.co.il>
> > 
> > ---
> > Changes v1 -> v2:
> >   - squash the two changes into one patch  (Thomas)
> >   - remove useless parentheses  (Baruch)
> >   - remove superfluous indentation
> > 
> > Notes: If anything, it is the +nofp or +nosimd that should be specified.
> > This can be done in a future patch, though.
> > ---
> >  arch/Config.in.arm | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> > index b1817ed568..3cafe21700 100644
> > --- a/arch/Config.in.arm
> > +++ b/arch/Config.in.arm
> > @@ -534,15 +534,9 @@ config BR2_GCC_TARGET_CPU
> >  	default "strongarm"	if BR2_strongarm
> >  	default "xscale"	if BR2_xscale
> >  	default "iwmmxt"	if BR2_iwmmxt
> > -	default "cortex-a53"		if (BR2_cortex_a53 && !BR2_ARCH_IS_64)
> > -	default "cortex-a53+fp"		if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
> > -	default "cortex-a53+fp+simd"	if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
> > -	default "cortex-a57"		if (BR2_cortex_a57 && !BR2_ARCH_IS_64)
> > -	default "cortex-a57+fp"		if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
> > -	default "cortex-a57+fp+simd"	if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
> > -	default "cortex-a72"		if (BR2_cortex_a72 && !BR2_ARCH_IS_64)
> > -	default "cortex-a72+fp"		if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
> > -	default "cortex-a72+fp+simd"	if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
> > +	default "cortex-a53"	if BR2_cortex_a53
> > +	default "cortex-a57"	if BR2_cortex_a57
> > +	default "cortex-a72"	if BR2_cortex_a72
> >  
> >  config BR2_GCC_TARGET_ABI
> >  	default "aapcs-linux"	if BR2_arm || BR2_armeb
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
