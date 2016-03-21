From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 21 Mar 2016 13:53:50 +0100
Subject: [Buildroot] [PATCH] linux: Introduce DTB's bootargs fixup
	feature
In-Reply-To: <20160321131206.1d3b29c7@free-electrons.com>
References: <1458558329-19210-1-git-send-email-mcoquelin.stm32@gmail.com>
 <20160321131206.1d3b29c7@free-electrons.com>
Message-ID: <CALszF6CqGMakciwieEsxXnBDPN=bhq_2KsLcQSwv-NwW-2Y0mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-03-21 13:12 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon, 21 Mar 2016 12:05:29 +0100, Maxime Coquelin wrote:
>> The goal of this patch is to make Kernel command line
>> modifications in DTB without having to add patches on top
>> of the Kernel tree.
>>
>> This is done from Buildroot's config, user can:
>>  - Overwrite the full bootargs property's value
>>  - Append a string to the bootargs property's value
>>
>> For example, the first option is usefull when the user want
>> to change the root parameter, while the second option can
>> be used to add debug parameters.
>>
>> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>
> Thanks for this patch! I see how it can be useful for the STM32
> defconfigs.
>
> However, I am not entirely sure this is something we want to take in
> Buildroot. Indeed, your patch only allows to customize
> the /chosen/bootargs property, and not any other property of the Device
> Tree. If we want to do that via Config.in options, it suddenly becomes
> a lot more complicated.
Indeed, it will be difficult to extend it further than bootargs.
It works well for bootargs for two reasons:
 1- It is a generic property
 2- It is a string

There could be other uses for DTB patching, such as MAC address assignment.
But I agree than doing this in Config.in makes no sense.

>
> So I believe a more Buildroot-ish way of doing this is to simply do it
> in a post-image script. The only thing needed to do that is to add some
> padding when creating the DTB, which we could either do
> unconditionally, or add an option to indicate how much padding is
> needed. But then, calling fdtput would be done in a post-image script.
>
> It is IMO even more important to do it this way since as of today, only
> one platform/board needs to adjust its bootargs this way. All other
> platforms have an ATAGs or DT compatible bootloader, where the bootargs
> customization is done via the bootloader, not via patching the DTB.

Ok, For sure it can be done, but I wanted to propose a generic way of
doing this.
Indeed, this is something other platforms could potentially use, even
if not the case today.

> Of course, let's see what others think.

Agree.
If it is decided to do this as post-image script, I will be happy to
implement it.

Regards,
Maxime
