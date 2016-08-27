From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 09:27:16 +0200
Subject: [Buildroot] [PATCH] pixman: properly enable/disable ARM
 optimizations
In-Reply-To: <04d09d36-c5e7-ac47-a821-84026fd98178@mind.be>
References: <1472244298-13978-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <04d09d36-c5e7-ac47-a821-84026fd98178@mind.be>
Message-ID: <20160827092716.5a1edb11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Aug 2016 00:07:59 +0200, Arnout Vandecappelle wrote:

> > +ifeq ($(BR2_ARM_CPU_HAS_ARM),y)  
> 
>  Minor nit: the instructions used by arm-simd are actually ARMv5TE instructions.
> Fortunately, all our ARMv5 CPU options support the E extension, so we can add
> !BR2_ARM_CPU_ARMV4 to the condition. Still, it's not strictly necessary, because
> the compiler can still generate this v5E code, and the resulting ELF file is
> compatible with v4 object files, and there is a CPU check so it will only be run
> if it is really supported (I didn't actually test that, but the code is there).
> And adding that extra condition will make the code really ugly. It's just weird
> to pass --enable-arm-simd when it will not be used in the end.

I should have added such an explanation. I indeed realized that the
SIMD code would not work with the oldest ARM cores, but pixman is
handling that properly. The only case where pixman's logic fall short
is on CPUs that do not support ARM instructions at all.

> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I'll grab a part of your explanation to extend the commit log when
applying the patch. Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
