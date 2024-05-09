Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31538C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC17A402CE;
	Thu,  9 May 2024 20:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kz1RfaRh6rhp; Thu,  9 May 2024 20:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A4DC402E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A4DC402E8;
	Thu,  9 May 2024 20:03:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21FB71BF33F
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D4F583EBA
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLhjXtV1cCp4 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:03:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06DAA83EB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06DAA83EB8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06DAA83EB8
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:03:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8853FF803;
 Thu,  9 May 2024 20:03:36 +0000 (UTC)
Date: Thu, 9 May 2024 22:03:34 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20240509220334.1641f661@windsurf>
In-Reply-To: <20240507143409.230685-1-jamie.gibbons@microchip.com>
References: <20240507143409.230685-1-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715285017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jcl7m8TSk++LLoLrXPrZsvanhdnnsp827HMIlQ8YUaw=;
 b=IJSwCxo8Jgf/srnBp0tZhrH3sgUPQYQsUtKwcxDXJHZUoR+PSeRNzsrgEOCLQRWd5nFyj2
 Jj1sSkQu2Y//oOb7Qv2hN0yKeU+srfAeGYOrm7DI8Iciq5/4wj/y/h/Bs741h6nWlMPAnw
 7O7jISBsFF6leVHuGOzO7rJY3rDYnD42zSrUlIMdL3g9rrhaL01t08iciQVi+I5ur02OMd
 YUrCtyCQvIJTC5PgMcoQQu8GdK2tjQZLVdk+Wrmejstgy7PSLf7WON5EiSsEeRnHhPnFdi
 PCWzUA4toeohRJ/ClwW99b7Hv4ioa7Ln/VSBkoMQ60Wz5vL5wdiPghnGdE9MFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IJSwCxo8
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglev_fire: add support for
 BeagleV Fire
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

On Tue, 7 May 2024 15:34:09 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> Add support for the BeagleV Fire, the Beagleboard SBC powered by
> Microchip's PolarFire SoC.

Thanks a lot for this patch! It mostly looks good, but there are a
number of small questions/comments below.


> +Flashing the image to your eMMC
> +===============================
> +
> +By default Buildroot builds a compatible image for you. The first partition
> +of this image contains a U-Boot binary, embedded in a Hart Software
> +Services (HSS) payload. The second partition contains a FAT filesystem
> +with a U-Boot env and an ITB file containing the kernel and the device
> +tree. The third partition contains the file system. This image can be
> +written directly to the eMMC. All you need to do is dd the image to the eMMC,
> +which can be done with the following command on your development host:
> +
> +  '$ sudo dd if=output/images/sdcard.img of=/dev/sdb bs=1M'

I'm a bit confused: how can the board's eMMC be visible as /dev/sdb on
the development host? Does the SoC ROM code expose the eMMC as a USB
mass storage device? This probably needs a bit of explanation: /dev/sdb
on the host might very well be something entirely different.

> +Customize BeagleV-Fire Cape Gateware Using Verilog
> +==================================================
> +
> +To customize your Beagle-V Fire gateware please follow the guide below to
> +create your custom bitstream (steps 1 - 6):
> +https://docs.beagleboard.org/latest/boards/beaglev/fire/demos-and-tutorials/gateware/customize-cape-gateware-verilog.html
> +
> +
> +Program BeagleV-Fire With Your Custom Bitstream with Buildroot
> +==============================================================
> +
> +Unzip the downloaded artifacts.zip file. 

Downloaded from where? According to the instructions in the previous
section?

> +On your Linux host development computer, copy the bitstream to BeagleV-Fire
> +board, replacing </path/to/your/> with the path to your BeagleV-Fire root file
> +system.
> +  'cp -r ./LinuxProgramming /path/to/your/buildroot/board/beaglev_fire/rootfs-overlay/etc/'

This will not do much if you don't regenerate the Buildroot image.


> diff --git a/board/beaglev_fire/rootfs-overlay/usr/share/beagleboard/gateware/change-gateware.sh b/board/beaglev_fire/rootfs-overlay/usr/share/beagleboard/gateware/change-gateware.sh
> new file mode 100644
> index 0000000000..0a35b6178b
> --- /dev/null
> +++ b/board/beaglev_fire/rootfs-overlay/usr/share/beagleboard/gateware/change-gateware.sh
> @@ -0,0 +1,25 @@
> +#!/bin/bash
> +
> +if [ -d "$1" ]
> +then
> +    echo "Changing gateware."
> +    if [ -e "$1"/mpfs_bitstream.spi ]
> +    then
> +        if [ -e "$1"/mpfs_dtbo.spi ]
> +        then
> +            if ! [ -d /lib/firmware ]
> +            then
> +                mkdir /lib/firmware
> +            fi
> +            cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
> +            cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
> +            . /usr/share/microchip/update-gateware.sh
> +        else
> +            echo "No device tree overlay file found."
> +        fi
> +    else
> +        echo "No gateware file found."
> +    fi
> +else
> +    echo "No directory found for this requested gateware."
> +fi

Please do error handling the other way around rather than having a
script that indents like crazy:

if [ ! -d "$1" ] ; then
	echo "No directory found for this requested gateware."
	exit 1
fi

echo "Changing gateware."

if [ ! -e "$1"/mpfs_bitstream.spi ]; then
	echo "No gateware file found."
	exit 1
