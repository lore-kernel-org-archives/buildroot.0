From: adam hussein(!) <kryme76@yahoo.com>
Date: Thu, 21 Nov 2013 08:07:17 -0800 (PST)
Subject: [Buildroot] libgcc erroneously built as armv5 for
	arm920t(armv4t)
In-Reply-To: <20131121162206.00dfb014@skate>
References: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>	<20131102163906.0b558177@skate>	<20131107203113.4a86ad85@skate>	<1385045770.26460.YahooMailNeo@web162202.mail.bf1.yahoo.com>
 <20131121162206.00dfb014@skate>
Message-ID: <1385050037.24198.YahooMailNeo@web162203.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


>Ok, so that's with a Buildroot internal toolchain. Can you also try to
>build the kernel with this toolchain to see if it's affected or not by
>the below problem?

It was fine, just didn't think to mention it as was an exception of the Sourcery toolchain.

>Ok. I think this is a kernel bug actually. The head.S file is special
>in that it contains instructions for ARMv5+, which an ARMv4t assembler
>will not accept. But it should, because the code guarantees that the
>ARMv5+ instructions will not be executed on ARMv4.
>
>In order to ask the assembler to accept these instructions, the
>following commit was made back in 2008:
>
>? http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/compressed/Makefile?id=80cec14a83ad0ad109d822b3f3482a379bc481ba
>
>However, it was reverted recently:
>
>? http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/compressed/Makefile?id=da94a829305f1c217cfdf6771cb1faca0917e3b9
>
>I am not sure how this last commit doesn't break your situation.

Interesting stuff. It's building 2.6.38.6, which benefits only from the first commit.

>It would be interesting if you could confirm whether the kernel builds
>or not with the Buildroot internal toolchain.

As above, it built fine.

>> 20126bdc:??? e16f3f10 ??? clz??? r3, r0
>> 20126be0:??? e16f2f11 ??? clz??? r2, r1

>So in other words, you mean that this wouldn't work on the target
>platform. Hum, weird. Is this a part of U-Boot implemented in assembly,
>or something compiled from C ?

Yes indeed. My belief is that _udivsi3 was pulled in with CLZs intact from the libgcc built and distributed with the Sourcery toolchain, rather than rebuilding a 4T arch version for the occasion.
To be honest, I'm not sure if something like --sysroot can redirect this; I've never thought about it before.

>Can you give me the relevant informations to allow me to build the
>kernel image and U-Boot image myself? Kernel version and configuration
>file, U-Boot version and configuration, etc.

Sure. Didn't get far off making for the dev board it was based on, aside from memory tweaks to u-boot.
I'm building the buildroot-2013.08.1 archive with 'make at91rm9200df_defconfig'.
The u-boot clone is at commit 46ef4faed18196472eb95216b2f74c1397ecf024 from http://git.denx.de/u-boot.git.
Then:
??? export PATH=$PATH:/data/at91rm9200/buildroot-2013.08.1/output/host/usr/bin/
??? export CROSS_COMPILE=arm-buildroot-linux-uclibcgnueabi-
??? make at91rm9200dvc_ram_config
??? make
or:
??? export PATH=$PATH:/data/at91rm9200/buildroot-2013.08.1-thomas2/output/host/opt/ext-toolchain/bin/
accordingly.

I used JTAG to pin-point that CLZ was the cause of failure, rather than myself!

Good luck,
Adam
