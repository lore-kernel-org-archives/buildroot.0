From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 22:15:31 +0100
Subject: [Buildroot] [PATCH v2 02/10]
 package/freescale-qoriq/fsl-qoriq-rcw: move rcw into freescale-qoriq and
 rename it
In-Reply-To: <20191121102324.35225-3-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-3-jerry.huang@nxp.com>
Message-ID: <20191125221531.0ce79006@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Nov 2019 18:23:16 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> From: Jerry Huang <jerry.huang@nxp.com>
> 
> Move package/rcw into package/freescale-qoriq,
> and rename it to fsl-qoriq-rcw.
> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>

Then, this package should be named nxp-qoriq-rcw, if you decide to name
the directory nxp-qoriq/.

> ---
> changes since v1:
> 1. new patch
> 2. move rcw to sub-directory freescale-qoriq
> 3. rename to fsl-qoriq-rcw
> ---
>  DEVELOPERS                                    |  2 +-
>  package/Config.in.host                        |  2 +-

You need Config.in.legacy handling due to the renaming of the option.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 19ea83df3b..9fbe229eb7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1603,7 +1603,7 @@ F:	package/python-pyrex/
>  F:	package/python-tinyrpc/
>  F:	package/python-txdbus/
>  F:	package/raptor/
> -F:	package/rcw/
> +F:	package/freescale-qoriq/fsl-qoriq-rcw/

Please preserve alphabetic ordering.

>  F:	package/rng-tools/
>  F:	package/rsyslog/
>  F:	package/setools/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 758c268e00..e4840080ad 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -62,7 +62,7 @@ menu "Host utilities"
>  	source "package/qemu/Config.in.host"
>  	source "package/raspberrypi-usbboot/Config.in.host"
>  	source "package/rauc/Config.in.host"
> -	source "package/rcw/Config.in.host"
> +	source "package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host"

Ditto: alphabetic ordering.

> -RCW_VERSION = LSDK-18.12
> -RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
> -RCW_SITE_METHOD = git
> -RCW_LICENSE = BSD-3-Clause
> -RCW_LICENSE_FILES = LICENSE
> +FSL_QORIQ_RCW_VERSION = LSDK-18.12
> +FSL_QORIQ_RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
> +FSL_QORIQ_RCW_SITE_METHOD = git
> +FSL_QORIQ_RCW_LICENSE = BSD-3-Clause
> +FSL_QORIQ_RCW_LICENSE_FILES = LICENSE
>  
>  RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))

How come the BR2_PACKAGE_HOST_RCW_CUSTOM_PATH option is not renamed ?

Also RCW_FILES should become NXP_QORIQ_RCW_FILES. All variables in the
.mk file should be renamed.

> -define HOST_RCW_ADD_CUSTOM_RCW_FILES
> +define HOST_FSL_QORIQ_RCW_ADD_CUSTOM_RCW_FILES
>  	mkdir -p $(@D)/custom_board/rcw
>  	cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board
>  	cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw
>  endef
>  HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES

If you don't change the hook registration, the hook will never be
called. Please check globally in this patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
