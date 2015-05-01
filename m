From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 00:36:42 +0200
Subject: [Buildroot] [PATCH v2 2/3] php: fpm sapi: install php-fpm.conf
In-Reply-To: <1430503955-24928-3-git-send-email-bos@je-eigen-domein.nl>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
 <1430503955-24928-3-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <5543FFFA.3060909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 20:12, Floris Bos wrote:
> Install a custom php-fpm.conf instead of the stock one.
> 
> - Listening on /var/run/php-fpm.sock instead of TCP port so we can
>   restrict access to webserver user www-data.
> - Using ondemand pm, so PHP children are only started after a PHP
>   request, instead of kept resident all the time.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
> v2: limit children to 5 by default

 And split it into two patches :-)

 Regards,
 Arnout

> ---
>  package/php/php-fpm.conf | 14 ++++++++++++++
>  package/php/php.mk       |  8 ++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 package/php/php-fpm.conf
> 
> diff --git a/package/php/php-fpm.conf b/package/php/php-fpm.conf
> new file mode 100644
> index 0000000..b75a58f
> --- /dev/null
> +++ b/package/php/php-fpm.conf
> @@ -0,0 +1,14 @@
> +[www]
> +# Only start children when there are requests to be processed
> +pm = ondemand
> +# Terminate them again after there haven't been any for 2 minutes
> +pm.process_idle_timeout = 120s
> +# Maximum number of children processing PHP requests concurrently
> +pm.max_children = 5
> +
> +listen = /var/run/php-fpm.sock
> +listen.owner = www-data
> +listen.group = www-data
> +user = www-data
> +group = www-data
> +
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 4c65c35..3b9a117 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -264,6 +264,14 @@ define PHP_INSTALL_INIT_SYSTEMD
>  	ln -fs ../../../../usr/lib/systemd/system/php-fpm.service \
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/php-fpm.service
>  endef
> +
> +define PHP_INSTALL_FPM_CONF
> +	$(INSTALL) -D -m 0644 package/php/php-fpm.conf \
> +		$(TARGET_DIR)/etc/php-fpm.conf
> +	rm -f $(TARGET_DIR)/etc/php-fpm.conf.default
> +endef
> +
> +PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FPM_CONF
>  endif
>  
>  define PHP_EXTENSIONS_FIXUP
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
