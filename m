From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 22:21:39 +0200
Subject: [Buildroot] [PATCH] package/proftpd: add mod_{sql,
 quotatab} support
In-Reply-To: <1537212783-15263-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537212783-15263-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180918222139.4deeec42@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Mon, 17 Sep 2018 14:33:03 -0500, Matt Weber wrote:
> From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> 
>  - Enables mod_sql which is required for quotatab

It's required for mod_quotatab_sql, not mod_quotatab.

>  - Adds options for enabling mod_quotatab and the sub-component
>    file/LDAP/RADIUS/SQL modules
>  - Copies over ftpasswd and ftpquota scripts if perl is enabled
>    (These scripts aren't required and the feature works
>     without them installed)

If they aren't required, are they related to mod_sql and mod_quotatab ?
The question is: should this be done as part of the same patch, or as a
separate patch ?

> +config BR2_PACKAGE_PROFTPD_MOD_SQL
> +	bool "mod_sql support"
> +	help
> +	  Compile ProFTPD with mode_sql support.
> +
> +config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
> +	bool "mod_quotatab support"
> +	help
> +	  Compile ProFTPD with mode_quotatab support. This module
> +	  is required in order to support quota tables:
> +	        1. mod_quotatab_file
> +	        2. mod_quotatab_ldap
> +	        3. mod_quotatab_radius
> +	        4. mod_quotatab_sql
> +
> +if BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
> +
> +config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_FILE
> +	bool "mod_quotatab_file table support"
> +	help
> +	  Compile mod_quotatab with mod_quotatab_file table.
> +
> +config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_LDAP
> +	bool "mod_quotatab_ldap table support"
> +	help
> +	  Compile mod_quotatab with mod_quotatab_ldap table.
> +
> +config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_RADIUS
> +	bool "mod_quotatab_radius table support"
> +	help
> +	  Compile mod_quotatab with mod_quotatab_radius table.
> +
> +config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_SQL
> +	bool "mod_quotatab_sql table support"
> +	depends on BR2_PACKAGE_PROFTPD_MOD_SQL

Please use:

	select BR2_PACKAGE_PROFTPD_MOD_SQL

> +	help
> +	  Compile mod_quotatab with mod_quotatab_sql table.
> +
> +comment "mod_quotatab_sql needs mod_sql"
> +	depends on !BR2_PACKAGE_PROFTPD_MOD_SQL

and drop this.

>  # configure script doesn't handle detection of %llu format string
> @@ -62,6 +86,15 @@ PROFTPD_POST_CONFIGURE_HOOKS = PROFTPD_MAKENAMES
>  
>  PROFTPD_MAKE = $(MAKE1)
>  
> +#Install Perl based scripts in target
> +ifeq ($(BR2_PACKAGE_PERL),y)
> +define PROFTPD_INSTALL_PERL_BIN
> +	$(INSTALL) -D -m 0755 $(@D)/contrib/ftpquota $(TARGET_DIR)/usr/sbin/ftpquota
> +	$(INSTALL) -D -m 0755 $(@D)/contrib/ftpasswd $(TARGET_DIR)/usr/sbin/ftpasswd
> +endef
> +PROFTPD_POST_INSTALL_TARGET_HOOKS = PROFTPD_INSTALL_PERL_BIN

Drop this hook, and do:

> +endif
> +
>  define PROFTPD_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
>  	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf

	$(PROFTPD_INSTALL_PERL_BIN)

instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
