From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 18:16:33 +1300
Subject: [Buildroot] [PATCH v3 3/3] board/altera: update README for new
 scripts and fixed some typos
In-Reply-To: <1484925159-25292-4-git-send-email-lucas.bajolet@savoirfairelinux.com>
References: <1484925159-25292-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
 <1484925159-25292-4-git-send-email-lucas.bajolet@savoirfairelinux.com>
Message-ID: <20170124181633.653f3617@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Jan 2017 10:12:39 -0500, Lucas Bajolet wrote:

>      output/images/
>      ??? rootfs.ext2
> -    ??? rootfs.ext3 -> rootfs.ext2

As explained in my review on PATCH 1/3, ext3 should probably be kept in
the defconfig, and therefore this should be kept.

>  Prepare your SDcard
>  ===================
> @@ -111,22 +97,26 @@ let's assume it is /dev/mmcblk0:
>  Delete all previous partitions with 'd' then create the new partition table,
>  using these options, pressing enter after each one:
>  
> -  * n p 1 9000000 +20480K t 1 b
> -  * n p 2 4096 +4496384K t 83
> -  * n p 3 2048 +1024K t 3 a2
> +  * n p 1 1 4095
> +  * n p 2 4096 +22000
> +  * n p 3  <Enter> -- This will take the remaining space from the SD card
> +
> +Then, still in fdisk, change the type of the partitions according to this
> +  * t 1 a2
> +  * t 2 b

Remove all this stuff that explains how to prepare the SD card. If we
have a genimage script that creates a ready to use SD card image, then
there is no need to re-explain all of this in the readme.txt file.

> +(ALT) Install the binaries to SDcard from genimage
> +--------------------------------------------
> +
> +`genimage` will generate a `sockit_image.img` image in the output folder.
> +From that point, you will need to execute the following command:
> +
> +   $ sudo dd if=sockit_image.img of=/dev/mmcblk0

Please name the image sdcard.img, and use the following instruction:

	sudo dd if=output/images/sdcard.img of=/dev/mmcblk0

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
