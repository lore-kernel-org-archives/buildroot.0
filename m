From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 2 Apr 2018 15:28:08 +0000
Subject: [Buildroot] [PATCH v2] board: add support for ARC HS
 Development Kit (HSDK)
In-Reply-To: <c7e8fef5-cd6e-60b2-ab1c-00dc1eb931eb@mind.be>
References: <20171219145554.17718-1-didin@synopsys.com>
 <ccf192ef-8200-f5c8-1a88-9bd348c90207@smile.fr>
 <c7e8fef5-cd6e-60b2-ab1c-00dc1eb931eb@mind.be>
Message-ID: <1522682888.3989.34.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, 2018-03-31 at 15:25 +0200, Arnout Vandecappelle wrote:
>  I have a few more comments... Sorry it took so long to get any review at all,
> but we have a really long patch backlog...
> 
> On 31-03-18 14:56, Romain Naour wrote:
> > Hi Evgeniy,
> > 
> > Le 19/12/2017 ? 15:55, Evgeniy Didin a ?crit :
> > > Synopsys DesignWare HSDK (which stands for ARC HS
> > > Development Kit) is the latest and greatest development
> > > platform that sports quad-core ARC HS38 in real silicon.
> > > 
> > > Most noticeable features of the board are:
> > >  * Quad-core ARC HS38 CPU running at 1GHz
> > >  * 4Gb of DDR
> > >  * Built-in Vivante GPU (well supported via open source
> > >    Etnaviv drivers)
> > >  * Built-in Wi-Fi/Bluetooth module (RedPine RS-9113)
> > > 
> > > And as usual we have:
> > >  * [micro] SD-card slot
> > >  * 2 USB 2.0 ports
> > >  * 1Gbit Ethernet port
> > >  * Built-in Digilent JTAG probe
> > >  * Serial port accessible via micro-USB port
> > > 
> > > Writing sdcard.img on SDcard creates two partitions:
> > >  * FAT32 with uImage and uboot.env
> > >  * EXT4 with root filesystem
> > > 
> > > We modify kernel config because in default hsdk kernel config
> > > CONFIG_INITRAMFS_SOURCE parameter is set and when we build
> > > rootfs separately (BR2_TARGET_ROOTFS_INITRAMFS is not set)
> > > error appears. Also we set up CONFIG_ARC_UBOOT_SUPPORT which
> > > enables usage of uboot variables in the boot process.
> 
>  And why is this needed?

We use core registers to pass 2 important pieces of information from
U-boot to the Linux kernel.

1. R0 - There's a payload passed to the kernel
      =1 - bootargs are passed
      =2 - .dtb is passed

2. R2 - Address where mentioned above payload is stored

And if we use U-Boot there should be no problem because
R0 is guaranteed to be set to either 1 or 2 which we then check in the kernel
and R2 containing an address is checked for having sane address.

But if u-Boot is not used:
 - Linux kernel is loaded via JTAG
 - Linux kernel is loaded by some other pre-bootloader
those regs might contain bogus values causing us unpredictable
issues.

> > > 
> > > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > > Cc: arc-buildroot at synopsys.com
> > > ---
> > > Changes since v1:
> > > -add entries in DEVELOPERS and .gitlab-ci.yml
> > > -change genimage-hsdk.cfg to genimage.cfg
> > > -enable BR2_TARGET_UBOOT_ENVIMAGE against mkenvimage in post-image.sh
> > > -add renaming "uboot-env.bin" to "uboot.env" in post-image.sh
> > > -changed tar to gzip when archiving sdcard.img
> > >  .gitlab-ci.yml                     |  1 +
> > >  DEVELOPERS                         |  1 +
> > >  board/synopsys/hsdk/genimage.cfg   | 26 +++++++++++++++++++++++++
> > >  board/synopsys/hsdk/linux.fragment |  2 ++
> > >  board/synopsys/hsdk/post-image.sh  | 18 ++++++++++++++++++
> > >  board/synopsys/hsdk/uboot.env.txt  |  9 +++++++++
> 
>  Please also add a readme.txt, cfr. vdk.

readme.txt is understood but what are "cfr. vdk."?

> > >  
> > >  N:	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> > >  F:	package/axfsutils/
> > > diff --git a/board/synopsys/hsdk/genimage.cfg b/board/synopsys/hsdk/genimage.cfg
> > > new file mode 100644
> > > index 0000000000..8928f704a2
> > > --- /dev/null
> > > +++ b/board/synopsys/hsdk/genimage.cfg
> > > @@ -0,0 +1,26 @@
> > > +image boot.vfat {
> > > +  vfat {
> > > +    files = {
> > > +      "uboot.env",
> > > +      "uImage"
> > > +    }
> > > +  }
> > > +  size = 100M
> 
>  Does it really need to be that large? Making this partition large means that
> also the sdcard.img will be large, which means it takes longer to dd it to an
> actual SD card.

Well 100 Mb is not that much and with write speed ~20Mb/sec it's still tolerable.
But in the same time it leaves as an ability to put more things to that partition.
Like other uImages etc. Indeed if that was a production image we'd only expect fixed
and predefined stuff to be put there and say 10Mb would be just ok. But that vanilla
Buildroot config is just a good starting point for people to play with the board.

The only downside here is larger sdcard.img which if not compressed is not that
convenient for sharing thus we wanted to compress it.

> > > +}
> > > +
> > > +image sdcard.img {
> > > +  hdimage {
> > > +  }
> > > +
> > > +  partition boot {
> > > +    partition-type = 0xC
> > > +    bootable = "true"
> > > +    image = "boot.vfat"
> > > +  }
> > > +
> > > +  partition rootfs {
> > > +    partition-type = 0x83
> > > +    image = "rootfs.ext4"
> > > +    size = 1G
> 
>  I would remove the size = 1G as well. genimage will infer the partition size
> from the size of rootfs.ext4, which is fine. Putting an explicit size here which
> is different from BR2_TARGET_ROOTFS_EXT2_SIZE is pointless I think. Yes, you can
> use resize2fs to use the full partition size - but then you probably want to
> also repartition and use the full SD card size.
> 
>  I understand that all the other genimage.cfg files we have in Buildroot do
> specify a size (though normally only 512M), but I think we should change that.

Agree, that sounds good.

>  Can you try leaving it out and see if that works for you?

It works as expected!

-Alexey
