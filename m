From: Andrea Simeoni <andreasimeoni73@gmail.com>
Date: Thu, 6 Feb 2020 18:22:06 +0100
Subject: [Buildroot] How to create a vfat "data" partition
Message-ID: <CAPmASetNL5QjGn3-ZqvcAMT_s2k8ZuMhufBYy8ei5eF5a6shKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I read the genimage manual (i.e. https://github.com/pengutronix/genimage)
but I still not sure the exact syntax to create a vfat partitio, with
mountpoint /opt where I can put files using the Buildroot overlay
directory.

I tried this:

image boot.vfat {
>   vfat {
>     files = {
>       "bcm2710-rpi-3-b.dtb",
>       "bcm2710-rpi-3-b-plus.dtb",
>       "bcm2710-rpi-cm3.dtb",
>       "rpi-firmware/bootcode.bin",
>       "rpi-firmware/cmdline.txt",
>       "rpi-firmware/config.txt",
>       "rpi-firmware/fixup.dat",
>       "rpi-firmware/start.elf",
>       "rpi-firmware/overlays",
>       "zImage"
>     }
>   }
>   size = 32M
> }
>
> image sdcard.img {
>   hdimage {
>   }
>
>   partition boot {
>     partition-type = 0xC
>     bootable = "true"
>     image = "boot.vfat"
>   }
>
>   partition rootfs {
>     partition-type = 0x83
>     image = "rootfs.ext4"
>   }
>
>   partition data {
>     partition-type = 0xC
>     image = "data.vfat"
>     size = 200M
>     mountpoint = "/opt"
>   }
> }
>

But it seems the Buildroot implementation of genimage does not allow the
mountpoint option.
Removing that option this is the error:

>>>   Executing post-image script board/raspberrypi3/post-image.sh
> INFO: cmd: "mkdir -p "/mnt/dev/buildroot/output/build/genimage.tmp""
> (stderr):
> INFO: cmd: "rm -rf "/mnt/dev/buildroot/output/build/genimage.tmp"/*"
> (stderr):
> INFO: cmd: "mkdir -p "/mnt/dev/buildroot/output/build/genimage.tmp""
> (stderr):
> INFO: cmd: "cp -a "/tmp/tmp.yAAi28XBRS"
> "/mnt/dev/buildroot/output/build/genimage.tmp/root"" (stderr):
> INFO: cmd: "find '/mnt/dev/buildroot/output/build/genimage.tmp/root'
> -depth -type d -printf '%P\0' | xargs -0 -I {} touch -r
> '/tmp/tmp.yAAi28XBRS/{}'
> '/mnt/dev/buildroot/output/build/genimage.tmp/root/{}'" (stderr):
> ERROR: file(data.vfat): stat(/mnt/dev/buildroot/output/images/data.vfat)
> failed: No such file or directory
> ERROR: hdimage(sdcard.img): could not setup data.vfat
>

It seems it wants an image for data.
How should i create it? I didn't find anything in the Buildroot manual.

Thanks in advance
Andrea S.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200206/5c38fbd6/attachment.html>
