From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 14:27:11 +0200
Subject: [Buildroot] [PATCH v7 1/1] package/nodejs: use system-icu for
 host-nodejs
In-Reply-To: <20200727115155.824789-1-james.hilliard1@gmail.com>
References: <20200727115155.824789-1-james.hilliard1@gmail.com>
Message-ID: <20200727122711.GW19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-07-27 05:51 -0600, James Hilliard spake thusly:
> The nodejs configure.py file orders zlib headers before the bundled ICU
> headers. The zlib headers happen to be located in the system include
> directory, next to some system ICU headers (not bundled). If these are
> built before nodejs is, nodejs will get confused and try to use the
> system ICU headers instead of the bundled ones.
> 
> Fix this by always using host-icu.
> 
> Set CXXFLAGS to -DU_DISABLE_RENAMING=1 when building with
> system-icu since host-icu is built with --disable-renaming.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/1ef947553ec762dba6a6202b1cfc84ceed75dbb2/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, with a few changes:

  - keep alphabetical order in _DEPENDENCIES
  - don't introduce HOST_NODEJS_CONF_OPTS

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/nodejs.mk | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 3f35ac7c33..89bd5177a2 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -10,7 +10,7 @@ NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
>  	libuv zlib nghttp2 \
>  	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
> -HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib
> +HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib host-icu
>  NODEJS_INSTALL_STAGING = YES
>  NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
>  NODEJS_LICENSE_FILES = LICENSE
> @@ -26,6 +26,20 @@ NODEJS_CONF_OPTS = \
>  	--cross-compiling \
>  	--dest-os=linux
>  
> +HOST_NODEJS_CONF_OPTS = \
> +	--prefix=$(HOST_DIR) \
> +	--without-snapshot \
> +	--without-dtrace \
> +	--without-etw \
> +	--shared-openssl \
> +	--shared-openssl-includes=$(HOST_DIR)/include/openssl \
> +	--shared-openssl-libpath=$(HOST_DIR)/lib \
> +	--shared-zlib \
> +	--no-cross-compiling \
> +	--with-intl=system-icu
> +
> +HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
> +
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  NODEJS_DEPENDENCIES += openssl
>  NODEJS_CONF_OPTS += --shared-openssl
> @@ -57,16 +71,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
>  		PATH=$(@D)/bin:$(BR_PATH) \
>  		PYTHON=$(HOST_DIR)/bin/python2 \
>  		$(HOST_DIR)/bin/python2 ./configure \
> -		--prefix=$(HOST_DIR) \
> -		--without-snapshot \
> -		--without-dtrace \
> -		--without-etw \
> -		--shared-openssl \
> -		--shared-openssl-includes=$(HOST_DIR)/include/openssl \
> -		--shared-openssl-libpath=$(HOST_DIR)/lib \
> -		--shared-zlib \
> -		--no-cross-compiling \
> -		--with-intl=small-icu \
> +		$(HOST_NODEJS_CONF_OPTS) \
>  	)
>  endef
>  
> @@ -81,6 +86,7 @@ define HOST_NODEJS_BUILD_CMDS
>  	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
>  		$(MAKE) -C $(@D) \
>  		$(HOST_CONFIGURE_OPTS) \
> +		CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
>  		LDFLAGS.host="$(HOST_LDFLAGS)" \
>  		NO_LOAD=cctest.target.mk \
>  		PATH=$(@D)/bin:$(BR_PATH)
> @@ -90,6 +96,7 @@ define HOST_NODEJS_INSTALL_CMDS
>  	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
>  		$(MAKE) -C $(@D) install \
>  		$(HOST_CONFIGURE_OPTS) \
> +		CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
>  		LDFLAGS.host="$(HOST_LDFLAGS)" \
>  		NO_LOAD=cctest.target.mk \
>  		PATH=$(@D)/bin:$(BR_PATH)
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
