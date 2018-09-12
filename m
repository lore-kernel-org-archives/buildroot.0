From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 17:21:19 +0200
Subject: [Buildroot] [PATCH v2 4/6] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <20180912102256.3164-5-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
 <20180912102256.3164-5-mark.corbin@embecosm.com>
Message-ID: <20180912172119.5ad08e92@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 11:22:54 +0100, Mark Corbin wrote:

> +GLIBC_CONF_OPTS = \
> +		--with-pkgversion="Buildroot" \
> +		--without-cvs \
> +		--disable-profile \
> +		--without-gd \
> +		--enable-obsolete-rpc \
> +		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
> +		--with-headers=$(STAGING_DIR)/usr/include
> +
> +ifeq ($(BR2_x86_64),y)
> +GLIBC_CONF_OPTS += --enable-lock-elision
> +endif
> +
> +# Override the default library locations of /lib64/<abi> and
> +# /usr/lib64/<abi>/ for RISC-V.
> +ifeq ($(BR2_riscv),y)
> +GLIBC_CONF_OPTS += libc_cv_slibdir=/lib64 libc_cv_rtlddir=/lib
> +endif
> +
>  define GLIBC_CONFIGURE_CMDS
>  	mkdir -p $(@D)/build
>  	# Do the configuration
> @@ -98,14 +118,8 @@ define GLIBC_CONFIGURE_CMDS
>  		--build=$(GNU_HOST_NAME) \
>  		--prefix=/usr \
>  		--enable-shared \
> -		$(if $(BR2_x86_64),--enable-lock-elision) \
> -		--with-pkgversion="Buildroot" \
> -		--without-cvs \
> -		--disable-profile \
> -		--without-gd \
> -		--enable-obsolete-rpc \
> -		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
> -		--with-headers=$(STAGING_DIR)/usr/include)
> +		$(GLIBC_CONF_OPTS) \
> +	)

This refactor of GLIBC_CONF_OPTS should have been a preparatory patch,
so that the small addition of GLIBC_CONF_OPTS specifically related to
RISC-V is the only portion part of the RISC-V architecture patch.

However, I think those variables lib_cv_* should not go in
GLIBC_CONF_OPTS, but in GLIBC_CONF_ENV, since that's how we do it in
all other autotools-based packages. But we indeed have a bunch of such
variables already:

                ac_cv_path_BASH_SHELL=/bin/bash \
                libc_cv_forced_unwind=yes \
                libc_cv_ssp=no \

So perhaps we need a first preparatory patch that move these to
GLIBC_CONF_ENV, and then your RISC-V architecture patch.

At this point, no need to resend such for this, this is the sort of
thing that we can fixup while applying. We'll see if there are more
comments on the rest of the series that require a new iteration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