fi

(Note: those two tests are redundant, doing the second test is sufficient)

etc. with the rest of the logic.

Why is update-gateware.sh in a separate script? It seems like a fairly
gratuitous split.

> diff --git a/board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh b/board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
> new file mode 100644
> index 0000000000..2e91c0f4f9
> --- /dev/null
> +++ b/board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
> @@ -0,0 +1,36 @@
> +#!/bin/bash
> +echo "================================================================================"
> +echo "|                            FPGA Gateware Update                              |"
> +echo "|                                                                              |"
> +echo "|   Please ensure that the mpfs_bitstream.spi file containing the gateware     |"
> +echo "|   update has been copied to directory /lib/firmware.                         |"
> +echo "|                                                                              |"
> +echo "|                 !!! This will take a couple of minutes. !!!                  |"
> +echo "|                                                                              |"
> +echo "|               Give the system a few minutes to reboot itself                 |"
> +echo "|                        after Linux has shutdown.                             |"
> +echo "|                                                                              |"
> +echo "================================================================================"

This whole message is silly as the previous script has already copied
whatever is needed in /lib/firmware/. But in fact, what does it copy it
in /lib/firmware/ in the first place?

> +
> +read -rsp $'Press any key to continue...\n' -n1 key
> +
> +mount -t debugfs none /sys/kernel/debug
> +
> +# Trash exisitng device tree overlay in case the rest of the process fails:
> +mtd_debug erase /dev/mtd0 0x0 0x10000
> +
> +# Write device tree overlay
> +dtbo_ls=$(ls -l /lib/firmware/mpfs_dtbo.spi)
> +dtbo_size=$(echo "$dtbo_ls" | cut -d " "  -f 5)

dtbo_size=$(stat -c %s /lib/firmware/mpfs_dtbo.spi)

will do that in one go

> +
> +mtd_debug write /dev/mtd0 0x400 "$dtbo_size" /lib/firmware/mpfs_dtbo.spi > /dev/zero

Why do you use mtd_debug in this script? It seems really debugging
oriented. Why not flash_erase and then writing to /dev/mtd0 directly?


> diff --git a/board/beaglev_fire/uboot-env.txt b/board/beaglev_fire/uboot-env.txt
> new file mode 100644
> index 0000000000..1b996ed76b
> --- /dev/null
> +++ b/board/beaglev_fire/uboot-env.txt
> @@ -0,0 +1,16 @@
> +# this assumes ${scriptaddr} is already set!!
> +
> +# Try to boot a fitImage from eMMC/SD
> +
> +setenv fdt_high 0xffffffffffffffff
> +setenv initrd_high 0xffffffffffffffff
> +
> +load mmc 0:${distro_bootpart} ${scriptaddr} beaglev_fire.itb;
> +bootm start ${scriptaddr}#kernel_dtb;
> +bootm loados ${scriptaddr};
> +# Try to load a ramdisk if available inside fitImage
> +bootm ramdisk;
> +bootm prep;
> +fdt set /soc/ethernet@20112000 mac-address ${beaglevfire_mac_addr0};
> +fdt set /soc/ethernet@20110000 mac-address ${beaglevfire_mac_addr1};
> +bootm go;

Nowadays, we try to use distro bootcmd instead of custom uBoot
environment scripts. See
https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/doc/develop/distro.rst
for some details.

> diff --git a/board/beaglev_fire/uboot-fragment.config b/board/beaglev_fire/uboot-fragment.config
> new file mode 100644
> index 0000000000..861593bd7e
> --- /dev/null
> +++ b/board/beaglev_fire/uboot-fragment.config
> @@ -0,0 +1 @@
> +CONFIG_MPFS_PRIORITISE_QSPI_BOOT=n
> diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
> new file mode 100644
> index 0000000000..3779658509
> --- /dev/null
> +++ b/configs/beaglev_fire_defconfig
> @@ -0,0 +1,40 @@
> +BR2_riscv=y
> +BR2_RISCV_ISA_RVC=y
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="6.1.30"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_OVERLAY="board/beaglev_fire/rootfs-overlay/"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglev_fire/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.1-mchp+fpga)/linux4microchip+fpga-2024.02.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_MTD=y
> +BR2_PACKAGE_DTC=y
> +BR2_PACKAGE_DTC_PROGRAMS=y

dtc is needed on the targe?

> +BR2_PACKAGE_BASH=y

Why?

> +BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +BR2_TARGET_ROOTFS_INITRAMFS=y

Your choice of root filesystem is weird. This option bundles the root
filesystem as an initramfs in the kernel image. But in addition, you
have put the root filesystem as a CPIO in a partition (which is
useless, as Linux cannot mount a CPIO image from a block device).

Could you clarify how you expect the root filesystem to be handled?

> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,polarfire-soc,u-boot)linux4microchip+fpga-2024.02.tar.gz"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beaglev_fire"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beaglev_fire/uboot-fragment.config"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_PACKAGE_HOST_GENEXT2FS=y

You don't generate an ext2 filesystem, so this is not needed.

> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_GPTFDISK=y

Not sure where this gets used.

> +BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_SQUASHFS=y

Where this gets used?

> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/beaglev_fire/uboot-env.txt"

Could you have a look at those different comments, and submit a v2 that
takes into account this feedback?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
