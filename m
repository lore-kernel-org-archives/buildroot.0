From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 11:38:07 +0100
Subject: [Buildroot] [PATCH 3/7] package/freescale-imx/imx-sc-firmware:
 bump to version 1.1 to support i.MX8QM
In-Reply-To: <20190909121525.13935-3-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
 <20190909121525.13935-3-maeva.manuel@nxp.com>
Message-ID: <20200205113807.04b1c60c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 Sep 2019 12:15:00 +0000
Maeva Manuel <maeva.manuel@nxp.com> wrote:

> Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>

I have applied, but with some changes. See below.

> -IMX_SC_FIRMWARE_VERSION = 1.0
> +IMX_SC_FIRMWARE_VERSION = 1.1

The bump to 1.2.1 was already done in commit
b74eaecb2232c4d2b717f867218ad731da836cbc, so I dropped this part.

>  IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
>  IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
>  
> @@ -18,10 +18,14 @@ endef
>  
>  IMX_SC_FIRMWARE_INSTALL_IMAGES = YES
>  define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
> -	# SCFW firmware is needed when generating imx8-boot-sd.bin which
> -	# is done in post-image script.
> -	cp $(@D)/mx8qx-mek-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-mek-scfw-tcm.bin
> -	cp $(@D)/mx8qx-val-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-val-scfw-tcm.bin
> +# SCFW firmware is needed when generating imx8-boot-sd.bin which
> +# is done in post-image script.
> +
> +# For i.MX8QM support the SCFW needed is mx8qm-mek-scfw-tcm.bin
> +# and mx8qm-val-scfw-tcm.bin
> +# For i.MX8QXP support the SCFW needed is mx8qx-mek-scfw-tcm.bin
> +# and mx8qx-val-scfw-tcm.bin
> +cp $(@D)/*-scfw-tcm.bin $(BINARIES_DIR)/*-scfw-tcm.bin

Code inside commands should be indented with one tab. Also, as pointed
out by Gary, it is preferable to only install what we really need, so I
changed this to:

+# SCFW firmware is needed when generating imx8-boot-sd.bin which is
+# done in post-image script.
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
 define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
-       # SCFW firmware is needed when generating imx8-boot-sd.bin which
-       # is done in post-image script.
        cp $(@D)/mx8qx-mek-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-mek-scfw-tcm.bin
        cp $(@D)/mx8qx-val-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-val-scfw-tcm.bin
 endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
+define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
+       cp $(@D)/mx8qm-*-scfw-tcm.bin $(BINARIES_DIR)/
+endef
+endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
