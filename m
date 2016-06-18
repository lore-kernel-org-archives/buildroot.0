From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jun 2016 14:57:42 +0200
Subject: [Buildroot] [PATCH 1/1] Apache mod_auth_tkt : new package
In-Reply-To: <1465556439-60344-2-git-send-email-mickael.chazaux@gmail.com>
References: <1465556439-60344-1-git-send-email-mickael.chazaux@gmail.com>
 <1465556439-60344-2-git-send-email-mickael.chazaux@gmail.com>
Message-ID: <20160618125742.GD3573@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mickael, All,

On 2016-06-10 13:00 +0200, Mickael Chazaux spake thusly:
> Signed-off-by: Mickael Chazaux <mickael.chazaux@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  package/apache-mod-auth-tkt/Config.in              |  5 ++++
>  package/apache-mod-auth-tkt/apache-mod-auth-tkt.mk | 31 ++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 package/apache-mod-auth-tkt/Config.in
>  create mode 100644 package/apache-mod-auth-tkt/apache-mod-auth-tkt.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f9afbc0..b8c26c2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1366,6 +1366,7 @@ menu "Networking applications"
>  	source "package/aiccu/Config.in"
>  	source "package/aircrack-ng/Config.in"
>  	source "package/apache/Config.in"
> +        source "package/apache-mod-auth-tkt/Config.in"

Indentation is a TAB, not 8 spaces.

>  	source "package/argus/Config.in"
>  	source "package/arptables/Config.in"
>  	source "package/atftp/Config.in"
> diff --git a/package/apache-mod-auth-tkt/Config.in b/package/apache-mod-auth-tkt/Config.in
> new file mode 100644
> index 0000000..a0350a1
> --- /dev/null
> +++ b/package/apache-mod-auth-tkt/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_APACHE_MOD_AUTH_TKT
> +	bool "Apache Module mod_auth_tkt"

This should depend on apache, no?

> +	help
> +	   Lightweight single-signon authentication module for Apache 
> +
> diff --git a/package/apache-mod-auth-tkt/apache-mod-auth-tkt.mk b/package/apache-mod-auth-tkt/apache-mod-auth-tkt.mk
> new file mode 100644
> index 0000000..6c2fa8b
> --- /dev/null
> +++ b/package/apache-mod-auth-tkt/apache-mod-auth-tkt.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# mod_auth_tkt
> +#
> +################################################################################
> +
> +APACHE_MOD_AUTH_TKT_DEPENDENCIES=apache
> +
> +APACHE_MOD_AUTH_TKT_VERSION=2.3.99b1
> +APACHE_MOD_AUTH_TKT_SITE="https://github.com/gavincarr/mod_auth_tkt/archive/"
> +APACHE_MOD_AUTH_TKT_SOURCE=2.3.99b1.tar.gz
> +
> +
> +define APACHE_MOD_AUTH_TKT_BUILD_CMDS
> +	(cd $(@D) && ./configure --apxs=$(STAGING_DIR)/usr/bin/apxs --apachever=2.4) 

This first line should go in APACHE_MOD_AUTH_TKT_CONFIGURE_CMDS.
Besides, parenthesis are not needed:

    define APACHE_MOD_AUTH_TKT_CONFIGURE_CMDS
        cd $(@D) && ./configure --apxs=$(STAGING_DIR)/usr/bin/apxs \
                                --apachever=2.4
    endef

> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)

What about CFLAGS and LDFLAGS?

> +endef
> +
> +define APACHE_MOD_AUTH_TKT_INSTALL_TARGET_CMDS
> +	(cd $(@D)/src && \
> +	$(LIBTOOL) --mode=install install mod_auth_tkt.la $(TARGET_DIR)/usr/modules/ \
> +	)

Parenthesis not required.

And yes, that's probably the simplest solution. The install procedure
for that module is definitely not cross-aware; it's not possible to
install out of tree.

> +endef
> +
> +define APACHE_MOD_AUTH_TKT_INSTALL_STAGING_CMDS
> +	(cd $(@D)/src && \
> +	$(LIBTOOL) --mode=install install mod_auth_tkt.la $(STAGING_DIR)/usr/modules/ \
> +	)

Why is it necessary to install it in staging? I would expect apache
modules to only be needed at runtime, since they are dlopened.

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
