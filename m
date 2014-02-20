From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 20 Feb 2014 16:30:11 -0500
Subject: [Buildroot] SoCkit support question?
In-Reply-To: <CAGduivymyJe+NLi=tsk1uCxit3ZOy=U8WxLjh=myR9MZGbL+ZQ@mail.gmail.com>
References: <940580837.479152.1392839319094.JavaMail.root@mail>
 <179193548.492145.1392839402433.JavaMail.root@mail>
 <CAE21AQrNm0dqnUAaBRebhTwSRuPz0u4xC0j1h4yDJizDgZFS2A@mail.gmail.com>
 <CAGduivymyJe+NLi=tsk1uCxit3ZOy=U8WxLjh=myR9MZGbL+ZQ@mail.gmail.com>
Message-ID: <530673E3.9030506@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 02/20/2014 04:08 AM, Maxime Hadjinlian wrote:
> Hi Charles, S?bastien, all
>
> On Wed, Feb 19, 2014 at 9:34 PM, Charles Manning <cdhmanning@gmail.com> wrote:
>>
>>
>> On Thu, Feb 20, 2014 at 8:50 AM, S?bastien Bourdelin
>> <sebastien.bourdelin@savoirfairelinux.com> wrote:
>>> Hi,
>>>
>>> I would like to submit the support for the SoCkit from Altera, but i have
>>> some questions regarding the bootloader step and need some advices on the
>>> best way to handle it.
>>>
>>> The SoC combines a hard processing system (HPS) and an FPGA, so the board
>>> design can change and the bootloader must provide a preloader.
>>>
>>> This preloader is normally generated using the Altera tools (Quartus,
>>> Qsys, bsp-editor) and results in source files defining the board that will
>>> be used in a patched u-boot from rocketboard (rocketboard is altera i
>>> guess).
>>> For more informations on this step, please look at :
>>> http://www.rocketboards.org/foswiki/Documentation/PreloaderUbootCustomization
>>>
>>> Then the preloader must be sign using an other tool from Altera (mkpimage)
>>> that comes with all the Altera dev environment.
>>> Maxime Hadjinlian has done a fork of this tool in GO
>>> (https://github.com/maximeh/mkpimage)
>>>
>>> If i use the sources from the rocketboard repository
>>> (http://git.rocketboards.org/?p=u-boot-socfpga.git;a=summary),
>>> regardless the branch, the preloader generated doesn't work, even if i'm
>>> signing it with the mkpimage tool from Altera (may be i'm missing something
>>> here).
>>
>> Yes, many people have observed. this. There are some discussions going on in
>> the rocketboard rfi mailing list on that too,
>>
>>> If i use the Altera tools to generate my preloader using Qsys and an
>>> example design from Altera, then use the result sources files that define
>>> the u-boot/board/altera/socfpga/*, built u-boot and sign it with the
>>> mkpimage from Altera then it works.
> The fact that it doesn't work out of the box with a really minimal
> configuration is a real PITA.
> As a matter of fact, I have heard that Altera is working on the 2nd
> version of theses boards, and it seems software and mainlining efforts
> has been pretty much put to a stop :/.
What i can do, is adding an u-boot patch for this board in buildroot
that will generate a working u-boot-spl based on the example design.
>>
>>
>> Yesterday I posted a patch for uboot on the rocketboard RFI mailing list.
>> http://lists.rocketboards.org/pipermail/rfi/2014-February/001281.html
>>
>> This patch adds a preloader signer (written in C) to the u-boot/tools as
>> well as adding this to the Makefile to run automatically (like say the OMAP
>> MLO signer does).
> That's really nice ! I ment to do that but never took the time. With
> the documentation published it is easier to code this right.
> Well done !
> Try to push it over to the mainline U-Boot mailing list, that can
> interests them, I already offered my Go and another Python version of
> my mkpimage a while ago, but maybe your C version will raise more
> interests to them.
>> I am also putting together some build-root recipes to copy the binary over
>> (something like how the omap MLO is handled).
> Obvious idea, could you put your branch online somewhere so S?bastien
> could work with you and so you don't do both the work :) ?
> I would be happy to help.
I'm not sure it will be necessary, until the Charles patchs are mainline
or at least in buildroot i could not use it.
I think we could just generate an un-sign preloader and let the end user
know that currently he has to sign it using the Altera tool or your tool
Maxime, then if the Charles patchs are accepted we could changed the
board config.
What do you think ?
>>
>>> So my question is what the best way to provide the support for this board
>>> in buildroot ?
>>>
>>> Assuming I have not made mistake, if you want to provide support for the
>>> bootloader of this board without using any tools from Altera, you must :
>>>
>>> - Use the patched u-boot from rocketboard
>>> - Define the board with a sample design, ie patch the sources in
>>> u-boot/board/altera/socfpga/*
>>> - Generate the bootloader (u-boot) and preloader (u-boot SPL)
>>> - Sign the preloader with a fork to mkpimage tools (recode the mkpimage
>>> from Maxim  Hadjinlian in C ?)
>>>
>>> Another approach would be to consider that the end user must provide their
>>> bootloader and flash it, the buildroot board config take care of building
>>> only Linux and the rootfs.
>>
>> I think it is better to build the preloader from buildroot too.
> Ideally, it would be part of the uboot-tools packages.
> That's also a reason why it would be nice if the U-Boot Tools could be
> from the same sources as U-Boot, I had sent a patch regarding this
> issues, but I have to rework my idea to re send this.
>> -- Charles
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
