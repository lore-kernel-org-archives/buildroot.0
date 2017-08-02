From: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@gmail.com>
Date: Wed, 2 Aug 2017 19:25:02 +0200
Subject: [Buildroot] genimage raw partition from multiple files
In-Reply-To: <cadb0fad-d46f-554c-05ee-ba70d0db7af1@gmail.com>
References: <cadb0fad-d46f-554c-05ee-ba70d0db7af1@gmail.com>
Message-ID: <67c75046-efbc-0881-e7c1-656b11168102@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

W dniu 02.08.2017 o 15:55, Micha? ?yszczek pisze:
> Hi,
> 
> I've been trying to figure out, how to create raw partition, without
> filesystem, from 2 or more files. Here is a general idea
> 
> 
> partition uboot {
>     partition-type = 0xa2
>     size = 1M
> 
>     image spl {
>         image = "u-boot-spl.bin.crc"
> 	size = 64k
>         offset = 0
>     }
> 
>     image uboot-real {
>         image = "u-boot.bin"
>         offset = 256k
>     }
> }
> 
> 
> Note that spl is 64k big, and uboot-real must be at offset 256k. Also
> this *MUST* be a partition of type 0xa2. Can such thing be done fully in
> genimage without post-install script?
> 

Ok, after messing with source code a little bit a found a way to do what
I want. Let's say want to create partition of type 0xA2 for uboot. That
partition should contain spl image and full uboot. First create image of
that partition - this image will be built from "subpartitions"


image uboot.img {
        hdimage {
                partition-table = "no"
        }

        partition spl {
                in-partition-table = "no"
                image = "u-boot-spl.bin.crc"
                offset = 0
                size = 64k
        }

        partition uboot-full {
                in-partition-table = "no"
                image = "u-boot.img"
                offset = 256k
        }

        size = 1M
}

2 things are very important here, first is "partition-table = "no"" in
hdimage, this will tell hdimage not add ANYTHING from itself, so no
partition table, no dos magic (55 aa), no mbr at all. All partitions
should also have "in-partition-table = "no"" to prevent any additional
bytes from genimage.

When image is created like that it can be normally added into partition
table


image sdcard.img {
        hdimage {
        }

        partition uboot-env {
                in-partition-table = "no"
                image = "uboot-env.bin"
                offset = 17408 # 512 * 34 -> just after gpt
        }

        partition uboot {
                partition-type = 0xa2
                image = "uboot.img"
        }

 	partition rootfs {
                partition-type = 0x83
                image = "rootfs.ext2"
                size = 500M
        }
}


And that's all, image will generate as expected. This may look like
hack, but it is quite clean solution I think. We can avoid any scripts
to create such partition for bootloader, and everything is in one place.

-- 
Best Regards
?yszczek Micha?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170802/7d79a146/attachment.asc>
