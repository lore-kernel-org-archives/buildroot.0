From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 22:57:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: add http geoip support
In-Reply-To: <20200621171222.1232374-1-fontaine.fabrice@gmail.com>
References: <20200621171222.1232374-1-fontaine.fabrice@gmail.com>
Message-ID: <20200621205743.GM2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-21 19:12 +0200, Fabrice Fontaine spake thusly:
> http geoip module is available since version 0.8.6 and
> https://github.com/nginx/nginx/commit/bc10147b9f36f1a61b96ceec016bf4d4d12e128f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nginx/Config.in | 6 ++++++
>  package/nginx/nginx.mk  | 6 +++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nginx/Config.in b/package/nginx/Config.in
> index 5c34f11edd..0dbeaae2ff 100644
> --- a/package/nginx/Config.in
> +++ b/package/nginx/Config.in
> @@ -75,6 +75,12 @@ config BR2_PACKAGE_NGINX_HTTP_IMAGE_FILTER_MODULE
>  	help
>  	  Enable ngx_http_image_filter_module
>  
> +config BR2_PACKAGE_NGINX_HTTP_GEOIP_MODULE
> +	bool "ngx_http_geoip_module"
> +	select BR2_PACKAGE_GEOIP
> +	help
> +	  Enable ngx_http_geoip_module
> +
>  config BR2_PACKAGE_NGINX_HTTP_SUB_MODULE
>  	bool "ngx_http_sub_module"
>  	help
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index c0640c87e6..c675d38ab4 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -85,7 +85,6 @@ endif
>  
>  # modules disabled or not activated because of missing dependencies:
>  # - google_perftools  (googleperftools)
> -# - http_geoip_module (geoip)
>  # - http_perl_module  (host-perl)
>  # - pcre-jit          (want to rebuild pcre)
>  
> @@ -134,6 +133,11 @@ NGINX_DEPENDENCIES += gd jpeg libpng
>  NGINX_CONF_OPTS += --with-http_image_filter_module
>  endif
>  
> +ifeq ($(BR2_PACKAGE_NGINX_HTTP_GEOIP_MODULE),y)
> +NGINX_DEPENDENCIES += geoip
> +NGINX_CONF_OPTS += --with-http_geoip_module
> +endif
> +
>  ifeq ($(BR2_PACKAGE_NGINX_HTTP_GUNZIP_MODULE),y)
>  NGINX_DEPENDENCIES += zlib
>  NGINX_CONF_OPTS += --with-http_gunzip_module
> -- 
> 2.26.2
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
