From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 19:05:15 +0200
Subject: [Buildroot] [PATCH 063/100] php: use the new gettext logic
In-Reply-To: <20170704144920.12318-64-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
 <20170704144920.12318-64-thomas.petazzoni@free-electrons.com>
Message-ID: <4e437522-446a-96a1-f0ed-71a6069b2614@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 16:48, Thomas Petazzoni wrote:
> This commit switches to use the new gettext logic, which involves:
> 
>  - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
>    on gettext/host-gettext
> 
>  - dropping BR2_PACKAGE_GETTEXT selection. Thanks to this, we can drop
>    the BR2_USE_WCHAR dependency
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/php/Config.ext | 5 -----
>  package/php/php.mk     | 2 +-
>  2 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index bb6ada6..5fe3513 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -164,14 +164,9 @@ comment "Human language and character encoding support"
>  
>  config BR2_PACKAGE_PHP_EXT_GETTEXT
>  	bool "Gettext"
> -	depends on BR2_USE_WCHAR
> -	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT

 I was going to say "shouldn't this depend on ENABLE_NLS", but of course it does
make sense to have this extension even if you don't have full NLS. However, in
that case you probably want the full-fledged gettext (otherwise there isn't much
point in having this extension). So the idea is that you would have NLS just for
PHP and not for all the other packages - which is a very valid use case IMO.

 So, I think here we would need to keep the dependency on WCHAR and the select
of gettext.

>  	help
>  	  Gettext support
>  
> -comment "Gettext support needs a toolchain w/ wchar"
> -	depends on !BR2_USE_WCHAR
> -
>  config BR2_PACKAGE_PHP_EXT_ICONV
>  	bool "iconv"
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index fe531a4..1a1ed21 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -160,7 +160,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
>  PHP_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
> -PHP_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)
> +PHP_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)

 Since the gettext extension doesn't depend on ENABLE_NLS, you can't use
NLS_DEPENDENCIES here - otherwise you don't get the full gettext so the gettext
extension is pretty useless.

 Bottom line: either the extension depends on ENABLE_NLS, or you have to repeat
the BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL handling.


 Regards,
 Arnout

>  endif
>  
>  ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
