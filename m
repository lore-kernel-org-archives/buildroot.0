From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 16:49:02 +0200
Subject: [Buildroot] [PATCH 3/6 RFC] package/gcc: use generic extract
 commands
In-Reply-To: <c6065405bb95d2c5bb88672a4329168b6a44c695.1441233378.git.yann.morin.1998@free.fr>
References: <cover.1441233378.git.yann.morin.1998@free.fr>
 <c6065405bb95d2c5bb88672a4329168b6a44c695.1441233378.git.yann.morin.1998@free.fr>
Message-ID: <560FEADE.1010700@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 03/09/2015 00:51, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

> ---
>  package/gcc/gcc-final/gcc-final.mk     |  3 ++-
>  package/gcc/gcc-initial/gcc-initial.mk |  3 ++-
>  package/gcc/gcc.mk                     | 15 ++++-----------
>  3 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 86b3c78..1d06d7e 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -12,7 +12,8 @@ HOST_GCC_FINAL_DEPENDENCIES = \
>  	$(HOST_GCC_COMMON_DEPENDENCIES) \
>  	$(BR_LIBC)
>  
> -HOST_GCC_FINAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
> +HOST_GCC_FINAL_TAR_EXCLUDES = $(HOST_GCC_TAR_EXCLUDES)
> +HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
>  
>  ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
>  HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
> diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
> index 6bb7997..a86b25a 100644
> --- a/package/gcc/gcc-initial/gcc-initial.mk
> +++ b/package/gcc/gcc-initial/gcc-initial.mk
> @@ -10,7 +10,8 @@ GCC_INITIAL_SOURCE = $(GCC_SOURCE)
>  
>  HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
>  
> -HOST_GCC_INITIAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
> +HOST_GCC_INITIAL_TAR_EXCLUDES = $(HOST_GCC_TAR_EXCLUDES)
> +HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
>  
>  ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
>  HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 501fcea..b9e9323 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -47,18 +47,11 @@ define HOST_GCC_APPLY_PATCHES
>  	$(HOST_GCC_APPLY_POWERPC_PATCH)
>  endef
>  
> -#
> -# Custom extract command to save disk space
> -#
> +HOST_GCC_TAR_EXCLUDES = \
> +	libjava/* libgo/* \
> +	gcc/testsuite/* libstdc++-v3/testsuite/*
>  
> -define HOST_GCC_EXTRACT_CMDS
> -	$(call suitable-extractor,$(GCC_SOURCE)) $(DL_DIR)/$(GCC_SOURCE) | \
> -		$(TAR) --strip-components=1 -C $(@D) \
> -		--exclude='libjava/*' \
> -		--exclude='libgo/*' \
> -		--exclude='gcc/testsuite/*' \
> -		--exclude='libstdc++-v3/testsuite/*' \
> -		$(TAR_OPTIONS) -
> +define HOST_GCC_FAKE_TESTSUITE
>  	mkdir -p $(@D)/libstdc++-v3/testsuite/
>  	echo "all:" > $(@D)/libstdc++-v3/testsuite/Makefile.in
>  	echo "install:" >> $(@D)/libstdc++-v3/testsuite/Makefile.in
> 
