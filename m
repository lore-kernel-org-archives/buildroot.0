From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 1 Feb 2016 14:43:45 +0100
Subject: [Buildroot] [PATCH v2 2/2] toolchain-external: move the sysroot
 toolchain support check to helper function
In-Reply-To: <1454334017-12326-2-git-send-email-romain.naour@gmail.com>
References: <1454334017-12326-1-git-send-email-romain.naour@gmail.com>
 <1454334017-12326-2-git-send-email-romain.naour@gmail.com>
Message-ID: <56AF6111.8030201@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 01/02/2016 14:40, Romain Naour a ?crit :
> The sysroot toolchain support check is duplicated at tree location in the
> external toolchain infra. So move it inside the check_unusable_toolchain helper
> that is called when the sysroot is copied to staging directory.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v2: new patch
> ---
>  toolchain/helpers.mk                               |  4 ++++
>  toolchain/toolchain-external/toolchain-external.mk | 14 +-------------
>  2 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index fd99efe..add433a 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -423,6 +423,10 @@ check_unusable_toolchain = \
>  	if test "$${non_existent_sysroot}" = "libc.a" ; then \
>  		echo "Unable to detect the toolchain sysroot, Buildroot cannot handle this toolchain." ; \
>  		exit 1 ; \
> +	fi ; \
> +	sysroot_dir="$(call toolchain_find_sysroot,$(__CROSS_CC))" ; \
> +	if test -z "$${sysroot_dir}" ; then \
> +		echo "External toolchain doesn't support --sysroot. Cannot use." ; \

oops, missing:

exit 1 ; \

Sorry.

Best regards,
Romain
>  	fi
>  
>  #
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 518afd6..5ad6309 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -467,17 +467,13 @@ $$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64
>  endef
>  
>  # Checks for an already installed toolchain: check the toolchain
> -# location, check that it supports sysroot, and then verify that it
> +# location, check that it is usable, and then verify that it
>  # matches the configuration provided in Buildroot: ABI, C++ support,
>  # kernel headers version, type of C library and all C library features.
>  define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
>  	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
>  	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
>  	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
> -	if test -z "$${SYSROOT_DIR}" ; then \
> -		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
> -		exit 1 ; \
> -	fi ; \
>  	$(call check_kernel_headers_version,\
>  		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
>  		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
> @@ -588,10 +584,6 @@ endef
>  
>  define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
>  	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
> -	if test -z "$${SYSROOT_DIR}" ; then \
> -		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
> -		exit 1 ; \
> -	fi ; \
>  	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>  	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>  	SUPPORT_LIB_DIR="" ; \
> @@ -633,10 +625,6 @@ endef
>  
>  define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
>  	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
> -	if test -z "$${SYSROOT_DIR}" ; then \
> -		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
> -		exit 1 ; \
> -	fi ; \
>  	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>  	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>  	SUPPORT_LIB_DIR="" ; \
> 
