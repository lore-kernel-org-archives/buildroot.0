From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 16:22:06 +0100
Subject: [Buildroot] libgcc erroneously built as armv5 for
 arm920t(armv4t)
In-Reply-To: <1385045770.26460.YahooMailNeo@web162202.mail.bf1.yahoo.com>
References: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>
 <20131102163906.0b558177@skate> <20131107203113.4a86ad85@skate>
 <1385045770.26460.YahooMailNeo@web162202.mail.bf1.yahoo.com>
Message-ID: <20131121162206.00dfb014@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Thu, 21 Nov 2013 06:56:10 -0800 (PST), adam hussein\(!\) wrote:

> Sorry for going quiet for so long; a lot of change going on here.

No problem.

> I'm
>  not in a position to work on this board now, the project taking a 
> different direction altogether; however, I have found time for a
> sneaky test of the patch using the internal toolchain, and it seems
> fine.
> 
> The objdump showing that udivsi3 no longer has CLZ instructions.
> 
> arm-buildroot-linux-uclibcgnueabi-objdump -d u-boot | grep
> "20126c1c:" -A 10 20126c1c:??? e2512001 ??? subs??? r2, r1, #1
> 20126c20:??? 012fff1e ??? bxeq??? lr
> 20126c24:??? 3a000036 ??? bcc??? 20126d04 <__udivsi3+0xe8>
> 20126c28:??? e1500001 ??? cmp??? r0, r1
> 20126c2c:??? 9a000022 ??? bls??? 20126cbc <__udivsi3+0xa0>
> 20126c30:??? e1110002 ??? tst??? r1, r2
> 20126c34:??? 0a000023 ??? beq??? 20126cc8 <__udivsi3+0xac>
> 20126c38:??? e311020e ??? tst??? r1, #-536870912??? ; 0xe0000000
> 20126c3c:??? 01a01181 ??? lsleq??? r1, r1, #3
> 20126c40:??? 03a03008 ??? moveq??? r3, #8
> 20126c44:??? 13a03001 ??? movne??? r3, #1

Ok, so that's with a Buildroot internal toolchain. Can you also try to
build the kernel with this toolchain to see if it's affected or not by
the below problem?

> Selecting Sourcery CodeBench 2013.05 external toolchain had the
> buildroot make attempt end with:
> 
> ? LD????? vmlinux
> ? SYSMAP? System.map
> ? SYSMAP? .tmp_System.map
> ? OBJCOPY arch/arm/boot/Image
> ? Kernel: arch/arm/boot/Image is ready
> ? AS????? arch/arm/boot/compressed/head.o
> arch/arm/boot/compressed/head.S: Assembler messages:
> arch/arm/boot/compressed/head.S:936: Error: selected processor does
> not support ARM mode `clz r5,r4'

Ok. I think this is a kernel bug actually. The head.S file is special
in that it contains instructions for ARMv5+, which an ARMv4t assembler
will not accept. But it should, because the code guarantees that the
ARMv5+ instructions will not be executed on ARMv4.

In order to ask the assembler to accept these instructions, the
following commit was made back in 2008:

  http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/compressed/Makefile?id=80cec14a83ad0ad109d822b3f3482a379bc481ba

However, it was reverted recently:

  http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/compressed/Makefile?id=da94a829305f1c217cfdf6771cb1faca0917e3b9

I am not sure how this last commit doesn't break your situation.

It would be interesting if you could confirm whether the kernel builds
or not with the Buildroot internal toolchain.

> And using it for u-boot gave me:
> 
> arm-none-linux-gnueabi-objdump -d u-boot | grep "20126bc0:" -A 10
> 20126bc0:??? e2512001 ??? subs??? r2, r1, #1
> 20126bc4:??? 012fff1e ??? bxeq??? lr
> 20126bc8:??? 3a000074 ??? bcc??? 20126da0 <__udivsi3+0x1e0>
> 20126bcc:??? e1500001 ??? cmp??? r0, r1
> 20126bd0:??? 9a00006b ??? bls??? 20126d84 <__udivsi3+0x1c4>
> 20126bd4:??? e1110002 ??? tst??? r1, r2
> 20126bd8:??? 0a00006c ??? beq??? 20126d90 <__udivsi3+0x1d0>
> 20126bdc:??? e16f3f10 ??? clz??? r3, r0
> 20126be0:??? e16f2f11 ??? clz??? r2, r1

So in other words, you mean that this wouldn't work on the target
platform. Hum, weird. Is this a part of U-Boot implemented in assembly,
or something compiled from C ?

Can you give me the relevant informations to allow me to build the
kernel image and U-Boot image myself? Kernel version and configuration
file, U-Boot version and configuration, etc.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
