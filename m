From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Thu, 17 Sep 2015 10:03:37 +0200
Subject: [Buildroot] =?utf-8?q?problem_booting_from_ext2_=C2=B5sd_card?=
In-Reply-To: <CA+BsyQ6yskQ6TFpZQCTMWtZka+TBNaNj2XzgWhu7RqskLN0HhA@mail.gmail.com>
References: <55FA01A4.5070107@proximus.be>
 <CA+BsyQ6yskQ6TFpZQCTMWtZka+TBNaNj2XzgWhu7RqskLN0HhA@mail.gmail.com>
Message-ID: <55FA73D9.6080800@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Brendan,  see below.

Brendan Heading schreef op 17/09/2015 om 2:27:
> On 17 September 2015 at 00:56, Johan Sagaert <sagaert.johan@proximus.be> wrote:
>> Hi
>> just extracted my rootfs to a ?sd card
>> configured u-boot to boot from it
>>
>> Any idea ? i have a single ext2 partition on a 4GB transcend class 10 card.
>> not sure where to start searching...
>> Tried several cards with equal results.
>> used cfdisk as tool.
> It looks a bit like your ext2 partition has been set up to be much
> larger than 4GB.
>
>> mmc0: new high speed SDHC card at address 59b4
>> mmcblk0: mmc0:59b4 USD   3.74 GiB
>>   mmcblk0: p1
> As you already highlighted - 4GB SD card.
>
>> attempt to access beyond end of device
>> mmcblk0p1: rw=0, want=11524007040, limit=7857074
> So with a block size of 512 bytes, 7857074 blocks = 3.83GB (give or
> take) which matches up with your SD card.
>
> However something is trying to access block 11524007040. that ain't right.
>
> I suspect that somehow, the ext2 filesystem on the card has been
> corrupted, or has been created incorrectly, or incorrectly copied to
> the card. How did you format it ?
I used an usb (?) sd card reader connected to my linux host.(debian 6)

Then used cfdisk to create a single partition type 83 and maximum size 
as suggested by cfdisk.

#! /bin/sh
IMAGES_DIR=/home/johan/srcmain
ROOTFS=$IMAGES_DIR/rootfs.tar
DRIVE=/dev/sdb
PART1=$DRIVE'1'

echo formatting $PART1
mkfs.ext2 $PART1 -L rootfs

echo Set check interval to NONE for $PART1
tune2fs -c 0 -i 0 $PART1

echo mount drive $PART1
mount -t ext2 $PART1 /mnt/usd -o noatime,nodiratime

echo extracting ...
tar -xvf $ROOTFS -C /mnt/usd

echo syncing ...
sync

echo unmount
umount $DRIVE?


The only thing i can think of is that my debian host is messing up the 
partition.
and also tried  cfdisk /z

Maybe i should bring up my board over nfs and do the partitioning from 
my board where it will
be used later.

Best Regards , Johan

> Brendan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
