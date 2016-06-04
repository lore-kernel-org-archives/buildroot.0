From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jun 2016 12:06:45 +0200
Subject: [Buildroot] [PATCH 1/4] package/nodejs: Add NODEJS_CONF_OPTS
In-Reply-To: <1464981346-11741-1-git-send-email-martin@barkynet.com>
References: <1464981346-11741-1-git-send-email-martin@barkynet.com>
Message-ID: <20160604100645.GA3852@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2016-06-03 20:15 +0100, Martin Bark spake thusly:
> Most packages in buildroot pass a FOO_CONF_OPTS variable into the
> configure script.  Transition nodejs to follow this convention.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/nodejs/nodejs.mk | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 0329299..b78ba79 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -13,6 +13,12 @@ HOST_NODEJS_DEPENDENCIES = host-python host-zlib
>  NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
>  NODEJS_LICENSE_FILES = LICENSE
>  
> +NODEJS_CONF_OPTS = --without-snapshot \
> +	--shared-zlib \
> +	--without-dtrace \
> +	--without-etw \
> +	--dest-os=linux

When we have multi-line variables, I prefer that we write all options on
multi-line and none on the first line:

    NODEJS_CONF_OPTS = \
        --without-snapshot \
        --shared-zlib \
        --without-dtrace \
        --without-etw \
        --dest-os=linux

Otehrwise, looks good:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  NODEJS_DEPENDENCIES += openssl
>  endif
> @@ -97,18 +103,14 @@ define NODEJS_CONFIGURE_CMDS
>  		PYTHON=$(HOST_DIR)/usr/bin/python2 \
>  		$(HOST_DIR)/usr/bin/python2 ./configure \
>  		--prefix=/usr \
> -		--without-snapshot \
> -		--shared-zlib \
>  		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
>  		$(if $(BR2_PACKAGE_ICU),--with-intl=system-icu,--with-intl=none) \
>  		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
> -		--without-dtrace \
> -		--without-etw \
>  		--dest-cpu=$(NODEJS_CPU) \
>  		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
>  		$(if $(NODEJS_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_MIPS_ARCH_VARIANT)) \
>  		$(if $(NODEJS_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_MIPS_FPU_MODE)) \
> -		--dest-os=linux \
> +		$(NODEJS_CONF_OPTS) \
>  	)
>  endef
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
