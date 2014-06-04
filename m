From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jun 2014 23:46:06 +0200
Subject: [Buildroot] [PATCH v2] Add support for Congatec QMX6
In-Reply-To: <1401780083-25730-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Tue, 3 Jun 2014 09:21:23 +0200")
References: <1401780083-25730-1-git-send-email-sho@relinux.de>
Message-ID: <87r434nyap.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 > Add support for the iMX6 based conga-QMX6 family of Qseven modules.
 > This patch is based on Linux 3.0.35 from Congatec's kernel reporitory

 > Signed-off-by: Stephan Hoffmann <sho@relinux.de>
 > ---
 > There has been a similar patch set from
 > Lahoudere Fabien <fabien.lahoudere@openwide.fr> last year adding a patch
 > to the freescale kernel repository, but it seems more logical to me to
 > start from the board manufacturer's repo (which might not have been
 > availeable at that time).

 > Changes v1 -> v2
 >   - fix whitespace errors

 >  board/congatec/qmx6/6q_bootscript.txt |  5 +++++
 >  board/congatec/qmx6/post-build.sh     |  7 +++++++
 >  board/congatec/qmx6/readme.txt        | 31 +++++++++++++++++++++++++++++++
 >  configs/qmx6_defconfig                | 13 +++++++++++++
 >  4 files changed, 56 insertions(+)
 >  create mode 100644 board/congatec/qmx6/6q_bootscript.txt
 >  create mode 100755 board/congatec/qmx6/post-build.sh
 >  create mode 100644 board/congatec/qmx6/readme.txt
 >  create mode 100644 configs/qmx6_defconfig

 > diff --git a/board/congatec/qmx6/6q_bootscript.txt b/board/congatec/qmx6/6q_bootscript.txt
 > new file mode 100644
 > index 0000000..087f13d
 > --- /dev/null
 > +++ b/board/congatec/qmx6/6q_bootscript.txt
 > @@ -0,0 +1,5 @@
 > +set bootargs $bootargs console=ttymxc1,115200 vmalloc=400M root=/dev/mmcblk0p1 rootwait consoleblank=0 ;
 > +setenv bootargs $bootargs video=mxcfb0:dev=hdmi,1280x720M at 60,if=RGB24
 > +setenv bootargs $bootargs video=mxcfb1:dev=lcd,CLAA-WVGA,if=RGB666
 > +setenv bootargs $bootargs fbmem=28M,10M
 > +${fs}load mmc ${disk}:1 10800000 /boot/uImage && bootm 10800000 ; echo "Error loading kernel image"


Are these bootargs all required (E.G. does this board always have that
LCD/HDMI output?)


 > diff --git a/board/congatec/qmx6/post-build.sh b/board/congatec/qmx6/post-build.sh
 > new file mode 100755
 > index 0000000..85c0c97
 > --- /dev/null
 > +++ b/board/congatec/qmx6/post-build.sh
 > @@ -0,0 +1,7 @@
 > +#!/bin/sh
 > +
 > +TARGET_DIR=$1
 > +BOARD_DIR="$(dirname $0)"
 > +MKIMAGE=$1/../host/usr/bin/mkimage

This would break with builds with custom HOST_DIR settings. Post-build
scripts are now called with $HOST_DIR/usr/bin prepended to the path, so
you can just use mkimage (but the defconfig should enable
BR2_PACKAGE_HOST_UBOOT_TOOLS to ensure it is available.

 > +
 > +$MKIMAGE -A arm -O linux -T script -C none -a 0 -e 0 -n "boot script" -d $BOARD_DIR/6q_bootscript.txt $TARGET_DIR/6q_bootscript
 > diff --git a/board/congatec/qmx6/readme.txt b/board/congatec/qmx6/readme.txt
 > new file mode 100644
 > index 0000000..6e8be9b
 > --- /dev/null
 > +++ b/board/congatec/qmx6/readme.txt
 > @@ -0,0 +1,31 @@
 > +This is the minimal buildroot support for the Congatec QMX6 Qseven CoM
 > +
 > +conga-QMX6 is based on the freescale iMX6 SoC. For more information please
 > +have a look at http://www.congatec.com/products/qseven/conga-qmx6.html
 > +
 > +The configuration is based on the currently latest kernel release from
 > +Congatec's git repository which is based on 3.0.35. The bootloader u-boot
 > +is preconfigured on the CPU module and does not need to be replaced.
 > +
 > +To build the default configuration you only have to:
 > +
 > +	make qmx6_defconfig && make
 > +
 > +You will need a microSD card of sufficient size and the first or only
 > +partition configured as Linux type.
 > +
 > +To transfer the system to the card you have zwo options:
 > +
 > +1.	$ sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1
 > +
 > +2. 	only once: sudo mkfs.ext3 /dev/sdX1
 > +	$ sudo mount /dev/sdX1 /mnt
 > +	$ sudo tar xf output/images/rootfs.tar -C
 > +	$ sudo umount /mnt

Any reason to document both ways? Why not always go for E.G. option 1
(perhaps with a resize2fs afterwards to use the entire partition).

I see the defconfig uses ext4, but here you use ext3. Does the
bootloader understand both?

 > +
 > +Connect a terminal program to the rs232 connector marked "CONSOLE",
 > +insert the microSD card into the socket on the CPU module and power
 > +the board to watch the system boot.

Baudrate?


 > diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
 > new file mode 100644
 > index 0000000..8cc8de3
 > --- /dev/null
 > +++ b/configs/qmx6_defconfig
 > @@ -0,0 +1,13 @@
 > +BR2_arm=y
 > +BR2_cortex_a9=y
 > +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/congatec/qmx6/post-build.sh"
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0_QMX6_R1.1.2"
 > +BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
 > +BR2_LINUX_KERNEL_INSTALL_TARGET=y

Please also lock kernel headers to 3.0 to match. It would be good to add
comments like we do for E.G. openblocks_a6_defconfig (and most others).


 > +BR2_TARGET_ROOTFS_CPIO=y

Why? You don't seem to be using it.


 > +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y

-- 
Bye, Peter Korsgaard
