From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Apr 2016 00:13:07 +0200
Subject: [Buildroot] [PATCH v4 7/7] beaglebone: adds barebox bootloader
	defconfig
In-Reply-To: <20160419202649.GA20663@smipidev>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-8-git-send-email-pieter@boesman.nl>
 <5702FACA.6080001@mind.be> <20160419202649.GA20663@smipidev>
Message-ID: <5716AD73.30309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/19/16 22:26, Pieter Smith wrote:
> On Tue, Apr 05, 2016 at 01:37:46AM +0200, Arnout Vandecappelle wrote:
>> On 03/20/16 23:35, Pieter Smith wrote:
>>> * Builds the barebox MLO and bootloader.
>>> * Generates a barebox environment that boots from eMMC by default.
>>> * Barebox integrates a perfectly good device-tree for the bbb, so no dtb is
>>>    being generated with the kernel.
>>>
>>> Signed-off-by: Pieter Smith <pieter@boesman.nl>
>>> ---
>>>   board/beaglebone/barebox.env/boot/sd      |  6 +++++
>>>   board/beaglebone/barebox.env/config-board |  4 +++
>>>   configs/beaglebone_barebox_defconfig      | 41 +++++++++++++++++++++++++++++++
>>>   3 files changed, 51 insertions(+)
>>>   create mode 100644 board/beaglebone/barebox.env/boot/sd
>>>   create mode 100644 board/beaglebone/barebox.env/config-board
>>>   create mode 100644 configs/beaglebone_barebox_defconfig
>>>
>>> diff --git a/board/beaglebone/barebox.env/boot/sd b/board/beaglebone/barebox.env/boot/sd
>>> new file mode 100644
>>> index 0000000..7a80e29
>>> --- /dev/null
>>> +++ b/board/beaglebone/barebox.env/boot/sd
>>> @@ -0,0 +1,6 @@
>>> +#!/bin/sh
>>
>>   Is that needed/useful?
>
> If you are referring to the interpreter specification: I suspect no, but all
> barebox scripts in barebox specify the interpreter, so I would like not to
> stray from the convention.

  That's what I meant. So ok.

>
> If you are referring to the presence of the sd script: Yes. The device name
> needs to be changed from the default to work with the Beaglebone.
>
>>> +
>>> +global.bootm.image=/boot/zImage
>>> +#global.bootm.oftree=/boot/oftree
>>
>>   Maybe repeat here the comment about using the built-in DT.
>
> ACK. Will be in v5 of the patch-set. I will not be removing the commented lines
> though. The convention is to leave these in so that the user can tune them if
> he wants something different.

  ok.

>
>>> +#global.bootm.initrd=<path to initrd>
>>
>>   I would remove this line, it's not very useful.
>
> These are kept in the scripts for a reason. These scripts are left as
> placeholders for easy tuning by the user. I also decided to retain this because
> it is present in the defaults included with barebox. If you feel strongly about
> this, I can remove it, but I would prefer to keep it in.

  ok.

>
> [snip]
>
>>> +# system
>>> +BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
>>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
>>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
>>
>>   Does the default (console) not work well?
>
> I inherited this from the beaglebone_defconfig. I know that the beaglebone uses
> a different serial port for the console than the Phytec am33xx modules (the
> default for the BSP), so I am quite sure this is necessary.

  The serial port is already set in the barebox config, and is already passed on 
the kernel command line, so there shouldn't be a need to set it explicitly again 
in the buildroot config. The default getty port is 'console', which means to use 
the kernel console as getty port. In most cases that's what you want.

  The beaglebone defconfig still had an explicit getty port because it is still 
from the time that the default getty port was tty1.

  So, ideally, please test that it still works without this line. But since you 
don't have a working beaglebone at the moment that will be tough...

[snip]
>>> +# Use the barebox built-in dtb
>>> +# BR2_LINUX_KERNEL_DTS_SUPPORT is not set
>>
>>   Good to put this here!
>
> As per your recommendation on v4 of the patch-set.

  I'm so great :-)

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
