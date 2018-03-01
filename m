From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Mar 2018 20:50:30 +0100
Subject: [Buildroot] [PATCH 1/1] Main Makefile Have "make savedefconfig"
 show where the file is being written to.
In-Reply-To: <20180227112818.6766-1-chrismcc@gmail.com>
References: <20180227112818.6766-1-chrismcc@gmail.com>
Message-ID: <dd0ef897-7b93-4c58-6f6f-a33e33f4e28a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-02-18 12:28, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index ec39bcdb9c..4ac2435a9c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -927,6 +927,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
>  		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>  		$(CONFIG_CONFIG_IN)
>  	@$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
> +	@echo "Saved to $(DEFCONFIG)"

 If BR2_DEFCONFIG is not set, you'll get "Saved to " which is a bit weird. So
change into:

	@echo "Saved to $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)"

 But now $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) is used 3
times, so perhaps it's worth adding a variable for it. I can't think of a good
name for it unfortunately.

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
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
