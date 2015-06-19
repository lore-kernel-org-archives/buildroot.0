From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 19 Jun 2015 22:52:15 +0200
Subject: [Buildroot] [PATCH 1/2] rpi-firmware: allow disabling
 installation of binary DTBs
In-Reply-To: <20150619203006.GC3638@free.fr>
References: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>
 <20150619203006.GC3638@free.fr>
Message-ID: <558480FF.409@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/19/2015 10:30 PM, Yann E. MORIN wrote:
> +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
> +	bool "Install Device Tree Blobs (DTBs)"
> +	default "y"
> +	help
> +	  Say 'y' here if you want to install the binary DTB files which
> +	  are suitable for a rpi-3.18.y branch Linux kernel.
> +
> +	  Say 'n' here if you intend to compile the device tree files
> +	  from kernel source instead.
> I would rephrase that as:
>
>      If you are using a Linux kernel <= 3.18, you should say 'y' here.
>
>      If you are using a Linux kernel >= 3.19, you should say 'n' here,
>      and enable BR2_LINUX_KERNEL_DTS_SUPPORT to let the kernel build
>      the DTB.
>

Rephrashing is fine with me.

>   endif # BR2_PACKAGE_RPI_FIRMWARE
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index cbcf790..9cccb38 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -13,6 +13,7 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
>   
>   RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
>   
> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
>   define RPI_FIRMWARE_INSTALL_DTB
>   	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
>   	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
> @@ -21,6 +22,7 @@ define RPI_FIRMWARE_INSTALL_DTB
>   		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
>   	done
>   endef
> +endif
> I'd put the overlays out of the conditional block, because they are
> *not* built by the Linux kernel.

They do seem to be part of the rpi Linux source tree: 
https://github.com/raspberrypi/linux/tree/rpi-3.18.y/arch/arm/boot/dts/overlays
Isn't it a matter of adding overlay/name-of-overlay to 
BR2_LINUX_KERNEL_INTREE_DTS_NAME if someone wants an overlay build?



Yours sincerely,

Floris Bos
