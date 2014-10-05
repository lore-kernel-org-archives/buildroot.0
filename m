From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 17:56:38 +0200
Subject: [Buildroot] [PATCH 8/8] package/php: Add Apache support
In-Reply-To: <1412516718-12597-8-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
 <1412516718-12597-8-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141005155638.GM4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-05 15:45 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/Config.in                            |   17 +++
>  package/php/php-04-cross-compile.only-for-apache |  131 ++++++++++++++++++++++
>  package/php/php.mk                               |   16 +++
>  3 files changed, 164 insertions(+)
>  create mode 100644 package/php/php-04-cross-compile.only-for-apache
> 
> diff --git a/package/php/Config.in b/package/php/Config.in
> index 32faa32..db4e647 100644
> --- a/package/php/Config.in
> +++ b/package/php/Config.in
> @@ -11,6 +11,9 @@ if BR2_PACKAGE_PHP
>  
>  source "package/php/Config.ext"
>  
> +config BR2_PACKAGE_PHP_APACHE
> +	bool
> +
>  config BR2_PACKAGE_PHP_CLI
>  	bool
>  
> @@ -26,6 +29,20 @@ choice
>  	help
>  	  Select the PHP interface(s).
>  
> +config BR2_PACKAGE_PHP_SAPI_APACHE
> +	bool "Apache"
> +	select BR2_PACKAGE_APACHE
> +	select BR2_PACKAGE_PHP_APACHE
> +	depends on !BR2_PREFER_STATIC_LIB # apache
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # apache
> +	depends on BR2_USE_MMU # apr
> +	help
> +	  Apache module
> +
> +comment "apache module needs a toolchain w/ dynamic library, threads"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HAS_THREADS
> +

Unrelated to your patch, but this choice is getting ugly. Maybe we should
switch to something like:

    config BR2_PACKAGE_PHP
        bool "php"
        select BR2_PACKAGE_PHP_SAPI_CGI if !BR2_PACKAGE_PHP_HAS_SAPI

    config BR2_PACKAGE_PHP_HAS_SAPI
        bool

    config BR2_PACKAGE_PHP_SAPI_CGI
        bool "CGI"

    config BR2_PACKAGE_PHP_SAPI_CLI
        bool "CLI"
        select BR2_PACKAGE_PHP_HAS_SAPI

    config BR2_PACKAGE_PHP_SAPI_APACHE
        bool "Apache"
        select BR2_PACKAGE_PHP_HAS_SAPI

    config BR2_PACKAGE_PHP_SAPI_FPM
        bool "FPM"
        select BR2_PACKAGE_PHP_HAS_SAPI

That way, we ensure at least one is selected, which was the initial
reason for the choice, while stil allowing multiple to be selected.

Then, if some are incompatible, we could do, for example:

    config BR2_PACKAGE_PHP_SAPI_APACHE
        bool "Apache"
        depends on !BR2_PACKAGE_PHP_SAPI_CLI
        select BR2_PACKAGE_PHP_HAS_SAPI

>  config BR2_PACKAGE_PHP_SAPI_CGI
>  	bool "CGI"
>  	# CGI uses fork()
> diff --git a/package/php/php-04-cross-compile.only-for-apache b/package/php/php-04-cross-compile.only-for-apache
> new file mode 100644
> index 0000000..a72befc
> --- /dev/null
> +++ b/package/php/php-04-cross-compile.only-for-apache
> @@ -0,0 +1,131 @@
> +Fix cross-compilation when used as Apache module.
> +
> +Apache is configured to use the worker MPM which depends on threads.
> +As PHP?s phtread detection is broken in a cross-compile environment, it is not
> +possible to apply this patch unconditionally, since php itself works without
> +thread support,

I have to say I do not like this much. How complex would it be to have a
proper patch that would work both with apache enabled or disabled?

We should try to have such a patch, and push it upstream.

[--SNIP--]
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 2e97c9a..0b32bca 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -50,6 +50,22 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
>  PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
>  PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
>  
> +ifeq ($(BR2_PACKAGE_PHP_APACHE),y)
> +# this patchset is only needed when cross-compiling mod_php for Apache
> +define PHP_PATCH_FOR_APACHE
> +	patch -d $(@D) -p1 -E -i $(TOPDIR)/$(PKGDIR)php-04-cross-compile.only-for-apache

Yes, $(PKGDIR) already has a trailing '/', for for readability, I'd
prefer we add one here. Multiple '/' in a path are innocuous.

Regards,
Yann E. MORIN.

> +endef
> +PHP_POST_PATCH_HOOKS += PHP_PATCH_FOR_APACHE
> +PHP_CONF_OPTS += \
> +	--with-apxs2=$(STAGING_DIR)/usr/bin/apxs \
> +	--with-config-file-path=/etc/apache2 \
> +	--with-config-file-scan-dir=/etc/apache2/php \
> +	--oldincludedir=$(STAGING_DIR)/usr/include \
> +	--enable-pthreads \
> +	--localstatedir=/var
> +PHP_DEPENDENCIES += apache
> +endif
> +
>  ### Extensions
>  PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
>  		$(if $(BR2_PACKAGE_PHP_EXT_POSIX),--enable-posix) \
> -- 
> 1.7.10.4
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
