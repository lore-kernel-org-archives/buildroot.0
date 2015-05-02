From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 23:17:44 +0200
Subject: [Buildroot] [PATCH v2 3/3] lighttpd: add option to enable
 php-fpm configuration
In-Reply-To: <1430503955-24928-4-git-send-email-bos@je-eigen-domein.nl>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
 <1430503955-24928-4-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <55453EF8.4010608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 20:12, Floris Bos wrote:
> If both lighttpd and php-fpm are selected, offer to
> enable PHP in the lighttpd configuration.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/lighttpd/Config.in    | 20 ++++++++++++++++++++
>  package/lighttpd/fastcgi.conf |  2 ++
>  package/lighttpd/lighttpd.mk  | 11 +++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 package/lighttpd/fastcgi.conf
> 
> diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
> index 2c101e7..e984ef8 100644
> --- a/package/lighttpd/Config.in
> +++ b/package/lighttpd/Config.in
> @@ -56,4 +56,24 @@ config BR2_PACKAGE_LIGHTTPD_LUA
>  	help
>  	  Enable Lua support. Needed to support mod_magnet
>  
> +config BR2_PACKAGE_LIGHTTPD_PHP_FPM
> +	bool "enable php in configuration"
> +	depends on BR2_PACKAGE_PHP

 This is unneeded (implied by the one below)

> +	depends on BR2_PACKAGE_PHP_FPM
> +	default "y"

 We don't put "" around y

> +	help
> +	  Configure lighttpd to handle PHP requests through php-fpm.
> +
> +	  Also enables allow-x-send-file, allowing you to offload static file sending

 This line is too long

> +	  to lighttpd with PHP code like:
> +
> +	  header("X-Send-File: /path/to/file");
> +
> +	  This is a necessity for letting the user download larger files, as
> +	  lighttpd buffers all PHP script output infinitely to memory, and
> +	  may run out if you use the normal readfile() method to output files.
> +
> +comment "php support depends on php with FPM sapi"
> +	depends on !BR2_PACKAGE_PHP || !BR2_PACKAGE_PHP_FPM

 And I'd make this
	depends on BR2_PACKAGE_PHP && !BR2_PACKAGE_PHP_FPM

The user will be smart enough to enable php if he needs is, so no comment needed
for that. But he may not be smart enough to enable FPM. And FPM is part of a
choice so you can't select it (well actually it's not really part of the choice
so you can select it, but it would be a little weird to say the least).


 Regards,
 Arnout

> +
>  endif
> diff --git a/package/lighttpd/fastcgi.conf b/package/lighttpd/fastcgi.conf
> new file mode 100644
> index 0000000..46c5f9a
> --- /dev/null
> +++ b/package/lighttpd/fastcgi.conf
> @@ -0,0 +1,2 @@
> +server.modules += ( "mod_fastcgi" )
> +fastcgi.server  = ( ".php" => (( "socket" => "/var/run/php-fpm.sock", "allow-x-send-file" => "enable" )) )
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index 626cd69..16ca88b 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -77,6 +77,17 @@ endef
>  
>  LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
>  
> +ifeq ($(BR2_PACKAGE_LIGHTTPD_PHP_FPM),y)
> +define LIGHTTPD_INSTALL_FASTCGI_CONFIG
> +	$(INSTALL) -D -m 0644 package/lighttpd/fastcgi.conf \
> +		$(TARGET_DIR)/etc/lighttpd/conf.d/fastcgi.conf
> +	$(SED) '/#include \"conf.d\/fastcgi.conf\"/s/^#//' \
> +		$(TARGET_DIR)/etc/lighttpd/modules.conf
> +endef
> +
> +LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_FASTCGI_CONFIG
> +endif
> +
>  define LIGHTTPD_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/lighttpd/S50lighttpd \
>  		$(TARGET_DIR)/etc/init.d/S50lighttpd
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
