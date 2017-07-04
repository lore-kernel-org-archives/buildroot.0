From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Jul 2017 17:12:08 +0200
Subject: [Buildroot] [PATCH v3 08/14] gcc-final: things are no longer
 installed in $(HOST_DIR)/usr
In-Reply-To: <20170704140404.4098-9-arnout@mind.be>
References: <20170704140404.4098-1-arnout@mind.be>
 <20170704140404.4098-9-arnout@mind.be>
Message-ID: <1d57d031-33f3-6ef6-0a2c-ebe8d2a69cd7@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 04/07/2017 ? 16:03, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Since things are no longer installed in $(HOST_DIR)/usr, the callers
> should also not refer to it.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Same as for gdb, there are also other reference to $(HOST_DIR)/usr in gcc/gcc.mk
and gcc/gcc-final/gcc-final.mk but as you explained privately, this patch is
doing only
s:$(HOST_DIR)/usr/$(GNU_TARGET_NAME):$(HOST_DIR)/$(GNU_TARGET_NAME):

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> ---
>  package/gcc/gcc-final/gcc-final.mk | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index e8d2e18fe5..12f08c81a8 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -59,18 +59,18 @@ GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGE
>  HOST_GCC_FINAL_CONF_OPTS = \
>  	$(HOST_GCC_COMMON_CONF_OPTS) \
>  	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
> -	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
> +	--with-build-time-tools=$(HOST_DIR)/$(GNU_TARGET_NAME)/bin
>  
> -HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*
> +HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
>  # The kernel wants to use the -m4-nofpu option to make sure that it
>  # doesn't use floating point operations.
>  ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
>  HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
> -HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
> +HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
>  endif
>  ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
>  HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
> -HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
> +HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
>  endif
>  
>  ifeq ($(BR2_bfin),y)
> @@ -103,9 +103,9 @@ HOST_GCC_FINAL_MAKE_OPTS += $(HOST_GCC_COMMON_MAKE_OPTS)
>  
>  # Make sure we have 'cc'
>  define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
> -	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
> -		ln -f $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc \
> -			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
> +	if [ ! -e $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-cc ]; then \
> +		ln -f $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc \
> +			$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-cc; \
>  	fi
>  endef
>  
> 
