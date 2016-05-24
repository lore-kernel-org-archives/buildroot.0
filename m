From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 24 May 2016 10:26:08 -0500
Subject: [Buildroot] Genimage last partition size issue
Message-ID: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noted in the partition options, size = 0 should cause the last
partition to take the rest of the space on the device.  However, when
I set size = 0 and then write the image to a SD card using "sudo dd
if=foo.img of=/dev/sdb", the rootfs partition only has 190M (the same
amount as when I don't use the size argument) when there is almost 4G
worth of space available.  I know the size argument works in general
as if I set the size to 3000M, the rootfs partition is 3000M after
writing it to the SD card.


Below is the config file for genimage that I am using.

> image boot.vfat {
>   vfat {
>     files = {
>       "MLO",
>       "u-boot.img"
>     }
>   }
>   size = 32M
> }
> image foo.img {
>   hdimage {
>   }
>   partition boot {
>     partition-type = 0xC
>     bootable = "true"
>     image = "boot.vfat"
>   }
>   partition rootfs {
>     partition-type = 0x83
>     image = "rootfs.ext4"
>     size = 0
>   }
> }




-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
