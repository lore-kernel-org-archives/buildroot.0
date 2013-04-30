From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 May 2013 00:09:05 +0200
Subject: [Buildroot] [PATCH v2 00/12] RFC: ARC port
In-Reply-To: <517FEC03.1010709@mind.be>
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
 <20130425050221.4846d873@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FA392@de02wembxa.internal.synopsys.com>
 <20130429224541.6f46b3b4@skate> <517FEC03.1010709@mind.be>
Message-ID: <20130501000905.609d0ced@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 30 Apr 2013 18:06:27 +0200, Arnout Vandecappelle wrote:
> On 29/04/13 22:45, Thomas Petazzoni wrote:
> >   * I am not entirely happy with 'toolchain/gcc: Introduce
> >     BR2_ARCH_HAS_NO_GCC_x_y' using a reverted logic. I haven't thought
> >     too much about it, but wouldn't it be possible to instead do
> >     something like BR2_ARCH_NEEDS_GCC_4_6_PLUS, and then do something
> >     like depends !BR2_ARCH_NEEDS_GCC_4_6_PLUS on all gcc versions <
> >     4.6 ? Hum, the problem is that it works with architecture that are
> >     supported starting from a given upstream gcc version, but not
> >     architecture that are supported only in 4.2-avr, or in 4.4-arc, etc.
> >
> >     Maybe others will have a suggestion on this point?
> 
>   Not entirely clean either, but what about the following:
> 
> [toolchain/gcc/Config.in]
> config BR2_ARCH_HAS_ALL_GCC
> 	bool
> 
> config BR2_ARCH_HAS_GCC_4_4
> 	bool
> 	default y if BR2_ARCH_HAS_ALL_GCC
> 
> [arch/Config.in]
> config BR2_mips
> 	select BR2_ARCH_HAS_ALL_GCC
> ...
> 
> [arch/Config.in.arm]
> config BR2_arm1176jzf_s
> 	select BR2_ARCH_HAS_ALL_GCC
> ...
> config BR2_cortex_a8
> 	select BR2_ARCH_HAS_GCC_4_4
> ...

Could be good. That said, this problem is quite different from doing
the ARC port. So maybe we could instead tell Mischa to revert back to
its original solution (adding yet another set of !BR2_arc everywhere),
and we can work on a solution to improve this as a follow-up patch. Of
course, if Mischa is willing to work on this, that'd be great, but I
don't think it's really mandatory to make this cleanup a strict
requirement to get the ARC code merged. The existing set of 'depends
on' for gcc versions is already ugly, it's not specifically the ARC
stuff that makes it ugly.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
