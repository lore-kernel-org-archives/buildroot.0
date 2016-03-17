From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 09:16:24 +0100
Subject: [Buildroot] [PATCH 10/16] arch/arm: add support for hard-float
 on Cortex-M4
In-Reply-To: <56E9F00F.9040209@mind.be>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9F00F.9040209@mind.be>
Message-ID: <20160317091624.157165ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 00:45:19 +0100, Arnout Vandecappelle wrote:
> On 03/16/16 22:43, Thomas Petazzoni wrote:
> > Cortex-M4 cores can optionally have a FPv4-SP floating point unit
> > (which is different than the VFPv4). This commit adds the necessary
> > Config.in options to allow the user to enable the use of this FPU, and
> > to build an EABIhf toolchain for Cortex-M4.
> >
> > Note that for now the kernel does not have CONFIG_VFP support for
> > ARMv7-M, so in practice, this VFP support cannot really be used for
> > the moment.
> 
>   As in, when you select this option, then your target will fail dramatically 
> because it's hardfloat so even a simple printf will crash violently if a 
> reschedule happens in the middle?

My tests show that a VFP-using userspace indeed doesn't start. I've
mailed the STM32 kernel maintainer to see what the plans are in terms
of FPU support.

>   If so, I'm not so sure we really want this option...

Agreed. I saw that the STM32F4 had a FPU, so I wanted to support that,
and it's only when I started testing on HW that I realized that the
kernel CONFIG_VFP option could not be enabled for this platform.

Depending on the answer from the STM32 kernel maintainer, I will either
drop or keep (disabled in some form?) this floating point support.

> >   config BR2_ARM_ENABLE_VFP
> >   	bool "Enable VFP extension support"
> 
>   As I understand it (but I could be wrong), FPv4 is not again different from 
> VFP, i.e. it's again a different ABI (like softfloat and VFP are different 
> ABIs). At least, you get different flags in the ELF files. So I would tend to 
> really make a separate option for FPv4, to avoid all confusion. That is, 
> assuming that I'm right about it being a different ABI.
> 
>   Note that in practice it doesn't make much of a difference becaus you never 
> have both VFP and FPv4 on the same processor. Well, at least for the time being 
> - who knows what kind of ugliness ARM will still invent :-)

The BR2_ARM_ENABLE_VFP option is *not* about choosing the ABI. The
BR2_ARM_ENABLE_VFP option is only here for cores that have an
*optional* FPU so that the user can say whether his specific SoC has
chosen to include the FPU or not.

If you for example have an hypothetical Cortex-M5 core that has a
mandatory FPU, then this BR2_ARM_ENABLE_VFP option would not appear, as
we know all Cortex-M5 based SoCs have FPU.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
