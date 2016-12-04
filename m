From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 23:52:30 +0100
Subject: [Buildroot] [PATCH 1/1] nginx-dav-ext: New package
In-Reply-To: <1480438071-11906-1-git-send-email-johan.oudinet@gmail.com>
References: <1480438071-11906-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20161204235230.4be68e7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied to master, but after doing a number of changes. See below.

On Tue, 29 Nov 2016 17:47:51 +0100, Johan Oudinet wrote:

> diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
> new file mode 100644
> index 0000000..6c2b3a2
> --- /dev/null
> +++ b/package/nginx-dav-ext/nginx-dav-ext.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# nginx-dav-ext
> +#
> +################################################################################
> +
> +NGINX_DAV_EXT_VERSION = v0.0.3
> +NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,$(NGINX_DAV_EXT_VERSION))
> +

LICENSE and LICENSE_FILES were missing here, so I've added them.

> +NGINX_DAV_EXT_DEPENDENCIES = expat

> diff --git a/package/nginx/Config.in b/package/nginx/Config.in
> index e6f2d96..6f339c7 100644
> --- a/package/nginx/Config.in
> +++ b/package/nginx/Config.in
> @@ -85,6 +85,16 @@ config BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
>  	help
>  	  Enable ngx_http_dav_module
>  
> +if BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
> +
> +config BR2_PACKAGE_NGINX_HTTP_DAV_EXT_MODULE
> +	bool "ngx_http_dav_ext_module"
> +	select BR2_PACKAGE_NGINX_DAV_EXT
> +	help
> +	  Enable ngx_http_dav_ext_module
> +
> +endif # BR2_PACKAGE_NGINX_HTTP_DAV_MODULE

This was not really needed, and we don't do that for other external
nginx modules, so I've dropped this change. Enabling
BR2_PACKAGE_NGINX_DAV_EXT is enough to get this module enabled.

> +ifeq ($(BR2_PACKAGE_NGINX_HTTP_DAV_EXT_MODULE)$(BR2_PACKAGE_NGINX_DAV_EXT),yy)

So I've changed this to just:

ifeq ($(BR2_PACKAGE_NGINX_DAV_EXT),y)

> +NGINX_DEPENDENCIES += nginx-dav-ext
> +NGINX_CONF_OPTS += --add-module=$(NGINX_DAV_EXT_DIR)
> +endif

and moved the whole chunk next to the "upload" external module
handling, so that all external modules are handled in the same place in
nginx.mk.

I've also added a separate patch to add you in the DEVELOPERS file for
nginx-dav-ext (even though you will never receive a build failure about
it, since the build really takes place inside the nginx package).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
