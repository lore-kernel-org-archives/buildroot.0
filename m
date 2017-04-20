From: abhimanyu.v at gmail.com <abhimanyu.v@gmail.com>
Date: Thu, 20 Apr 2017 23:23:44 +0530
Subject: [Buildroot] [PATCH v8 2/2] Add defconfig for MIPS Creator ci40
In-Reply-To: <00a41e1f-2b06-a715-4d96-b317af6e2890@mind.be>
References: <20170416174048.4737-1-abhimanyu.v@gmail.com>
 <20170416174048.4737-2-abhimanyu.v@gmail.com>
 <00a41e1f-2b06-a715-4d96-b317af6e2890@mind.be>
Message-ID: <CA+V_ovvHApxEs-0xcUs-EX52GmLC4tuKQY2y2oXsWafK4=ySgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thankyou again for review Arnout!
Sorry for late reply as was out of station!

On Tue, Apr 18, 2017 at 5:12 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

>  Hi Abhimanyu,
>
>  I have a few tiny improvement suggestions still, but it looks good
> already so
> on your next iteration (with the improved genimage.sh) you can add my
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> On 16-04-17 19:40, Abhimanyu Vishwakarma wrote:
> > From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> >
> > Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
>
> [snip]
> > diff --git a/board/ci40/post-build.sh b/board/ci40/post-build.sh
> > new file mode 100755
> > index 000000000..978ced585
> > --- /dev/null
> > +++ b/board/ci40/post-build.sh
> > @@ -0,0 +1,4 @@
> > +#!/bin/bash
>
>  It's a bit of a personal preference: when the script doesn't rely on
> bashisms,
> I prefer to use /bin/sh instead of /bin/bash.
>
>
Will do it.


> > +
> > +# Copy to target
> > +cp ${BINARIES_DIR}/vmlinux.gz.itb ${TARGET_DIR}/fitImage
> > diff --git a/board/ci40/readme.txt b/board/ci40/readme.txt
> > new file mode 100644
> > index 000000000..9d399c850
> > --- /dev/null
> > +++ b/board/ci40/readme.txt
> > @@ -0,0 +1,64 @@
> > +*********************
> > +* MIPS Creator CI40 *
> > +*********************
> > +
> > +This document details how to build and run a Buildroot system on the
> > +MIPS Creator CI40 platform. For more details about the CI40, see
> > +https://creatordev.io/ci40-iot-hub.html.
> > +
> > +How to build
> > +------------
> > +
> > +$ make ci40_defconfig
> > +$ make
> > +
> > +Prepare USB/MMC for boot
> > +------------------------
> > +
> > +On successful build, "sdcard.img" file will be created in
> 'output/images'
> > +folder.
> > +
> > +Use following command to write image to bootable device
> > +
> > +# dd if=./output/images/sdcard.img of=/dev/<your-microsd-or-usb-device>
>
>  You could add here something like:
>
> You usually have to be root to be allowed to do this
>
> of just put sudo in front of the command line example (and start it with $
> instead of #, of course).
>
>
Thanks will update.

> +
> > +Booting from USB/MMC
> > +--------------------
> > +
> > +The boot loader is already present in NOR flash. To boot your newly
> generated
> > +Linux and root filesystem, you need to interrupt U-Boot autoboot.
> Current
> > +U-Boot is configured with 2 seconds of boot-delay, after expiry of this
> > +boot-delay timeout U-Boot starts booting the default image. To interrupt
> > +autoboot, press any key before the boot-delay time expires, U-Boot will
> > +stop the autoboot process and give a U-Boot prompt. You can now boot to
> > +your preferred boot method as describe below:
>
>  A little bit verbose, but very clear!
>
>
Thankyou :)


> > +
> > +From USB
> > +  pistachio # run usbboot
> > +
> > +From SD-Card
> > +  pistachio # run mmcboot
> > +
> > +Persistent boot command
> > +-----------------------
> > +
> > +To boot automatically to your preferred boot method, use following
> command to
> > +make it persistent, for example to automatically boot to usb:
> > +
> > +  pistachio # setenv bootcmd run usbboot
> > +  pistachio # saveenv
> > +
> > +Flash new bootloader
> > +--------------------
> > +
> > +Bootloader image will be available in 'output/images' folder.
> > +Use following command to flash new bootloader:
> > +
> > +# flashcp -v u-boot-pistachio_marduk-<version>.img /dev/mtd0
>
>  Although you were asked before to make this section shorter, I think it's
> a
> little bit too terse now. How about
>
> The bootloader image will be available in the 'output/images' folder. To
> flash
> the new bootloader, copy it to the device and use the following command on
> the
> device:
>
> # flashcp -v u-boot-pistachio_marduk-<version>.img /dev/mtd0
>
>
It look good to me. I will also use the above comment to use sudo here too!


> > +
> > +Online docs
> > +-----------
> > +
> > +Mostly for OpenWRT but it is applicable to Buildroot
> > +https://docs.creatordev.io/ci40/guides/openwrt-platform/#overview
> > +
> > diff --git a/configs/ci40_defconfig b/configs/ci40_defconfig
> > new file mode 100644
> > index 000000000..2ea3afe47
> > --- /dev/null
> > +++ b/configs/ci40_defconfig
> > @@ -0,0 +1,48 @@
> > +# architecture
> > +BR2_mipsel=y
> > +BR2_mips_32r2=y
>
>  Perhaps it would make sense to add an explicit
>
> BR2_MIPS_SOFT_FLOAT=y
>
> ? Although we don't do this for any of the other MIPSes and I doubt we'll
> change
> the default any time soon for 32-bit MIPS.
>
>
Since we have never done for other MIPSes i think we should keep it
consistent? So will dropping this one.


>  Regards,
>  Arnout
>
> > +
> > +# linux header same as custom kernel ie 4.4.x
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
> > +
> > +# kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
> github,CreatorDev,linux,openwrt-4.4.14)/linux-openwrt-4.4.14.tar.gz"
> > +BR2_LINUX_KERNEL_DEFCONFIG="pistachio"
> > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> > +# vmlinux.gz.itb image includes img/pistachio_marduk device tree
> > +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="vmlinux.gz.itb"
> > +
> > +# bootloader flash support
> > +BR2_PACKAGE_MTD=y
> > +
> > +# wireless firmware
> > +BR2_PACKAGE_UCCP420WLAN=y
> > +
> > +# wireless package
> > +BR2_PACKAGE_WIRELESS_TOOLS=y
> > +BR2_PACKAGE_WPA_SUPPLICANT=y
> > +BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
> > +
> > +# bootloader
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pistachio_marduk"
> > +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> > +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call
> github,CreatorDev,u-boot,v1.0.5)/u-boot-CreatorDev-v1.0.5.tar.gz"
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-pistachio_
> marduk-2015.10-v1.0.5.img"
> > +
> > +# fitimage / image generation
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
> > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/ci40/post-build.sh"
> > +
> > +# image generation
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +BR2_PACKAGE_HOST_GENIMAGE=y
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> > +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci40/genimage.cfg"
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>

Regards,
Abhimanyu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170420/a9b2f075/attachment.html>
