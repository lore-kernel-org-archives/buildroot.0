From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 23:10:40 +0100
Subject: [Buildroot] [PATCH] defconfig for Phytec Cosmic-AM335x Board
In-Reply-To: <1390908698-7256-1-git-send-email-praveen.v@phytec.in> (Praveen
 kumar Vattipalli's message of "Tue, 28 Jan 2014 17:01:38 +0530")
References: <1390908698-7256-1-git-send-email-praveen.v@phytec.in>
Message-ID: <87lhxzzrj3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Praveen" == Praveen kumar Vattipalli <praveen.v@phytec.in> writes:

 > Signed-off-by: Praveen Kumar Vattipalli <praveen.v@phytec.in>

Thanks for your patch. See below for a few comments:

 > ---
 >  board/cosmic-am335x/readme.txt         |   54 ++++++++++++++++++++++++++++++
 >  configs/phytec_cosmic_am335x_defconfig |   57 ++++++++++++++++++++++++++++++++
 >  2 files changed, 111 insertions(+)
 >  create mode 100644 board/cosmic-am335x/readme.txt
 >  create mode 100644 configs/phytec_cosmic_am335x_defconfig

 > diff --git a/board/cosmic-am335x/readme.txt b/board/cosmic-am335x/readme.txt
 > new file mode 100644
 > index 0000000..62fd238
 > --- /dev/null
 > +++ b/board/cosmic-am335x/readme.txt
 > @@ -0,0 +1,54 @@
 > +Phytec Cosmic-AM335x Board.
 > +
 > +How to build it
 > +===============
 > +
 > +Configure Buildroot
 > +-------------------
 > +
 > +The pcm051lb_defconfig configuration is a default configuration for Phytec Cosmic-AM335x Board.
 > +
 > +  $ make phytec_cosmic_am335x_defconfig

Ehh, pcm051lb or phytec_cosmit_am335x?

 > 

+
 > +Build the rootfs
 > +----------------
 > +You may now build your rootfs with:
 > +
 > +  $ make
 > +
 > +This may take a long time. In this process it download some pakages,you need internet Connections.

Typos/odd sentence. What about:

This may take a long time. During this process, additional source code is
downloaded from the Internet.


 > +
 > +Result of the build
 > +-------------------
 > +
 > +After building, you should obtain this tree:
 > +
 > +	output/images/
 > +		+-- rootfs.tar
 > +		+-- barebox.bin
 > +		+-- uImage
 > +
 > +To boot the board you need MLO (primary bootloader) so download from below link
 > +ftp://ftp.phytec.de/pub/Products/India/Cosmic-AM335x/Linux/PD13.0.0/images/MLO

Hmm, can't we build MLO ourselves?


 > +
 > +Prepare you SDCard
 > +==================
 > +
 > +For more information, download manual
 > +
 > +	ftp://ftp.phytec.de/pub/Products/India/Cosmic-AM335x/Linux/doc/Cosmic-AM335x%20System%20Development%20User%20Manual.pdf
 > +
 > +Install the binaries to the SDCard
 > +----------------------------------
 > +
 > +		cp MLO /media/boot
 > +	output/images/
 > +		cp barebox.bin uImage /media/boot
 > +		tar -xvf rootfs.tar -C /media/rootfs
 > +

Hmm, it looks like there's a mount command, a 'cd' in front of
output/images and sudo before the tar missing.

 > +Finish
 > +======
 > +
 > +Unmount all the partitions And eject your SDcard from your computer.
 > +
 > +Insert the SDcard into your cosmic, and power it up. Your new system should come up, now.
 > diff --git a/configs/phytec_cosmic_am335x_defconfig b/configs/phytec_cosmic_am335x_defconfig
 > new file mode 100644
 > index 0000000..94ba4ba
 > --- /dev/null
 > +++ b/configs/phytec_cosmic_am335x_defconfig
 > @@ -0,0 +1,57 @@
 > +BR2_arm=y
 > +BR2_cortex_a8=y
 > +BR2_ARM_SOFT_FLOAT=y
 > +BR2_JLEVEL=4

Please don't hardcode JLEVEL in a defconfig.

 > +BR2_DEPRECATED=y

Why?


 > +BR2_TOOLCHAIN_EXTERNAL=y
 > +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 > +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 > +BR2_TOOLCHAIN_EXTERNAL_URL="ftp://ftp.phytec.de/pub/Products/India/Cosmic-AM335x/Linux/PD13.0.0/tools/toolchain/arm-cortexa8-linux-gnueabi.tar.bz2"

Defconfigs should use the internal uClibc toolchain.

 > +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-cortexa8-linux-gnueabi"
 > +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 > +BR2_TOOLCHAIN_EXTERNAL_CXX=y
 > +BR2_TARGET_GENERIC_HOSTNAME="Cosmic-AM335x"
 > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
 > +BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 > +BR2_TARGET_GENERIC_GETTY_TERM=""
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="ftp://ftp.phytec.de/pub/Products/India/Cosmic-AM335x/Linux/PD13.0.0/src/linux/linux-3.2.tar.bz2"

No mainline support?

 > +BR2_LINUX_KERNEL_DEFCONFIG="pcm051lb"

 > +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 > +BR2_PACKAGE_TAR=y
 > +BR2_PACKAGE_FBGRAB=y
 > +BR2_PACKAGE_FBSET=y
 > +BR2_PACKAGE_FB_TEST_APP=y
 > +BR2_PACKAGE_FBV=y
 > +BR2_PACKAGE_EVTEST=y
 > +BR2_PACKAGE_I2C_TOOLS=y
 > +BR2_PACKAGE_LZO=y
 > +BR2_PACKAGE_LIBGPGME=y
 > +BR2_PACKAGE_TSLIB=y
 > +BR2_PACKAGE_LIBXML2=y
 > +BR2_PACKAGE_NCURSES_TARGET_PANEL=y
 > +BR2_PACKAGE_NCURSES_TARGET_FORM=y
 > +BR2_PACKAGE_NCURSES_TARGET_MENU=y
 > +BR2_PACKAGE_CAN_UTILS=y
 > +BR2_PACKAGE_DHCP=y
 > +BR2_PACKAGE_DHCP_SERVER=y
 > +BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK=y
 > +BR2_PACKAGE_DHCP_CLIENT=y
 > +BR2_PACKAGE_ETHTOOL=y
 > +BR2_PACKAGE_IPERF=y
 > +BR2_PACKAGE_IPROUTE2=y
 > +BR2_PACKAGE_OPENSSH=y
 > +BR2_PACKAGE_WGET=y
 > +BR2_PACKAGE_IPKG=y
 > +BR2_PACKAGE_OPKG=y
 > +BR2_PACKAGE_RPM=y
 > +BR2_PACKAGE_BASH=y
 > +BR2_PACKAGE_DASH=y
 > +BR2_PACKAGE_FILE=y
 > +BR2_PACKAGE_TIME=y
 > +BR2_PACKAGE_WHICH=y

These packages are for a specific use case and shouldn't be in a minimal
defconfig.


 > +BR2_TARGET_BAREBOX=y
 > +BR2_TARGET_BAREBOX_CUSTOM_TARBALL=y
 > +BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION="ftp://ftp.phytec.de/pub/Products/India/Cosmic-AM335x/Linux/PD13.0.0/src/bootloaders/barebox/barebox-2013.07.0.tar.bz2"

No mainline support?

 > +BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="pcm051lb"

-- 
Bye, Peter Korsgaard
