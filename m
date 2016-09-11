From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Sep 2016 00:55:29 +0200
Subject: [Buildroot] [PATCH 2/4] php: rework selection of interfaces
In-Reply-To: <1473632768-53238-2-git-send-email-fabrice.fontaine@orange.com>
References: <1473632768-53238-1-git-send-email-fabrice.fontaine@orange.com>
 <1473632768-53238-2-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <765efa55-2d51-62a0-f115-c5b4e34c9d7a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabrice,

On 12-09-16 00:26, Fabrice Fontaine wrote:
> Following suggestion of Yann Morin, rework selection of php interfaces:
> use booleans instead of choice to be able to select multiple interfaces
> as they are not exclusive

 Maybe add something like:

The choice was introduced in commit fcdc9f891 to make sure at least one
SAPI option was selected. Here, we use an auxiliary symbol
BR2_PACKAGE_PHP_HAS_SAPI and CGI will be selected if this symbol is not set.

> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
>  package/php/Config.in | 40 +++++-----------------------------------
>  package/php/php.mk    |  8 ++++----
>  2 files changed, 9 insertions(+), 39 deletions(-)
> 
> diff --git a/package/php/Config.in b/package/php/Config.in
> index eee8d26..c90ad4f 100644
> --- a/package/php/Config.in
> +++ b/package/php/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PHP
>  	bool "php"
> +	select BR2_PACKAGE_PHP_SAPI_CGI if !BR2_PACKAGE_PHP_HAS_SAPI
>  	help
>  	  PHP  is a widely-used general-purpose scripting
>  	  language that is especially suited for Web development
> @@ -9,61 +10,30 @@ config BR2_PACKAGE_PHP
>  
>  if BR2_PACKAGE_PHP
>  
> -config BR2_PACKAGE_PHP_CLI
> +# Helper to make sure at least one interface is selected.
> +config BR2_PACKAGE_PHP_HAS_SAPI

 The name is not ideal, because it's actually _HAS_SAPI_EXCEPT_CGI. But that's
impossible to understand, so perhaps extend the comment with
# All SAPI options except CGI will select this symbol.

>  	bool
>  
> -config BR2_PACKAGE_PHP_CGI
> -	bool
> -
> -config BR2_PACKAGE_PHP_FPM
> -	bool
> -
> -choice
> -	prompt "Interface"

 You should keep this as a comment, or alternatively change the prompts below to
include "Interface". Now it is just

     [*] php
     -*-   CGI
     [ ]   CLI
     [ ]   FPM
           Extensions  --->

which is not descriptive enough IMHO.

> -	default BR2_PACKAGE_PHP_SAPI_CGI
> -	help
> -	  Select the PHP interface(s).
> -
>  config BR2_PACKAGE_PHP_SAPI_CGI
>  	bool "CGI"
>  	# CGI uses fork()
>  	depends on BR2_USE_MMU
> -	select BR2_PACKAGE_PHP_CGI
>  	help
>  	  Common Gateway Interface
>  
>  config BR2_PACKAGE_PHP_SAPI_CLI
>  	bool "CLI"
> -	select BR2_PACKAGE_PHP_CLI
> +	select BR2_PACKAGE_PHP_HAS_SAPI
>  	help
>  	  Command Line Interface
>  
>  config BR2_PACKAGE_PHP_SAPI_FPM
>  	bool "FPM"
>  	depends on BR2_USE_MMU
> -	select BR2_PACKAGE_PHP_FPM
> +	select BR2_PACKAGE_PHP_HAS_SAPI
>  	help
>  	  PHP-FPM (FastCGI Process Manager)

 Isn't FPM mutually exclusive with CGI?

 If yes, it could be tricky to code that in Config.in without a dependency cycle
due to HAS_SAPI...

>  
> -config BR2_PACKAGE_PHP_SAPI_CLI_CGI
> -	bool "CGI and CLI"
> -	# CGI uses fork()
> -	depends on BR2_USE_MMU
> -	select BR2_PACKAGE_PHP_CLI
> -	select BR2_PACKAGE_PHP_CGI

 Any user-settable config symbol that is removed should move to
Config.in.legacy. Something like this:

config BR2_PACKAGE_PHP_SAPI_CLI_CGI
	bool "PHP CGI and CLI option is split up"
	select BR2_PACKAGE_PHP_SAPI_CLI
	select BR2_PACKAGE_PHP_SAPI_CGI
	help
	  The PHP Interface options have been split up into a
	  separate option for each interface.

> -	help
> -	  Command line and Common gateway interfaces
> -
> -config BR2_PACKAGE_PHP_SAPI_CLI_FPM

 Similar for this one.


 Regards,
 Arnout

> -	bool "FPM and CLI"
> -	depends on BR2_USE_MMU
> -	select BR2_PACKAGE_PHP_CLI
> -	select BR2_PACKAGE_PHP_FPM
> -	help
> -	  Command line and PHP-FPM (FastCGI Process Manager)
> -
> -endchoice
> -
>  source "package/php/Config.ext"
>  
>  endif
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 7df10be..97e3396 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -77,9 +77,9 @@ else
>  PHP_CONF_ENV += ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=no
>  endif
>  
> -PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
> -PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
> -PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
> +PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),,--disable-cli)
> +PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),,--disable-cgi)
> +PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_FPM),--enable-fpm,--disable-fpm)
>  
>  ### Extensions
>  PHP_CONF_OPTS += \
> @@ -280,7 +280,7 @@ PHP_CONF_OPTS += \
>  PHP_DEPENDENCIES += jpeg libpng freetype
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PHP_FPM),y)
> +ifeq ($(BR2_PACKAGE_PHP_SAPI_FPM),y)
>  define PHP_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 $(@D)/sapi/fpm/init.d.php-fpm \
>  		$(TARGET_DIR)/etc/init.d/S49php-fpm
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
