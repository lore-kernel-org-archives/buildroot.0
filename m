From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 22:25:50 +0100
Subject: [Buildroot] [PATCH 04/16] uclibc: Enable compile in thumb mode
 when selected
In-Reply-To: <87zitx5oz0.fsf@dell.be.48ers.dk>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87zitx5oz0.fsf@dell.be.48ers.dk>
Message-ID: <20160317222550.7232666c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 12:21:55 +0100, Peter Korsgaard wrote:

>  >  - Force ARM mode only when gcc 4.7 or 4.8 is selected with Thumb1 and
>  >    threads. We also explicitly disable COMPILE_IN_THUMB_MODE when we
>  >    fall in this situation. With newer gcc versions, starting 4.9, this
>  >    problem is fixed and we can build uClibc in Thumb1 mode.
> 
>  >  - Enable COMPILE_IN_THUMB_MODE when Thumb1 or Thumb2 is selected. We
>  >    need to disable context functions since they don't build in Thumb
>  >    mode.
> 
> Why do we need to tell uClibc that we are building in thumb1/2 mode?
> From a quick grep this just adds -mthumb to CFLAGS, which shouldn't be
> needed as we've already configured the compiler to do so by default and
> enables USE_BX + USE_LDREXSTREX.

USE_LDREXSTREX is mandatory for uClibc to build on Thumb2 (see commit
https://lists.uclibc.org/pipermail/uclibc/2014-November/048704.html).
Otherwise, the build fails with:

/tmp/ccsjUC4D.s: Assembler messages:
/tmp/ccsjUC4D.s:31: Error: selected processor does not support ARM opcodes
/tmp/ccsjUC4D.s:32: Error: attempt to use an ARM instruction on a Thumb-only processor -- `swp r2,r2,[r0]'
/tmp/ccsjUC4D.s:33: Error: attempt to use an ARM instruction on a Thumb-only processor -- `orr r3,pc,#1'
/tmp/ccsjUC4D.s:34: Error: attempt to use an ARM instruction on a Thumb-only processor -- `bx r3'
make[2]: *** [libpthread/linuxthreads.old/pt-machine.o] Error 1

> Now, I don't know enough of the finer details about this. I thought BX
> was for thumb1 interworking with classical ARM code and not needed for
> thumb2, so isn't it just adding overhead for thumb2? I also see that
> enabling this option will break thumb compilation on arm920t.

What makes you think it will fail to build ?

I believe you think:

#if defined(__USE_BX__)
# if (__ARM_ARCH <= 4 && !defined __ARM_ARCH_4T__)
#  error Use of BX was requested, but is not available on the target processor.
# endif /* ARCH level */
#endif /* __USE_BX__ */

will make it fail to build.

But ARM920T is an ARMv4T, not an ARMv4. Quoting from
http://www.atmel.com/Images/ARM_920T_TRM.pdf:

"""
The ARM920T processor incorporates the ARM9TDMI integer core, which
implements the ARM architecture v4T.
"""

However, it could indeed break StrongARM and FA256, which implement the
ARMv4 instruction set. *But* for those two cores, we don't select
BR2_ARM_CPU_HAS_THUMB, so you can't switch them to Thumb mode.

But isn't this all moot since Thumb appeared with ARMv4T ?

> Luckily Yann is the author of this logic in uClibc, so lets ask him ;)
> 
>  >  - Disable COMPILE_IN_THUMB_MODE explicitly otherwise.
> 
>  > This allows to build a Thumb2 toolchain on ARMv7-M for example.
> 
> What wasn't working before?

See above. If you don't enable COMPILE_IN_THUMB_MODE, you can't enable
USE_LDREXSTREX.

So I think we should:

 1/ Enable COMPILE_IN_THUMB_MODE whenever ARM_INSTRUCTIONS_THUMB(2) is
    enabled.

 2/ Enable USE_BX whenever ARM_INSTRUCTIONS_THUMB(2) is enabled. I
    don't see why USE_BX for later cores can cause performance problems,
    it's just about using a simple bx instruction to switch between ARM
    and Thumb modes.

 3/ Enable USE_LDREXSTREX whenver ARM_INSTRUCTIONS_THUMB(2) is enabled
    *and* we're on ARMv7. Otherwise, disable it.

Thoughts ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
