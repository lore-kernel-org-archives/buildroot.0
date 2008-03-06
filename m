From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 6 Mar 2008 17:28:28 +0100
Subject: [Buildroot] I really need some help
References: <1CD05B980C94AC408B37C82BBABAA3E60A91DE9E@mtsexchange.dc.multitech.prv>
Message-ID: <02be01c87fa9$2864e2c0$030514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> > I have been trying for the past 2+ months to successfully 
>> complete a 
>> > buildroot session for a AT91SAM9260EK. I first installed 
>> buildroot via 
>> > svn. Then I then did a "make at91sam9260pf_defconfig" to 
>> get baseline 
>> > config files.
>> 
>> The "pf" is for parallel flash and will not work on the EK 
>> since it does not have any parallel flash. You should use 
>> "make at91sam9260dfc_defconfig" and a dataflash card for this board.
>> 
>> If you want to use the internal dataflash, then you need to 
>> fix U-Boot and at91bootstrap, but it might be easier to 
>> download the binaries from www.linux4sam.org
> 
> Right now I have been working with the free BSP package from Timesys and
> the binaries from linux4sam.
> 
> Firstly, I guess I don't understand what is referred to by "parallel
> flash". 

In this context, it is a non-multiplexed random access flash memory
with address bus, databus, chip select, read and write strobe.

>Is the NAND flash on the EK board not considered parallel flash?

It is a parallel flash, but it is usually referred to as a NAND flash,
implying an 8/16 bit databus and only 1-2 address pins.

If you want to be strict then you can say that a parallel flash
memory is a RAM, because RAM = Random Access Memory.
What is usually called a RAM, is actually a RWM (Read/Write Memory)
The pundit will claim that you can write to a flash as well,but 
it is not so easy to do that as it is with a normal RAM.

> Or is the issue because the 9260 has a bug that won't allow it to boot
> from NAND Flash. We are planning to switch development efforts to the
> 9G20 when the EK is available in April, and that part supposedly has the
> NAND boot issue fixed.

There is no prepared defconfig for NAND flash only.
The difference is at91bootstrap and U-boot.
You will be able to use buildroot to build the linux and the rootfs in any case.

> Secondly, considering what you are saying about the internal dataflash,
> can I assume that the Uboot and bootstrap files I got from both Timesys
> and linux4sam have the internal dataflash fix, since I am able to boot
> the boards without a dataflash card?

Yes, the buildroot was created because Atmel poorly supports
the external dataflashcard.
You can use the timesys at91bootstrap/u-boot if you want to use
the internal dataflash, but I think that you will find that during
development, it is much nicer to use the dataflash card.

> 
> And thirdly, which binaries are stored on the dataflash and which can be
> on the NAND Flash of the 9260EK board? Is the linux kernel stored on the
> dataflash or the NAND flash typically?
> 

The AT91 buildroot pretty much ignores the NAND flash.
I see there is a lot of activity on the u-boot mailing list about
this and that feature of NAND flash which has issues in u-boot.
Again, reconfiguring to not build the boot programs 
will allow you to complete the build.




>> 
>> Is "SuperModem-2.6.22.1" your project name?
> 
> Yes, name with kernel version
> 
>> 
>> 
>> For: "atd.c:498:2: error: #error "No mail command specified." 
>> error message:
>> 
>> If you do not need the "at" package, you can just disable it 
>> in menuconfig. If you need it, then you need to look at 
>> "atd.c" somewhere in the build_arm_wchar/at-3.1.10 to find 
>> out why you get the error message.
> 
> What is this AT package? Do I disable it in the busy box or the kernel
> config? I am an kernel building newbie so I am not familiar with all the
> options. I really need a "Building Linux kernels for Dummies" book. :)
> 

It is a package, and you disable it by "make menuconfig".
It is not part of the Linux kernel.

Best Regards
Ulf Samuelsson
