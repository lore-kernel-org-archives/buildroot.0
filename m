From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 22:23:06 +0200
Subject: [Buildroot] [PATCH] nodejs: new package
In-Reply-To: <1344665495-27246-1-git-send-email-net147@gmail.com>
References: <1344665495-27246-1-git-send-email-net147@gmail.com>
Message-ID: <20120811222306.4e21b827@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat, 11 Aug 2012 16:11:35 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> +config BR2_PACKAGE_NODEJS
> +	bool "nodejs"
> +	select BR2_PACKAGE_OPENSSL

I know nothing about nodejs. Is OpenSSL support absolutely mandatory?

> +	help
> +	  Event-driven I/O server-side JavaScript environment based on V8.
> +
> +	  http://nodejs.org/

if BR2_PACKAGE_NODEJS

> +
> +config BR2_PACKAGE_NODEJS_NPM
> +	bool "nodejs npm"
> +	depends on BR2_PACKAGE_NODEJS

Thanks to the if above, you can drop this depends on.

> +	help
> +	  Enable npm (Node Package Manager).
> +
> +config BR2_PACKAGE_NODEJS_WAF
> +	bool "nodejs waf"
> +	depends on BR2_PACKAGE_NODEJS

Ditto.

> +	help
> +	  Enable node-waf for building native modules.

endif

> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> new file mode 100644
> index 0000000..8a0fa91
> --- /dev/null
> +++ b/package/nodejs/nodejs.mk
> @@ -0,0 +1,54 @@
> +#############################################################
> +#
> +# nodejs
> +#
> +#############################################################
> +NODEJS_VERSION = 0.8.6
> +NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
> +NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
> +NODEJS_INSTALL_STAGING = YES

Does NodeJS contains libraries required by other packages?

> +NODEJS_DEPENDENCIES = host-python
> +NODEJS_LICENSE = MIT
> +
> +define NODEJS_CONFIGURE_CMDS
> +	(cd $(@D); rm -rf config.cache; \
> +		$(TARGET_CONFIGURE_ARGS) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		PATH="$(HOST_DIR)/usr/bin:$(PATH)" \
> +		./configure \
> +		--prefix=/usr \
> +		--without-snapshot \
> +		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
> +		$(if $(BR2_PACKAGE_NODEJS_WAF),,--without-waf) \
> +		--without-dtrace \
> +		--without-etw \
> +	)
> +endef

I haven't looked at the nodejs source code, but looking at this, it
seems like it is using a conventional autoconf based build system. Can
you use the autotools-package infrastructure instead of redefining all
the configure/build/install steps manually?

> diff --git a/package/python/python.mk b/package/python/python.mk
> index fae4e5c..7b314ab 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -27,7 +27,6 @@ HOST_PYTHON_CONF_OPT += 	\
>  	--disable-gdbm		\
>  	--disable-bsddb		\
>  	--disable-test-modules	\
> -	--disable-bz2		\
>  	--disable-ssl
>  
>  HOST_PYTHON_MAKE_ENV = \

This should be in a separate patch, with an explanation on why it is
necessary.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
