From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 06 Jun 2017 20:44:05 +0200
Subject: [Buildroot] [PATCH] toolchain/toolchain-common.in: update
 definition of BR2_TOOLCHAIN_HAS_GCC_BUG_64735 for GCC 7
In-Reply-To: <20170606173222.537500c6@free-electrons.com>
References: <20170606140850.5823-1-joerg.krause@embedded.rocks>
 <20170606173222.537500c6@free-electrons.com>
Message-ID: <1496774645.3962.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2017-06-06 at 17:32 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue,  6 Jun 2017 16:08:50 +0200, J?rg Krause wrote:
> 
> > diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> > index d670f44747..06986abdd2 100644
> > --- a/toolchain/toolchain-common.in
> > +++ b/toolchain/toolchain-common.in
> > @@ -13,10 +13,9 @@ comment "Toolchain Generic Options"
> >  # ints before GCC 7
> >  config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> >  	bool
> > -	default y if BR2_nios2
> > -	default y if BR2_ARM_CPU_ARMV4
> > -	default y if BR2_ARM_CPU_ARMV5
> > -	default y if BR2_sparc_v8
> > +	default y if (BR2_nios2 || BR2_ARM_CPU_ARMV4 || \
> > +		BR2_ARM_CPU_ARMV5 || BR2_sparc_v8) && \
> > +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
> 
> This feels very complicated. What about just:
> 
> 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7

Wouldn't that be rather:

"""
config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
"""

The package mpd chooses between version 0.19 and 0.20 depending on that
bug. For now, if mpd is build with GCC6 (and below) and an architecture
not affected by this bug, version 0.20 is selected. By not depending on
the architecture anymore, mpd version 0.19 would be selected instead.

J?rg
