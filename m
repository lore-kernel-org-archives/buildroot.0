From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Nov 2016 16:44:20 +0100
Subject: [Buildroot] [PATCH 1/2] ti-cgt-pru: add package for PRU Host
 toolchain
In-Reply-To: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <20161124164420.792cab0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Nov 2016 14:24:32 -0500, Ash Charles wrote:

> diff --git a/package/ti-cgt-pru/Config.in.host b/package/ti-cgt-pru/Config.in.host
> new file mode 100644
> index 0000000..440f774
> --- /dev/null
> +++ b/package/ti-cgt-pru/Config.in.host
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_HOST_TI_CGT_PRU
> +	bool "host ti-cgt-pru"
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

	depends on BR2_arm

would probably be nice here.

> +	help
> +	  This package provides the Code Generation Tools for the PRU
> +	  unit found on some TI processors e.g. AM3358.
> +
> +	  Note: this is a binary cross toolchain that runs on x86 hosts
> +	        targeting ARM PRU cores.

No need to align this second line.


> index 0000000..a4c8566
> --- /dev/null
> +++ b/package/ti-cgt-pru/ti-cgt-pru.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# ti-cgt-pru
> +#
> +################################################################################
> +
> +TI_CGT_PRU_VERSION = 2.1.3
> +TI_CGT_PRU_SOURCE = ti_cgt_pru_$(TI_CGT_PRU_VERSION)_linux_installer_x86.bin
> +TI_CGT_PRU_SITE = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)/"

Remove double quotes.

> +TI_CGT_PRU_LICENSE =  BSD-3c, MIT, TI-TSPA
> +TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.1.x_manifest.html
> +
> +define HOST_TI_CGT_PRU_EXTRACT_CMDS
> +	chmod +x $(DL_DIR)/$(TI_CGT_PRU_SOURCE)
> +	$(DL_DIR)/$(TI_CGT_PRU_SOURCE) --prefix $(@D) --mode unattended

Add:

	mv $(@D)/ti-cgt-pru_2.1.3/* $(@D)
	rmdir $(@D)/ti-cgt-pru_2.1.3/

> +endef
> +
> +# Since this is largely prebuilt toolchain and likes to live in its own
> +# directory, put is in $(HOST_DIR)/ti-cgt-pru_$(CGT_PRU_VERION)
> +# Packages wanting to use this toolchain need to use this path as TI's
> +# standard PRU_CGT path.
> +
> +PRU_CGT = $(HOST_DIR)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)

I'd think I'd prefer:

TI_PRU_CGT = $(HOST_DIR)/usr/share/ti-cgt-pru/

> +define HOST_TI_CGT_PRU_INSTALL_CMDS
> +	$(INSTALL) -d $(PRU_CGT)

We usually use 'mkdir -p' instead.

> +	cp -af $(@D)/$(notdir $(PRU_CGT)) $(HOST_DIR)

	cp -dpfr $(@D)/* $(TI_PRU_CGT)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
