From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 06 Jun 2017 21:35:04 +0200
Subject: [Buildroot] [PATCH] toolchain/toolchain-common.in: update
 definition of BR2_TOOLCHAIN_HAS_GCC_BUG_64735 for GCC 7
In-Reply-To: <20170606212314.069892f2@free-electrons.com>
References: <20170606140850.5823-1-joerg.krause@embedded.rocks>
 <20170606173222.537500c6@free-electrons.com>
 <1496774645.3962.1.camel@embedded.rocks>
 <20170606212314.069892f2@free-electrons.com>
Message-ID: <1496777704.3962.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2017-06-06 at 21:23 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 06 Jun 2017 20:44:05 +0200, J?rg Krause wrote:
> 
> > > >  config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> > > >  	bool
> > > > -	default y if BR2_nios2
> > > > -	default y if BR2_ARM_CPU_ARMV4
> > > > -	default y if BR2_ARM_CPU_ARMV5
> > > > -	default y if BR2_sparc_v8
> > > > +	default y if (BR2_nios2 || BR2_ARM_CPU_ARMV4 || \
> > > > +		BR2_ARM_CPU_ARMV5 || BR2_sparc_v8) && \
> > > > +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7  
> > > 
> > > This feels very complicated. What about just:
> > > 
> > > 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7  
> > 
> > Wouldn't that be rather:
> > 
> > """
> > config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> > 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> > """
> 
> No because that would make the option "y" as soon as you have gcc < 7.
> But we want the option to be "y" only if you have gcc < 7 *and* you're
> using one of nios2, ARMv4/v5 or sparc v8.

Sorry, I totally got you wrong. So, what you mean is:


"""
config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
	bool
	default y if BR2_nios2
	default y if BR2_ARM_CPU_ARMV4
	default y if BR2_ARM_CPU_ARMV5
	default y if BR2_sparc_v8
	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
"""

Right?

J?rg
