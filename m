From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Sep 2015 18:01:00 +0200
Subject: [Buildroot] [PATCH 3/3] Fix uClibc build for ARM-nommu
In-Reply-To: <55EC5D29.9030708@gmail.com>
References: <1441470824-23456-1-git-send-email-public.douglas.raillard@gmail.com>
 <20150906152558.6472329b@free-electrons.com>
 <55EC5D29.9030708@gmail.com>
Message-ID: <20150906180100.0f23f83c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Douglas,

On Sun, 6 Sep 2015 17:35:05 +0200, Douglas RAILLARD wrote:

> >> +define UCLIBC_ARM_THUMB_CONFIG
> >> +	$(call KCONFIG_ENABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
> >> +	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
> >> +endef
> >> +endif
> > 
> > Other than that, it looks good to me.
> 
> One thing that this patch does not reflect is that the only threading
> backend which works (and compiles) on ARM Thumb is BR2_PTHREADS_OLD.
> Should we warn the user or is its responsibility to choose what is
> appropriate for this target ?

No, we have to make sure that the user cannot do a selection that is
known to not work.

This problem is already partially handled by the following piece of
code in uclibc.mk:

# Thumb build is broken with threads, build in ARM mode
ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
UCLIBC_EXTRA_CFLAGS += -marm
endif

But this only handles the case of ARM platforms that support the
original Thumb instruction set, and which also support the regular ARM
instruction set. This is for example the case on ARMv4 or ARMv5
(possibly ARMv6, but I'm not sure).

The Cortex-M3 is defined in Buildroot as:

config BR2_cortex_m3
        bool "cortex-M3"
        select BR2_ARM_CPU_HAS_THUMB
        select BR2_ARM_CPU_HAS_THUMB2

However, I am not sure this makes sense. Gcc only understands a -mthumb
option, which means Thumb on ARMv4/v5, and Thumb-2 on ARMv7 (at least
for ARMv7-A). So I believe we should remove the "select
BR2_ARM_CPU_HAS_THUMB" from this BR2_cortex_m3 option.

Then, we should test if building uclibc in Thumb 2 mode on ARMv7-A with
NPTL enabled works. Depending on whether it works or not, the choice
will be different. If it doesn't work, and indeed building the NPTL
code in Thumb-2 is broken, then we will have to:

 1/ Enforce building with the ARM instruction set on ARMv7-A

 2/ Prevent from selecting NPTL as the thread implementation on ARMv7-M

Does that make sense?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
