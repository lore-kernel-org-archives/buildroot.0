From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 5 Feb 2014 16:28:41 +0100 (CET)
Subject: [Buildroot] [PATCH] Make BR2_DEFCONFIG a hidden option in
 Config.in
In-Reply-To: <1391532219-24589-1-git-send-email-arnout@mind.be>
Message-ID: <842669928.5073160.1391614121156.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am not able to reproduce the case where BR2_DEFCONFIG ended in my 
defconfig, but I was able to test that if it was originally there it
is properly remove and that it doesn't prevent defconfig and
savedefconfig from working properly


Tested-by: J?r?my Rosen <jeremy.rosen@openwide.fr>



----- Mail original -----
> The manual says that BR2_DEFCONFIG can be set on the command line or
> in
> the configuration menu. However, the use case for setting it from the
> menu was somewhat vague to say the least. So make it a hidden option.
> 
> With this change, it is no longer needed to do special quoting when
> passing BR2_DEFCONFIG through the environment.
> 
> Also, in some cases (not clear how) it was possible that the value
> of BR2_DEFCONFIG did end up in the saved defconfig. When it is a
> hidden
> option, it is never saved.
> 
> Since for hidden options, Kconfig discards whatever is already stored
> in the .config file when it is run, we always have to pass the
> correct
> value in the environment. Therefore, all the *config targets can no
> longer be in noconfig_targets. This makes 'make menuconfig' and
> friends
> a bit slower.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I wonder if the noconfig_targets hack makes any sense at all...
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Config.in                       | 6 ++----
>  Makefile                        | 9 ++-------
>  docs/manual/customize-store.txt | 9 ++++-----
>  3 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 1dc1ffe..d6d5c0a 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -109,17 +109,15 @@ config BR2_TAR_OPTIONS
>  
>  endmenu
>  
> +# This has to be a separate config option so BR2_DEFCONFIG is saved
> in .config.
>  config BR2_DEFCONFIG_FROM_ENV
>  	string
>  	option env="BR2_DEFCONFIG"
>  
>  config BR2_DEFCONFIG
> -	string "Location to save buildroot config"
> +	string
>  	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
>  	default "$(CONFIG_DIR)/defconfig"
> -	help
> -	  When running 'make savedefconfig', the defconfig file will be
> saved
> -	  in this location.
>  
>  config BR2_DL_DIR
>  	string "Download dir"
> diff --git a/Makefile b/Makefile
> index da3e148..ec359e3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -55,10 +55,7 @@ DATE:=$(shell date +%Y%m%d)
>  # Need to export it, so it can be got from environment in children
>  (eg. mconf)
>  export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell
>  $(TOPDIR)/support/scripts/setlocalversion)
>  
> -noconfig_targets:=menuconfig nconfig gconfig xconfig config
> oldconfig randconfig \
> -	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig
> release \
> -	randpackageconfig allyespackageconfig allnopackageconfig \
> -	source-check print-version olddefconfig
> +noconfig_targets = release source-check print-version
>  
>  # Strip quotes and then whitespaces
>  qstrip=$(strip $(subst ",,$(1)))
> @@ -678,10 +675,8 @@ $(BUILD_DIR)/buildroot-config/%onf:
>  
>  DEFCONFIG = $(call qstrip,$(BR2_DEFCONFIG))
>  
> -# We don't want to fully expand BR2_DEFCONFIG here, so Kconfig will
> -# recognize that if it's still at its default
> $(CONFIG_DIR)/defconfig
>  COMMON_CONFIG_ENV = \
> -	BR2_DEFCONFIG='$(call qstrip,$(value BR2_DEFCONFIG))' \
> +	BR2_DEFCONFIG="$(DEFCONFIG)" \
>  	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
>  	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
>  	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
> diff --git a/docs/manual/customize-store.txt
> b/docs/manual/customize-store.txt
> index 8fb5b57..e880803 100644
> --- a/docs/manual/customize-store.txt
> +++ b/docs/manual/customize-store.txt
> @@ -28,11 +28,10 @@ following command: +make savedefconfig+.
>  
>  This strips the buildroot configuration down by removing
>  configuration
>  options that are at their default value. The result is stored in a
>  file
> -called +defconfig+.  If you want to save it in another place, change
> -the +BR2_DEFCONFIG+ option, or call make with +make savedefconfig
> -BR2_DEFCONFIG=<path-to-defconfig>+.  The usual place is
> -+configs/<boardname>_defconfig+. The configuration can then be
> rebuilt by
> -running +make <boardname>_defconfig+.
> +called +defconfig+.  If you want to save it in another place, call
> make
> +with +make savedefconfig BR2_DEFCONFIG=<path-to-defconfig>+.  The
> usual
> +place is +configs/<boardname>_defconfig+. The configuration can then
> be
> +rebuilt by running +make <boardname>_defconfig+.
>  
>  Alternatively, you can copy the file to any other place and rebuild
>  with
>  +make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
> --
> 1.9.rc1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
