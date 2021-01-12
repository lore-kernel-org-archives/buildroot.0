From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 12 Jan 2021 23:50:33 +0100
Subject: [Buildroot] [PATCH v2 1/8] package/freescale-imx/firmware-imx:
 bump version to 8.10
In-Reply-To: <20210105152420.26379-2-stephane.viau@oss.nxp.com>
References: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
 <20210105152420.26379-2-stephane.viau@oss.nxp.com>
Message-ID: <636366db-0dd3-4a30-7097-d09423d91aa8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 05/01/2021 ? 16:24, Stephane Viau a ?crit?:
> - Same version as NXP release 5.4.70-2.3.0
> - EULA/COPYING: update to LA_OPT_NXP_Software_License v17
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Not related to this patch, but why those firmware are installed to
$(TARGET_DIR)/lib/firmware/imx ?

Because without any change I get:

coda 2040000.vpu: Direct firmware load for vpu/vpu_fw_imx6q.bin failed with error -2
coda 2040000.vpu: Falling back to sysfs fallback for: vpu/vpu_fw_imx6q.bin
coda 2040000.vpu: Direct firmware load for v4l-coda960-imx6q.bin failed with
error -2
coda 2040000.vpu: Falling back to sysfs fallback for: v4l-coda960-imx6q.bin
coda 2040000.vpu: firmware request failed

It seems that vpu directory is expected to be in "firmware" directory:
$(TARGET_DIR)/lib/firmware/vpu

see:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8af7779f3cbc1f6720d15f00abc797493710d1ab

At least we have to create a simlink:
/lib/firmware/imx/vpu -> /lib/firmware/vpu

or set fw_path_para in the kernel cmdline:
firmware_class.path=/lib/firmware/imx/

Best regards,
Romain

> ---
> v2:
> - Add "EULA/COPYING: update to LA_OPT_NXP_Software_License v17" in
>   commit log (Gary)
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
>  package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
> index 3230677d49..0a717d40f5 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  a72f70fd2ecaa58800bb88ed672fddc322ab9843ee7777eb89b82016b0aa3614  firmware-imx-8.9.bin
> -sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
> -sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
> +sha256  2b70f169d4065b2a7ac7a676afe24636128bd2dacc9f5230346758c3b146b2be  firmware-imx-8.10.bin
> +sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
> +sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 7d1f42f1d8..b33ffb7ee8 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FIRMWARE_IMX_VERSION = 8.9
> +FIRMWARE_IMX_VERSION = 8.10
>  FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
>  FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
>  
> 
