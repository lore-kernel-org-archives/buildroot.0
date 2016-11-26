From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 12:07:55 +0100
Subject: [Buildroot] [PATCH v2 1/3] ti-cgt-pru: add package for PRU Host
	toolchain
In-Reply-To: <1480096200-20475-1-git-send-email-ash.charles@savoirfairelinux.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-1-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <760c58e7-fe45-501e-3c2c-b4cb33a5af4f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-11-16 18:49, Ash Charles wrote:
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
> Changes v1 --> v2
>  * extract source to $(@D) cleanly (suggested by Thomas)
>  * be more explicit about licensing (suggested by Arnout)
>  * switch to buildroot-suitable name: PRU_CGT --> TI_CGT_PRU_DIR
>  * sundry clarifications
> ---
[snip]

> diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
> new file mode 100644
> index 0000000..115eb0c
> --- /dev/null
> +++ b/package/ti-cgt-pru/ti-cgt-pru.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# ti-cgt-pru
> +#
> +################################################################################
> +
> +TI_CGT_PRU_VERSION = 2.1.3

 Any reason not to use 2.1.4?

> +TI_CGT_PRU_SOURCE = ti_cgt_pru_$(TI_CGT_PRU_VERSION)_linux_installer_x86.bin
> +TI_CGT_PRU_SITE = http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)
> +TI_CGT_PRU_LICENSE = TI Technology and Software Publicly Available License (compiler + PRU library), \
> +	Boost Software License 1.0 (compiler), \
> +	BSD-2c, BSD-3c, MIT, Academic Free License 3.0, Hewlett-Packard (PRU library)
> +TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.1.x_manifest.html \
> +	PRU_CodeGen_Library_2.1_0222433C-30C1-442d-B5C6-2073BD97F80F.spdx.tag
> +
> +define HOST_TI_CGT_PRU_EXTRACT_CMDS
> +	chmod +x $(DL_DIR)/$(TI_CGT_PRU_SOURCE)
> +	$(DL_DIR)/$(TI_CGT_PRU_SOURCE) --prefix $(@D) --mode unattended
> +        mv $(@D)/ti-cgt-pru_2.1.3/* $(@D)
> +        rmdir $(@D)/ti-cgt-pru_2.1.3/

 Indentation is wrong here: should be tabs. Also, use $(TI_CGT_PRU_VERSION)
instead of 2.1.3.


> +endef
> +
> +# Since this is largely prebuilt toolchain and likes to live in its own
> +# directory, put is in $(HOST_DIR)/ti-cgt-pru_$(CGT_PRU_VERION)
                    it
> +# Packages wanting to use this toolchain need to use this path as TI's
> +# standard PRU_CGT path e.g. make PRU_CGT=$(TI_CGT_PRU_DIR)...
> +
> +TI_CGT_PRU_DIR = $(HOST_DIR)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)

 Actually, TI_CGT_PRU_DIR is not good because we already define that name (it's
the build directory). It's not really a problem now because we only have a host
package so we only define HOST_TI_CGT_PRU_DIR, but still, it's inconsistent. So
the variable name should be e.g. TI_CGT_PRU_INSTALLDIR.

 Also, I don't think it's necessary to put the version in the installation
directory name. We're not going to support side-by-side install of different
versions. But that's just a minor nit.

 Regards,
 Arnout

> +define HOST_TI_CGT_PRU_INSTALL_CMDS
> +	mkdir -p $(TI_CGT_PRU_DIR)
> +	cp -dpfr $(@D)/* $(TI_CGT_PRU_DIR)
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
