From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Tue, 10 May 2016 11:04:41 +1000
Subject: [Buildroot] [PATCH 1/1] Makefile: Support merged defconfigs
In-Reply-To: <90639972664ebd51802b3c2b94b8c01e235bd956.1462771329.git.sam.bobroff@au1.ibm.com>
References: <90639972664ebd51802b3c2b94b8c01e235bd956.1462771329.git.sam.bobroff@au1.ibm.com>
Message-ID: <20160510010441.GA3744@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 09, 2016 at 03:22:32PM +1000, Sam Bobroff wrote:
> Within the Linux kernel, and several other packages, it's currently
> possible to maintain defconfigs as diffs (fragments) against other
> configs but this is not possible with buildroot itself.
> 
> This patch adds the capability, although using a slightly different
> implementation. Files may be added in the normal config directories
> ($TOPDIR/configs or $BR2_EXTERNAL/configs) with the format
> "xxx_defconfig.merge" that contain, one per line, the files to be
> passed to merge_config.sh to create the matching xxx_defconfig file
> (the first line should contain the base config followed by the
> fragments).  The generated defconfig file is then handled as it would
> normally be.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>

This neatly solves some problems for us over in op-build land. Tested
with several fragments and output is what I expect:

Tested-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

> ---
> For a discussion about this from the OP build project, see
> https://github.com/open-power/op-build/issues/457
> 
> A couple of things about the implementation:
> 
> * merge_config.sh will only output to a file called ".config" so I've set it up
>   to output directly to $TOPDIR/.config, since that's about to be overwritten
>   anyway, but I don't feel this is particularly nice.
> * It seems strange to pass --defconfig=.config when running conf but I couldn't
>   quickly tell if there was something better to do. Using --oldconfig would
>   pick up .config by default but I don't know if it would then process the file
>   correctly so I went with what seemed safe.
> * I realise that there are now four very similar rules that handle defconfigs.
>   I could look at factoring them but it didn't seem worth the effort and
>   complexity at this point.
> 
>  Makefile | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 71735b5..eb80152 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -845,6 +845,16 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
>  		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
>  
> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig.merge outputmakefile
> +	cd $(TOPDIR)/configs && xargs -a $@.merge -x -P 1 $(TOPDIR)/support/kconfig/merge_config.sh -m -O $(TOPDIR)
> +	$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/.config \
> +		$< --defconfig=$(TOPDIR)/.config $(CONFIG_CONFIG_IN)
> +
> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig.merge outputmakefile
> +	cd $(BR2_EXTERNAL)/configs && xargs -a $@.merge -x -P 1 $(TOPDIR)/support/kconfig/merge_config.sh -m -O $(TOPDIR)
> +	$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/.config \
> +		$< --defconfig=$(TOPDIR)/.config $(CONFIG_CONFIG_IN)
> +
>  savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< \
>  		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
