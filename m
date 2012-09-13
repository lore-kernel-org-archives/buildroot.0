From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Sep 2012 08:18:01 +0200
Subject: [Buildroot] [RFC] Add board support for Raspberry Pi device.
In-Reply-To: <1347402977-17837-1-git-send-email-marek.belisko@open-nandra.com>
References: <1347402977-17837-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <50517A99.4040700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/12 00:36, Marek Belisko wrote:
> Signed-off-by: Marek Belisko<marek.belisko@open-nandra.com>
>
> Basic support:
> - boot binary blobs + VideoCore added in utils package (to avoid fetching 2 times
>    same repo which is quite big)
This should be in a separate patch "raspberrypi-utils: new package".
And I'd call it raspberrypi-firmware to be consistent with upstream.

> - added post-build script to adjust password, add config, cmdline files
> - add actual kernel build 3.2.27 with cutdown config
> - using external toolchain
> - some parts was overtaken from commits from:https://github.com/nezticle/RaspberryPi-BuildRoot.git
overtaken: you mean taken over? ("to overtake" has a different meaning)

[snip]
> diff --git a/board/raspberrypi/config.txt b/board/raspberrypi/config.txt
This file doesn't happen to be included in raspberrypi-firmware?

[snip]
> diff --git a/board/raspberrypi/linux-3.2.27_defconfig b/board/raspberrypi/linux-3.2.27_defconfig
> new file mode 100644
> index 0000000..3b8bd74
> --- /dev/null
> +++ b/board/raspberrypi/linux-3.2.27_defconfig
> @@ -0,0 +1,546 @@
> +CONFIG_EXPERIMENTAL=y
> +CONFIG_LOCALVERSION="-cutdown"
Looking at the number of modules, it's not very cutdown...
I'm not sure what the best approach is (minimal or maximal).
> diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
> new file mode 100755
> index 0000000..2ed4569
> --- /dev/null
> +++ b/board/raspberrypi/post-build.sh
> @@ -0,0 +1,23 @@
> +TARGETDIR=$1
> +# Set root password to 'root'. Password generated with
> +# mkpasswd, from the 'whois' package in Debian/Ubuntu.
> +sed -i 's%^root::%root:8kfIfYHmcyQEE:%' $TARGETDIR/etc/shadow
NACK. Has nothing to do with RPi (although I think it's a good
idea to update the skeleton with this change).
> +
> +# Generate cmdline file
> +echo -e 'dwc_otg.lpm_enable=0 console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait'>  $TARGETDIR/boot/cmdline.txt
> +
> +# Copy config file
> +cp board/raspberrypi/config.txt $TARGETDIR/boot/
> +
> +
> +# Copy zImage to boot partition
> +cp $TARGETDIR/../images/zImage $TARGETDIR/boot/kernel.img
> +
> +# Package the /boot partition
> +tar -czf $TARGETDIR/../images/boot.tar.gz --exclude=Image -C $TARGETDIR/boot/ .
> +
> +# add eth0 dhcp entry into /etc/network/interfaces
> +echo -e 'auto eth0 \niface eth0 inet dhcp'>>  $TARGETDIR/etc/network/interfaces
NACK. Has nothing to do with RPi (although I think it's a good idea
to have a config option similar to TARGET_GENERIC_GETTY to add this)

> +
> +# add /opt/vc/lib to default library path
> +echo /opt/vc/lib>  $TARGETDIR/etc/ld.so.conf
NACK. There shouldn't be any library installed in /opt/vc/lib (see below).


A README that explain how all this can be put onto bootable media
would be nice.

> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> new file mode 100644
> index 0000000..e19883d
> --- /dev/null
> +++ b/configs/raspberrypi_defconfig
> @@ -0,0 +1,19 @@
> +BR2_arm=y
> +BR2_arm1176jzf_s=y
> +BR2_TOOLCHAIN_EXTERNAL=y
Any chance of testing it with an internal toolchain?

> +BR2_TARGET_GENERIC_HOSTNAME="raspberrypi"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to RaspberryPi"

I don't see a reason to override the defaults here. Admittedly, the
armadeus and beaglebone defconfigs do it as well.

> +BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
> +BR2_PACKAGE_ZLIB=y
> +BR2_PACKAGE_RASPBERRYPI_UTILS=y
> +BR2_PACKAGE_BOOTLOADER=y
> +BR2_PACKAGE_VIDEOCORE=y
> +BR2_TARGET_ROOTFS_TAR_GZIP=y
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rpi-3.2.27"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.2.27_defconfig"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/package/Config.in b/package/Config.in
> index 441159d..b3aaeb2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -222,6 +222,7 @@ source "package/owl-linux/Config.in"
>   source "package/parted/Config.in"
>   source "package/pciutils/Config.in"
>   source "package/picocom/Config.in"
> +source "package/raspberrypi-utils/Config.in"
>   source "package/read-edid/Config.in"
>   source "package/rng-tools/Config.in"
>   source "package/sane-backends/Config.in"
> diff --git a/package/raspberrypi-utils/Config.in b/package/raspberrypi-utils/Config.in
> new file mode 100644
> index 0000000..f267c78
> --- /dev/null
> +++ b/package/raspberrypi-utils/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_RASPBERRYPI_UTILS
> +	bool "Raspberry Pi bootloader and VideoCore binaries"
> +	help
> +	  Raspberry Pi bootloader and videocore binaries
> +
> +if BR2_PACKAGE_RASPBERRYPI_UTILS
> +
> +config BR2_PACKAGE_BOOTLOADER

