From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:10:19 +0200
Subject: [Buildroot] [PATCH 1/1] Added support for LeMaker BananaPi M2
	Plus board.
In-Reply-To: <1506092386-15175-1-git-send-email-mike.harmony@snapav.com> (Mike
 Harmony's message of "Fri, 22 Sep 2017 10:59:46 -0400")
References: <1506092386-15175-1-git-send-email-mike.harmony@snapav.com>
Message-ID: <87y3p6phhg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Harmony <mike.harmony@snapav.com> writes:

 > Signed-off-by: Mike Harmony <mike.harmony@snapav.com>
 > ---
 >  DEVELOPERS                         |  4 ++++
 >  board/lemaker/m2-plus/boot.cmd     |  7 +++++++
 >  board/lemaker/m2-plus/genimage.cfg | 33 +++++++++++++++++++++++++++++++++
 >  configs/bananapi_m2_plus_defconfig | 26 ++++++++++++++++++++++++++
 >  4 files changed, 70 insertions(+)
 >  create mode 100644 board/lemaker/m2-plus/boot.cmd
 >  create mode 100644 board/lemaker/m2-plus/genimage.cfg
 >  create mode 100644 configs/bananapi_m2_plus_defconfig

You have now sent this a number of times. It would be good to add a note
what has changed between the versions you sent. From a quick look I
don't seem to see anything?

You have put the files under board/lemaker and mentioned lemaker in the
commit log, but this is a board from Sinovoip, right?

https://linux-sunxi.org/Banana_Pi_M2%2B
https://en.wikipedia.org/wiki/Banana_Pi

I've moved the files under board/sinovoip and adjusted the commit
message to match.


 > diff --git a/configs/bananapi_m2_plus_defconfig b/configs/bananapi_m2_plus_defconfig
 > new file mode 100644
 > index 0000000..59dae1b
 > --- /dev/null
 > +++ b/configs/bananapi_m2_plus_defconfig
 > @@ -0,0 +1,26 @@
 > +BR2_arm=y
 > +BR2_cortex_a7=y
 > +BR2_KERNEL_HEADERS_4_13=y

The default (same as kernel built) is nicer, as the 4_13 option will not
continue to exist forever. 

 > +BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Plus"
 > +BR2_SYSTEM_DHCP="eth0"

What is this for? There is still no support for the h3 ethernet
interface in the mainline kernel and the dts file doesn't list it
either.

I've dropped it for now.


> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/lemaker/m2-plus/genimage.cfg board/bananapi/m2-plus/boot.cmd"

The boot.cmd argument is not needed, so I've dropped it.


> +BR2_LINUX_KERNEL=y

Just using the default kernel version (which is currently 4.13 but will
change in the future) isn't good, so I've changed this to 4.13.3 using
the custom version support.

> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-bananapi-m2-plus"
 > +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y

You didn't disable tar output even though it isn't used, so I've done
that.

 > +BR2_TARGET_UBOOT=y
 > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 > +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Sinovoip_BPI_M2_Plus"
 > +BR2_TARGET_UBOOT_NEEDS_DTC=y
 > +BR2_TARGET_UBOOT_SPL=y
 > +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"

This may work, but all the other sunxi defconfigs use
BR2_TARGET_UBOOT_FORMAT_CUSTOM so I've changed it to use that instead.

> +BR2_TARGET_UBOOT_BOOT_SCRIPT=y
 > +BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/lemaker/m2-plus/boot.cmd"
 > +BR2_PACKAGE_HOST_GENEXT2FS=y
 > +BR2_PACKAGE_HOST_GENIMAGE=y

Your genimage.cfg creates a fat partition, so we also need:

BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_MTOOLS=y

> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

There is no need to explicitly enable this or host-genext2fs as they are
only used indirectly.

Committed with these fixes, thanks.

For the future, please compare with similar defconfigs.

-- 
Bye, Peter Korsgaard
