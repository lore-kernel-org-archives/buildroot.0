From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Apr 2021 21:18:26 +0200
Subject: [Buildroot] Boot from CRAMFS partition on an emmc
In-Reply-To: <5b033e7b-0a24-9088-986b-7e8f05f66620@gmail.com>
References: <5b033e7b-0a24-9088-986b-7e8f05f66620@gmail.com>
Message-ID: <ac4368c1-7b8f-3861-9a1f-c9675c60359c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Marko,

On 29/04/2021 17:50, Marko Stanisic wrote:
> Hello everyone,
> 
> Have someone worked extensively with cramfs rootfs?

 Unlikely. AFAIK, cramfs is pretty much deprecated and replaced with squashfs.
Perhaps for extremely small filesystems (like, less than 100KB) cramfs would
perform better than squashfs, but even then I kind of doubt it. squashfs also
has much better compression options like zstd which is both faster and smaller
than gzip.


> I created an emmc.img file in buildroot 2020.11.1.
> 
> (several partitions with two same rootfs.cramfs partitions, but loading from one
> of them at a time)
> 
> 
> I have created two rootfs partitions in that image file , which are both defined as
> 
> a CRAM Filesystem. (have zImage and device tree inside a rootfs.cramfs in the
> folder /boot)
> 
> 
> My f*irst problem* is that i have no clue how to handle these two partition from
> U-boot (2016)
> 
> I have following commands:
> 
> ?? - cramfsls (should show directory from an image??) and
> 
> ?? - cramfsload?? (have to set environment variable cramfsaddr, from where the
> cramfs is loaded plus offset )

 U-Boot *used* to only support loading cramfs from MTD devices, so not from
eMMC. Perhaps there's a way to copy the partition into memory first and read it
from there, but don't hold your breath.

> *Second problem* is that with *mmc part*? the rootfs.cramfs partitions are not
> visible, but both defined as bootable.

 That's... weird. Is U-Boot built with support for whatever partition table
format is used in the image?

 Note that "bootable" is a DOSism that lost its meaning decades ago.


 Regards,
 Arnout


> But i know startadress and number of sectors from every partition
> 
> (got from fdisk -l on my host pc inspecting the emmc.img)
> 
> 
> Maybe i have some missunderstanding how to handle that, but have someone an idea
> here?
> 
> Thanks for every help i get!!
> 
> 
> PS: I dont want ramdisks as these are regularly used with cramfs
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
