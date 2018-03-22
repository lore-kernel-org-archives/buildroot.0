From: Martin Bark <martin@barkynet.com>
Date: Thu, 22 Mar 2018 19:45:08 +0000
Subject: [Buildroot] [PATCH v3 0/7] Add rpi3 b+ support
In-Reply-To: <43BEBD2B-1C51-4098-BF4C-CD9D70067729@jens-maus.de>
References: <20180316180232.18829-1-martin@barkynet.com>
 <20180316204132.30aadcfc@windsurf>
 <CAFGQKxcg_O2Kr-VmUhgiDW9Q_4nZY8ZsMZhLCEcpTg7SZ+un_g@mail.gmail.com>
 <20180316232824.7a41721f@windsurf> <20180319181430.4c264d3d@gmx.net>
 <CAFGQKxeynSw4=0TkE_qkXX0+=R63BU9gAY0+DNS39K4KiDnP-Q@mail.gmail.com>
 <43BEBD2B-1C51-4098-BF4C-CD9D70067729@jens-maus.de>
Message-ID: <CAFGQKxcaVi70jAyPEUCFUU3SYyD-SmQ_ybqadpoHkVOKZWRTrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jens,

On 20 March 2018 at 12:52, Jens Maus <mail@jens-maus.de> wrote:
> FYI: In one of my buildroot-based projects I am actually using the pi3-miniart-bt + core_freq setting at the same time to free the standard UART for a GPIO HAT that requires the UART. See here:
>
> https://github.com/jens-maus/RaspberryMatic/blob/master/buildroot-external/board/raspberrypi3/config.txt#L27-L30

Yes exactly, you need the core_freq=250 for pi3-miniart-bt to work but
buildroot does not set this.  Using pi3-miniart-bt to free up ttyAMA0
for other uses, as you do, is a good reason to use it.

Given enable_uart=1 sets core_freq=250 (see [1]) and using
pi3-miniart-bt also needs core_freq=250, i can't see the point it
using pi3-miniart-bt to just enable serial logins.

Thanks

Martin

[1] https://www.raspberrypi.org/documentation/configuration/uart.md

>
> Best Regards,
>
> Jens
>
>> Am 19.03.2018 um 19:18 schrieb Martin Bark <martin@barkynet.com>:
>>
>> Hi,
>>
>> On 19 March 2018 at 17:14, Peter Seiderer <ps.report@gmx.net> wrote:
>>> Hello Martin,
>>>
>>> On Fri, 16 Mar 2018 23:35:48 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>>
>>>> Hello,
>>>>
>>>> On Fri, 16 Mar 2018 21:06:52 +0000, Martin Bark wrote:
>>>>
>>>>> The only reason for this seems to be the use of the pi3-miniuart-bt
>>>>> overlay.  Personally i never use this overlay, I set enable_uart=1 in
>>>>> config.txt (the same as raspi-config does).  Is there a reason
>>>>> buildroot favours the pi3-miniuart-bt overlay?
>>>>
>>>> I am not familiar with those configuration details of the RPi platform,
>>>> but I remember they have been discussed in the past. Perhaps you can
>>>> check the commit log for some details about them.
>>>>
>>>> Especially this commit log:
>>>>
>>>> commit 1e03cc2290f98fc7434254d2abd9afd504de8360
>>>> Author: Peter Seiderer <ps.report@gmx.net>
>>>> Date:   Mon May 2 22:25:44 2016 +0200
>>>>
>>>>    raspberrypi3: fix serial console (load pi3-miniuart-bt overlay)
>>>>
>>>>    - enable BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS in raspberrypi3_defconfig
>>>>    - add copy of rpi-firmware/overlays directory to boot partition in genimage-raspberrypi3.cfg
>>>>    - enhance post-image.sh script to add 'dtoverlay=pi3-miniuart-bt' on request
>>>>    - add BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay" in raspberrypi3_defconfig
>>>>
>>>>    Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>>>    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>>>
>>>
>>> And the full discussion about the different solutions, see [1]...
>>>
>>> I am still in prefer the overlay solutions ;-)
>>>
>>> Regards,
>>> Peter
>>>
>>>
>>> [1] https://patchwork.ozlabs.org/patch/617683/
>>
>> Ok i remember this conversation now.
>>
>> As a matter of interest has anyone actually tried using bluetooth with
>> the pi3-miniuart-bt overlay?  I have not.  According to [1]
>> pi3-miniuart-bt overlay requires core_freq=250 to work (which makes
>> sense) and buildroot does not set this.  I'm not sure the current way
>> pi3-miniuart-bt overlay is setup even works.
>>
>> Thanks
>>
>> Martin
>>
>> [1] https://github.com/raspberrypi/linux/blob/rpi-4.14.y/arch/arm/boot/dts/overlays/README
>>
>>>> Best regards,
>>>>
>>>> Thomas
>>>
>
> --
> Jens Maus, Dresden/Germany
> http://jens-maus.de/
>
> *** Content is authentic only with digital signature  ***
>
