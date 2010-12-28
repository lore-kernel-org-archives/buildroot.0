From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Dec 2010 23:38:40 +0100
Subject: [Buildroot] [PATCH 04/10] binutils: make it a proper package
In-Reply-To: <1293563435-10054-5-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 28 Dec 2010 16:10:29 -0300")
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
	<1293563435-10054-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874o9xldzj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> * Convert binutils to a proper autotargets package
 Gustavo> * Add version 2.21
 Gustavo> * Drop version 2.17
 Gustavo> * Hook up packaged binutils for target gcc
 Gustavo> * Build tools are on HOST_DIR now so change it
 Gustavo> * TARGET_CROSS is now in HOST_DIR too

 Gustavo> diff --git a/package/Config.in b/package/Config.in
 Gustavo> index 27d8023..fb47e27 100644
 Gustavo> --- a/package/Config.in
 Gustavo> +++ b/package/Config.in
 Gustavo> @@ -35,6 +35,7 @@ endmenu
 Gustavo>  menu "Development tools"
 Gustavo>  source "package/autoconf/Config.in"
 Gustavo>  source "package/automake/Config.in"
 Gustavo> +source "package/binutils/Config.in"
 Gustavo>  source "package/bison/Config.in"
 Gustavo>  source "package/bsdiff/Config.in"
 Gustavo>  source "package/ccache/Config.in"
 Gustavo> diff --git a/package/Makefile.in b/package/Makefile.in
 Gustavo> index 9765a1a..983f9f5 100644
 Gustavo> --- a/package/Makefile.in
 Gustavo> +++ b/package/Makefile.in
 Gustavo> @@ -114,7 +114,7 @@ TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 Gustavo>  TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
 
 Gustavo>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 Gustavo> -TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 Gustavo> +TARGET_CROSS=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-

Seeing this I thought the build would be broken because GCC isn't moved
yet, but I see you do move it later on in this patch, even if it isn't
mentioned in the commit message.

 Gustavo> +config BR2_PACKAGE_BINUTILS
 Gustavo> +	bool
 Gustavo> +	depends on BR2_TOOLCHAIN_BUILDROOT
 Gustavo> +	default y if BR2_PACKAGE_BINUTILS_TARGET || BR2_PACKAGE_BINUTILS_LIBBFD
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_BINUTILS_TARGET
 Gustavo> +	bool "binutils"
 Gustavo> +	select BR2_PACKAGE_MPC if BR2_GCC_VERSION_4_5_X
 Gustavo> +	select BR2_PACKAGE_MPFR
 Gustavo> +	select BR2_PACKAGE_GMP
 Gustavo> +	help
 Gustavo> +	  The GNU Binutils are a collection of binary tools.
 Gustavo> +
 Gustavo> +	  http://www.gnu.org/software/binutils/
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_BINUTILS_LIBBFD
 Gustavo> +	bool
 Gustavo> +	help
 Gustavo> +	  Install libbfd from binutils in the target.
 Gustavo> +	  
 Gustavo> +	  This option is currently used by oprofile to just install
 Gustavo> +	  the minimum libbfd needed instead of a full-blown binutils.

I find this quite complicated. I would prefer something like:

config BR2_PACKAGE_BINUTILS
       bool "binutils"
       depends on BR2_TOOLCHAIN_BUILDROOT
       help
         ..

config BR2_PACKAGE_BINUTILS_FULLINSTALL
       bool "perform full installation"
       depends on BR2_PACKAGE_BINUTILS
       help
         Select this to install all binary utilies and not just libbfd.

And then move the MPC/MPFR/GMP selects under
BR2_PACKAGE_GCC_TARGET. Also add selects for BR2_PACKAGE_BINUTILS +
FULLINSTALL.

 Gustavo> +++ b/package/binutils/binutils.mk
 Gustavo> @@ -0,0 +1,68 @@
 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# binutils
 Gustavo> +#
 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 Gustavo> +BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.bz2
 Gustavo> +BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
 Gustavo> +ifeq ($(ARCH),avr32)
 Gustavo> +BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 Gustavo> +endif
 Gustavo> +BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 Gustavo> +BINUTILS_INSTALL_STAGING = YES
 Gustavo> +
 Gustavo> +# These aren't really needed, we just pull them until gcc is a proper package
 Gustavo> +ifeq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 Gustavo> +BINUTILS_DEPENDENCIES = gmp mpfr
 Gustavo> +ifeq ($(BR2_GCC_VERSION_4_5_X),y)                                                                   

You have trailing spaces here and elsewhere.

 Gustavo> +++ b/toolchain/gcc/gcc-uclibc-4.x.mk
 Gustavo> @@ -53,9 +53,6 @@ else
 Gustavo>  GCC_OPTSPACE=--enable-target-optspace
 Gustavo>  endif
 
 Gustavo> -GCC_TARGET_PREREQ=
 Gustavo> -GCC_STAGING_PREREQ=
 Gustavo> -
 Gustavo>  #############################################################
 Gustavo>  #
 Gustavo>  # Setup some initial stuff
 Gustavo> @@ -203,17 +200,12 @@ endif
 Gustavo>  #############################################################
 Gustavo>  GCC_BUILD_DIR1:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-initial
 
 Gustavo> -
 Gustavo> -# The --without-headers option stopped working with gcc 3.0 and has never been
 Gustavo> -# fixed, so we need to actually have working C library header files prior to
 Gustavo> -# the step or libgcc will not build...
 Gustavo> -
 Gustavo>  $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 Gustavo>  	mkdir -p $(GCC_BUILD_DIR1)
 Gustavo>  	(cd $(GCC_BUILD_DIR1); rm -rf config.cache; \
 Gustavo>  		$(HOST_CONFIGURE_OPTS) \
 Gustavo>  		$(GCC_DIR)/configure $(QUIET) \
 Gustavo> -		--prefix=$(STAGING_DIR)/usr \
 Gustavo> +		--prefix=$(HOST_DIR)/usr \
 Gustavo>  		--build=$(GNU_HOST_NAME) \
 Gustavo>  		--host=$(GNU_HOST_NAME) \
 Gustavo>  		--target=$(REAL_GNU_TARGET_NAME) \
 Gustavo> @@ -243,7 +235,6 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 Gustavo>  	touch $@
 
 Gustavo>  $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
 Gustavo> -	# gcc >= 4.3.0 have to also build all-target-libgcc

Why are you removing those comments? We still support gcc 4.2.x

 Gustavo>  ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 Gustavo>  	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
 Gustavo>  else
 Gustavo> @@ -276,22 +262,16 @@ gcc_initial-dirclean:
 Gustavo>  #############################################################
 Gustavo>  GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-intermediate
 
 Gustavo> -
 Gustavo>  # The --without-headers option stopped working with gcc 3.0 and has never been
 Gustavo>  # fixed, so we need to actually have working C library header files prior to
 Gustavo>  # the step or libgcc will not build...
 
 Gustavo>  $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 Gustavo>  	mkdir -p $(GCC_BUILD_DIR2)
 Gustavo> -	-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
 Gustavo> -	mkdir -p $(STAGING_DIR)/lib
 Gustavo> -	ln -snf ../../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
 Gustavo> -	$(if $(BR2_ARCH_IS_64),mkdir -p $(STAGING_DIR)/lib64)
 Gustavo> -	$(if $(BR2_ARCH_IS_64),ln -snf ../../lib64 $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64)

Why remove this ARCH_IS_64 stuff?


-- 
Bye, Peter Korsgaard
