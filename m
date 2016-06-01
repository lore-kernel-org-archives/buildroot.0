From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed, 1 Jun 2016 13:03:17 +0200
Subject: [Buildroot] [PATCH] odroid_xu4: new board
In-Reply-To: <20160531223059.34d2c127@free-electrons.com>
References: <1446836886-27256-1-git-send-email-viktorin@rehivetech.com>
 <20160531223059.34d2c127@free-electrons.com>
Message-ID: <20160601130317.5150dfe4@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 May 2016 22:30:59 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> Sorry for the late review. 

Half a year, cool :). Never mind, I am pretty sure there are many other
things to do around Buildroot...

> It generally looks good, but I still have a
> number of comments which should be addressed in order for the patch to
> be applied.
> 
> On Fri,  6 Nov 2015 20:08:06 +0100, Jan Viktorin wrote:
> > This patch provides support for the board Odroid XU4:
> > 
> >   http://odroid.com/dokuwiki/doku.php?id=en:odroid-xu4
> > 
> > The support utilizes the Linux Kernel 4.2 experimental from:
> > 
> >   https://github.com/tobetter/linux  odroidxu4-v4.2  
> 
> There is a v4.6 branch now, perhaps using it would be good (but it's
> definitely not mandatory).

Do you mean https://github.com/ioft/linux.git? It doesn't boot for me. I spent
about 2 days just on this (about 2 weeks ago). No idea why...

The v4.2 works, just the CPU cores are shuffled (cpu0 is LITTLE, cpu1-4 are BIG,
and cpu5-7 are again LITTLE).

If there is somebody with a successful setup of v4.6, I'd be happy to see what
I did wrong.

> 
> > 
> >   (currently: 5eb40d45b291ee129cbfac2073f1ca7aa32ff4c5)
> > 
> > and a customized linux defconfig which disables various (mostly)
> > useless drivers to minimalize the Buildroot initial system. It
> > compiles the r8152 driver into the kernel to have a working
> > Ethernet out-of-the-box.  
> 
> Please use odroidxu4_defconfig from the upstream tree. It is not
> necessary to have a strictly minimal kernel configuration, we very much
> prefer using an upstream defconfig.

Ok, I just didn't like the default configuration due to its size...

> 
> > diff --git a/board/hardkernel/linux-odroidxu4-v4.2.config b/board/hardkernel/linux-odroidxu4-v4.2.config  
> 
> Please use a subdirectory for the board:
> 
> 	board/<vendor>/<board>/
> 
> So in your case:
> 
> 	board/hardkernel/odroid-xu4/

Will fix.

> 
> 
> > diff --git a/board/hardkernel/readme.txt b/board/hardkernel/readme.txt
> > new file mode 100644
> > index 0000000..d7a77db
> > --- /dev/null
> > +++ b/board/hardkernel/readme.txt
> > @@ -0,0 +1,49 @@
> > +Odroid XU4
> > +==========
> > +
> > +http://www.hardkernel.com/main/products/prdt_info.php?g_code=G143452239825

This duplication is probably a mistake...

> > +http://www.hardkernel.com/main/products/prdt_info.php?g_code=G143452239825
> > +
> > +The Buildroot odroid_xu4_defconfig configuration builds:
> > +
> > +  u-boot.bin -> u-boot.bin.hardkernel
> > +  zImage
> > +  exynos5422-odroidxu4.dtb
> > +  rootfs.ext3
> > +
> > +and prepares:
> > +
> > +  bl1.bin.hardkernel
> > +  bl2.bin.hardkernel
> > +  tzsw.bin.hardkernel
> > +  sd_fusing.sh
> > +  boot.ini
> > +
> > +As the board requires signed 1st bootloader, it is necessary to use
> > +the provided BLOBs.
> > +
> > +
> > +Installation:
> > +
> > + - suppose ${SD} points to eg. /dev/sdc (your SD card)
> > +
> > + 1) make odroid_xu4_defconfig
> > + 2) make
> > + 3) cd output/images
> > + 4) create 2 partitions (fdisk, cfdisk, ...):
> > +    FAT (~128 MB), ext3 (rest).
> > +
> > + 5) sudo ./sd_fusing ${SD}
> > +    Installs the bootloaders, trust zone and the built U-Boot.
> > +
> > + 6) sudo dd if=rootfs.ext3 of=${SD}2
> > +    Write to eg. /dev/sdc2.
> > +
> > + 7) sudo mount ${SD}1 /mnt
> > +    Mount the FAT partition (eg. /dev/sdc1).
> > +
> > + 8) sudo cp -v zImage boot.ini exynos5422-odroidxu4.dtb /mnt
> > + 9) sudo umount ${SD}1  
> 
> Please use the genimage mechanism to directly generate a bootable SD
> card. Look at the other boards supported in Buildroot, many of them are
> using genimage.

Ok, sorry, I have no clue how genimage works and what does it do...
I'll try to rework this.

> 
> > diff --git a/configs/odroid_xu4_defconfig b/configs/odroid_xu4_defconfig
> > new file mode 100644
> > index 0000000..3790db7
> > --- /dev/null
> > +++ b/configs/odroid_xu4_defconfig
> > @@ -0,0 +1,27 @@
> > +BR2_arm=y
> > +BR2_cortex_a15=y
> > +BR2_ARM_FPU_NEON=y  
> 
> Using NEON as the FPU is really not recommended. Please use the VFP
> unit for floating point by default.

OK.

> 
> > +BR2_KERNEL_HEADERS_4_2=y  
> 
> This needs to be changed to:
> 
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y

OK.

> 
> > +BR2_TARGET_GENERIC_HOSTNAME="odroid-xu4"
> > +BR2_TARGET_GENERIC_ISSUE="Welcome to Odroid XU4!"
> > +BR2_TARGET_GENERIC_GETTY_PORT="ttySAC2"
> > +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y  
> 
> Aren't the default setting (use the kernel console) working for yuo?

I am not sure, I will try it.

> 
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroid-post.sh"  
> 
> We usually call it post-image.sh.

OK.

> 
> > +BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_TARGET_UBOOT_VERSION)"
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/tobetter/linux"
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="odroidxu4-v4.2"
> > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/hardkernel/linux-odroidxu4-v4.2.config"
> > +BR2_LINUX_KERNEL_ZIMAGE=y
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5422-odroidxu4"
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_3=y
> > +# BR2_TARGET_ROOTFS_TAR is not set
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BOARDNAME="odroid"
> > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
> > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="odroidxu3-v2012.07"  
> 
> Thanks!
> 
> Thomas

Regards
Jan


-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech
   Brno, Czech Republic
