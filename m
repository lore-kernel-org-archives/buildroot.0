From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 11:48:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/exim: Add optional OpenSSL
 support
In-Reply-To: <1428775279-20078-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428775279-20078-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150412094855.GD4218@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-11 20:01 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/exim/exim.mk |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index f39445d..967b782 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -62,6 +62,14 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV
>  endef
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +EXIM_DEPENDENCIES += openssl
> +define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
> +	$(call exim-config-change,SUPPORT_TLS,yes)
> +	$(call exim-config-change,TLS_LIBS,-lssl -lcrypto)

I would prefer we use pkg-config. From doc/spec.txt:

    If you have pkg-config available, then instead you can just use:

    SUPPORT_TLS=yes
    USE_OPENSSL_PC=openssl

Of course, you'll have to add host-pkgconf to exim's dependencies.

Regards,
Yann E. MORIN.

> +endef
> +endif
> +
>  # this specific toolchain lacks libnsl
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12),y)
>  define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
> @@ -89,6 +97,7 @@ define EXIM_CONFIGURE_CMDS
>  	$(EXIM_USE_DEFAULT_CONFIG_FILE)
>  	$(EXIM_USE_DEFAULT_CONFIG_FILE_DOVECOT)
>  	$(EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV)
> +	$(EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL)
>  	$(EXIM_CONFIGURE_TOOLCHAIN)
>  endef
>  endif # CUSTOM_CONFIG
> -- 
> 1.7.10.4
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
