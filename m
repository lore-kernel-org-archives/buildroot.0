From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 19:15:14 +0100
Subject: [Buildroot] [PATCH v2 2/9] firmware-imx: Use self-extractible
	helper
In-Reply-To: <1416432642-26005-3-git-send-email-jezz@sysmic.org>
References: <1416432642-26005-1-git-send-email-jezz@sysmic.org>
 <1416432642-26005-3-git-send-email-jezz@sysmic.org>
Message-ID: <20141127181514.GG3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-11-19 22:30 +0100, J?r?me Pouiller spake thusly:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index d26b31c..629149e 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -7,27 +7,19 @@
>  FIRMWARE_IMX_VERSION = $(FREESCALE_IMX_VERSION)
>  FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
>  FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
> +
> +# See freescale-imx.mk
>  FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
>  	Atheros license (ath6k)
> -FIRMWARE_IMX_LICENSE_FILES = licenses/vpu/EULA licenses/ath6k/AR6102/License.txt
> -# This is a legal minefield: the EULA specifies that
> -# the Board Support Package includes software and hardware (sic!)
> -# for which a separate license is needed...
> +FIRMWARE_IMX_LICENSE_FILES = EULA licenses/vpu/EULA licenses/ath6k/AR6102/License.txt
>  FIRMWARE_IMX_REDISTRIBUTE = NO
>  
>  FIRMWARE_IMX_BLOBS = ath6k sdma vpu
>  
> -# The archive is a shell-self-extractor of a bzipped tar. It happens
> -# to extract in the correct directory (firmware-imx-x.y.z)
> -# The --force makes sure it doesn't fail if the source dir already exists.
> -# The --auto-accept skips the license check - not needed for us
> -# because we have legal-info.
>  define FIRMWARE_IMX_EXTRACT_CMDS
> -	cd $(BUILD_DIR); \
> -	sh $(DL_DIR)/$(FIRMWARE_IMX_SOURCE) --force --auto-accept
> +	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(FIRMWARE_IMX_SOURCE))
>  endef
>  
> -
>  define FIRMWARE_IMX_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/lib/firmware
>  	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
