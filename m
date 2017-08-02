From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:55:18 +0200
Subject: [Buildroot] genimage raw partition from multiple files
In-Reply-To: <67c75046-efbc-0881-e7c1-656b11168102@gmail.com>
References: <cadb0fad-d46f-554c-05ee-ba70d0db7af1@gmail.com>
 <67c75046-efbc-0881-e7c1-656b11168102@gmail.com>
Message-ID: <20170802195518.2f279e2b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Aug 2017 19:25:02 +0200, Micha? ?yszczek wrote:

> > Note that spl is 64k big, and uboot-real must be at offset 256k. Also
> > this *MUST* be a partition of type 0xa2. Can such thing be done fully in
> > genimage without post-install script?
> >   
> 
> Ok, after messing with source code a little bit a found a way to do what
> I want. Let's say want to create partition of type 0xA2 for uboot. That
> partition should contain spl image and full uboot. First create image of
> that partition - this image will be built from "subpartitions"
> 
> 
> image uboot.img {
>         hdimage {
>                 partition-table = "no"
>         }
> 
>         partition spl {
>                 in-partition-table = "no"
>                 image = "u-boot-spl.bin.crc"
>                 offset = 0
>                 size = 64k
>         }
> 
>         partition uboot-full {
>                 in-partition-table = "no"
>                 image = "u-boot.img"
>                 offset = 256k
>         }
> 
>         size = 1M
> }
> 
> 2 things are very important here, first is "partition-table = "no"" in
> hdimage, this will tell hdimage not add ANYTHING from itself, so no
> partition table, no dos magic (55 aa), no mbr at all. All partitions
> should also have "in-partition-table = "no"" to prevent any additional
> bytes from genimage.
> 
> When image is created like that it can be normally added into partition
> table
> 
> 
> image sdcard.img {
>         hdimage {
>         }
> 
>         partition uboot-env {
>                 in-partition-table = "no"
>                 image = "uboot-env.bin"
>                 offset = 17408 # 512 * 34 -> just after gpt
>         }
> 
>         partition uboot {
>                 partition-type = 0xa2
>                 image = "uboot.img"
>         }
> 
>  	partition rootfs {
>                 partition-type = 0x83
>                 image = "rootfs.ext2"
>                 size = 500M
>         }
> }
> 
> 
> And that's all, image will generate as expected. This may look like
> hack, but it is quite clean solution I think. We can avoid any scripts
> to create such partition for bootloader, and everything is in one place.

And those two snippets of genimage configuration can be in a single
genimage.cfg, and both uboot.img and then sdcard.img will be produced
by a single genimage invocation ? Or do we need a first genimage
invocation to generate uboot.img, and then a second genimage invocation
to generate sdcard.img (which requires uboot.img) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
