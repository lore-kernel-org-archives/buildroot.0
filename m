From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Oct 2015 21:27:56 +0100
Subject: [Buildroot] [PATCH 04/21 v2] core: commonalise the bundled and
 br2-external %_defconfig rules
In-Reply-To: <3b01a81ac78b8ca787b1e0308e819d8eb2ece1df.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <3b01a81ac78b8ca787b1e0308e819d8eb2ece1df.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <562E8CCC.20505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-10-15 22:33, Yann E. MORIN wrote:
> The code for both cases is exactly the same, and only differs in the
> location where defconfig files are looked for.
> 
> We use an intermediate macro to generate the corresponding rules,
> because directly generating the rules is ugly and needs lots of escaping
> and double-dollar-ing for the $(eval ...) and $(foreach ...) calls to
> play nicely together.
> 
> Furthermore, that will be tremendously useful when we support multiple
> br2-external trees.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

 Bunch of small nits. I'm not giving it my reviewed-by yet because I'm not
convinced that this change really makes things clearer, so it only really
applies in function of the multi-external and for that I first have to see the
whole series.

> ---
>  Makefile | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 60cea32..052f58a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -789,13 +789,12 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
>  
>  # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig

 This comment should go inside the define

> -%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
> -	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
> -		$< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
> -
> -%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
> -	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
> -		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
> +define PERCENT_DEFCONFIG

 The macros we've added recently were all lowercase, and I like it that way.

 Regards,
 Arnout

> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
> +	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
> +		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
> +endef
> +$(eval $(foreach d,$(TOPDIR) $(BR2_EXTERNAL),$(call PERCENT_DEFCONFIG,$(d))$(sep)))
>  
>  savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
