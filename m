From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 00:23:10 +0200
Subject: [Buildroot] [PATCH] php.ini: set date.timezone to UTC
In-Reply-To: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <5543FCCE.2000904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 20:12, Floris Bos wrote:
> Prevent a warning being logged each time a PHP date/time method is
> used by setting UTC as (default) timezone in php.ini
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/php/php.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 3b9a117..7bd3f63 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -288,6 +288,7 @@ define PHP_INSTALL_FIXUP
>  	rm -f $(TARGET_DIR)/usr/bin/phpize
>  	$(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
>  		$(TARGET_DIR)/etc/php.ini
> +	$(SED) 's/;date.timezone =/date.timezone = UTC/' $(TARGET_DIR)/etc/php.ini

 Would it be possible to use BR2_TARGET_LOCALTIME (if set) instead? Something like:

ifeq ($(BR2_TARGET_LOCALTIME),)
PHP_LOCALTIME = UTC
else
PHP_LOCALTIME = $(BR2_TARGET_LOCALTIME)
endif

	$(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
		$(TARGET_DIR)/etc/php.ini

 That is, assuming that php can deal with complex timezones like Europe/Brussels.

 Regards,
 Arnout

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
