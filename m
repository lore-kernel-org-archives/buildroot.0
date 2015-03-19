From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 22:26:46 +0100
Subject: [Buildroot] [PATCH] configs: add defconfig for Freescale i.MX31
	PDK
In-Reply-To: <550AED3F.4070606@freescale.com>
References: <1426585422-22441-1-git-send-email-vincent.stehle@freescale.com>
 <550A0AF9.5050101@mind.be> <550AED3F.4070606@freescale.com>
Message-ID: <550B3F16.60600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/15 16:37, Vincent Stehl? wrote:
> On 03/19/2015 12:32 AM, Arnout Vandecappelle wrote:
> ..
>>  Doesn't the upstream MACH_MX31_3DS work? 2.6.28 is extremely old...
> 
> Hi Arnout,
> 
> Thank you for reviewing this patch so quickly and sending
> feedbacks.
> 
> This defconfig is indeed based on an old 2.6.28 kernel; the idea
> was to base the defconfig on the last Freescale "official"
> release, which works fine for me.
> 
> You are right that mainline kernel has support for the i.MX31
> processor, but there is no dts in there for the i.MX31 PDK right
> now. The few tries I just did do not boot "as is" but I will
> continue a bit.

 It doesn't look like it's using DT, but there's a mach-mx31_3ds.c that uses the
old platform approach. Of course your bootloader has to set the correct machine
ID (1151) in that case.

>   Do you insist that this i.MX31 config uses mainline, or would
> it be acceptable to stay on the "old", Freescale "official"
> kernel?

 If there's no other way it's acceptable, but it's really not nice. And the
headers issue definitely has to be fixed.

>>> +BR2_KERNEL_HEADERS_3_2=y
>>  That doesn't sound like a good idea when the kernel is 2.6.28...
> 
> Granted, this is not optimal. Those are the kernel headers
> closest to 2.6.28, "easily" available in buildroot.
> 
> It is indeed possible to manually specify the 2.6.28 kernel
> headers version, but this necessitates two patches to fix the
> linux-headers "build".
>   Do you prefer this solution?

 Not really :-)

[snip]
>>  If network boot is really the only option, then perhaps it would be nicer to
>> use an initramfs linked into the kernel? Or doesn't the board have enough memory
>> to support that?
> 
> This is my only boot method for the moment.
>   Do you insist that the defconfig should use MMC?

 No, MMC is not that much better since not many PCs can access it anyway.

>   I will continue to try a bit to generate a suitable MMC with
> buildroot anyway. Maybe that can be changed in the defconfig later
> on?
> 
> On the other hand, if we stay with network booting, initramfs is
> a nice idea as it makes the setup simpler indeed. Also, the
> i.MX31 PDK has 128 MB of memory, so this is a practical solution.
>   I just tested and an initramfs included in the zImage works
> fine. Only, Freescale "official" kernel has no support for
> initrd/initramfs, so we need another patch.

 Er, you say that initramfs works but it isn't supported? WTF?


 Regards,
 Arnout


>   Would you prefer this solution?
> 
> I will send a v2 patch right away, with a few reworks discussed
> here, and still based on the "old" Freescale "official" release.
> Please let me know if this is going in the right direction (or
> not ;)
> 
> Thanks again for reviewing!
> 
> Best regards,
> 
> V.
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
