From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Tue, 26 Apr 2011 22:38:49 +0700
Subject: [Buildroot] Buildroot 2011.02 images won't load on Qemu with
	qemu_arm_versatile_defconfig
In-Reply-To: <BANLkTinw6H=Z01BRih6rDR3-LbOcSk37uw@mail.gmail.com>
References: <BANLkTi=r-0A6Fy8FNMq+Y398sjOd6_cbPA@mail.gmail.com>
	<87ipu15or2.fsf@macbook.be.48ers.dk>
	<BANLkTinw6H=Z01BRih6rDR3-LbOcSk37uw@mail.gmail.com>
Message-ID: <BANLkTik8RGjbPK7v9VDb+v4N0cgtBMLSFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 26, 2011 at 9:55 PM, Dwi Sasongko Supriyadi
<ruckuus@gmail.com>wrote:

>
>
> On Tue, Apr 26, 2011 at 4:46 PM, Peter Korsgaard <jacmet@uclibc.org>wrote:
>
>> >>>>> "Dwi" == Dwi Sasongko Supriyadi <ruckuus@gmail.com> writes:
>>
>>  Dwi> Hello All,
>>  Dwi> I found issue when trying to load buildroot images on Qemu.
>> Following is my
>>  Dwi> configuration:
>>
>>  Dwi> 1. Buildroot configured with make qemu_arm_versatile_defconfig
>>  Dwi> 2. Using uClibc toolchain
>>  Dwi> 3. rootfs.cpio, initramfs of linux kernel
>>
>>  Dwi> Basically, I just did: make qemu_arm_versatile_defconfig; make then
>> use the
>>  Dwi> resulting images available under output/images
>>
>>  Dwi> I run qemu with following command:
>>
>>  Dwi> qemu-system-arm -M versatilepb -m 128M -kernel output/images/zImage
>> -initrd
>>  Dwi> output/images/rootfs.cpio.gz -append "root=/dev/ram rdinit=/bin/sh"
>>
>>  Dwi> Qemu launched but there is nothing shown.
>>
>> Odd, I've using the versatile config pretty often here.
>
>
> I also use versatile_defconfig for kernel then using the zImage with Qemu,
> and never try zImage result from buildroot. I also worked with older
> version, i.e. 2.6.27
>
>
>> I do configure
>> it slightly differently, as I normally don't care about graphics output
>> - So I use the serial output:
>>
>> qemu-system-arm -M versatilepb -kernel output/images/zImage -append
>>   'console=ttyAMA0,115200 root=/dev/sda' -nographic -net nic -net user
>>   -hda output/images/rootfs.ext2
>>
>> I've tweaked the versatile config a bit in git since the 2011.02
>> release though (enabled getty on serial port).
>>
>
> Perhaps you could give the default versatile config in git a try before
>> changing to initramfs?
>>
>>
> I tried to use versatile config from git, but there is still the same
> result. Qemu stopped after compressing Linux.
>
> Please correct me if I am wrong, is following the versatile
> config difference between 2011.02 and buildroot from git correct?
>
> diff -Nru configs/qemu_arm_versatile_defconfig
> ../buildroot/configs/qemu_arm_versatile_defconfig
> --- configs/qemu_arm_versatile_defconfig 2011-04-26 19:16:59.215058879
> +0700
> +++ ../buildroot/configs/qemu_arm_versatile_defconfig 2011-04-26
> 19:34:21.614809336 +0700
> @@ -2,6 +2,10 @@
>  BR2_arm=y
>  BR2_arm926t=y
>
> +# system
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +
>  # filesystem
>  BR2_TARGET_ROOTFS_EXT2=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> @@ -9,7 +13,7 @@
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.36"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.3"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-2.6.36.config"
>
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-2.6.38.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
>
> I also saw there are minor difference between both boards config and I did
> try 2.6.38.config in 2.6.36 kernel but I found the same result.
>
> I am a little bit puzzled but also surprised knowing that only older kernel
> version can be used ... should this be known as Qemu issue?
>
> Using 2.6.27.58 with CS toolchain or BR toolchain the image result can be
> used flawlessly, but not with 2.6.36/37/38. I am worried also with the fact
> that my qemu gets segfault when missing -m parameter. I am running Ubuntu
> Lucid with Qemu version 0.12.3. Could you please confirm your Qemu version?
>
>
Confirmed, the root cause seems in Qemu. I downloaded and compiled Qemu
version 0.14.0 and use it as follow:

../qemu-0.14.0/arm-softmmu/qemu-system-arm -M versatilepb -m 128M -kernel
output/images/zImage -initrd output/images/rootfs.cpio.gz -append
"root=/dev/ram rdinit=/sbin/init" -nographic

I can log in to buildroot system.

Thanks for your help.

Best regards,
DWI

-- 
Good software can't be measured by `wc -l software.c`
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110426/d7ec9f4a/attachment-0001.html>
