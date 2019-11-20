From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 10:13:22 +0100
Subject: [Buildroot] [PATCH 6/9] package/freescale-qoriq/cadence: new
 package
In-Reply-To: <20191120040725.32207-7-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-7-jerry.huang@nxp.com>
Message-ID: <20191120101322.00088afe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Nov 2019 12:07:22 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> This package provides the firmware for LS1028ARDB DP (display port).
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
>  package/freescale-qoriq/Config.in          |  2 ++
>  package/freescale-qoriq/cadence/Config.in  |  9 +++++++++
>  package/freescale-qoriq/cadence/cadence.mk | 19 +++++++++++++++++++

We need an entry in the DEVELOPERS file for this package.

Also, "cadence" is not descriptive enough as a package name.
freescale-qoriq-cadence-dp-firmware perhaps? It's a bit long, but at
least it's descriptive.

>  3 files changed, 30 insertions(+)
>  create mode 100644 package/freescale-qoriq/cadence/Config.in
>  create mode 100644 package/freescale-qoriq/cadence/cadence.mk

The .hash file is missing.

> diff --git a/package/freescale-qoriq/cadence/Config.in b/package/freescale-qoriq/cadence/Config.in
> new file mode 100644
> index 0000000000..67292a799f
> --- /dev/null
> +++ b/package/freescale-qoriq/cadence/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_CADENCE
> +	bool "display port firmware"

This should be just the package name.

> +	help
> +	Display Port, a resident EL3 firmware.

Indentation is not correct, we also need a link to some upstream web
site that gives details about this firmware.

Just curious: the DisplayPort really needs a firmware that runs on the
main CPU, at EL3 ? This is pretty scary :-/ How does it get loaded ?

> +if BR2_PACKAGE_CADENCE
> +config BR2_PACKAGE_CADENCE_DP_BIN
> +	string "Custom DP Firmware BIN"

This is not needed, there is a single firmware image in the archive,
just hardcode it in the package.

> +endif
> diff --git a/package/freescale-qoriq/cadence/cadence.mk b/package/freescale-qoriq/cadence/cadence.mk
> new file mode 100644
> index 0000000000..dd78411e15
> --- /dev/null
> +++ b/package/freescale-qoriq/cadence/cadence.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# DP firmware for NXP layerscape platforms

Just the name of the package.

> +#
> +################################################################################
> +CADENCE_INSTALL_IMAGES = YES

One empty line between the comment header and the first variable.

Also, please specify _INSTALL_TARGET = NO

> +DP_BIN = $(call qstrip,$(BR2_PACKAGE_CADENCE_DP_BIN))

As per the comment above, this is not needed.

> +
> +define CADENCE_BUILD_CMDS
> +	cd $(@D)/ && wget http://www.nxp.com/lgfiles/sdk/lsdk1909/firmware-cadence-lsdk1909.bin &&\

Urgh, this is horrible: you are completely bypassing Buildroot's
download infrastructure. Please use it:

<pkg>_VERSION = lsdk1909
<pkg>_SITE = http://www.nxp.com/lgfiles/sdk/lsdk1909/
<pkg>_SOURCE = firmware-cadence-$(<pkg>_VERSION).bin

define <pkg>_EXTRACT_CMDS
	cd $(@D); \
		sh $(<pkg>_DL_DIR)/$(<pkg>_SOURCE) --auto-accept
endef

> +define CADENCE_INSTALL_IMAGES_CMDS
> +	cp $(@D)/firmware-cadence-lsdk1909/dp/$(DP_BIN) $(BINARIES_DIR)/;

Use:

	$(INSTALL) -D -m 0644 $(@D)/firmware-cadence-lsdk1909/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin

Also, please add the appropriate licensing information, since there is
a COPYING file in the archive.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
