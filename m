From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 09:03:26 +0100
Subject: [Buildroot] [PATCH 02/16] arch/arm: Cortex-M3 provides only
 Thumb-2
In-Reply-To: <56E9E177.5000606@mind.be>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9E177.5000606@mind.be>
Message-ID: <20160317090326.3dbeffb1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Mar 2016 23:43:03 +0100, Arnout Vandecappelle wrote:

>   If thumb2 is a superset of thumb, then CPU_HAS_THUMB2 should select 
> CPU_HAS_THUMB. And according to [1], it really is a superset.

Right, this is a superset.

> > and we could have a single option for both in
> > Buildroot, since -mthumb on ARMv4/v5 means original Thumb, while
> > -mthumb on ARMv7 means Thumb 2.
> 
>   Well, I think the main reason to have the CPU_HAS_THUMB2 option is to allow 
> packages to depend on it, e.g. because there is some thumb2 assembly in it.

Indeed.


> > diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> > index 33f763a..cd1ec33 100644
> > --- a/arch/Config.in.arm
> > +++ b/arch/Config.in.arm
> > @@ -172,7 +172,6 @@ config BR2_cortex_a17
> >   	select BR2_ARCH_HAS_MMU_OPTIONAL
> >   config BR2_cortex_m3
> >   	bool "cortex-M3"
> > -	select BR2_ARM_CPU_HAS_THUMB
> 
>   I do agree about the change itself, but I also think that HAS_THUMB2 should 
> select HAS_THUMB instead. Also, I think the BR2_ARM_INSTRUCTIONS_THUMB2 option 
> should be removed, because in the end it's just compiling in thumb mode. In arm 
> mode, we also don't have separate options for armv5, armv6, armv7.

I originally started to remove BR2_ARM_INSTRUCTIONS_THUMB2, and have a
single BR2_ARM_INSTRUCTIONS_THUMB that simply says "use Thumb for that
core", which would be Thumb1 for old ARM cores, and Thumb2 for ARMv7.

However, there are cases where packages really need to know whether
Thumb1 or Thumb2 is used. For example, glibc or musl don't build in
Thumb1, so we force ARM instructions. This is fine for Thumb1, because
all cores that support Thumb1 also support the ARM instruction set.

However, glibc and musl build fine in Thumb2, so there's no reason to
force using the ARM instruction set. And Thumb2 is different than
Thumb1 in that respect: there are some cores that implement *only*
Thumb2 and not ARM (basically, the ARMv7-M ones).

So, if we remove BR2_ARM_INSTRUCTIONS_THUMB, we will have to change:

ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
GLIBC_EXTRA_CFLAGS += -marm
endif

to something like:

ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB):$(BR2_CPU_HAS_THUMB2),y:)
GLIBC_EXTRA_CFLAGS += -marm
endif

And so on everywhere where we need to do things depending on whether
Thumb1 or Thumb2 is used.

So, while using Thumb1 or Thumb2 is just a matter of passing -mthumb to
gcc and would therefore lead us to think that a single options is
sufficient, I found it clearer to keep two separate options.

But I'm open to suggestions. As I said, I initially started my patch
series by doing what you suggested, but reverted back to the
ARM/Thumb/Thumb2 choice that we have today.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
