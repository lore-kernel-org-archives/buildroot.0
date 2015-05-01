From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 01:07:02 +0200
Subject: [Buildroot] [PATCH v2 1/3] php: fpm sapi: install startup script
In-Reply-To: <1430503955-24928-2-git-send-email-bos@je-eigen-domein.nl>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
 <1430503955-24928-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <55440716.1000908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 20:12, Floris Bos wrote:
> Install the startup script if using the FastCGI Process Manager.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 (after Floris' further explanation).

 Regards,
 Arnout

> 
> ---
> v2: add systemd support
> ---
>  package/php/0006-fix-php-fpm.service.in.patch | 35 +++++++++++++++++++++++++++
>  package/php/php.mk                            | 15 ++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 package/php/0006-fix-php-fpm.service.in.patch
> 
> diff --git a/package/php/0006-fix-php-fpm.service.in.patch b/package/php/0006-fix-php-fpm.service.in.patch
> new file mode 100644
> index 0000000..a182a25
> --- /dev/null
> +++ b/package/php/0006-fix-php-fpm.service.in.patch
> @@ -0,0 +1,35 @@
> +From bb19125781c0794da9a63fee62e263ff4efff661 Mon Sep 17 00:00:00 2001
> +From: Floris Bos <bos@je-eigen-domein.nl>
> +Date: Fri, 1 May 2015 15:28:55 +0200
> +Subject: [PATCH] Fix php-fpm.service.in
> +
> +- Expand file paths.
> +- Remove obsolete After=syslog.target. Syslog is socket activated nowadays.
> +
> +Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> +---
> + sapi/fpm/php-fpm.service.in | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/sapi/fpm/php-fpm.service.in b/sapi/fpm/php-fpm.service.in
> +index a2df30e..c135f04 100644
> +--- a/sapi/fpm/php-fpm.service.in
> ++++ b/sapi/fpm/php-fpm.service.in
> +@@ -1,11 +1,11 @@
> + [Unit]
> + Description=The PHP FastCGI Process Manager
> +-After=syslog.target network.target
> ++After=network.target
> + 
> + [Service]
> + Type=@php_fpm_systemd@
> +-PIDFile=@localstatedir@/run/php-fpm.pid
> +-ExecStart=@sbindir@/php-fpm --nodaemonize --fpm-config @sysconfdir@/php-fpm.conf
> ++PIDFile=@EXPANDED_LOCALSTATEDIR@/run/php-fpm.pid
> ++ExecStart=@EXPANDED_SBINDIR@/php-fpm --nodaemonize --fpm-config @EXPANDED_SYSCONFDIR@/php-fpm.conf
> + ExecReload=/bin/kill -USR2 $MAINPID
> + 
> + [Install]
> +-- 
> +2.1.4
> +
> diff --git a/package/php/php.mk b/package/php/php.mk
> index e4331f2..4c65c35 100644
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
> +
> +define PHP_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(@D)/sapi/fpm/php-fpm.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/php-fpm.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -fs ../../../../usr/lib/systemd/system/php-fpm.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/php-fpm.service
> +endef
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
