From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 23:12:21 +0100
Subject: [Buildroot] [PATCH v2 07/10]
 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
In-Reply-To: <20191121102324.35225-8-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-8-jerry.huang@nxp.com>
Message-ID: <20191125231221.743cd7ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Nov 2019 18:23:21 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> From: Jerry Huang <jerry.huang@nxp.com>
> 
> This package provides the firmware for LS1028ARDB DP (display port).
> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>

Overall, looks pretty good. Rename to nxp-qoriq-... if you decide to
use the nxp branding.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9fbe229eb7..b15115f507 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2545,3 +2545,6 @@ F:	package/qjson/
>  F:	package/quazip/
>  F:	package/shapelib/
>  F:	package/tinc/
> +
> +N:	Changming Huang <jerry.huang@nxp.com>

Please sort your name at the right place in the DEVELOPERS file
(alphabetic ordering).

> diff --git a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
> new file mode 100644
> index 0000000000..9259776750
> --- /dev/null
> +++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_FSL_QORIQ_CADENCE_DP_FW
> +	bool "FSL QorIQ cadence DP firmware"

Just:

	bool "fsl-qorirq-cadence-dp-fw

> +	help
> +	  FSL QorIQ cadence DP firmware, a resident EL3 firmware.
> +	  link: http://www.nxp.com/lgfiles/sdk/lsdk1909/firmware-cadence-lsdk1909.bin

One empty line between the description and the upstream URL, and no
"link: " before the link. Also, pointing to the binary file itself is
not useful, we need an actual web page. If none exist, just don't
provide an upstream URL.

> diff --git a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.hash b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.hash
> new file mode 100644
> index 0000000000..bee912bee1
> --- /dev/null
> +++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin

Hash of the license file is missing.

> diff --git a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.mk b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.mk
> new file mode 100644
> index 0000000000..d0d112e25f
> --- /dev/null
> +++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# fsl-qoriq-cadence-dp-fw
> +#
> +################################################################################
> +
> +FSL_QORIQ_CADENCE_DP_FW_VERSION = lsdk1909
> +FSL_QORIQ_CADENCE_DP_FW_SITE = http://www.nxp.com/lgfiles/sdk/lsdk1909
> +FSL_QORIQ_CADENCE_DP_FW_SOURCE = firmware-cadence-$(FSL_QORIQ_CADENCE_DP_FW_VERSION).bin
> +FSL_QORIQ_CADENCE_DP_FW_LICENSE = NXP-Binary-EULA
> +FSL_QORIQ_CADENCE_DP_FW_LICENSE_FILES = COPYING
> +FSL_QORIQ_CADENCE_DP_FW_INSTALL_IMAGES = YES
> +FSL_QORIQ_CADENCE_DP_FW_INSTALL_TARGET = no

Should be "NO" (upper_case)

> +
> +define FSL_QORIQ_CADENCE_DP_FW_EXTRACT_CMDS
> +	cd $(@D); \
> +		sh $(FSL_QORIQ_CADENCE_DP_FW_DL_DIR)/$(FSL_QORIQ_CADENCE_DP_FW_SOURCE) --auto-accept;

Final semi-colon not needed.

> +endef
> +
> +define FSL_QORIQ_CADENCE_DP_FW_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/firmware-cadence-lsdk1909/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
> +endef
> +
> +$(eval $(generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
