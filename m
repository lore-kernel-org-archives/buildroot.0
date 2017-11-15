From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Nov 2017 22:55:36 +0100
Subject: [Buildroot] [PATCH/next 1/5] armada-firmware: new package
In-Reply-To: <20171115211525.kthewizyrikb4wiz@speedy.hunter>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-2-geomatsi@gmail.com>
 <dbbc1ce7-1847-a08d-fca0-a667b555b71c@mind.be>
 <20171115211525.kthewizyrikb4wiz@speedy.hunter>
Message-ID: <e3badf0d-7c2f-b2fe-99fa-fbb7bc208530@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-11-17 22:15, Sergey Matyukevich wrote:
> Hi Arnout,
> 
> Thanks for the review !
> 
>>> This package adds SCP BL2 firmware for Marvell Armada 7040 and 8040 SoCs.
> 
> ...
> 
>>> diff --git a/boot/Config.in b/boot/Config.in
>>> index 2f46c8546e..0ffbd7288b 100644
>>> --- a/boot/Config.in
>>> +++ b/boot/Config.in
>>> @@ -17,5 +17,6 @@ source "boot/ts4800-mbrboot/Config.in"
>>>  source "boot/uboot/Config.in"
>>>  source "boot/vexpress-firmware/Config.in"
>>>  source "boot/xloader/Config.in"
>>> +source "boot/armada-firmware/Config.in"
>>
>>  Please keep things alphabetic. However, I don't think the boot loader menu is
>> appropriate. Yes, it's an image that is used by the bootloader, but really it is
>> a piece of firmware, not really related to booting the SoC.
> 
> Will fix the order. However it looks like boot menu is the right place for this
> package. This package is similar to versatile-firmware. It is SCP_BL2 image
> which is used by ATF to boot SCP coprocessor. A bit more details are available
> in ATF design document:
> https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/firmware-design.rst#scp-bl2-system-control-processor-firmware-image-load

 As I understand it, it should also be possible to load the SCP firmware after
boot. Maybe not on all platforms. But even if it weren't I wouldn't consider it
a bootloader. And the same goes for vexpress-firmware by the way.

 That said, it's not such a big deal for me.

[snip]
>>> +define ARMADA_FIRMWARE_INSTALL_IMAGES_CMDS
>>> +	$(INSTALL) -D -m 0644 $(@D)/mrvl_scp_bl2_7040.img $(BINARIES_DIR)/mrvl_scp_bl2_7040.img
>>> +	$(INSTALL) -D -m 0644 $(@D)/mrvl_scp_bl2_8040.img $(BINARIES_DIR)/mrvl_scp_bl2_8040.img
>>
>>  I don't think the name is really relevant, is it? So maybe you could always
>> copy it to the same file in BINARIES_DIR so on the ATF side you don't need to
>> access variables of this package.
> 
> This file depends on platform. Now we are adding MacchiatoBin, but another
> interesting networking board called EspressoBin from the same vendor is on the
> horizon. So it makes sense to keep things a little bit more flexible.
> 
> It looks like, together with review comments from Baruch, this brings us
> to the following implementation:
> - choice submenu for available platforms in armada-firmware config menu
>   ..
>   config BR2_TARGET_ARMADA_FIRMWARE_IMAGE
>     string
>     default "mrvl_scp_bl2_8040.img" if BR2_PACKAGE_ARMADA_8040
>     default "mrvl_scp_bl2_7040.img" if BR2_PACKAGE_ARMADA_7040
> 
> - copy only selected BR2_TARGET_ARMADA_FIRMWARE_IMAGE to BINARIES_DIR
> 
> - use the same BR2_TARGET_ARMADA_FIRMWARE_FIRMWARE variable in ATF package
>   to specify correct firmware

 My point was: you can copy the image to $(BINARIES_DIR)/scp-fw.bin, then in the
ATF package you don't need to specify the firmware name but just always use
scp-fw.bin. A further step would be to introduce an arm-scp-firmware (or
atf-scp-firmware) virtual package (implemented by vexpress-firmware and
armada-firmware). That way no change is needed in ATF to add an additional
firmware package, and it's possible to add new firmware in BR2_EXTERNAL.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
