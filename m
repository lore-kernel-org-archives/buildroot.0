From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 05 Jun 2015 22:24:22 +0200
Subject: [Buildroot] [PATCH 1/1] savedefconfig: Remove BR2_DEFCONFIG
 from saved defconfig file
In-Reply-To: <1433405793-26785-1-git-send-email-Herve.CODINA@celad.com>
References: <1433405793-26785-1-git-send-email-Herve.CODINA@celad.com>
Message-ID: <55720576.6010108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 10:16, Herve Codina wrote:
> BR2_DEFCONFIG should not be present in saved defconfig file.
> 
> The use case is:
> make qemu_arm_versatile
> make savedefconfig BR2_DEFCONFIG=my_custom_defconfig
> 
> BR2_DEFCONFIG is set in my_custom_defconfig with an absolute path
> to qemu_arm_versatile (value present in .config) and set in

 Although that behaviour is clearly wrong, I thought long and hard about what
the appropriate behaviour would be. And indeed, even if you _don't_ change the
value of BR2_DEFCONFIG, it should not be saved into the defconfig file itself.

 I also thought Yann had a similar patch pending but couldn't find anything.

 So yes, this gets my

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

except for some small nits below.


> my_custom_defconfig as it is different from default mentionned in

mentioned

> config.in (default is BR2_DEFCONFIG from environnement).

environment

> 
> On savedefconfig recipe, simply remove BR2_DEFCONFIG from generated file
> 
> Signed-off-by: Herve Codina <Herve.CODINA@celad.com>
> ---
>  Makefile |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 43b5ba5..3c9e6fb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -777,6 +777,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< \
>  		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>  		$(CONFIG_CONFIG_IN)
> +	@sed -i '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)

 sed -i -> $(SED)


 Now I see this, I wonder whether the condition is really needed. savedefconfig
only makes sense if there already is a .config, and if there is a .config, it
will have BR2_DEFCONFIG defined. But that's for a separate patch.


 Regards,
 Arnout

>  
>  .PHONY: defconfig savedefconfig
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
