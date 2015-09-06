From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Sun, 6 Sep 2015 22:44:28 +0200
Subject: [Buildroot] [PATCH 3/3] Fix uClibc build for ARM-nommu
In-Reply-To: <20150906180100.0f23f83c@free-electrons.com>
References: <1441470824-23456-1-git-send-email-public.douglas.raillard@gmail.com>
 <20150906152558.6472329b@free-electrons.com> <55EC5D29.9030708@gmail.com>
 <20150906180100.0f23f83c@free-electrons.com>
Message-ID: <55ECA5AC.6040800@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas

On 06/09/2015 18:01, Thomas Petazzoni wrote:
> However, I am not sure this makes sense. Gcc only understands a -mthumb
> option, which means Thumb on ARMv4/v5, and Thumb-2 on ARMv7 (at least
> for ARMv7-A). So I believe we should remove the "select
> BR2_ARM_CPU_HAS_THUMB" from this BR2_cortex_m3 option.

There does not seem to be a way to force gcc to generate Thumb instead
of Thumb2 on ARMv7-M, so in reality, Cortex-M3 only supports Thumb2 when
using gcc toolchain.
However, BR2_PTHREADS_OLD does compile with Thumb2.
If it compiles for Thumb too, the test on BR2_TOOLCHAIN_HAS_THREADS is
maybe too generic, it should be on BR2_PTHREADS_NATIVE instead.
We should then test BR2_PTHREADS_OLD with a true Thumb target (i.e.
where -mthumb generates Thumb and not Thumb2). If that works, we should
probably replace:
ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy) with
ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_PTHREADS_NATIVE),yy)
or something like that.


> Then, we should test if building uclibc in Thumb 2 mode on ARMv7-A with
> NPTL enabled works. Depending on whether it works or not, the choice
> will be different. If it doesn't work, and indeed building the NPTL
> code in Thumb-2 is broken, then we will have to:
> 
>  1/ Enforce building with the ARM instruction set on ARMv7-A


Building for cortex-A8 with BR2_ARM_INSTRUCTIONS_THUMB2 selected and
BR2_PTHREADS_NATIVE works. I checked that the uClibc configuration was
set for Thumb and NPTL accordingly.
This is strange because Waldemar said that NPTL is not Thumb ready yet,
and it fails when building for Cortex-M3.
My guess is that inline ARM assembly used in uClibc is given to gas as
is, so as long as the target can handle ARM, gas happily output ARM
instructions, even if gcc has generated Thumb2 assembly for the C code,
but it is only speculations.

> 2/ Prevent from selecting NPTL as the thread implementation on ARMv7-M

Is there an already implemented way of telling if ARMv7-M target is
selected ?
Testing BR2_ARM_INSTRUCTIONS_THUMB2 is not enough because NPTL builds on
Cortex-A8 with BR2_ARM_INSTRUCTIONS_THUMB2.


Best,

Douglas

-- 

Douglas RAILLARD
