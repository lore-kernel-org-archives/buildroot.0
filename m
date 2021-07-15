From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Jul 2021 23:06:40 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/libtirpc: Add optional
 GSSAPI support
In-Reply-To: <20210715031316.3325515-2-james.hilliard1@gmail.com>
References: <20210715031316.3325515-1-james.hilliard1@gmail.com>
 <20210715031316.3325515-2-james.hilliard1@gmail.com>
Message-ID: <20210715210640.GE12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

James, All,

On 2021-07-14 21:13 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libtirpc/Config.in   | 8 ++++++++
>  package/libtirpc/libtirpc.mk | 8 +++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> index 2e9c939fa8..1899edefbf 100644
> --- a/package/libtirpc/Config.in
> +++ b/package/libtirpc/Config.in
> @@ -7,5 +7,13 @@ config BR2_PACKAGE_LIBTIRPC
>  
>  	  http://sourceforge.net/projects/libtirpc/
>  
> +config BR2_PACKAGE_LIBTIRPC_GSS
> +	bool "gss"
> +	depends on BR2_USE_MMU # libkrb5
> +	depends on BR2_PACKAGE_LIBTIRPC
> +	select BR2_PACKAGE_LIBKRB5
> +	help
> +	  Enable GSSAPI support
> +
>  comment "libtirpc needs a toolchain w/ threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
> index 2678c144e9..38f05e493b 100644
> --- a/package/libtirpc/libtirpc.mk
> +++ b/package/libtirpc/libtirpc.mk
> @@ -18,7 +18,13 @@ LIBTIRPC_AUTORECONF = YES
>  # getrpcby{number,name} are only provided if 'GQ' is defined
>  LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
>  
> -LIBTIRPC_CONF_OPTS = --disable-gssapi
> +ifeq ($(BR2_PACKAGE_LIBTIRPC_GSS),y)
> +LIBTIRPC_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lgssapi_krb5"

I think the proper solution would probably to pass the path to
krb5-config:

    LIBTIRPC_CONF_ENV += KRB5_CONFIG=$(STAGING_DIR)/usr/bin/krb5-config

Could you look into that, please?

If that does not work, can you expand the commit log to explain why we
thus need to explicitly pass -l flags, and respin, please?

Regards,
Yann E. MORIN.

> +LIBTIRPC_CONF_OPTS += --enable-gssapi
> +LIBTIRPC_DEPENDENCIES += libkrb5
> +else
> +LIBTIRPC_CONF_OPTS += --disable-gssapi
> +endif
>  
>  define HOST_LIBTIRPC_INSTALL_CMDS
>  	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
