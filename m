From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Nov 2016 21:25:50 +0100
Subject: [Buildroot] [PATCH 2/2] ti-pru-support: add staging files for
 PRU firmware
In-Reply-To: <1479324273-13589-2-git-send-email-ash.charles@savoirfairelinux.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1479324273-13589-2-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <ad91bcce-9a34-4ab4-2ac1-a59ec9ff6a45@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ash,

 In addition to Thomas's comments...

On 16-11-16 20:24, Ash Charles wrote:
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
> ---
>  package/Config.in                        |  1 +
>  package/ti-pru-support/Config.in         | 10 ++++++++++
>  package/ti-pru-support/ti-pru-support.mk | 25 +++++++++++++++++++++++++

 We now also include a hash file for git packages.

>  3 files changed, 36 insertions(+)
>  create mode 100644 package/ti-pru-support/Config.in
>  create mode 100644 package/ti-pru-support/ti-pru-support.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9ed296f..4f333c2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -463,6 +463,7 @@ endmenu
>  	source "package/sysstat/Config.in"
>  	source "package/targetcli-fb/Config.in"
>  	source "package/ti-gfx/Config.in"
> +	source "package/ti-pru-support/Config.in"
>  	source "package/ti-sgx-demos/Config.in"
>  	source "package/ti-sgx-km/Config.in"
>  	source "package/ti-sgx-um/Config.in"
> diff --git a/package/ti-pru-support/Config.in b/package/ti-pru-support/Config.in
> new file mode 100644
> index 0000000..af17d54
> --- /dev/null
> +++ b/package/ti-pru-support/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_TI_PRU_SUPPORT
> +	bool "TI PRU support"
> +	select BR2_PACKAGE_HOST_TI_CGT_PRU

 You need to propagate the dependencies from that package.

> +	help
> +	  This package provides useful headers and libraries for the
> +	  PRU unit found on some TI processors e.g. AM3358.  This
> +	  package provides staging only; the included labs and
> +	  examples aren't built.
> +
> +	  https://git.ti.com/pru-software-support-package/pru-software-support-package/trees/master

 Not a great URL, but I can't find anything better.

> diff --git a/package/ti-pru-support/ti-pru-support.mk b/package/ti-pru-support/ti-pru-support.mk
> new file mode 100644
> index 0000000..9adb859
> --- /dev/null
> +++ b/package/ti-pru-support/ti-pru-support.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# ti-pru-support
> +#
> +################################################################################
> +
> +TI_PRU_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
> +TI_PRU_SUPPORT_SITE = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git"

 Since upstream calls it pru-software-support-package, why not give the
buildroot package the same name? It's not needed to put ti- in front of it (we
also don't put gnu- in front of make).

> +TI_PRU_SUPPORT_LICENSE =  BSD-3c, GPLv2

 Since we only build/install the lib/src subdirectory, only that license
applies: BSD-3c. The only GPLv2 I could find is the dtsi but you're not
installing that.

> +TI_PRU_SUPPORT_LICENSE_FILES = PRU_Package-v5.0-Manifest.html
> +TI_PRU_SUPPORT_INSTALL_STAGING = YES

 Since this is not building for the actual target (ARM), I don't think it's
appropriate to install it to staging. In fact, I would call it a host package.


> +TI_PRU_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
> +
> +define TI_PRU_SUPPORT_BUILD_CMDS
> +	$(MAKE) PRU_CGT=$(PRU_CGT) -C $(@D)/lib/src
> +endef
> +
> +define TI_PRU_SUPPORT_INSTALL_STAGING_CMDS
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include
> +	cp -af $(@D)/include/* $(STAGING_DIR)/usr/include
> +	$(INSTALL) -d $(STAGING_DIR)/usr/lib
> +	$(INSTALL) -m 0644 $(@D)/lib/src/*/gen/*.lib $(STAGING_DIR)/usr/lib/

 Wouldn't it make more sense to install in $(PRU_CGT), so that it gets picked up
automatically when you build your own application?

 Regards,
 Arnout

> +endef
> +
> +$(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
