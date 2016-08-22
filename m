From: Jeroen Roovers <jer@airfi.aero>
Date: Mon, 22 Aug 2016 11:57:00 +0200
Subject: [Buildroot] [PATCH 1/1] added comments on how to install the
	system
In-Reply-To: <20160821124604.vtzsuyrz5tgnapve@tarshish>
References: <1471774436-18803-1-git-send-email-guillaume.bressaix@gmail.com>
 <20160821124604.vtzsuyrz5tgnapve@tarshish>
Message-ID: <CANCHnQrg6u4czJBeQub+qFTD5PwWxry-nxgGDDEM7SE-s9jLBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 August 2016 at 14:46, Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Guillaume W. Bres,
>
> On Sun, Aug 21, 2016 at 12:13:56PM +0200, Guillaume W. Bres wrote:
> > +The first partition, /dev/sdb1 in this example, should be a bootable FAT16 partition.
> > +The second partition, /dev/sdb2 in this example, should be an EXT4 partition.

See below.

>
> > +sudo cp output/images/{MLO,u-boot.img,zImage} /dev/sdb1
> > +sudo cp output/images/am335x-bone.dtb /dev/sdb1 -- for the beaglebone
> > +sudo cp output/images/am335x-boneblack.dtb /dev/sdb1 -- for the beaglebone black
>
> Have you tested these commands? They overwrite the raw /dev/sdb1 block device,
> instead of copying files into the FAT filesystem.

Indeed, that is not the way. It's more complicated than that. We would
need to create a separate FAT16 image besides the rootfs image,
loop-mount the former and then copy those files to the mounted image
file.

An additional useful step to describe would be to copy the rootfs to
the FAT16 image as well, which is needed if you want to forego the
second partition and use the rootfs as an initramfs.


>
> An easier approach might be to document the use of the generated sdcard.img
> file. sdcard.img support for BeagleBone is now in the buildroot master branch;
> soon to be 2016.08. See board/acmesystems/arietta-g25/readme.txt as an
> example.
>
> > +sudo dd if=output/images/rootfs.ext4 of=/dev/sdb2

But that wouldn't describe the required FAT16 image as intended.


Regards,
     jer
