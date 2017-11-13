From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Nov 2017 10:00:00 +0200
Subject: [Buildroot] [PATCH/next 2/5] armada-ddr: new package
In-Reply-To: <20171112201646.15558-3-geomatsi@gmail.com>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-3-geomatsi@gmail.com>
Message-ID: <20171113080000.twkales7r7helbfr@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Sun, Nov 12, 2017 at 11:16:43PM +0300, Sergey Matyukevich wrote:
> This package adds Marvell Armada SoC DDR training algorithms.
> This code is not built separately, it is needed as dependency
> to build ATF firmware for Marvell Armada SoCs.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  boot/Config.in                  |  1 +
>  boot/armada-ddr/Config.in       | 16 ++++++++++++++++
>  boot/armada-ddr/armada-ddr.hash |  2 ++
>  boot/armada-ddr/armada-ddr.mk   | 20 ++++++++++++++++++++
>  4 files changed, 39 insertions(+)
>  create mode 100644 boot/armada-ddr/Config.in
>  create mode 100644 boot/armada-ddr/armada-ddr.hash
>  create mode 100644 boot/armada-ddr/armada-ddr.mk
> 
> diff --git a/boot/Config.in b/boot/Config.in
> index 0ffbd7288b..1363181fc5 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -18,5 +18,6 @@ source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
>  source "boot/xloader/Config.in"
>  source "boot/armada-firmware/Config.in"
> +source "boot/armada-ddr/Config.in"
>  
>  endmenu
> diff --git a/boot/armada-ddr/Config.in b/boot/armada-ddr/Config.in
> new file mode 100644
> index 0000000000..23b71b8345
> --- /dev/null
> +++ b/boot/armada-ddr/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_TARGET_ARMADA_DDR
> +	bool "armada-ddr"
> +	depends on BR2_aarch64
> +	help
> +	  Marvell keeps algorithms for DDR training in a separate repository.
> +	  This code is not built separately, it is needed as dependency
> +	  to build ATF firmware for Marvell Armada 7040 and 8040 SoCs.
> +
> +if BR2_TARGET_ARMADA_DDR
> +
> +config BR2_TARGET_ARMADA_DDR_VERSION
> +	string "Armada DDR training code version"
> +	help
> +	  Marvell Armada DDR training code version
> +
> +endif
> diff --git a/boot/armada-ddr/armada-ddr.hash b/boot/armada-ddr/armada-ddr.hash
> new file mode 100644
> index 0000000000..2dc36e0975
> --- /dev/null
> +++ b/boot/armada-ddr/armada-ddr.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 5f6f2b8c0742eb8b4ff716dc6715d20507c6ceadd5576aa446e407a428861de9 armada-ddr-mv_ddr-armada-17.10.tar.gz
> diff --git a/boot/armada-ddr/armada-ddr.mk b/boot/armada-ddr/armada-ddr.mk
> new file mode 100644
> index 0000000000..5f76bfd7ed
> --- /dev/null
> +++ b/boot/armada-ddr/armada-ddr.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# Marvell Armada DDR training code
> +#
> +################################################################################
> +
> +ARMADA_DDR_VERSION = $(call qstrip,$(BR2_TARGET_ARMADA_DDR_VERSION))

Here again, should be a static commit id.

> +ARMADA_DDR_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(ARMADA_DDR_VERSION))
> +ARMADA_DDR_LICENSE = Proprietary

The few files I looked into each have a few optional license headings, 
including a Commercial License, GPL-2.0+, GPL with exception, and BSD.

> +
> +ARMADA_DDR_INSTALL_IMAGES  = YES
> +
> +define ARMADA_DDR_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -m 0755 -d $(DL_DIR)/mv-ddr-marvell
> +	$(call suitable-extractor,$(notdir $(ARMADA_DDR_SOURCE))) \
> +		$(DL_DIR)/$(notdir $(ARMADA_DDR_SOURCE)) | \
> +		$(TAR) --strip-components=1 -C $(DL_DIR)/mv-ddr-marvell $(TAR_OPTIONS) -
> +endef

Can't you use $(BUILD_DIR)/... for ATF, where mv-ddr-marvell source are 
extracted anyway?

> +
> +$(eval $(generic-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
