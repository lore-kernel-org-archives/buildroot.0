From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 23:40:02 +0100
Subject: [Buildroot] [PATCH v3 2/2] pru-software-support: add library
 for PRU firmware
In-Reply-To: <1480346294-22771-2-git-send-email-ash.charles@savoirfairelinux.com>
References: <1480346294-22771-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480346294-22771-2-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <20161130234002.0aa1f6dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 10:18:14 -0500, Ash Charles wrote:
> TI provides a set of headers files and libraries useful in developing
> firmware for real-time (PRU) cores embedded in some processors e.g.
> AM3358.  This package stages these files for any packages creating
> PRU firmware.
> 
> Note: As per [1], use commit v4.0.2 to sync with common TI Linux
>       versions.
> 
> [1] http://e2e.ti.com/support/arm/sitara_arm/f/791/p/552190/2018113#2018113
> 
> Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>

Thanks again for this new iteration. I think we're really close to
having something that we can merge.

> diff --git a/package/pru-software-support/Config.in b/package/pru-software-support/Config.in
> new file mode 100644
> index 0000000..94981db
> --- /dev/null
> +++ b/package/pru-software-support/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PRU_EXAMPLES
> +     bool "PRU sample firmware"

Indentation is wrong throughout this file: it should use one tab for
indentation.

The prompt should be just:

	pru-software-support

just like the package name.

> +     depends on BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT

This should be a select.

> +     help
> +       PRU firmware examples extracted for TI's PRU software support

for -> from

> +       package. See readme.txt for installation details.
> diff --git a/package/pru-software-support/Config.in.host b/package/pru-software-support/Config.in.host
> new file mode 100644
> index 0000000..aeb9efe
> --- /dev/null
> +++ b/package/pru-software-support/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT
> +	bool "host PRU software support"

	bool "host pru-software-support"

> +	depends on BR2_PACKAGE_HOST_TI_CGT_PRU

This should be a select

> +	help
> +	  This package provides useful headers and libraries for the
> +	  PRU unit found on some TI processors e.g. AM3358.  This
> +	  package provides staging only; the included labs and
> +	  examples aren't built.

I think "provides staging only" is a bit misleading, especially when
this package doesn't install anything in staging in fact.

Also: "the included labs and examples aren't built, they can be built
using the corresponding target package."

> +	  https://git.ti.com/pru-software-support-package/pru-software-support-package
> diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
> new file mode 100644
> index 0000000..bc90086
> --- /dev/null
> +++ b/package/pru-software-support/pru-software-support.hash
> @@ -0,0 +1,2 @@
> +# Locally-calculated hash for git checkout

Just "Locally calculated hash".

> +sha256	b257535ca9b1641d1a238795f3c7004064c573a91cf4a1fa566e3f7c2360c38f	pru-software-support-804b548e69ef9fdf44445f6d0968d81cb8a1e7b4.tar.gz
> diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
> new file mode 100644
> index 0000000..7705fe0
> --- /dev/null
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# pru-software-support
> +#
> +################################################################################
> +
> +PRU_SOFTWARE_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
> +PRU_SOFTWARE_SUPPORT_SITE = git://git.ti.com/pru-software-support-package/pru-software-support-package.git
> +PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c
> +PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU_Package-v5.0-Manifest.html
> +PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru

Doesn't the target of pru-software-support depends on the host variant
being built/installed?

> +
> +define HOST_PRU_SOFTWARE_SUPPORT_BUILD_CMDS
> +	$(MAKE) PRU_CGT=$(TI_CGT_PRU_INSTALLDIR) -C $(@D)/lib/src
> +endef
> +
> +# install this library support alongside PRU toolchain i.e.
> +# everything in TI_CGT_PRU_INSTALLDIR as PRU_CGT
> +define HOST_PRU_SOFTWARE_SUPPORT_INSTALL_CMDS
> +	mkdir -p $(TI_CGT_PRU_INSTALLDIR)/usr/include
> +	cp -dpfr $(@D)/include/* $(TI_CGT_PRU_INSTALLDIR)/usr/include
> +	mkdir -p $(TI_CGT_PRU_INSTALLDIR)/usr/lib
> +	cp -dpfr $(@D)/lib/src/*/gen/*.lib $(TI_CGT_PRU_INSTALLDIR)/usr/lib/
> +endef
> +
> +define PRU_SOFTWARE_SUPPORT_BUILD_CMDS
> +	$(MAKE) PRU_CGT=$(TI_CGT_PRU_INSTALLDIR) -C $(@D)/examples
> +endef
> +
> +define PRU_SOFTWARE_SUPPORT_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/share/pru-software-support
> +	cp -dpfr $(@D)/examples/* $(TARGET_DIR)/usr/share/pru-software-support/
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

Otherwise, looks good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
