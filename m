From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 17:43:38 +0200
Subject: [Buildroot] [PATCH v2] php.ini: set date.timezone
In-Reply-To: <1430579415-22802-3-git-send-email-bos@je-eigen-domein.nl>
References: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>
 <1430579415-22802-3-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <5544F0AA.7050305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/15 17:10, Floris Bos wrote:
> Set date.timezone in php.ini to match time zone settings.
> Prevents a warning being logged about it not being set
> each time a PHP date/time method is used.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> ---
> v2: follows Arnout's suggestion, using BR2_TARGET_LOCALTIME
> ---
>  package/php/php.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 3b9a117..47811ff 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -24,6 +24,12 @@ PHP_CONF_ENV = \
>  	ac_cv_func_strcasestr=yes \
>  	EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
>  
> +ifeq ($(BR2_TARGET_LOCALTIME),)
> +PHP_LOCALTIME = UTC
> +else
> +PHP_LOCALTIME = $(BR2_TARGET_LOCALTIME)
> +endif
> +
>  # PHP can't be AUTORECONFed the standard way unfortunately
>  PHP_DEPENDENCIES += host-autoconf host-automake host-libtool
>  define PHP_BUILDCONF
> @@ -288,6 +294,8 @@ define PHP_INSTALL_FIXUP
>  	rm -f $(TARGET_DIR)/usr/bin/phpize
>  	$(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
>  		$(TARGET_DIR)/etc/php.ini
> +	$(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
> +		$(TARGET_DIR)/etc/php.ini
>  endef
>  
>  PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
