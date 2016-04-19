From: Pieter Smith <pieter@boesman.nl>
Date: Tue, 19 Apr 2016 22:26:49 +0200
Subject: [Buildroot] [PATCH v4 7/7] beaglebone: adds barebox bootloader
	defconfig
In-Reply-To: <5702FACA.6080001@mind.be>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-8-git-send-email-pieter@boesman.nl>
 <5702FACA.6080001@mind.be>
Message-ID: <20160419202649.GA20663@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 05, 2016 at 01:37:46AM +0200, Arnout Vandecappelle wrote:
> On 03/20/16 23:35, Pieter Smith wrote:
> >* Builds the barebox MLO and bootloader.
> >* Generates a barebox environment that boots from eMMC by default.
> >* Barebox integrates a perfectly good device-tree for the bbb, so no dtb is
> >   being generated with the kernel.
> >
> >Signed-off-by: Pieter Smith <pieter@boesman.nl>
> >---
> >  board/beaglebone/barebox.env/boot/sd      |  6 +++++
> >  board/beaglebone/barebox.env/config-board |  4 +++
> >  configs/beaglebone_barebox_defconfig      | 41 +++++++++++++++++++++++++++++++
> >  3 files changed, 51 insertions(+)
> >  create mode 100644 board/beaglebone/barebox.env/boot/sd
> >  create mode 100644 board/beaglebone/barebox.env/config-board
> >  create mode 100644 configs/beaglebone_barebox_defconfig
> >
> >diff --git a/board/beaglebone/barebox.env/boot/sd b/board/beaglebone/barebox.env/boot/sd
> >new file mode 100644
> >index 0000000..7a80e29
> >--- /dev/null
> >+++ b/board/beaglebone/barebox.env/boot/sd
> >@@ -0,0 +1,6 @@
> >+#!/bin/sh
> 
>  Is that needed/useful?

If you are referring to the interpreter specification: I suspect no, but all
barebox scripts in barebox specify the interpreter, so I would like not to
stray from the convention.

If you are referring to the presence of the sd script: Yes. The device name
needs to be changed from the default to work with the Beaglebone.

> >+
> >+global.bootm.image=/boot/zImage
> >+#global.bootm.oftree=/boot/oftree
> 
>  Maybe repeat here the comment about using the built-in DT.

ACK. Will be in v5 of the patch-set. I will not be removing the commented lines
though. The convention is to leave these in so that the user can tune them if
he wants something different.

> >+#global.bootm.initrd=<path to initrd>
> 
>  I would remove this line, it's not very useful.

These are kept in the scripts for a reason. These scripts are left as
placeholders for easy tuning by the user. I also decided to retain this because
it is present in the defaults included with barebox. If you feel strongly about
this, I can remove it, but I would prefer to keep it in.

[snip]

> >+# system
> >+BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
> >+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
> >+BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
> 
>  Does the default (console) not work well?

I inherited this from the beaglebone_defconfig. I know that the beaglebone uses
a different serial port for the console than the Phytec am33xx modules (the
default for the BSP), so I am quite sure this is necessary.

> >+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
> 
>  Why?

Again... Inherited from beaglebone_defconfig. I see no need to stick to this.
Will be RW in v5 of the patch-set.

> >+# BR2_ROOTFS_POST_IMAGE_SCRIPT is not set
> 
>  This is the default. However, it would be nice if you could add a genimage
> script. Pandaboard should be a good basis.

ACK. Will be in v5 of the patch-set as per the discussion on "[PATCH v4 3/7]
barebox: support custom barebox output image name"

> >+
> >+# filesystem
> >+BR2_PACKAGE_AM33X_CM3=y
> >+BR2_TARGET_ROOTFS_EXT2=y
> 
>  We tend to prefer ext4 nowadays.

ACK. Will be ext4 in v5 of the patch-set.

> >+# BR2_TARGET_ROOTFS_TAR is not set
> >+
> >+# Linux headers same as kernel, a 4.4 series
> >+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
> 
>  The version should be really locked down, i.e.:
> 
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.6"

ACK. Will be locked down in v5 of the patch-set.

[snip]

> >+# kernel
> >+BR2_LINUX_KERNEL=y
> >+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> >+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.6"
> 
>  Maybe you can switch to 4.5 already?

ACK. Will verify and change if nothing breaks.

> >+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> >+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
> >+BR2_LINUX_KERNEL_ZIMAGE=y
> >+
> >+# Use the barebox built-in dtb
> >+# BR2_LINUX_KERNEL_DTS_SUPPORT is not set
> 
>  Good to put this here!

As per your recommendation on v4 of the patch-set.

[snip]

- Pieter
