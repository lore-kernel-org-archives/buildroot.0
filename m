From: adam hussein(!) <kryme76@yahoo.com>
Date: Fri, 27 Sep 2013 04:23:04 -0700 (PDT)
Subject: [Buildroot] libgcc erroneously built as armv5 for
	arm920t(armv4t)
In-Reply-To: <20130926175221.GC3418@free.fr>
References: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>
 <20130926175405.67336473@skate> <20130926175221.GC3418@free.fr>
Message-ID: <1380280984.22189.YahooMailNeo@web162203.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>In crosstool-Ng, we have this:
>? ? http://crosstool-ng.org/hg/crosstool-ng/annotate/98b7806295cc/patches/gcc/4.4.5/210-arm-unbreak-armv4t.patch#l1
>
>For gcc, if --with-cpu is not specified, then it defaults to
>TARGET_CPU_arm10tdmi which is an armv5 (as far as I understand it).
>
>The patch above downgrades the default CPU to an armv4t. Maybe worth a
>try. That, or passing --with-cpu=... as suggested by Adam.

Hi,

I have got a similar patch in:
??? package/gcc/4.7.3/830-arm_unbreak_armv4t.patch
...to edit SUBTARGET_CPU_DEFAULT to use arm9tdmi instead of the arm5t arm10tdmi 
core.

The file affected, gcc/config/arm/linux-eabi.h, has no equivalent to set the architecture to arm4t as default.
I wonder if libgcc has no translation from the cpu/core to the architecture.

Following back from the __udivsi3 libgcc function...

My exception was at:
??? 20127a2c:??? e16f3f10 ??? clz??? r3, r0

which is in:
??? 20127a10 <__udivsi3>:

u-boot.map states:
???? .text????????? 0x20127a10????? 0x20c /opt/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/libgcc.a(_udivsi3.o)

then in ../buildroot-2013.08.1/output/build/host-gcc-final-4.7.3/build/arm-buildroot-linux-uclibcgnueabi/libgcc/_udivsi3.dep 
??? _udivsi3.o: ../../../libgcc/config/arm/lib1funcs.S _udivsi3.vis \
???????????????????? ../../../libgcc/config/arm/ieee754-df.S \
???????????????????? ../../../libgcc/config/arm/ieee754-sf.S \
???????????????????? ../../../libgcc/config/arm/bpabi.S

The assembler code at the start:

??? 20127a10 <__udivsi3>:
??? 20127a10:??? e2512001 ??? subs??? r2, r1, #1??? ; 0x1
??? 20127a14:??? 012fff1e ??? bxeq??? lr
??? 20127a18:??? 3a000074 ??? bcc??? 20127bf0 <__udivsi3+0x1e0>
??? 20127a1c:??? e1500001 ??? cmp??? r0, r1
??? 20127a20:??? 9a00006b ??? bls??? 20127bd4 <__udivsi3+0x1c4>
??? 20127a24:??? e1110002 ??? tst??? r1, r2
????20127a28:??? 0a00006c ??? beq??? 20127be0 <__udivsi3+0x1d0>

matches an available version(within "#else /* ARM version/Thumb-2.? */")
This then uses the macro ARM_DIV_BODY, which sure enough gives the CLZ containing options.

??? .macro ARM_DIV_BODY dividend, divisor, result, curbit
??? 
??? #if __ARM_ARCH__ >= 5 && ! defined (__OPTIMIZE_SIZE__)
??? 
??? #if defined (__thumb2__)
??????????? clz???? \curbit, \dividend
??????????? clz???? \result, \divisor
??? ...
??? #else
??????????? clz???? \curbit, \dividend
??????????? clz???? \result, \divisor
??? ...
??? #endif
??? 
??? #else /* __ARM_ARCH__ < 5 || defined (__OPTIMIZE_SIZE__) */
??? #if __ARM_ARCH__ >= 5
??? 
??????????? clz???? \curbit, \divisor
??????????? clz???? \result, \dividend
??? ...
??? #else /* __ARM_ARCH__ < 5 */
??? ...

So, we clearly have __ARM_ARCH__ >= 5.
The value of this is defined at the beginning of the same file, in the absense of any of:
??? __ARM_ARCH_2__,
??? __ARM_ARCH_3__,
??? __ARM_ARCH_3M__,
??? __ARM_ARCH_4__ or
??? __ARM_ARCH_4T__
..being defined.

I notice with a 'grep -r "__ARM_ARCH_" *" that 'libffi' does something similar.
But, I can't find where this is set. 
Or rather, I don't think it is set in one piece.
The file:
??? gcc/config/arm/arm-cores.def
..seems to be a bridge from 'arm9tdmi', specifying '4T', presumably to append make up __ARM_ARCH_4T__

But the construction of this I unfortunately cannot find.

Any of this jog a memory?

Cheers,
Adam
