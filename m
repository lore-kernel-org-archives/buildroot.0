From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 14 Mar 2012 17:41:10 +0100
Subject: [Buildroot] [PATCH 4/5] Microblaze: build kernel with device
	tree
In-Reply-To: <201203140025.24202.arnout@mind.be>
References: <4F5CD7C9.40505@relinux.de> <20120312231055.5ba3a3be@skate>
 <201203140025.24202.arnout@mind.be>
Message-ID: <CAM+bi4s-yf0Jb1+c17Uee2iDkD995ZGMnNe3JfXxEb9fcMbiKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They way I'm using this now is, with the patches I sent to the list:

1.- Configure buildroot to make a .cpio filesystem
2.- Manually copy the DTS file under
output/build/linux-3.2.6/arch/microblaze/boot/dts/lx9.dts
3.- Under kernel configuration, set CONFIG_BLK_DEV_INITRD=y and
CONFIG_INITRAMFS_SOURCE=../../images/rootfs.cpio
4.- Under buildroot configuration, set
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=simpleImage.lx9

After this, I can make and I get a full working system under
output/build/linux-3.2.6/arch/micr
oblaze/boot/simpleImage.lx9

My understanding of this is the following:

Current patches allow filesystem development for microblaze, including
kernel. The only thing it does not provide is the ability to generate a
merged filesystem+kernel, ability which isn't available for any other arch.
In my opinion, current patches could be applied for next release.

On the other hand, for addional steps are required to get to a simpleImage

Step 1 is dependant on the desired image, (maybe you want a gzip'ed or
bzip2'ed filesystem). This has implications on the kernel configuration,
since it needs to be able to decompress a gzip image or a cpio filesystem
(CONFIG_RD_GZIP, CONFIG_RD_BZIP2 and others). This can be solved with the
appropiate buildroot defconfig that is consistent with the kernel defconfig.

Step 2 requires a BR2_DTS_FILE config option. This may trigger a simple cp
BR2_DTS_FILE $(kernel_dir)/arch/$(ARCH)/boot/dts/$(BR2_DTS_FILE). I think
some of the patches recently sent already do this.

Step 3 can also be taken care of the same way as Step 1.

Step 4 could also be taken care by the defconfig.


Maybe this is the easiest way to implement DTS support into buildroot, but
depends heavily on existing defconfigs.

So, what should be the next step?

Regards,


2012/3/14 Arnout Vandecappelle <arnout@mind.be>

>  Since nobody seems to be stepping up to add generic DTS support, that
> means microblaze is blocked.  That, I think, is stupid.  If we have
> working patches for microblaze now, why not accept them?  We can
> always add DTS support later and refactor the microblaze-specific stuff
> away.  In fact, this microblaze-specific stuff makes it easier to add
> generic DTS support, because you already get a defconfig that uses it
> and that you can use for testing.
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120314/e8a0cbfc/attachment.html>
