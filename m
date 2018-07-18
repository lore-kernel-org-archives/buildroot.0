From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 15:40:43 +0200
Subject: [Buildroot] [PATCH 1/1] mariadb: bump version to 10.2.16
In-Reply-To: <20180718132846.3176-1-bluemrp9@gmail.com>
References: <20180718132846.3176-1-bluemrp9@gmail.com>
Message-ID: <20180718154043.1140bb82@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this update. A few comments/questions below.

On Wed, 18 Jul 2018 06:28:46 -0700, Ryan Coe wrote:
> @@ -67,7 +67,7 @@ MARIADB_CONF_OPTS += \
>  	-DMYSQL_DATADIR=/var/lib/mysql \
>  	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
>  
> -HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled
> +HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF

This change should be explained in the commit log. Is it really related
to the bump ?

>  
>  # Some helpers must be compiled for host in order to crosscompile mariadb for
>  # the target. They are then included by import_executables.cmake which is
> @@ -104,13 +104,13 @@ define MARIADB_INSTALL_INIT_SYSTEMD
>  endef
>  endif
>  
> +# We don't need mysql_config on the target as it's only useful in staging
> +# We also don't need the test suite on the target
>  define MARIADB_POST_INSTALL
>  	mkdir -p $(TARGET_DIR)/var/lib/mysql
>  	$(INSTALL) -D -m 644 $(TARGET_DIR)/usr/share/mysql/my-small.cnf \
>  		$(TARGET_DIR)/etc/mysql/my.cnf
> -	# We don't need this on the target as it's only useful in staging
>  	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
> -	# Remove test suite
>  	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
>  endef

This whole changed should be explained in the commit log, and be part
of a separate patch, because it has nothing to do with the bump.

>  
> diff --git a/package/mysql/Config.in b/package/mysql/Config.in
> index 278dc73e57..140c2314d4 100644
> --- a/package/mysql/Config.in
> +++ b/package/mysql/Config.in
> @@ -17,6 +17,7 @@ choice
>  config BR2_PACKAGE_MARIADB
>  	bool "mariadb"
>  	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
> +	depends on !BR2_STATIC_LIBS #dlopen

This should also be explained in the commit log. In addition, when you
add such a dependency, a Config.in comment should be added:

comment "mariadb needs a toolchain w/ dynamic library"
	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
	depends on BR2_STATIC_LIBS

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
