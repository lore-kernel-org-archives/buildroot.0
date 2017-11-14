From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Nov 2017 23:07:31 +0100
Subject: [Buildroot] [PATCH/next 1/5] armada-firmware: new package
In-Reply-To: <20171112201646.15558-2-geomatsi@gmail.com>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-2-geomatsi@gmail.com>
Message-ID: <dbbc1ce7-1847-a08d-fca0-a667b555b71c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-11-17 21:16, Sergey Matyukevich wrote:
> This package adds SCP BL2 firmware for Marvell Armada 7040 and 8040 SoCs.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  boot/Config.in                            |  1 +
>  boot/armada-firmware/Config.in            | 19 +++++++++++++++++++
>  boot/armada-firmware/armada-firmware.hash |  2 ++
>  boot/armada-firmware/armada-firmware.mk   | 18 ++++++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 boot/armada-firmware/Config.in
>  create mode 100644 boot/armada-firmware/armada-firmware.hash
>  create mode 100644 boot/armada-firmware/armada-firmware.mk
> 
> diff --git a/boot/Config.in b/boot/Config.in
> index 2f46c8546e..0ffbd7288b 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -17,5 +17,6 @@ source "boot/ts4800-mbrboot/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
>  source "boot/xloader/Config.in"
> +source "boot/armada-firmware/Config.in"

 Please keep things alphabetic. However, I don't think the boot loader menu is
appropriate. Yes, it's an image that is used by the bootloader, but really it is
a piece of firmware, not really related to booting the SoC.

>  
>  endmenu
> diff --git a/boot/armada-firmware/Config.in b/boot/armada-firmware/Config.in
> new file mode 100644
> index 0000000000..530b5622c8
> --- /dev/null
> +++ b/boot/armada-firmware/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_TARGET_ARMADA_FIRMWARE
> +	bool "armada-firmware"
> +	depends on BR2_aarch64
> +	help
> +	  Marvell Armada SCP BL2 firmware images.

 Could you write a little more help text? Like, that it's the firmware for the
management coprocessor and that it is needed for power management. The first
paragraph of [1] can be a source of inspiration.

 We normally also want an upstream URL. [1] might be usable but I'm not sure.

> +
> +if BR2_TARGET_ARMADA_FIRMWARE
> +
> +config BR2_TARGET_ARMADA_FIRMWARE_IMAGE
> +	string "Armada SCP BL2 image name"
> +	help
> +	  Armada SCP BL2 firmware image name.
> +
> +config BR2_TARGET_ARMADA_FIRMWARE_VERSION
> +	string "Armada SCP BL2 image version"
> +	help
> +	  Armada SCP BL2 firmware image version.
> +
> +endif
> diff --git a/boot/armada-firmware/armada-firmware.hash b/boot/armada-firmware/armada-firmware.hash
> new file mode 100644
> index 0000000000..5eeca9d6ea
> --- /dev/null
> +++ b/boot/armada-firmware/armada-firmware.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 b310443c0d51d07b7c11597548685ae608b8478eee7095925427da6ab71e0168 armada-firmware-binaries-marvell-armada-17.10.tar.gz
> diff --git a/boot/armada-firmware/armada-firmware.mk b/boot/armada-firmware/armada-firmware.mk
> new file mode 100644
> index 0000000000..d75dc7cb6c
> --- /dev/null
> +++ b/boot/armada-firmware/armada-firmware.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# Marvell Armada SCP BL2 firmware images
> +#
> +################################################################################
> +
> +ARMADA_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARMADA_FIRMWARE_VERSION))
> +ARMADA_FIRMWARE_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(ARMADA_FIRMWARE_VERSION))

 We try to keep the upstream name as the package name. Is there anything wrong
with binaries-marvell?

> +ARMADA_FIRMWARE_LICENSE = Proprietary
> +
> +ARMADA_FIRMWARE_INSTALL_IMAGES  = YES
> +
> +define ARMADA_FIRMWARE_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/mrvl_scp_bl2_7040.img $(BINARIES_DIR)/mrvl_scp_bl2_7040.img
> +	$(INSTALL) -D -m 0644 $(@D)/mrvl_scp_bl2_8040.img $(BINARIES_DIR)/mrvl_scp_bl2_8040.img

 I don't think the name is really relevant, is it? So maybe you could always
copy it to the same file in BINARIES_DIR so on the ATF side you don't need to
access variables of this package.

 Regards,
 Arnout

> +endef
> +
> +$(eval $(generic-package))
> 

[1]
http://wiki.macchiatobin.net/tiki-index.php?page=Enable+Power+Management+on+MACCHIATObin#Bootloader



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
