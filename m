From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Nov 2017 10:23:39 +0200
Subject: [Buildroot] [PATCH/next 3/5] atf: add support for Marvell
 Armada SoCs
In-Reply-To: <20171112201646.15558-4-geomatsi@gmail.com>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-4-geomatsi@gmail.com>
Message-ID: <20171113082339.wzqq5ijnhlksuklq@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Sun, Nov 12, 2017 at 11:16:44PM +0300, Sergey Matyukevich wrote:
> Add support for Marvell Armada SoCs to arm-trusted-firmware package.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 7b1cc6ebb6..d6bde29894 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -39,6 +39,19 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
>  endif
>  
> +ifeq ($(BR2_TARGET_ARMADA_FIRMWARE),y)
> +ARMADA_FIRMWARE_IMAGE = $(call qstrip,$(BR2_TARGET_ARMADA_FIRMWARE_IMAGE))
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
> +	SCP_BL2=$(BINARIES_DIR)/$(ARMADA_FIRMWARE_IMAGE)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += armada-firmware
> +endif
> +
> +ifeq ($(BR2_TARGET_ARMADA_DDR),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
> +	MV_DDR_PATH=$(DL_DIR)/mv-ddr-marvell
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += armada-ddr
> +endif

These are not really optional dependencies of ATF in general. It's only the 
Marvell specific ATF version that needs them, and they are not optional.

I don't have any better suggestion at the moment.

baruch

> +
>  define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) \
>  		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
