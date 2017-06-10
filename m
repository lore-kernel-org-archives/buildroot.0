From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Jun 2017 12:40:47 +0200
Subject: [Buildroot] [PATCH 3/3] package/rpi-firmware: updated to 4.9.31
 firmware (ca9116f)
In-Reply-To: <8F29C33F-DF80-4401-B36B-23E12D859201@free.fr>
References: <20170610070050.20782-1-mail@jens-maus.de>
 <8E8EFCD7-3A29-410A-A992-9D62BE9C604F@free.fr>
 <7729E3FB-13CA-4123-B840-4EAF2AB64673@jens-maus.de>
 <8F29C33F-DF80-4401-B36B-23E12D859201@free.fr>
Message-ID: <d06f4897-e954-5473-5137-236cfa5f80d3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-06-17 11:45, Yann E. MORIN wrote:
> On June 10, 2017 10:37:55 AM GMT+02:00, Jens Maus <mail@jens-maus.de> wrote:
>> Hi,
>>
>>> Am 10.06.2017 um 09:26 schrieb Yann E. MORIN
>> <yann.morin.1998@free.fr>:
>>>
>>>> On June 10, 2017 9:00:50 AM GMT+02:00, Jens Maus <mail@jens-maus.de>
>> wrote:
>>>> This commit updates the rpi-firmware package to the latest 4.9.31
>>>> compatible commit (ca9116ffd0cea06fdeb876ac7d19790bf2631d8c) and
>>>> uses a for() to install DTS files in case
>>>> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
>>>> is used.
>>>
>>> Please separate the patch in two:
>>>  - one to bump version
>>>  - one to change install code (but see below)
>>
>> Will do so, thanks for your comments.
>>
>>>> Signed-off-by: Jens Maus <mail@jens-maus.de>
>>> [snip]
>>>> diff --git a/package/rpi-firmware/rpi-firmware.mk
>>>> b/package/rpi-firmware/rpi-firmware.mk
>>>> index 134fcebb5..4c3d37375 100644
>>>> --- a/package/rpi-firmware/rpi-firmware.mk
>>>> +++ b/package/rpi-firmware/rpi-firmware.mk
>>> [snip]
>>>> @@ -12,10 +12,9 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
>>>>
>>>> ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
>>>> define RPI_FIRMWARE_INSTALL_DTB
>>>> -    $(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb
>>>> $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
>>>> -    $(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb
>>>> $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
>>>> -    $(INSTALL) -D -m 0644 $(@D)/boot/bcm2709-rpi-2-b.dtb
>>>> $(BINARIES_DIR)/rpi-firmware/bcm2709-rpi-2-b.dtb
>>>> -    $(INSTALL) -D -m 0644 $(@D)/boot/bcm2710-rpi-3-b.dtb
>>>> $(BINARIES_DIR)/rpi-firmware/bcm2710-rpi-3-b.dtb
>>>> +    for dtb in $(@D)/boot/*.dtb; do \
>>>> +        $(INSTALL) -D -m 0644 $${dtb}
>>>> $(BINARIES_DIR)/rpi-firmware/$${dtb##*/} || exit 1; \
>>>> +    done
>>>
>>> What is the reason you are doing so?
>>
>> Because latest rpi-firmware contains dtb files for pi zero w and
>> compute modules which the non-for statements didn't catch.
> 
> Then say so in the commit log.
> 
> Also, I would prefer you just add them to the existing list.
> It is better to be explicit rather than having a catch-all
> command.

 But then, a loop that iterates over a list of variables is still nicer than
repeating the command 7 times.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
