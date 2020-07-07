From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 7 Jul 2020 14:37:31 +0200
Subject: [Buildroot] [PATCH 2/3] package: Add new fip package
In-Reply-To: <20200707075339.389528-3-mylene.josserand@collabora.com>
References: <20200707075339.389528-1-mylene.josserand@collabora.com>
 <20200707075339.389528-3-mylene.josserand@collabora.com>
Message-ID: <6788c3c4-14c6-5f97-323c-e588fc954198@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Myl?ne,

Le 07/07/2020 ? 09:53, Myl?ne Josserand a ?crit?:
> Firmware Image Pacakge (FIP) is used to sign Amlogic u-boot binaries.
> It is a host package as it is only binaries to call on u-boot image
> to sign it. One tool is a python script that needs to be called with
> 'python' command, otherwise, it is not working. That is why there is
> a dependency on host-python.
> 
> For the moment, only LePotato's board is supported. Other ones
> may be added later, if needed.

We had a previous contribution about LePotato board from Baylibre [1].
There are several concerns about licensing, aml_encrypt_gxl and acs_tool.py.

What about gxlimg to replace aml_encrypt_gxl?

[1]
http://patchwork.ozlabs.org/project/buildroot/patch/1533545408-11248-2-git-send-email-narmstrong at baylibre.com/
[2] https://github.com/repk/gxlimg

Best regards,
Romain

> 
> Signed-off-by: Myl?ne Josserand <mylene.josserand@collabora.com>
> ---
>  package/Config.in.host     |  1 +
>  package/fip/Config.in.host | 17 +++++++++++++++++
>  package/fip/fip.hash       |  2 ++
>  package/fip/fip.mk         | 30 ++++++++++++++++++++++++++++++
>  4 files changed, 50 insertions(+)
>  create mode 100644 package/fip/Config.in.host
>  create mode 100644 package/fip/fip.hash
>  create mode 100644 package/fip/fip.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index f1246c708f..21d2bc4072 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -24,6 +24,7 @@ menu "Host utilities"
>  	source "package/f2fs-tools/Config.in.host"
>  	source "package/faketime/Config.in.host"
>  	source "package/fatcat/Config.in.host"
> +	source "package/fip/Config.in.host"
>  	source "package/fwup/Config.in.host"
>  	source "package/genext2fs/Config.in.host"
>  	source "package/genimage/Config.in.host"
> diff --git a/package/fip/Config.in.host b/package/fip/Config.in.host
> new file mode 100644
> index 0000000000..914020a1b3
> --- /dev/null
> +++ b/package/fip/Config.in.host
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_HOST_FIP
> +	bool "host Amlogic FIP binaries"
> +	help
> +	  This package contains the FIP utilities, that is
> +	  used to create U-Boot final binary.
> +
> +if BR2_PACKAGE_HOST_FIP
> +
> +config BR2_PACKAGE_HOST_FIP_LEPOTATO
> +	bool "FIP lepotato version"
> +	default y
> +	select BR2_PACKAGE_HOST_PYTHON3
> +	help
> +	  This option will download the latest libretech-cc's version
> +	  of the fip utility for the board "lepotato".
> +
> +endif
> diff --git a/package/fip/fip.hash b/package/fip/fip.hash
> new file mode 100644
> index 0000000000..547fff8534
> --- /dev/null
> +++ b/package/fip/fip.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 7a59dc36c89b02c38f9b630b4abb7056869ff76ca6152b6c3ce797ddd1349a64  fip-bfdad4cc520b254813536ebfba8b9749386cd57c.tar.gz
> diff --git a/package/fip/fip.mk b/package/fip/fip.mk
> new file mode 100644
> index 0000000000..d1fb43ad13
> --- /dev/null
> +++ b/package/fip/fip.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# fip
> +#
> +################################################################################
> +
> +FIP_VERSION = bfdad4cc520b254813536ebfba8b9749386cd57c
> +FIP_SITE = $(call github,LibreELEC,amlogic-boot-fip,$(FIP_VERSION))
> +FIP_LICENSE = PROPRIETARY
> +FIP_DEPENDENCIES = host-python3
> +
> +ifeq ($(BR2_PACKAGE_HOST_FIP_LEPOTATO),y)
> +HOST_FIP_LEPOTATO_BINARIES += lepotato/bl2.bin lepotato/acs.bin \
> +			lepotato/bl21.bin lepotato/bl30.bin \
> +			lepotato/bl301.bin lepotato/bl31.img \
> +			lepotato/blx_fix.sh lepotato/acs_tool.py lepotato/aml_encrypt_gxl
> +endif
> +
> +define HOST_FIP_INSTALL_SUBDIR
> +	$(INSTALL) -m 0755 -d $(HOST_DIR)/usr/bin/fip/
> +endef
> +
> +define HOST_FIP_INSTALL_CMDS
> +	$(foreach b,$(HOST_FIP_LEPOTATO_BINARIES),
> +		$(INSTALL) -D -m 755 $(@D)/$(b) $(HOST_DIR)/usr/bin/fip/)
> +endef
> +
> +HOST_FIP_PRE_INSTALL_HOOKS += HOST_FIP_INSTALL_SUBDIR
> +
> +$(eval $(host-generic-package))
> 
