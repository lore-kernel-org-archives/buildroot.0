From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 00:57:54 +0100
Subject: [Buildroot] [PATCH 24/84 RFC] package/php: use 'menuconfig'
 instad of 'config'+'menu'
In-Reply-To: <7f07ff3547359b272d229ebd4ca3740b7c6eff84.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <7f07ff3547359b272d229ebd4ca3740b7c6eff84.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56846F82.1010404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:24, Yann E. MORIN wrote:
> Move the external extensions selection into the bundled extensions'
> Config.in.
> 
> Make the menu prompt a comment, reword it so that it is more in line
> with the following comments.

 Yet another NACK, and here you can see another reason why it's not good IMHO:
the internal extension have prompts like "XSL", while the external extensions
are called "php-yaml", which looks inconsistent.


 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Config.in      | 16 ----------------
>  package/php/Config.ext | 20 ++++++++++++++++++--
>  package/php/Config.in  |  2 +-
>  3 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index d65730a..9b719e8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -542,22 +542,6 @@ endif
>  	source "package/nodejs/Config.in"
>  	source "package/perl/Config.in"
>  	source "package/php/Config.in"
> -if BR2_PACKAGE_PHP
> -if !BR2_STATIC_LIBS
> -menu "External php extensions"
> -	source "package/php-geoip/Config.in"
> -	source "package/php-gnupg/Config.in"
> -	source "package/php-imagick/Config.in"
> -	source "package/php-memcached/Config.in"
> -	source "package/php-ssh2/Config.in"
> -	source "package/php-yaml/Config.in"
> -	source "package/php-zmq/Config.in"
> -endmenu
> -endif
> -if BR2_STATIC_LIBS
> -comment "External PHP extensions need a toolchain w/ dynamic library"
> -endif
> -endif
>  	source "package/python/Config.in"
>  	source "package/python3/Config.in"
>  if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 5324e79..92f4d6a 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -1,4 +1,4 @@
> -menu "Extensions"
> +comment "Generic extensions"
>  
>  config BR2_PACKAGE_PHP_EXT_CALENDAR
>  	bool "Calendar"
> @@ -400,4 +400,20 @@ config BR2_PACKAGE_PHP_EXT_XSL
>  	help
>  	  XSL transformation support
>  
> -endmenu
> +if !BR2_STATIC_LIBS
> +
> +comment "External extensions"
> +
> +source "package/php-geoip/Config.in"
> +source "package/php-gnupg/Config.in"
> +source "package/php-imagick/Config.in"
> +source "package/php-memcached/Config.in"
> +source "package/php-ssh2/Config.in"
> +source "package/php-yaml/Config.in"
> +source "package/php-zmq/Config.in"
> +
> +endif # !STATIC_LIBS
> +
> +if BR2_STATIC_LIBs
> +comment "External PHP extensions need a toolchain w/ dynamic library"
> +endif
> diff --git a/package/php/Config.in b/package/php/Config.in
> index eee8d26..7e79179 100644
> --- a/package/php/Config.in
> +++ b/package/php/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_PHP
> +menuconfig BR2_PACKAGE_PHP
>  	bool "php"
>  	help
>  	  PHP  is a widely-used general-purpose scripting
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
