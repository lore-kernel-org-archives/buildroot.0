From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 08:47:54 +0100
Subject: [Buildroot] [PATCH] arch/arm: use EABIhf by default with VFP
In-Reply-To: <20151026013217.60ad1af8@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 26 Oct 2015 01:32:17 +0100")
References: <87k2qn6gf0.fsf@dell.be.48ers.dk>
 <1445786380-2741-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <87bnbmixv1.fsf@dell.be.48ers.dk>
 <20151026013217.60ad1af8@free-electrons.com>
Message-ID: <87bnbmdqad.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Sun, 25 Oct 2015 19:53:06 +0100, Peter Korsgaard wrote:

 >> > diff --git a/arch/Config.in.arm b/arch/Config.in.arm
 >> > index 4d10f4c..f0110b1 100644
 >> > --- a/arch/Config.in.arm
 >> > +++ b/arch/Config.in.arm
 >> > @@ -188,6 +188,7 @@ endchoice
 >> >  choice
 >> >  	prompt "Target ABI"
 >> >  	depends on BR2_arm || BR2_armeb
 >> > +	default BR2_ARM_EABIHF if BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV2
 >> 
 >> I think we should only do it when we are certain it will run,
 >> E.G. arm926 (our default variant) selects MAYBE_HAS_VFPV2, but it is
 >> afaik quite rare to see arm9s with a vfp.
 >> 
 >> Committed with that changed, thanks.

 > default BR2_ARM_EABIHF if BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV2

 > was indeed wrong, since having BR2_ARM_CPU_MAYBE_HAS_VFPV2 does not
 > indicate that the SoC has VFP.

Indeed.

 > However, unlike BR2_ARM_CPU_HAS_NEON which gets selected even on ARM
 > cores for which NEON is optional, but for which the user has explicitly
 > requested NEON support to be enabled (through BR2_ARM_ENABLE_NEON), it
 > is not the case for the VFP option. I think we should do that.
 > Otherwise, BR2_ARM_CPU_HAS_VFPV2 will not be true, even if the VFPv2
 > unit is actually available and used.

But packages should use the BR2_ARM_FPU_VFPV2 (and 3/4) symbols to check
if they should use the VFP, and not BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV2

I don't think kconfig will let us both have these options depend on
BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV2 and select
BR2_ARM_CPU_HAS_VFPV2.

-- 
Venlig hilsen,
Peter Korsgaard 
