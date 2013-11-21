From: adam hussein(!) <kryme76@yahoo.com>
Date: Thu, 21 Nov 2013 06:56:10 -0800 (PST)
Subject: [Buildroot] libgcc erroneously built as armv5 for
	arm920t(armv4t)
In-Reply-To: <20131107203113.4a86ad85@skate>
References: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>	<20131102163906.0b558177@skate>
 <20131107203113.4a86ad85@skate>
Message-ID: <1385045770.26460.YahooMailNeo@web162202.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Sorry for going quiet for so long; a lot of change going on here.

Thanks for the patch; much tidier!

I'm
 not in a position to work on this board now, the project taking a 
different direction altogether; however, I have found time for a sneaky 
test of the patch using the internal toolchain, and it seems fine.

The objdump showing that udivsi3 no longer has CLZ instructions.

arm-buildroot-linux-uclibcgnueabi-objdump -d u-boot | grep "20126c1c:" -A 10
20126c1c:??? e2512001 ??? subs??? r2, r1, #1
20126c20:??? 012fff1e ??? bxeq??? lr
20126c24:??? 3a000036 ??? bcc??? 20126d04 <__udivsi3+0xe8>
20126c28:??? e1500001 ??? cmp??? r0, r1
20126c2c:??? 9a000022 ??? bls??? 20126cbc <__udivsi3+0xa0>
20126c30:??? e1110002 ??? tst??? r1, r2
20126c34:??? 0a000023 ??? beq??? 20126cc8 <__udivsi3+0xac>
20126c38:??? e311020e ??? tst??? r1, #-536870912??? ; 0xe0000000
20126c3c:??? 01a01181 ??? lsleq??? r1, r1, #3
20126c40:??? 03a03008 ??? moveq??? r3, #8
20126c44:??? 13a03001 ??? movne??? r3, #1

Selecting Sourcery CodeBench 2013.05 external toolchain had the buildroot make attempt end with:

? LD????? vmlinux
? SYSMAP? System.map
? SYSMAP? .tmp_System.map
? OBJCOPY arch/arm/boot/Image
? Kernel: arch/arm/boot/Image is ready
? AS????? arch/arm/boot/compressed/head.o
arch/arm/boot/compressed/head.S: Assembler messages:
arch/arm/boot/compressed/head.S:936: Error: selected processor does not support ARM mode `clz r5,r4'

And using it for u-boot gave me:

arm-none-linux-gnueabi-objdump -d u-boot | grep "20126bc0:" -A 10
20126bc0:??? e2512001 ??? subs??? r2, r1, #1
20126bc4:??? 012fff1e ??? bxeq??? lr
20126bc8:??? 3a000074 ??? bcc??? 20126da0 <__udivsi3+0x1e0>
20126bcc:??? e1500001 ??? cmp??? r0, r1
20126bd0:??? 9a00006b ??? bls??? 20126d84 <__udivsi3+0x1c4>
20126bd4:??? e1110002 ??? tst??? r1, r2
20126bd8:??? 0a00006c ??? beq??? 20126d90 <__udivsi3+0x1d0>
20126bdc:??? e16f3f10 ??? clz??? r3, r0
20126be0:??? e16f2f11 ??? clz??? r2, r1


I hope this tells you what you wanted to know, in spite of not being able to run on the hardware.


Adam





----- Original Message -----
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: adam hussein(!) <kryme76@yahoo.com>; "buildroot at busybox.net" <buildroot@busybox.net>
Sent: Thursday, November 7, 2013 7:31 PM
Subject: Re: [Buildroot] libgcc erroneously built as armv5 for arm920t(armv4t)

Adam,

Did you had the opportunity to test the proposed patch?


On Sat, 2 Nov 2013 16:39:06 +0100, Thomas Petazzoni wrote:
> Dear adam hussein\(!\),
> 
> On Thu, 26 Sep 2013 08:34:53 -0700 (PDT), adam hussein\(!\) wrote:
> 
> > I've been building the at91rm9200ek configuration of buildroot to get a toolchain I can use to build u-boot with some board specific configuration.
> > 
> > This is an ARM920T core chip with ARMv4T architecture??- later ARM9 series have ARMv5TE architecture (http://en.wikipedia.org/wiki/ARM9)
> > 
> > When gcc is built, or perhaps specifically libgcc only, it seems the selection of 920t/v4 architecture gets lost and v5 is used instead.
> > This means that when I use it to build u-boot, I find it has the __udivsi3 function using the illegal (to v4) instruction CLZ (count leading zeros).
> > 
> > The easiest workaround for me is to specify arm7tdmi and be done with it, but I'd like to try contributing a proper fix if possible.
> 
> Can you try the attached patch? Ideally, it would be nice if you could
> try it with two configurations:
> 
>? * With the internal toolchain backend
>? * With the Sourcery CodeBench 2013.05 external toolchain
> 
> and run it on real hardware.
> 
> Thanks a lot for your testing!
> 
> Thomas



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
