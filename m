From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 13 Aug 2010 19:54:20 +0100
Subject: [Buildroot] linux26 in package dependency does not build linux
In-Reply-To: <1281725350.13866.77.camel@dubciaranr1.verifone.com>
References: <1281725350.13866.77.camel@dubciaranr1.verifone.com>
Message-ID: <1281725660.13866.80.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BTW, "./scripts/graph-depends" shows the the dependencies are being
recognised.

And:
$ make kmod-example-show-depends
linux26


> I'm adding some support for building external kernel modules for linux
> in buildroot and have added the patches below.  It's work in progress
> and currently doesn't have an install stage but that'll come when I get
> over this hurdle.
> 
> The idea is to have a minimal per-module makefile with common
> definitions in package/kmod/kmod-common.mk.  The idea seems to work and
> the requisite targets get set up.
> The problem is that building a module requires a configured kernel
> source.
> I thought adding a prerequisite of "linux26" in the module makefile (via
> kmod-common.mk) would cause linux to be built and so overcome this but
> it is not being built before the modules.
> 
> I see that linux-fusion has linux26 in its dependency list and that
> seems to work so my idea shouldn't be that far-fetched.
> Any idea what I'm doing wrong?
> 
> 
> 
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2b68cab..9b768c9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -489,4 +489,6 @@ source "package/vim/Config.in"
>  endif
>  endmenu
>  
> +source "package/kmod/Config.in"
> +
>  endmenu
> diff --git a/package/kmod/Config.in b/package/kmod/Config.in
> new file mode 100644
> index 0000000..ce44a01
> --- /dev/null
> +++ b/package/kmod/Config.in
> @@ -0,0 +1,6 @@
> +
> +menu "External kernel modules"
> +
> +source "package/kmod/kmod-example/Config.in"
> +
> +endmenu
> diff --git a/package/kmod/kmod-common.mk b/package/kmod/kmod-common.mk
> new file mode 100644
> index 0000000..3f14c3c
> --- /dev/null
> +++ b/package/kmod/kmod-common.mk
> @@ -0,0 +1,31 @@
> +#############################################################
> +#
> +# Common kmod defiitions
> +#
> +#############################################################
> +
> +
> +# Arg 1: module name (lower case).
> +define GENKMOD
> +
> +KMOD_$(call UPPERCASE,$(1))_VERSION ?= invalid-version
> +KMOD_$(call UPPERCASE,$(1))_SITE ?= invalid-url
> +
> +# Make sure linux source code is present before building modules.
> +KMOD_$(call UPPERCASE,$(1))_DEPENDENCIES += linux26
> +
> +define KMOD_$(call UPPERCASE,$(1))_BUILD_CMDS
> +# Pass KDIR to package makefile so it can reference kernel.
> +	$(MAKE) -C $$(@D) KDIR=$$(LINUX26_DIR)
> +endef # KMOD_$(call UPPERCASE,$(1))_BUILD_CMDS.
> +
> +#define KMOD_$(call UPPERCASE,$(1))_INSTALL_CMDS
> +#endef # KMOD_$(call UPPERCASE,$(1))_INSTALL_CMDS.
> +
> +define KMOD_$(call UPPERCASE,$(1))_CLEAN_CMDS
> +	$(MAKE) -C $$(@D) KDIR=$$(LINUX26_DIR) clean
> +endef # KMOD_$(call UPPERCASE,$(1))_CLEAN_CMDS.
> +
> +$(eval $(call GENTARGETS,package/kmod,kmod-$(1)))
> +
> +endef # GENKMOD
> diff --git a/package/kmod/kmod-example/Config.in b/package/kmod/kmod-example/Config.in
> new file mode 100644
> index 0000000..72a9c44
> --- /dev/null
> +++ b/package/kmod/kmod-example/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_KMOD_EXAMPLE
> +	bool "example"
> +	help
> +	  Example driver.
> diff --git a/package/kmod/kmod-example/kmod-example.mk b/package/kmod/kmod-example/kmod-example.mk
> new file mode 100644
> index 0000000..65e2946
> --- /dev/null
> +++ b/package/kmod/kmod-example/kmod-example.mk
> @@ -0,0 +1,9 @@
> +#############################################################
> +#
> +# Example module
> +#
> +#############################################################
> +
> +KMOD_EXAMPLE_DEPENDENCIES = 
> +
> +$(eval $(call GENKMOD,example))
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> new file mode 100644
> index 0000000..5045acc
> --- /dev/null
> +++ b/package/kmod/kmod.mk
> @@ -0,0 +1,2 @@
> +include package/kmod/kmod-common.mk
> +include package/kmod/*/*.mk
> 
> 
