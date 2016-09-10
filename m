From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 00:08:33 +0200
Subject: [Buildroot] [PATCH v3,2/2] php: add apache support
In-Reply-To: <1473535035-130056-2-git-send-email-fabrice.fontaine@orange.com>
References: <1473535035-130056-1-git-send-email-fabrice.fontaine@orange.com>
 <1473535035-130056-2-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160910220833.GI5740@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2016-09-10 21:17 +0200, Fabrice Fontaine spake thusly:
> Continue work started by Bernd Kuhls in
> https://patchwork.ozlabs.org/patch/437544/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Remove unneeded php-04-apache.patch
>  - Fix pthread detection if Apache MPM is event or worker
>  - Update pthread detection mechanism (--enable-pthreads does not exist
>    anymore)
>  - Remove unneeded --oldincludedir
>  - Fix php module path
> 
>  package/php/Config.in | 17 +++++++++++++++++
>  package/php/php.mk    | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/package/php/Config.in b/package/php/Config.in
> index eee8d26..5f5a976 100644
> --- a/package/php/Config.in
> +++ b/package/php/Config.in
> @@ -9,6 +9,9 @@ config BR2_PACKAGE_PHP
>  
>  if BR2_PACKAGE_PHP
>  
> +config BR2_PACKAGE_PHP_APACHE
> +	bool
> +
>  config BR2_PACKAGE_PHP_CLI
>  	bool
>  
> @@ -24,6 +27,20 @@ choice
>  	help
>  	  Select the PHP interface(s).
>  
> +config BR2_PACKAGE_PHP_SAPI_APACHE
> +	bool "Apache"

So the apache "interface" is exclusive to all others?

In the end, I seem to recall I was the one suggesting we do a choice
here (see commit fcdc9f8). In retrospect, that was a very bad
suggestion.

Instead, we should remove that choice, turn back in possible interfaces
to individual booleans, and just ensure that at least one is enabled,
lilke we do in other packages (e.g. weston):

    config BR2_PACKAGE_PHP
        bool "php"
        slect BR2_PACKAGE_PHP_SAPI_CGI if !BR2_PACKAGE_PHP_HAS_SAPI

    config BR2_PACKAGE_PHP_HAS_SAPI
        bool

    config BR2_PACKAGE_PHP_SAPI_CGI
        bool "CGI
        # No select of BR2_PACKAGE_PHP_HAS_SAPI, or circular dependency
        # would ensue. Don't add this comment in actual code! ;-)

    config BR2_PACKAGE_PHP_SAPI_CLI
        bool "CLI"
        select BR2_PACKAGE_PHP_HAS_SAPI

    config BR2_PACKAGE_PHP_SAPI_FPM
        bool "FPM"
        select BR2_PACKAGE_PHP_HAS_SAPI

    config BR2_PACKAGE_PHP_SAPI_APACHE
        bool "Apache"
        select BR2_PACKAGE_PHP_HAS_SAPI

Of course, if some interfaces are incompatible one with the others, then
add proper dependencies (but be carefull of circular deps! ;-) ).

Oh, and splitting the choice should be a separate patch, to come before
this one, please.

> +	select BR2_PACKAGE_APACHE
> +	select BR2_PACKAGE_PHP_APACHE
> +	depends on !BR2_STATIC_LIBS # apache
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # apache
> +	depends on BR2_USE_MMU # apr

"depends on" go before "select", please. Also, I'd prefer the
architecture dependencies come first (i.e. MMU before threads and
static).

> +	help
> +	  Apache module
> +
> +comment "apache module needs a toolchain w/ dynamic library, threads"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> +
>  config BR2_PACKAGE_PHP_SAPI_CGI
>  	bool "CGI"
>  	# CGI uses fork()
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 7df10be..083cd58 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -81,6 +81,37 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
>  PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
>  PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
>  
> +ifeq ($(BR2_PACKAGE_PHP_APACHE),y)
> +PHP_DEPENDENCIES += apache
> +
> +PHP_CONF_OPTS += \
> +	--with-apxs2=$(STAGING_DIR)/usr/bin/apxs \
> +	--with-config-file-path=/etc/apache2 \
> +	--with-config-file-scan-dir=/etc/apache2/php \
> +	--localstatedir=/var
> +
> +# PHP assumes pthreads are not working when cross-compiling,
> +# needed for Apache-MPM event or worker
> +ifeq ($(BR2_PACKAGE_APACHE_EVENT)$(BR2_PACKAGE_APACHE_WORKER),y)
> +PHP_CONF_ENV += ac_cv_pthreads_lib=pthread
> +PHP_CONF_OPTS += --enable-maintainer-zts
> +
> +define PHP_FIX_THREADS_DETECTION
> +	$(SED) 's/pthreads_working\=no/pthreads_working\=yes/' $(@D)/configure
> +endef
> +
> +PHP_PRE_CONFIGURE_HOOKS += PHP_FIX_THREADS_DETECTION
> +endif

Why do you need to tweak the configure file? Provide more explanations,
please (in the commit log and/or by expanding the comment above).

Also, it probably does not have to be conditional to the Apache SAPI to
be enabled, does it? If so, then this tweak (if at all needed) should
not depend on the Apache SAPI, but really on BR2_TOOLCHAIN_HAS_THREADS.

In any case, this thread "fix" should have been in a separate patch, to
come before the Apache SAPI.

> +# PHP sets a full path with $(TARGET_DIR) for libphp module instead of a
> +# relative path
> +define PHP_FIX_MODULE_PATH
> +	$(SED) 's:$(TARGET_DIR)/usr/::' $(TARGET_DIR)/etc/apache2/httpd.conf
> +endef

That the php package changes the content of a file installed by the
apache package is not good, no-no... :-/

Care to explain a bit more in details what happens here?

Is it because we pass --with-config-file-path=/etc/apache2 ?

If so, I think it would be better not to do so, and only install a
config fragment that has to be sourced by the main apache config file, a
bit like is done in distros.

Regards,
Yann E. MORIN.

> +PHP_POST_INSTALL_TARGET_HOOKS += PHP_FIX_MODULE_PATH
> +endif
> +
>  ### Extensions
>  PHP_CONF_OPTS += \
>  	$(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
> -- 
> 2.5.0
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
