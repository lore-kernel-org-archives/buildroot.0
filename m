From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Nov 2016 21:07:27 +0100
Subject: [Buildroot] [PATCH 1/2] ti-cgt-pru: add package for PRU Host
 toolchain
In-Reply-To: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <68d3a1af-7921-2876-fd60-b560d64bf173@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-11-16 20:24, Ash Charles wrote:
> TI provides a binary code generation toolchain to develop firmware for
> the programmable real-time unit/co-processor found in some SOCs such as
> some models in the AM335x line. This toolchain includes C/C++ support
> (clpru) rather than just assembler (pasm) supported by the pre-existing
> am335x-pru-package [1].  Following the lead of the Yocto meta-ti
> layer [2], this package provides a host toolchain suitable for an x86
> (or x86_64) Linux targeting an ARM-based PRU core.
> 
> [1] http://processors.wiki.ti.com/index.php/PRU_Assembly_Instructions#pasm_vs._clpru
> [2] http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
> 
> Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>
> ---
>  package/Config.in.host             |  1 +
>  package/ti-cgt-pru/Config.in.host  | 11 +++++++++++
>  package/ti-cgt-pru/ti-cgt-pru.hash |  2 ++
>  package/ti-cgt-pru/ti-cgt-pru.mk   | 29 +++++++++++++++++++++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 package/ti-cgt-pru/Config.in.host
>  create mode 100644 package/ti-cgt-pru/ti-cgt-pru.hash
>  create mode 100644 package/ti-cgt-pru/ti-cgt-pru.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 3b115c5..e244694 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -39,6 +39,7 @@ menu "Host utilities"
>  	source "package/squashfs/Config.in.host"
>  	source "package/sunxi-tools/Config.in.host"
>  	source "package/tegrarcm/Config.in.host"
> +	source "package/ti-cgt-pru/Config.in.host"
>  	source "package/uboot-tools/Config.in.host"
>  	source "package/util-linux/Config.in.host"
>  	source "package/vboot-utils/Config.in.host"
> diff --git a/package/ti-cgt-pru/Config.in.host b/package/ti-cgt-pru/Config.in.host
> new file mode 100644
> index 0000000..440f774
> --- /dev/null
> +++ b/package/ti-cgt-pru/Config.in.host
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_HOST_TI_CGT_PRU
> +	bool "host ti-cgt-pru"
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	help
> +	  This package provides the Code Generation Tools for the PRU
> +	  unit found on some TI processors e.g. AM3358.
> +
> +	  Note: this is a binary cross toolchain that runs on x86 hosts
> +	        targeting ARM PRU cores.

 I wouldn't say "ARM PRU", that sounds as if the PRU is an ARM.

> +
> +	  https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm#PRU

 I think
http://processors.wiki.ti.com/index.php/Programmable_Realtime_Unit_Software_Development
is  a much more useful URL.


> diff --git a/package/ti-cgt-pru/ti-cgt-pru.hash b/package/ti-cgt-pru/ti-cgt-pru.hash
> new file mode 100644
> index 0000000..1c19b33
> --- /dev/null
> +++ b/package/ti-cgt-pru/ti-cgt-pru.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	df85cd1ed3aea12d577854ece11bf5f2af6ace8c39959eea4cf2fa5973924e0e	ti_cgt_pru_2.1.3_linux_installer_x86.bin
> diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
> new file mode 100644
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
> +TI_CGT_PRU_LICENSE =  BSD-3c, MIT, TI-TSPA

 We prefer to specify a bit which license applies to which part. In addition,
the TSPA kind of eats up the other licenses, so I'd put it in front. You're also
missing a few licenses. Finally, the title of the non-standardized licenses
should be in full. So something like this:

TI_CGT_PRU_LICENSE = TI Technology and Software Publicly Available License
(compiler + PRU library), \
	Boost Software License 1.0 (compiler), \
 	BSD-2c, BSD-3c, MIT, Academic Free License 3.0, Hewlett-Packard (PRU library)

> +TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.1.x_manifest.html

 Part of the license text is only in
PRU_CodeGen_Library_2.1_0222433C-30C1-442d-B5C6-2073BD97F80F.spdx.tag


 Regards,
 Arnout

> +
> +define HOST_TI_CGT_PRU_EXTRACT_CMDS
> +	chmod +x $(DL_DIR)/$(TI_CGT_PRU_SOURCE)
> +	$(DL_DIR)/$(TI_CGT_PRU_SOURCE) --prefix $(@D) --mode unattended
> +endef
> +
> +# Since this is largely prebuilt toolchain and likes to live in its own
> +# directory, put is in $(HOST_DIR)/ti-cgt-pru_$(CGT_PRU_VERION)
> +# Packages wanting to use this toolchain need to use this path as TI's
> +# standard PRU_CGT path.
> +
> +PRU_CGT = $(HOST_DIR)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)
> +define HOST_TI_CGT_PRU_INSTALL_CMDS
> +	$(INSTALL) -d $(PRU_CGT)
> +	cp -af $(@D)/$(notdir $(PRU_CGT)) $(HOST_DIR)
> +endef
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