Should be called BR2_PACKAGE_RASPBERRYPI_BOOTLOADER

> +        bool "Raspberry Pi bootloader files"
> +        help
> +          These are the binary bootloader files from Broadcom.
> +https://github.com/raspberrypi/firmware

Empty line between the help text and the URL.

> +
> +config BR2_PACKAGE_VIDEOCORE
> +        bool "Raspberry Pi VideoCore drivers"
> +        help
> +          These are the binary VideoCore drivers from Broadcom.
> +https://github.com/raspberrypi/firmware
> +
> +endif #BR2_PACKAGE_RASPBERRYPI_UTILS

This Config.in doesn't feel right: bootloader and video driver are
not really closely related, so they sound more like separate
packages (you'd actually even want the bootloader in boot/
but that's probably a bridge too far). How about this alternative:

config BR2_PACKAGE_RASPBERRYPI_FIRMWARE
bool

config BR2_PACKAGE_RASPBERRYPI_BOOTLOADER
bool "Raspberry Pi bootloader files"
select BR2_PACKAGE_RASPBERRYPI_FIRMWARE
help
...

> +
> diff --git a/package/raspberrypi-utils/raspberrypi-utils.mk b/package/raspberrypi-utils/raspberrypi-utils.mk
> new file mode 100644
> index 0000000..3dc640b
> --- /dev/null
> +++ b/package/raspberrypi-utils/raspberrypi-utils.mk
> @@ -0,0 +1,41 @@
> +RASPBERRYPI_UTILS_VERSION = 05bb1ecbf6e11f5fbec18380cd8c5daea02f1392
> +RASPBERRYPI_UTILS_SITE = git://github.com/raspberrypi/firmware.git
> +RASPBERRYPI_UTILS_SITE_METHOD = git
> +RASPBERRYPI_UTILS_INSTALL_TARGET = YES

That's the default, so leave it out.

> +
> +ifeq ($(BR2_PACKAGE_VIDEOCORE),y)
> +RASPBERRYPI_UTILS_INSTALL_STAGING = YES
> +
> +define RASPBERRYPI_UTILS_INSTALL_STAGING_CMDS
> +	cp -r $(@D)/hardfp/opt $(STAGING_DIR)/
> +endef

Please install everything in /usr instead of /opt. That way,
there is no need to give special paths to gcc or ld.so to find
the library.

> +
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BOOTLOADER),y)
> +define RASPBERRYPI_UTILS_INSTALL_TARGET_BOOT
> +	if [ ! -d "$(TARGET_DIR)/boot" ]; then \
> +		mkdir $(TARGET_DIR)/boot; \
> +	fi; \
> +	cp $(@D)/boot/arm128_start.elf $(TARGET_DIR)/boot/start.elf
> +	cp $(@D)/boot/bootcode.bin $(TARGET_DIR)/boot/bootcode.bin
> +	cp $(@D)/boot/loader.bin $(TARGET_DIR)/boot/loader.bin

Just an idea, but doesn't it make more sense to do the stuff
you do in the post-build script here? That would of course mean
that you have to add the kernel to the dependencies here, but
I don't see an issue with that. And that way you can use
$(IMAGES_DIR) instead of $TARGETDIR/../images.

> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_VIDEOCORE),y)
> +define RASPBERRYPI_UTILS_INSTALL_TARGET_VIDEOCORE
> +	mkdir -p $(TARGET_DIR)/opt/vc
> +	cp -r $(@D)/hardfp/opt/vc/bin $(TARGET_DIR)/opt/vc
> +	cp -r $(@D)/hardfp/opt/vc/lib $(TARGET_DIR)/opt/vc
> +	cp -r $(@D)/hardfp/opt/vc/sbin $(TARGET_DIR)/opt/vc
> +endef
> +endif

Put this in the same condition as the INSTALL_STAGING.

> +
> +define RASPBERRYPI_UTILS_INSTALL_TARGET_CMDS
> +	$(RASPBERRYPI_UTILS_INSTALL_TARGET_BOOT)
> +	$(RASPBERRYPI_UTILS_INSTALL_TARGET_VIDEOCORE)
> +endef
> +
> +$(eval $(generic-package))
> +

Regards,
Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mindhttp://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile:http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
