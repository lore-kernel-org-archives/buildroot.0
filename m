From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 18:08:45 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] package/libkrb5: add openssl optional dependency
In-Reply-To: <20210613091044.877789-1-fontaine.fabrice@gmail.com>
References: <20210613091044.877789-1-fontaine.fabrice@gmail.com>
Message-ID: <20210613160845.GQ168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-13 11:10 +0200, Fabrice Fontaine spake thusly:
> openssl is an optional dependency which is enabled by default since at
> least 2007 and
> https://github.com/krb5/krb5/commit/4c17f25c0f106ec8e3aad2cee4e7a24f66b5a65d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

I squashed the two commits together, because selecting the openssl
options is really just part of fixing the openssl dependency of libkrb5.

Thank you! :-)

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Add openssl optional dependency
> 
>  package/libkrb5/libkrb5.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> index e4f3fa4186..794cedd33c 100644
> --- a/package/libkrb5/libkrb5.mk
> +++ b/package/libkrb5/libkrb5.mk
> @@ -41,6 +41,21 @@ else
>  LIBKRB5_CONF_OPTS += --without-ldap
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBKRB5_CONF_OPTS += \
> +	--enable-pkinit \
> +	--with-crypto-impl=openssl \
> +	--with-spake-openssl \
> +	--with-tls-impl=openssl
> +LIBKRB5_DEPENDENCIES += openssl
> +else
> +LIBKRB5_CONF_OPTS += \
> +	--disable-pkinit \
> +	--with-crypto-impl=builtin \
> +	--without-spake-openssl \
> +	--without-tls-impl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBEDIT),y)
>  LIBKRB5_CONF_OPTS += --with-libedit
>  LIBKRB5_DEPENDENCIES += host-pkgconf libedit
> -- 
> 2.30.2
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
