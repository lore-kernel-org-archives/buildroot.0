From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 14 Jan 2021 22:16:42 +0100
Subject: [Buildroot] [PATCH v2] package/freescale-imx/firmware-imx: fix
 the VPU firmware location
In-Reply-To: <20210113223039.14401-1-festevam@gmail.com>
References: <20210113223039.14401-1-festevam@gmail.com>
Message-ID: <31fed583-ec07-e013-adf1-86fc61b74c00@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

Le 13/01/2021 ? 23:30, Fabio Estevam a ?crit?:
> The mainline kernel searches the coda VPU firmware inside the following
> locations [1]:
> 
> /lib/firmware/
> /lib/firmware/vpu/
> 
> Currently Buildroot installs the coda firmware into /lib/firmware/imx/vpu,
> which is not a valid location.
> 
> Fix it by installing the coda firmwares into /lib/firmware/vpu/ which
> is a valid path for both mainline and NXP vendor kernels. Also create a
> symlink to /lib/firmware/ so that mainline kernels do not need to wait
> more than 60 seconds to search again inside /lib/firmware/vpu/.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8af7779f3cbc1f6720d15f00abc797493710d1ab
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Suggested-by: Romain Naour <romain.naour@gmail.com>

Acked-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Create symlinks to /lib/firmware to speed up mainline kernels to
> found the VPU firmware.
> 
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 7d1f42f1d87b..6fba4e8a0cb3 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -116,9 +116,11 @@ endif
>  FIRMWARE_IMX_VPU_FW_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME))
>  ifneq ($(FIRMWARE_IMX_VPU_FW_NAME),)
>  define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
> -	mkdir -p $(TARGET_DIR)/lib/firmware/imx/vpu
> -	cp $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin \
> -		$(TARGET_DIR)/lib/firmware/imx/vpu/
> +	mkdir -p $(TARGET_DIR)/lib/firmware/vpu
> +	for i in $$(find $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin); do \
> +		cp $$i $(TARGET_DIR)/lib/firmware/vpu/ ; \
> +		ln -sf vpu/$$(basename $$i) $(TARGET_DIR)/lib/firmware/$$(basename $$i) ; \
> +	done
>  endef
>  endif
>  
> 
