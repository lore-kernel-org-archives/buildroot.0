From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Thu, 19 Mar 2015 16:37:35 +0100
Subject: [Buildroot] [PATCH] configs: add defconfig for Freescale i.MX31
 PDK
In-Reply-To: <550A0AF9.5050101@mind.be>
References: <1426585422-22441-1-git-send-email-vincent.stehle@freescale.com>
 <550A0AF9.5050101@mind.be>
Message-ID: <550AED3F.4070606@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/2015 12:32 AM, Arnout Vandecappelle wrote:
..
>  Doesn't the upstream MACH_MX31_3DS work? 2.6.28 is extremely old...

Hi Arnout,

Thank you for reviewing this patch so quickly and sending
feedbacks.

This defconfig is indeed based on an old 2.6.28 kernel; the idea
was to base the defconfig on the last Freescale "official"
release, which works fine for me.

You are right that mainline kernel has support for the i.MX31
processor, but there is no dts in there for the i.MX31 PDK right
now. The few tries I just did do not boot "as is" but I will
continue a bit.
  Do you insist that this i.MX31 config uses mainline, or would
it be acceptable to stay on the "old", Freescale "official"
kernel?

..
>> +BR2_KERNEL_HEADERS_3_2=y
>  That doesn't sound like a good idea when the kernel is 2.6.28...

Granted, this is not optimal. Those are the kernel headers
closest to 2.6.28, "easily" available in buildroot.

It is indeed possible to manually specify the 2.6.28 kernel
headers version, but this necessitates two patches to fix the
linux-headers "build".
  Do you prefer this solution?

..
>> +BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
>> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  Why not uClibc and why C++?

Those are "leftovers", sorry. Thanks for spotting those mistakes.
I will remove that.

..
>> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y
>  With a more recent kernel we don't need this crappy option...

This is correct: this is necessary only with the "official"
release kernel.

..
>> +# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
>  Why?

Also "leftovers", sorry. Thanks for spotting, I will remove as
well.

..
>  If network boot is really the only option, then perhaps it would be nicer to
> use an initramfs linked into the kernel? Or doesn't the board have enough memory
> to support that?

This is my only boot method for the moment.
  Do you insist that the defconfig should use MMC?
  I will continue to try a bit to generate a suitable MMC with
buildroot anyway. Maybe that can be changed in the defconfig later
on?

On the other hand, if we stay with network booting, initramfs is
a nice idea as it makes the setup simpler indeed. Also, the
i.MX31 PDK has 128 MB of memory, so this is a practical solution.
  I just tested and an initramfs included in the zImage works
fine. Only, Freescale "official" kernel has no support for
initrd/initramfs, so we need another patch.
  Would you prefer this solution?

I will send a v2 patch right away, with a few reworks discussed
here, and still based on the "old" Freescale "official" release.
Please let me know if this is going in the right direction (or
not ;)

Thanks again for reviewing!

Best regards,

V.
