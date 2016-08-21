From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 21 Aug 2016 15:46:05 +0300
Subject: [Buildroot] [PATCH 1/1] added comments on how to install the
 system
In-Reply-To: <1471774436-18803-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1471774436-18803-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20160821124604.vtzsuyrz5tgnapve@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume W. Bres,

On Sun, Aug 21, 2016 at 12:13:56PM +0200, Guillaume W. Bres wrote:
> The sudo dd part was not that trivial to me, as I was expecting
> the usual ramdisk image or a rootfs.tar file. I think
> board/readme.txt should mention it.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  board/beaglebone/readme.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/board/beaglebone/readme.txt b/board/beaglebone/readme.txt
> index 43ebe53..7d73e93 100644
> --- a/board/beaglebone/readme.txt
> +++ b/board/beaglebone/readme.txt
> @@ -32,3 +32,14 @@ After building, you should get a tree like this:
>    ??? u-boot.img
>    ??? uEnv.txt
>    ??? zImage
> +
> +Prepare SD card
> +===============
> +
> +The first partition, /dev/sdb1 in this example, should be a bootable FAT16 partition.
> +The second partition, /dev/sdb2 in this example, should be an EXT4 partition.
> +
> +sudo cp output/images/{MLO,u-boot.img,zImage} /dev/sdb1
> +sudo cp output/images/am335x-bone.dtb /dev/sdb1 -- for the beaglebone
> +sudo cp output/images/am335x-boneblack.dtb /dev/sdb1 -- for the beaglebone black

Have you tested these commands? They overwrite the raw /dev/sdb1 block device, 
instead of copying files into the FAT filesystem.

An easier approach might be to document the use of the generated sdcard.img 
file. sdcard.img support for BeagleBone is now in the buildroot master branch; 
soon to be 2016.08. See board/acmesystems/arietta-g25/readme.txt as an 
example.

> +sudo dd if=output/images/rootfs.ext4 of=/dev/sdb2

The readme.txt file does not mention rootfs.ext4, even though 
beaglebone_defconfig contains BR2_TARGET_ROOTFS_EXT2_4=y. This is unrelated to 
this patch, but worth fixing anyway.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
