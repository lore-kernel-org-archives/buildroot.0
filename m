From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 14:06:24 +0200
Subject: [Buildroot] [PATCH V2 1/1] Arcturus uCLS1012A-SOM support
In-Reply-To: <20170607185010.4652-1-oleks@arcturusnetworks.com>
References: <20170607185010.4652-1-oleks@arcturusnetworks.com>
Message-ID: <20170608140624.74726acf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Jun 2017 14:50:10 -0400, Oleksandr Zhadan wrote:
> The uCLS1012A-SOM product family (ucls1012a) is an Arcturus Networks Inc.
> 64bit ARM Cortex-A53 class System on Module powered by a NXP QorIQ LS1012A
> Low Power Communication Processor.  This 314 pin MXM3.0/SMARC module card
> contains DDR3, QSPI NOR Flash, eMMC NAND Flash, optional Audio CODEC and is
> available with 1 or 2 Gig-Ethernet PHYs.
> 
> Signed-off-by: Oleksandr Zhadan<oleks@arcturusnetworks.com>
> Signed-off-by: Michael Durrant<mdurrant@arcturusnetworks.com>

Thanks for this contribution!

First of all, could you change the commit title to:

	configs/arcturus_ucls1012a: new defconfig

>  board/arcturus/aarch64-ucls1012a/post-image.sh     |  17 +++++
>  board/arcturus/aarch64-ucls1012a/readme.txt        |  79 ++++++++++++++++++++
>  .../aarch64-ucls1012a/rootfs/etc/init.d/S09modload |  14 ++++
>  .../rootfs/lib/firmware/Freescale-Binary-EULA      |  80 +++++++++++++++++++++
>  .../rootfs/lib/firmware/ppfe_class_ls1012a.elf     | Bin 0 -> 53016 bytes
>  .../rootfs/lib/firmware/ppfe_tmu_ls1012a.elf       | Bin 0 -> 11492 bytes

It's really not nice to bundle those files in Buildroot. Can we instead
have a package that downloads them? Where do they come from?

> diff --git a/board/arcturus/aarch64-ucls1012a/post-image.sh b/board/arcturus/aarch64-ucls1012a/post-image.sh
> new file mode 100755
> index 000000000..bc2d52505
> --- /dev/null
> +++ b/board/arcturus/aarch64-ucls1012a/post-image.sh
> @@ -0,0 +1,17 @@
> +#!/bin/sh
> +
> +echo ---------Making ITB partition image---------
> +
> +MKIMAGE=${HOST_DIR}/usr/bin/mkimage
> +MKIMAGE_IN=board/arcturus/aarch64-ucls1012a/ucls1012a.its
> +MKIMAGE_OUT=output/images/part0-000000.itb
> +
> +${MKIMAGE} -f $MKIMAGE_IN $MKIMAGE_OUT
> +
> +# Remove intermediate files
> +rm -f output/images/rootfs.cpio
> +rm -f output/images/rootfs.cpio.gz

Please don't remove intermediate files.

> +
> +echo Done

Not really useful.

> +
> +exit 0

Ditto.

> diff --git a/board/arcturus/aarch64-ucls1012a/readme.txt b/board/arcturus/aarch64-ucls1012a/readme.txt
> new file mode 100644
> index 000000000..cf9d592ef
> --- /dev/null
> +++ b/board/arcturus/aarch64-ucls1012a/readme.txt
> @@ -0,0 +1,79 @@
> +Arcturus uCLS1012A SoM
> +======================
> +
> +This file was located <buildrootdir>/board/arcturus/aarch64-ucls1012a/readme.txt

Not useful.

> +
> +This tutorial describes how to use the predefined Buildroot
> +configuration for the Arcturus uCLS101A SoM platform.
> +
> +Additional information about the uCLS1012A System on Module can be found at
> +https://www.arcturusnetworks.com/products/ucls1012a
> +and product support for registered users at
> +https://www.arcturusnetworks.com/support
> +
> +Building
> +--------

Add one blank line here.

> +Return to the top directory <buildrootdir> and execute the following commands.
> +
> +  make arcturus_ucls1012a_defconfig
> +  make
> +
> +nb: Any errors thrown by build root may be associated with missing host compilers
> +and build tools required by buildroot such as bison, awk, cmake, g++.

This last paragraph is not very useful, please drop.

> +Result of the build
> +-------------------
> +
> +After compilation and linking is complete, your image should be located 
> +<buildrootdir>/output/images/

There is no "linking" really in Buildroot context.

> +  cd output/images/
> +  ls
> +
> +  Image
> +  arc-ucls1012a.dtb
> +  part0-000000.itb
> +  rootfs.tar
> +  u-boot.bin

Perhaps use the output of:

	tree output/images

instead ?

> diff --git a/board/arcturus/aarch64-ucls1012a/rootfs/etc/init.d/S09modload b/board/arcturus/aarch64-ucls1012a/rootfs/etc/init.d/S09modload
> new file mode 100755
> index 000000000..07d1d855a
> --- /dev/null
> +++ b/board/arcturus/aarch64-ucls1012a/rootfs/etc/init.d/S09modload

Please name the rootfs overlay folder something like fs-overlay or
rootfs-overlay or rootfs_overlay. But not just "rootfs".

> +/dts-v1/;
> +
> +/ {
> +	description = "Image file for the Arcturus uCLS1012A Linux Kernel";
> +	#address-cells = <1>;
> +
> +	images {
> +		kernel {
> +			description = "Linux kernel";
> +			data = /incbin/("../../../output/images/Image");

So file paths are relative to where the .its file is located, and not
relative to where the mkimage command is executed ?

I'm not a big fan of these ../../../output/, because they won't work at
all for out of tree build.

> diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
> new file mode 100644
> index 000000000..b8b1c1fa8
> --- /dev/null
> +++ b/configs/arcturus_ucls1012a_defconfig
> @@ -0,0 +1,22 @@
> +BR2_aarch64=y
> +BR2_TOOLCHAIN_EXTERNAL=y

Please leave the default of a Buildroot toolchain, and force a kernel
headers version that matches your Linux kernel version.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
