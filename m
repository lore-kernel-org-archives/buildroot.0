From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Nov 2013 22:07:52 +0100
Subject: [Buildroot] [PATCH v2 2/5] gcc: add microblaze internal
 toolchain
In-Reply-To: <1384277505-11503-3-git-send-email-spenser@gillilanding.com>
References: <1384277505-11503-1-git-send-email-spenser@gillilanding.com>
 <1384277505-11503-3-git-send-email-spenser@gillilanding.com>
Message-ID: <20131112220752.6fea927d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Tue, 12 Nov 2013 11:31:42 -0600, Spenser Gilliland wrote:

> +# Until gcc 4.7, a three stage build process was needed when using
> +# NPTL. This hidden option tells whether gcc is a version that
> +# requires this three stage build process.
> +config BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
> +	bool

Hum, is this really meant to be part of your patch? :-)


> @@ -16,39 +23,44 @@ choice
>  	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
>  		depends on BR2_avr32
>  		bool "gcc 4.2.2-avr32-2.1.5"
> +		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD

and this (and all the other occurrences).

> +GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
> +else ifeq ($(findstring microblaze,$(GCC_VERSION)),microblaze)
> +MBGCC_VERSION = b93bb009e021aba64dd4b8cdb0bbc5a176c55543

MBGCC_VERSION ?

> +GCC_SITE = http://github.com/Xilinx/gcc/tarball/$(MBGCC_VERSION)
> +GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
>  else
>  GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
> -endif
> -
>  GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
> +endif
>  
>  #
>  # Xtensa special hook
> @@ -60,7 +66,7 @@ endef
>  #
>  
>  define HOST_GCC_EXTRACT_CMDS
> -	$(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
> +	$(call suitable-extractor,$(GCC_SOURCE),$(BZCAT)) $(DL_DIR)/$(GCC_SOURCE) | \

The suitable-extractor macro doesn't take a second argument, so
the ,$(BZCAT) here is useless.

>  		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
>  		--exclude='libjava/*' \
>  		--exclude='libgo/*' \

Another issue is that this series is going to conflict quite badly with
the series posted by Mischa to add specific binutils/gcc/gdb/uClibc
versions for ARC.

It would probably be good if you could sync up on these two series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
