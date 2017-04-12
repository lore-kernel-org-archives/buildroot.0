From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Apr 2017 15:19:49 +0200
Subject: [Buildroot] [PATCH] system: add option to pass genimage config
	files
In-Reply-To: <20170410153439.11004-1-etienne.phelip@savoirfairelinux.com>
References: <20170410153439.11004-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <9e948362-952b-ad2c-8d3e-93590a7f3772@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Etienne,

On 10-04-17 17:34, Etienne Phelip wrote:
> Add a new Kconfig entry to allow users to provide a list of genimage
> config files.
> 
> A new target is added to the Makefile in order to execute the
> support/scripts/genimage.sh script for each provided config files.
> 
> The new target-genimage target depends on target-post-image, thus
> update the world target dependency.
> 
> Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
> ---
> 
> Changes since RFC:
>  - add BR2_GENIMAGE_CFG_FILES_SELECT blind helper option
> 
> Board configs will be changed incrementally.
> 
>  Makefile         |  9 +++++++--
>  system/Config.in | 15 +++++++++++++++
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 941bf78..3bb1b1c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -546,11 +546,11 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
>  
>  prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>  
> -world: target-post-image
> +world: target-genimage
>  
>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>  	legal-info legal-info-prepare legal-info-clean printvars help \
> -	list-defconfigs target-finalize target-post-image source-check
> +	list-defconfigs target-finalize target-post-image target-genimage source-check

 Line becomes too long, split it.

>  
>  # Populating the staging with the base directories is handled by the skeleton package
>  $(STAGING_DIR):
> @@ -719,6 +719,11 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
>  		$(call MESSAGE,"Executing post-image script $(s)"); \
>  		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>  
> +target-genimage: target-post-image
> +	@$(foreach c, $(call qstrip,$(BR2_GENIMAGE_CFG_FILES)), \
> +		$(call MESSAGE,"Executing genimage with config $(c)"); \
> +		$(EXTRA_ENV) ./support/scripts/genimage.sh -c $(c)$(sep))

 As I mentioned somewhere else: the genimage.sh script should expect
BINARIES_DIR as its first argument, so it can be used directly as a post-image
script. In that case, of course, this call should be updated as well.

> +
>  source: $(foreach p,$(PACKAGES),$(p)-all-source)
>  
>  _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
> diff --git a/system/Config.in b/system/Config.in
> index b47ae43..77073a0 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -563,4 +563,19 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
>  	  directory / images directory. The arguments in this option will be
>  	  passed *after* those.
>  
> +config BR2_GENIMAGE_CFG_FILES
> +	string "genimage config files passed to genimage"
> +	default ""
> +	help
> +	  Specify a space-separated list of genimage config files to used by
> +	  genimage after the post-image script has been executed.
> +
> +	  This can be used to generate multiple binary image for one or more
                                                            ^s


 Regards,
 Arnout

> +	  mediums (e.g. SD card and flash).
> +
> +config BR2_GENIMAGE_CFG_FILES_SELECT
> +        bool
> +        default y if BR2_GENIMAGE_CFG_FILES != ""
> +        select BR2_PACKAGE_HOST_GENIMAGE
> +
>  endmenu
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
