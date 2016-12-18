From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Dec 2016 23:06:58 +0100
Subject: [Buildroot] [PATCH] BeagleBoard X15: new board
In-Reply-To: <20161218213526.16032-1-theo.debrouwere@skynet.be> (Theo
 Debrouwere's message of "Sun, 18 Dec 2016 22:35:26 +0100")
References: <20161215223730.4890-1-theo.debrouwere@skynet.be>
 <20161218213526.16032-1-theo.debrouwere@skynet.be>
Message-ID: <87eg14gad9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Theo" == Theo Debrouwere <theo.debrouwere@skynet.be> writes:

 > From: Theo Debrouwere <Theo.Debrouwere@gmail.com>
 > This configuration provides a basic setup for using Buildroot
 > to create a sd-card image a BeagleBoard X15 board.

 > Signed-off-by: Theo Debrouwere <Theo.Debrouwere@gmail.com>
 > ---
 >  board/beagleboardx15/genimage.cfg  | 26 ++++++++++++++++++++
 >  board/beagleboardx15/post-image.sh | 15 ++++++++++++
 >  board/beagleboardx15/readme.txt    | 49 ++++++++++++++++++++++++++++++++++++++
 >  configs/beagleboardx15_defconfig   | 23 ++++++++++++++++++
 >  4 files changed, 113 insertions(+)
 >  create mode 100644 board/beagleboardx15/genimage.cfg
 >  create mode 100755 board/beagleboardx15/post-image.sh
 >  create mode 100644 board/beagleboardx15/readme.txt
 >  create mode 100644 configs/beagleboardx15_defconfig

 > diff --git a/board/beagleboardx15/genimage.cfg b/board/beagleboardx15/genimage.cfg
 > new file mode 100644
 > index 0000000..5432026
 > --- /dev/null
 > +++ b/board/beagleboardx15/genimage.cfg
 > @@ -0,0 +1,26 @@
 > +image boot.vfat {
 > +	vfat {
 > +		files = {
 > +			"MLO",
 > +			"u-boot.img"

No dtbs? Does it get them from mmc0:2/boot?

> +		}
 > +	}
 > +	size = 4M
 > +}
 > +
 > +image sdcard.img {
 > +	hdimage {
 > +	}
 > +
 > +	partition u-boot {
 > +		partition-type = 0xC
 > +		bootable = "true"
 > +                image = "boot.vfat"
 > +	}
 > +
 > +	partition rootfs {
 > +		partition-type = 0x83
 > +		image = "rootfs.ext4"
 > +		size = 1G

All our other genimage.cfg files use 512M, so I've changed it to that as
well.

> diff --git a/configs/beagleboardx15_defconfig b/configs/beagleboardx15_defconfig
 > new file mode 100644
 > index 0000000..89f0081
 > --- /dev/null
 > +++ b/configs/beagleboardx15_defconfig
 > @@ -0,0 +1,23 @@
 > +BR2_arm=y
 > +BR2_cortex_a15=y
 > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboardx15/post-image.sh"
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am57xx-beagle-x15 am57xx-beagle-x15-revb1"
 > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
 > +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y
 > +BR2_TARGET_UBOOT=y

You forgot to lock the kernel and u-boot versions for reproducable
builds. I've changed it to explicitly select linux 4.9 and u-boot
2016.11 and committed, thanks!

-- 
Bye, Peter Korsgaard
