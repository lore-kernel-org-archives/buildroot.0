From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Apr 2015 22:27:09 +0200
Subject: [Buildroot] [PATCH] php: fpm sapi: install startup script
In-Reply-To: <1430422567-14903-1-git-send-email-bos@je-eigen-domein.nl>
References: <1430422567-14903-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <5542901D.30403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/30/15 21:36, Floris Bos wrote:
> When PHP's FastCGI Process Manager SAPI is selected:
> 
> - install a startup script.
> - install a simple configuration, using the ondemand process manager
>   that only starts children when the website is actually being used.

 Correct me if I'm wrong, but what is still missing is the configuration of the
webserver to actually use this, right? You still have to update your webserver
configuration to point to /var/run/php-fpm.sock to handle php scripts, right?

 If so, perhaps that could be explained in the help text in php/Config.in.


 It may also be good to explain in the commit log why you don't use the provided
default config file

> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/php/php-fpm.conf | 14 ++++++++++++++
>  package/php/php.mk       | 15 +++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 package/php/php-fpm.conf
> 
> diff --git a/package/php/php-fpm.conf b/package/php/php-fpm.conf
> new file mode 100644
> index 0000000..2ffe595
> --- /dev/null
> +++ b/package/php/php-fpm.conf
> @@ -0,0 +1,14 @@
> +[www]
> +# Only start children when there are requests to be processed
> +pm = ondemand
> +# Terminate them again after there haven't been any for 2 minutes
> +pm.process_idle_timeout = 120s
> +# Maximum number of children processing PHP requests concurrently
> +pm.max_children = 32

 Isn't that a bit high? Typically embedded web servers will not have the power
to handle that many parallel requests efficiently.

> +
> +listen = /var/run/php-fpm.sock
> +listen.owner = www-data
> +listen.group = www-data
> +user = www-data
> +group = www-data
> +
> diff --git a/package/php/php.mk b/package/php/php.mk
> index e4331f2..6c42aba 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -251,6 +251,21 @@ PHP_CONF_OPTS += \
>  PHP_DEPENDENCIES += jpeg libpng freetype
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PHP_FPM),y)
> +define PHP_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 $(@D)/sapi/fpm/init.d.php-fpm \
> +		$(TARGET_DIR)/etc/init.d/S49php-fpm
> +endef

 There's also a php-fpm.service that you can install for systemd.


 Regards,
 Arnout

> +
> +define PHP_INSTALL_FPM_CONF
> +	$(INSTALL) -D -m 0644 package/php/php-fpm.conf \
> +		$(TARGET_DIR)/etc/php-fpm.conf
> +	rm -f $(TARGET_DIR)/etc/php-fpm.conf.default
> +endef
> +
> +PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FPM_CONF
> +endif
> +
>  define PHP_EXTENSIONS_FIXUP
>  	$(SED) "/prefix/ s:/usr:$(STAGING_DIR)/usr:" \
>  		$(STAGING_DIR)/usr/bin/phpize
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
