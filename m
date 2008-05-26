From: Wayne Keenan <wayne.keenan@gmail.com>
Date: Mon, 26 May 2008 17:07:19 +0100
Subject: [Buildroot] Anyone try simulating their Buildroot-created
	filesystem image in QEMU?
In-Reply-To: <483AC264.6080500@tirsdagsklubben.nu>
References: <326f33790805231205j302081b1oec193841dac80e0c@mail.gmail.com>
	<483AC264.6080500@tirsdagsklubben.nu>
Message-ID: <270858e90805260907qe8164c2i47a230009c949191@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

How about using the qemu-img  conversion utility to convert from ext[2|3]
(or other) to qcow (qemu) format ?


Regards
Wayne


On Mon, May 26, 2008 at 3:00 PM, Knut-H?vard Aksnes <kna@tirsdagsklubben.nu>
wrote:

> Arun Reddy wrote:
>
>> While this might fall more under a QEMU related problem, I thought it
>> might be helpful to ask it here since other Buildroot members may have
>> encountered the same problem I'm having.
>>
>> I have successfully built my filesystem image for a versatile (pb)
>> baseboard. I have included all the appropriate hardware and drivers for this
>> board in my kernel configuration as listed here:
>>
>> http://fabrice.bellard.free.fr/qemu/qemu-doc.html#SEC63
>>
>> I am trying to now boot it in QEMU, and used the following syntax:
>>
>> qemu-system-arm -M versatilepb -m 128 -kernel
>> arm-linux-2.6.24.4-20080523.gz -hda rootfs.arm.ext2 -nographic -append
>> "root=/dev/hda1 console=ttyAMA0"
>>
>> The kernel image uncompresses fine, but I am getting a kernel panic saying
>> that it is unable to mount the root fs on unknown block. I was wondering if
>> the problem is coming from the fact that rootfs.arm.ext2 is not a harddisk
>> image, and cannot be used with the -hda option? Or does it have to do with
>> the device I passed into root=? I know for certain that hda1 is what I wish
>> to use so the kernel will know what to use as the root filesystem... in this
>> case the local harddisk.
>>
>>  I suspect that the problem is that roofs.arm.ext2 is an ext2fs partition
> image not a disk image.
> The way I solve this problem is to build the rootfs to cpio or tar.
>
>  1. Format and partition a flash card using parted.
>  2. Run mkfs on the partition on the flash card.
>  3. Dump the rootfs on the newly created partition.
>  4. Install kernel and bootloader.
>  5. Umount the new filesystem.
>  6. Run qemu with -hda /dev/sdb or similar not /dev/sdb1 (you will
>     probably have to be root to do this)
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080526/90a3ebd7/attachment-0001.htm 
