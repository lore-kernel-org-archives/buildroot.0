From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Aug 2016 02:26:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: switch from libmysqlclient
 to mysqlnd
In-Reply-To: <1471971288-4564-1-git-send-email-bos@je-eigen-domein.nl>
References: <1471971288-4564-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <65c74b5a-1a2a-f17f-5381-91b0cf7503c2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23-08-16 18:54, Floris Bos wrote:
> The Mysql Native Driver has been the default mysql driver since
> PHP 5.4, but buildroot was still using libmysqlclient.
> 
> Mysqlnd has several advantages such as improved memory management
> and the more favorable PHP licensing terms.
> (can combine it with proprietary PHP extensions like Ioncube
> loader, while libmysqlclient requires commercial licensing if you
> link to it and do not fall under their GPL/FOSS license exception)

 I may be too tired and could be missing something, but this commit message
looks like it doesn't match the actual change...

 I _guess_ that the php config script will use mysqlnd when the plain
--with-mysqli option is passed, and will use libmysqlclient when --with-mysqli
has a parameter. If this is the case, please specify it explicitly in the commit
message. If this is not the case, it should _definitely_ be explained in the
commit message :-)

 With that, you can add my
  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout


> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/php/Config.ext | 12 ------------
>  package/php/php.mk     |  6 ++----
>  2 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 82aaf41..7c3ba7e 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -113,10 +113,6 @@ endif
>  
>  config BR2_PACKAGE_PHP_EXT_MYSQLI
>  	bool "Mysqli"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_USE_MMU # mysql
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
> -	select BR2_PACKAGE_MYSQL
>  	help
>  	  MySQL Improved extension support
>  
> @@ -135,17 +131,9 @@ if BR2_PACKAGE_PHP_EXT_PDO
>  
>  config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
>  	bool "MySQL"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_USE_MMU # mysql
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
> -	select BR2_PACKAGE_MYSQL
>  	help
>  	  PDO driver for MySQL
>  
> -comment "MySQL drivers need a toolchain w/ C++, threads"
> -	depends on BR2_USE_MMU
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> -
>  config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
>  	bool "PostgreSQL"
>  	select BR2_PACKAGE_POSTGRESQL
> diff --git a/package/php/php.mk b/package/php/php.mk
> index d7e27a1..deaf56e 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -181,8 +181,7 @@ endif
>  
>  ### Native SQL extensions
>  ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQLI),y)
> -PHP_CONF_OPTS += --with-mysqli=$(STAGING_DIR)/usr/bin/mysql_config
> -PHP_DEPENDENCIES += mysql
> +PHP_CONF_OPTS += --with-mysqli
>  endif
>  ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
>  PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
> @@ -199,8 +198,7 @@ PHP_DEPENDENCIES += sqlite
>  PHP_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
>  endif
>  ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
> -PHP_CONF_OPTS += --with-pdo-mysql=$(STAGING_DIR)/usr
> -PHP_DEPENDENCIES += mysql
> +PHP_CONF_OPTS += --with-pdo-mysql
>  endif
>  ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL),y)
>  PHP_CONF_OPTS += --with-pdo-pgsql=$(STAGING_DIR)/usr
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
