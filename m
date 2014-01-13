From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 13 Jan 2014 09:52:45 +0100 (CET)
Subject: [Buildroot] [PATCH] prevent recursion in %_defconfig rules
In-Reply-To: <1389111727-11021-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <713578016.3542538.1389603165287.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping ?

Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 04

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75012 Paris - France
www.openwide.fr





----- Mail original -----
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> 
> ---
> The following command, run from a clean buildroot checkout
> 
> make O=.. BR2_EXTERNAL=.. raspberrypi_defconfig
> 
> cause the following output, and makes stop :
> 
> 
> make: *** Pas de r?gle pour fabriquer la cible ?
> /home/rosen/tmp/buildroot/
> configs/../configs/../configs/../configs/<lots more >/../configs/
> raspberrypi_defconfig ?, n?cessaire pour ? /home/rosen/tmp/buildroot/
> configs/../configs/../configs/<lots more>/../configs/
> raspberrypi_defconfig ?. Arr?t.
> 
> The problem is that the buildroot makefile has two rules to generate
> %_defconfig: One that depends on $(TOPDIR)/configs/%_defconfig and
> the
> other one that depends on $(BR2_EXTERNAL)/configs/%_defconfig.
> 
> When one rule checks for the file, the other rule becomes an implicit
> rule
> for the dependancy causing an infinite cross-recursion.
> 
> By overriding the implicit rule, we prevent the infinite recursion.
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 4320e7b..41d641c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -760,10 +760,14 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf
> outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@
>  	$(CONFIG_CONFIG_IN)
>  
> +$(TOPDIR)/configs/%_defconfig:;
> +
>  %_defconfig: $(BUILD_DIR)/buildroot-config/conf
>  $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@
>  	$(CONFIG_CONFIG_IN)
>  
> +$(BR2_EXTERNAL)/configs/%_defconfig:;
> +
>  savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@$(COMMON_CONFIG_ENV) $< \
> --
> 1.8.5.2
> 
> 
