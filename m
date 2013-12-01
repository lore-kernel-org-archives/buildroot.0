From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 01 Dec 2013 01:32:23 +0100
Subject: [Buildroot] [PATCHv4 3/5] core: allow external defconfigs to be
 used
In-Reply-To: <1385751626-28967-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1385751626-28967-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385751626-28967-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <529A8397.3080908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/11/13 20:00, Thomas Petazzoni wrote:
> This commit allows the user to store defconfigs in
> $BR2_EXTERNAL/configs/. To achieve this:
>
>   * It adds a new %_defconfig that looks in $BR2_EXTERNAL/configs/ for
>     the corresponding defconfig file.
>
>   * Updates the help target to also list external defconfigs.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   Makefile | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index b5a9828..eb547a2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -754,6 +754,12 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>   	@mkdir -p $(BUILD_DIR)/buildroot-config
>   	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
>
> +ifeq ($(BR2_EXTERNAL_USED),y)
> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
> +	@mkdir -p $(BUILD_DIR)/buildroot-config
> +	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
> +endif
> +
>   savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>   	@mkdir -p $(BUILD_DIR)/buildroot-config
>   	@$(COMMON_CONFIG_ENV) $< \
> @@ -862,8 +868,17 @@ endif
>   	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>   	@echo '  make O=dir             - Locate all output files in "dir", including .config'
>   	@echo
> +	@echo 'Built-in configs'
> +	@echo
>   	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
>   	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
> +ifeq ($(BR2_EXTERNAL_USED),y)

  It's a minor nit, but I'd make this conditional on
ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)

  Regards,
  Arnout

> +	@echo
> +	@echo 'User-provided configs'
> +	@echo
> +	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
> +	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
> +endif
>   	@echo
>   	@echo 'See docs/README, or generate the Buildroot manual for further details'
>   	@echo
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
