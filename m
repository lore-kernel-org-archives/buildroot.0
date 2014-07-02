From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 02 Jul 2014 08:09:25 +0200
Subject: [Buildroot] [PATCH] grub2: fix a few minor issues in help text
In-Reply-To: <1404236356-4595-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404236356-4595-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <10481671.PAqJ3h0H0Y@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 01 July 2014 19:39:16 Thomas Petazzoni wrote:
> The help text of grub2 explains the detailed steps to create a disk
> image with grub2 installed on it. However, the steps for the
> BIOS-based systems have a few minor issues fixed by this patch:
> 
>  - When calling partx to get the partitions detected, we should do it
>    on the /dev/loop0 block device, and not on the underlying disk.img
>    image file.
>  - The grub-bios-setup utility must be called as root to work properly
>    on /dev/loop0.
>  - The steps to cleanup the partx and loop device were missing.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  boot/grub2/Config.in | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
> index b37e024..c6c47b7 100644
> --- a/boot/grub2/Config.in
> +++ b/boot/grub2/Config.in
> @@ -24,17 +24,20 @@ config BR2_TARGET_GRUB2
>  		store Grub2. Leaving 1 MB of free space is safe.
>  	  3. Setup loop device and loop partitions
>  	     sudo losetup -f disk.img
> -	     sudo partx -a disk.img
> +	     sudo partx -a /dev/loop0
>  	  4. Prepare the root partition
>  	     sudo mkfs.ext3 -L root /dev/loop0p1
>  	     sudo mount /dev/loop0p1 /mnt
>  	     sudo tar -C /mnt -xf output/images/rootfs.tar
>  	     sudo umount /mnt
>  	  5. Install Grub2
> -	     ./output/host/usr/sbin/grub-bios-setup \
> +	     sudo ./output/host/usr/sbin/grub-bios-setup \
>  			-b ./output/host/usr/lib/grub/i386-pc/boot.img \
>  			-c ./output/images/grub.img -d . /dev/loop0
> -	  6. Your disk.img is ready!
> +	  6. Cleanup loop device
> +	     sudo partx -d /dev/loop0
> +	     sudo losetup -d /dev/loop0
> +	  7. Your disk.img is ready!
> 
>  	  To test your BIOS image in Qemu:
Just a remark for people who dislike to call sudo in their build 
scripts:

genimage can be used to create disk image. Installing grub using 
genimage is the tricky part. It can be done using :

        partition boot {
                in-partition-table = "no"
                image = "path_to_boot.img"
                offset = 0
                size = 512
        }
        partition grub {
                 in-partition-table = "no"
                 image = "path_to_grub.img"
                 offset = 512
        }

The result is not byte to byte identical to result using 
grub-bios-setup (why?) but it seems it does not matter.



-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
