From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:20:31 +0200
Subject: [Buildroot] [PATCH v2] sh4: fix toolchain creation
In-Reply-To: <20150407201124.GA11866@waldemar-brodkorb.de>
References: <20150407201124.GA11866@waldemar-brodkorb.de>
Message-ID: <20150407222031.7430e991@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

Thanks for this new iteration!

On Tue, 7 Apr 2015 22:11:25 +0200, Waldemar Brodkorb wrote:

> CAUTION: uClibc/uClibc-ng does not work for sh4a/sh4aeb.

So we should add the appropriate Config.in conditions to make sure
uClibc and uClibc-ng cannot be selected on sh4a*.

> +LIB_DIR := lib*

The scope of variables is global in Buildroot, so all variables should
be prefixed by the name of the package, i.e:

HOST_GCC_FINAL_GCC_LIB_DIR = lib*

Also, no reason to use := here, so use = instead.

> +# The kernel wants to use the -m4-nofpu option to make sure that it
> +# doesn't use floating point operations.
> +ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
> +HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
> +LIB_DIR := lib/!m4*
> +endif
> +ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
> +HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
> +LIB_DIR := lib/!m4*
> +endif
> +
>  # Disable shared libs like libstdc++ if we do static since it confuses linking
>  ifeq ($(BR2_STATIC_LIBS),y)
>  HOST_GCC_FINAL_CONF_OPTS += --disable-shared
> @@ -110,9 +122,9 @@ endif
>  # Cannot use the HOST_GCC_FINAL_USR_LIBS mechanism below, because we want
>  # libgcc_s to be installed in /lib and not /usr/lib.
>  define HOST_GCC_FINAL_INSTALL_LIBGCC
> -	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
> +	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/$(LIB_DIR)/libgcc_s* \
>  		$(STAGING_DIR)/lib/
> -	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
> +	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/$(LIB_DIR)/libgcc_s* \
>  		$(TARGET_DIR)/lib/
>  endef
>  
> @@ -140,7 +152,7 @@ endif
>  ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
>  define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
>  	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
> -		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.a \
> +		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/$(LIB_DIR)/$${i}.a \
>  			$(STAGING_DIR)/usr/lib/ ; \
>  	done
>  endef
> @@ -148,9 +160,9 @@ endef
>  ifeq ($(BR2_STATIC_LIBS),)
>  define HOST_GCC_FINAL_INSTALL_SHARED_LIBS
>  	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
> -		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
> +		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/$(LIB_DIR)/$${i}.so* \
>  			$(STAGING_DIR)/usr/lib/ ; \
> -		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
> +		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/$(LIB_DIR)/$${i}.so* \
>  			$(TARGET_DIR)/usr/lib/ ; \
>  	done
>  endef

Maybe we can have a variable that shortens
$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/$(LIB_DIR)/. Maybe this is actually
what HOST_GCC_FINAL_GCC_LIB_DIR should point to?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
