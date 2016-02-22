From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue, 23 Feb 2016 00:24:12 +0100
Subject: [Buildroot] [PATCH v2] configs/olimex_imx233_olinuxino: switch
	to u-boot
In-Reply-To: <20160222234908.5cd7b5a7@free-electrons.com>
References: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
 <1456122476-6210-1-git-send-email-phil@zankapfel.net>
 <20160222234908.5cd7b5a7@free-electrons.com>
Message-ID: <CAPiYbRJgxCXCNSasxzzzS86-u-+wqZ4UyBLzhpkcb_huWkwqeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 February 2016 at 23:49, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Phil Eichinger,
>
> On Mon, 22 Feb 2016 07:27:56 +0100, Phil Eichinger wrote:
>
>> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
>> Tested-by: Phil Eichinger <phil@zankapfel.net>
>
> Tested-by tags are meant to be given by other people, not the patch
> author, since we assume you have tested the patches you are
> submitting :-)

This should read Tested-on-actual-hardware-by ;-)


>> -BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
>> +BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
>> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x42000000"
>
> Any reason to use an appended uImage? If you're using a recent version
> of U-Boot, you should use bootz to boot a zImage, and boot with a DTB
> separate from the kernel.

The reason behind this is the u-boot defconfig boots an uImage by default.
So I thought this defconfig should provide the easiest starting point for anyone
trying to get an image up and running.

> Also:
>
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
>> +BR2_TARGET_UBOOT_FORMAT_SD=y
>
> Please used a fixed U-Boot version, otherwise your defconfig might
> break in the future when we bump the default U-Boot version. See other
> defconfig.

Ah, didn't think of that.

> Another thing is that you removed some comments from the defconfig,
> while some of them were really useful, such as the one that explains
> why BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y is enabled. We normally
> don't enable mdev support in our default defconfig, but this defconfig
> has a specific reason for doing so, so this comment should be kept.

Good point, I'll add them again.

> Finally, but this is a possible improvement for the future, you could
> probably replace the complicated sequence of commands to build the SD
> card by a nice post-image script that relies on genimage. But this is
> for another patch.

I was thinking of something like an post-image script but doesn't that
mean to settle on
something like the smallest SD card possible?
Or were you thinking more of an interactive post-image script?
Meanwhile I've tried a 4.4.1 kernel and it works, but I think I will
put the kernel
version bump into another patch.

> Could you send an updated version that takes into account the above
> suggestions?

Sure, tomorrow!
Thanks for your thorough review, again I've learned a lot!

Cheers, Phil
