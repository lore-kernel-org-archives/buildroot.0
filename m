From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 15 Mar 2012 19:57:28 +0100
Subject: [Buildroot] [PATCH 4/5] Microblaze: build kernel with device
 tree
In-Reply-To: <CAM+bi4s-yf0Jb1+c17Uee2iDkD995ZGMnNe3JfXxEb9fcMbiKQ@mail.gmail.com>
References: <4F5CD7C9.40505@relinux.de> <20120312231055.5ba3a3be@skate>
 <201203140025.24202.arnout@mind.be>
 <CAM+bi4s-yf0Jb1+c17Uee2iDkD995ZGMnNe3JfXxEb9fcMbiKQ@mail.gmail.com>
Message-ID: <4F623B98.1050701@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alvaro, hello all!


Am 14.03.2012 17:41, schrieb Alvaro Gamez:
> They way I'm using this now is, with the patches I sent to the list:
>
> 1.- Configure buildroot to make a .cpio filesystem
> 2.- Manually copy the DTS file under
> output/build/linux-3.2.6/arch/microblaze/boot/dts/lx9.dts
> 3.- Under kernel configuration, set CONFIG_BLK_DEV_INITRD=y and
> CONFIG_INITRAMFS_SOURCE=../../images/rootfs.cpio
> 4.- Under buildroot configuration, set
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=simpleImage.lx9
>
In fact my original patch builds a complete embedded Linux system
including the rootfs as initrd within the kernel image. No manual steps
are needed when the settings in the defconfig-file and the dts and
kernel defconfig from the boards directory are used.
> After this, I can make and I get a full working system under
> output/build/linux-3.2.6/arch/micr
> oblaze/boot/simpleImage.lx9
>
> My understanding of this is the following:
>
> Current patches allow filesystem development for microblaze, including
> kernel. The only thing it does not provide is the ability to generate
> a merged filesystem+kernel, ability which isn't available for any
> other arch. In my opinion, current patches could be applied for next
> release.
I think so, too.

Arnout wrote:
> - Stephan doesn't see how to do it, and
Regarding the Devicetree and simpleimage topics I do not have the time
to figure that out. At least, there are some comments on my original
implementation, too. I did not address these, because it works for me
and they will become obsolete when generic dts support becomes available.
> We can
> always add DTS support later and refactor the microblaze-specific stuff
> away.  In fact, this microblaze-specific stuff makes it easier to add
> generic DTS support, because you already get a defconfig that uses it
> and that you can use for testing.
I think that would be a goor solution!

Alvaro wrote:
>
> On the other hand, for addional steps are required to get to a simpleImage
>
> Step 1 is dependant on the desired image, (maybe you want a gzip'ed or
> bzip2'ed filesystem). This has implications on the kernel
> configuration, since it needs to be able to decompress a gzip image or
> a cpio filesystem (CONFIG_RD_GZIP, CONFIG_RD_BZIP2 and others). This
> can be solved with the appropiate buildroot defconfig that is
> consistent with the kernel defconfig.
>
> Step 2 requires a BR2_DTS_FILE config option. This may trigger a
> simple cp BR2_DTS_FILE
> $(kernel_dir)/arch/$(ARCH)/boot/dts/$(BR2_DTS_FILE). I think some of
> the patches recently sent already do this.
Yes, my old patch does and there was another patch doing this.

What I think is also important, but can be addressed seperatelly:

- Building the toolchain from Source
- Building the boot loader
- Accessing the Flash on the Microboard from Bootloader and Linux
>
> So, what should be the next step?
I can put the patches that I have (the one fixing the toolchain download
got lost somewhere) together, rebase them to the current HEAD and resend
them on the weekend. I already squashed the three patches concerning
toolchain download into one (but that removed Alvaro's entry as Author,
which I don't like) and renamed the board directory to lower case. I can
also add useful help texts for the architecture selection, but maybe
Alvaro wants to do this himself.

So I think we have 4 patches:

Alvaro: Microblaze: added architecture support for both big endian and
low endian
Alvaro: Microblaze: added external toolchain from Xilinx
Stephan: Microblaze: build kernel with device tree
Stephan: Microblaze: added defconfig for Avnet S6LX9 Microboard

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120315/6a82c841/attachment.html>
