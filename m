From: Andreas Ziegler <br015@umbiko.net>
Date: Tue, 30 Mar 2021 08:20:08 +0000
Subject: [Buildroot] Buildroot: enable lib/firmware/brcm for rpi0w
In-Reply-To: <20210329204937.01bb10a6@gmx.net>
References: <mailman.13.1616500803.19462.buildroot@busybox.net>
 <75b24e8f6fe588935be2f1320d172d68@umbiko.net>
 <20210324232703.46b691fe@gmx.net>
 <ed68882a97bad7976f53b30716196c96@umbiko.net>
 <20210325222017.39c79288@gmx.net>
 <0d1e250a62069d63923fccf305f9766d@umbiko.net>
 <20210329204937.01bb10a6@gmx.net>
Message-ID: <9ade3a3c03ddd5de4ee38b8bb05f79e1@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On 2021-03-29 18:49, Peter Seiderer wrote:
> Hello Andreas,
> 
> On Fri, 26 Mar 2021 12:47:21 +0000, Andreas Ziegler <br015@umbiko.net> 
> wrote:
> 
>> Hello Peter,
>> 
>> On 2021-03-25 21:20, Peter Seiderer wrote:
>> >
>> > Many thanks for doing the tests!
>> >
>> 
>> Not at all; after getting confused with different versions and
>> repositories, I wanted to understand the reason behind this.
>> 
>> Short summary of my findings; I may state the obvious here, but it was
>> new for me and maybe it helps someone with the same hazy knowledge 
>> about
>> hardware engineering as myself:
>> 
>> Broadcom sold its RF division to Cypress in 2016. Cypress now supports
>> the legacy wireless /bluetooth /radio hardware from Broadcom; that is
>> the reason why BCM* and CYW* versions of firmware exist, and
>> linux-firmware removed the original Broadcom supplied binaries.
>> 
>> Cypress does not directly sell to end customers, but provides silicon 
>> to
>> hardware partners (AzureWave, Murata, ...), which in turn sell RF
>> solutions. Cypress distributes firmware for their silicon chips
>> (probably to same hardware partners).
>> 
>> End product is some type of SOC (subsystem on chip); the benefit is 
>> that
>> tuning and regulatory issues have been taken care of. The SOC
>> manufacturer is responsible for supplying bluetooth patch (HCD),
>> regulatory data (CLM) and firmware configuration (TXT).
>> 
>> That means the firmware binary (BIN) can be obtained from any source,
>> the other items (HCD, CLM, TXT) need to be sourced from the 
>> implementer.
>> 
>> >> The LibreELEC repository (rpi-wifi-firmware) seems to have adopted
>> >> this
>> >> version in commit 7dbd877545ae15069f2bd0e73893af942500e23d on Jan. 25.
>> >
>> > So a good reason to stay with LibreELEC (and fix the firmware package
>> > to
>> > provide raspberrypi,4-model-b.txt as a link or copy, do you know if
>> > missing
>> > it has some disadvantages or produces only the firmware load warning or
>> > is
>> > there a fallback to plain brcmfmac43455-sdio.txt?), keeping up with
>> > RPi-Distro...
>> 
>> Yes, also my opinion to stay with LibreELEC. The repository is small, 
>> is
>> updated in a timely manner, and is (slightly) better documented than
>> RPi-Distro.
>> 
>> There is one thing (apart from providing the missing link) I would
>> propose: merge rpi-bt-firmware and rpi-wifi-firmware into
>> rpi-rf-firmware, combining the code from both .mk and Config.in files.
>> Functionality would be identical, but one less firmware package. If
>> anyone is interested, I could provide a patch.
> 
> +1 from my side...

I will propose something via the mailing list.


>> In recent kernels, firmware load tries board-specific path first, then
>> falls back to firmware derived path [1]. If I remember correctly, in
>> kernels < 5.0 the firmware load failed.
>> 
>> >> There seem to be some bigger changes in the pipeline: linux-firmware
>> >> removed the Broadcom redistributed binaries in January [4] for the
>> >> 20210208 release; instead Cypress firmware should be used. The
>> >> upstream
>> >> repository for this firmware seems to be murata-wireless /
>> >> cyw-fmac-fw [5]
>> >>
>> >> I need to look into this in detail at some other time ...
>> >
>> > Seems kind of (another) firmware mess...., different versions at
>> > different
>> > repositories...., all with the same name (instead of clear version
>> > string)...
>> 
>> There are at least three different versions available in Buildroot:
>> 
>> (available in Buildroot, repo 'master' version listed respectively)
>>    libreELEC		build 2021-01-04	version 7.45.229
>>    linux-firmware	build 2020-09-18	version 7.45.221
>>    murata-wireless	build 2020-09-18	version 7.45.221
>> (not in buildroot)
>>    rpi-distro		build 2021-01-04	version 7.45.229
>> 
>> > Regards,
>> > Peter
>> 
>> Kind regards,
>> Andreas
> 
> Thanks again for the detailed information (and testing)!
> 
> Did just sent out an patch adding the convenience firmware 
> configuration
> links for RPi3A+, RPi3B+ and RPi4B (see [2])...

Tested and works for me. Hardware used was RPi4B. I replied to your 
patch, adding two lines for additional boards using BCM43430 Hardware. 
One is in the Linux Firmware Repository (3B), the other is the one 
reported by Laurentiu Christian (0W). I hope this approach is 
acceptable.

> Regards,
> Peter
> 
> [2] 
> https://patchwork.ozlabs.org/project/buildroot/patch/20210329184503.10514-1-ps.report at gmx.net/
> 
>> 
>> [1]
>> https://elixir.bootlin.com/linux/v5.10.21/source/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c#L616
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot

Kind regards,
Andreas
