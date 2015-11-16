From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Mon, 16 Nov 2015 17:29:51 +0000
Subject: [Buildroot] [PATCH v7] board: add support for Intel Galileo Gen
 2
In-Reply-To: <56314C13.5030302@mind.be>
References: <1445359684.18938.6.camel@intel.com> <56314C13.5030302@mind.be>
Message-ID: <1447694994.6537.51.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > diff --git a/board/intel/galileo/genimage.cfg b/board/intel/galileo/genimage.cfg
> > new file mode 100644
> > index 0000000..b1db6f7
> > --- /dev/null
> > +++ b/board/intel/galileo/genimage.cfg
> > @@ -0,0 +1,15 @@
> > +image sdcard.img {
> > +	hdimage {
> > +	}
> > +
> > +	partition boot {
> > +		partition-type = 0xC
> > +		image = "efi-part.vfat"
> 
>  Doesn't genimage allow to specify this in a single file?

Hi Arnout, 

Needed to do a bit of investigation to refresh my memory here - on why I
implemented this way. To understand what genimage does requires a bit of
understanding of what tools it is using under the hood. Typically using
hdimage and vfat are mutually exclusive.

 * hdimage - typically I use hdimage where I have 1 or more partitions I
want to aggregate into a single image ... so I want pull the ext3/ext4
image created by buildroot as a partition. 
 * vfat - typically I use vfat where I want to use an overlay fs, i.e. a
sdcard that has been formatted as vfat with a EFI, Kernel, Ext3 overlay
image and perhaps also an initramfs. 

So you are usually doing one or the other. The constraint with Galileo
Gen 2 is that it's UEFI BIOS can only read VFAT or EFI partitions when
looking for bootloader EFI binaries like grub-efi or gummiboot. So this
leaves me with a couple of options:-

 * I can use hdimage - I can create the VFAT/EFI partition myself
calling mtools, and then use hdimage above to aggregate this partition
into an image along with the rootfs image produced by buildroot
 * I can use vfat with the overlay fs approach, however this typically
comes with a boottime performance penalty.

So my approach is as follows ...

 * Use genimage vfat instead to create my first 'image' as vfat, under
the hood genimage uses dd + mkfs.vfat to create the image and then uses
mtools (mmd + mcopy) to copy in the EFI binaries.
 * I then use hdimage to pull in the vfat image above as an EFI parition
and the ext3 image created by buildroot as the rootfs partition. 

For me this was simplest approach to layout the sdcard image as the
Galileo requires, much simpler than rewriting lots of mtools logic that
already exists in genimage. Make sense ?

Ray K
