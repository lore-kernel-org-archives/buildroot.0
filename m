From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 12:27:14 +0100
Subject: [Buildroot] [PATCH v2 2/3] pru-software-support: add library
	for PRU firmware
In-Reply-To: <1480096200-20475-2-git-send-email-ash.charles@savoirfairelinux.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-2-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <1c417375-fe37-9cc8-5747-87c670b3e51f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-11-16 18:49, Ash Charles wrote:
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
[snip]
> diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
> new file mode 100644
> index 0000000..bbff1db
> --- /dev/null
> +++ b/package/pru-software-support/pru-software-support.hash
> @@ -0,0 +1,2 @@
> +# no hash for git checkout

 Where do you get this from? It's been more than a year now that this is no
longer true, do we still have documentation bits saying that there should be no
hash for git downloads?

 For git downloads, add a locally calculated sha256.

> +none	xxx	pru-software-support-804b548e69ef9fdf44445f6d0968d81cb8a1e7b4.tar.gz
> diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
> new file mode 100644
> index 0000000..366680a
> --- /dev/null
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -0,0 +1,26 @@
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
> +
> +define HOST_PRU_SOFTWARE_SUPPORT_BUILD_CMDS
> +	$(MAKE) PRU_CGT=$(TI_CGT_PRU_DIR) -C $(@D)/lib/src
> +endef
> +
> +# install this library support alongside PRU toolchain i.e.
> +# everything in TI_CGT_PRU_DIR as PRU_CGT
> +define HOST_PRU_SOFTWARE_SUPPORT_INSTALL_CMDS
> +	mkdir -p $(TI_CGT_PRU_DIR)/usr/include
> +	cp -dpfr $(@D)/include/* $(TI_CGT_PRU_DIR)/usr/include
> +	mkdir -p $(TI_CGT_PRU_DIR)/usr/lib
> +	$(INSTALL) -m 0644 $(@D)/lib/src/*/gen/*.lib $(TI_CGT_PRU_DIR)/usr/lib/
> +endef

 Otherwise, looks good to me.

 Regards,
 Arnout

> +
> +$(eval $(host-generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
