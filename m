From: Jens Maus <mail@jens-maus.de>
Date: Fri, 16 Mar 2018 10:32:08 +0100
Subject: [Buildroot] [PATCH 4/4] package/rpi-firmware: improve
 installation of dtb files
In-Reply-To: <CAFGQKxcvdNOy8Fxku3kwhJjMz+T5dnqz3oY3gYEB7er7t8Gc1A@mail.gmail.com>
References: <1521120291-15781-1-git-send-email-martin@barkynet.com>
 <1521120291-15781-4-git-send-email-martin@barkynet.com>
 <20180315204022.58ee68fc@gmx.net>
 <CAFGQKxfa0L=bTWtPQV9HNFOP6Wox3BTX-p_gyp+aF0PQoPK5-Q@mail.gmail.com>
 <20180315215947.GA26659@scaer>
 <CAFGQKxcvdNOy8Fxku3kwhJjMz+T5dnqz3oY3gYEB7er7t8Gc1A@mail.gmail.com>
Message-ID: <D04562A3-E6F9-44CB-862F-AD1B3D6D9941@jens-maus.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BTW: As you seem to push updates regarding Pi3+ I have some more patches at hand for you :)

https://github.com/jens-maus/RaspberryMatic/blob/master/buildroot-patches/0003-rpi-wifi-firmware.patch
https://github.com/jens-maus/RaspberryMatic/blob/master/buildroot-patches/0004-wiringpi.patch

The first is to actually get WiFi working again because the NVRAM settings file is different for the new WiFi chip of the Pi3+. The second updates the wiringpi package to the latest master version which fixes compatibility to the Pi3+.

Sorry that I am not able to submit these patches myself via patchwork to buildroot, but my time is unfortunately limited these days. However, feel free to submit these patches yourself.

Regards,
Jens

> Am 15.03.2018 um 23:40 schrieb Martin Bark <martin@barkynet.com>:
> 
> Yann,
> 
> On 15 March 2018 at 21:59, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Martin, All,
>> 
>> On 2018-03-15 19:58 +0000, Martin Bark spake thusly:
>>> On 15 March 2018 at 19:40, Peter Seiderer <ps.report@gmx.net> wrote:
>>>> On Thu, 15 Mar 2018 13:24:51 +0000, Martin Bark <martin@barkynet.com> wrote:
>>>>> Don't list specific dtb files, instead install all dtb files in the same
>>>>> way as dtbo files are currently done.
>>>>> 
>>>>> Signed-off-by: Martin Bark <martin@barkynet.com>
>>>>> ---
>>>>> package/rpi-firmware/rpi-firmware.mk | 7 +++----
>>>>> 1 file changed, 3 insertions(+), 4 deletions(-)
>>>>> 
>>>>> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
>>>>> index 1ebdd96..9cc3d4a 100644
>>>>> --- a/package/rpi-firmware/rpi-firmware.mk
>>>>> +++ b/package/rpi-firmware/rpi-firmware.mk
>>>>> @@ -12,10 +12,9 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
>>>>> 
>>>>> ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
>>>>> define RPI_FIRMWARE_INSTALL_DTB
>>>>> -     $(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
>>>>> -     $(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
>>>>> -     $(INSTALL) -D -m 0644 $(@D)/boot/bcm2709-rpi-2-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2709-rpi-2-b.dtb
>>>>> -     $(INSTALL) -D -m 0644 $(@D)/boot/bcm2710-rpi-3-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2710-rpi-3-b.dtb
>>>>> +     for dtb in  $(@D)/boot/*.dtb; do \
>>>>> +             $(INSTALL) -D -m 0644 $${dtb} $(BINARIES_DIR)/rpi-firmware/$${dtb##*/} || exit 1; \
>>>>> +     done
>>>> 
>>>> Which will install three additional dtb files (bcm2708-rpi-0-w.dtb,
>>>> bcm2708-rpi-cm.dtb and bcm2710-rpi-cm3.dtb), not a downside of the
>>>> patch, but worth mentioning....
>>> 
>>> Yes, it will also install the new bcm2710-rpi-3-b-plus.dtb. This code
>>> does not seem to have been kept updated, it's missing several dtb
>>> files as you mention.  I think it's better to just install all dtb
>>> files as we do for the dtbo files.
>> 
>> I wonder if we should not just drop BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
>> now the rpi dtbs are now supposed to be in the kernel snce at least 3.19.
> 
> Yes it would be good to remove this.  It would also be good to remove
> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS and have them built as
> part of the kernel.  Really only the booloader and /op/vc code is
> needed from rpi-firmware.
> 
> Thanks
> 
> Martin
> 
>> 
>> Besids, all our rpi defconfig are using the DT from the kernel, which is
>> another good indication that we don't need those from rpi-firmware
>> anymore...
>> 
>> If it is not yet in the kernel, it is just a matter of time before it is
>> available there...
>> 
>> Regards,
>> Yann E. MORIN.
>> 
>> --
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Jens Maus, Dresden/Germany
http://jens-maus.de/

*** Content is authentic only with digital signature  ***

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 3745 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180316/8fb58798/attachment.p7s>
