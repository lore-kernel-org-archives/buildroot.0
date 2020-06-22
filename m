From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Jun 2020 22:25:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxmlrpc: add openssl optional
 dependency
In-Reply-To: <20200622054708.1885805-1-fontaine.fabrice@gmail.com>
References: <20200622054708.1885805-1-fontaine.fabrice@gmail.com>
Message-ID: <20200622202508.GT2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-06-22 07:47 +0200, Fabrice Fontaine spake thusly:
> Without this patch, openssl_abyss is enabled if openssl is built before
> libxmlrpc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libxmlrpc/libxmlrpc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
> index 54db9f1f89..f9925b74ca 100644
> --- a/package/libxmlrpc/libxmlrpc.mk
> +++ b/package/libxmlrpc/libxmlrpc.mk
> @@ -39,6 +39,13 @@ ifeq ($(BR2_STATIC_LIBS),y)
>  LIBXMLRPC_STATIC_OPTS = SHARED_LIB_TYPE=NONE MUST_BUILD_SHLIB=N
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBXMLRPC_DEPENDENCIES = host-pkgconf openssl
> +LIBXMLRPC_CONF_OPTS = --enable-abyss-openssl
> +else
> +LIBXMLRPC_CONF_OPTS = --disable-abyss-openssl
> +endif

These should have been append-assignment, using '+=' not '='. This would
have been caught by rinning check-package:

    $ make check-package
    package/libxmlrpc/libxmlrpc.mk:43: conditional override of variable LIBXMLRPC_DEPENDENCIES
    package/libxmlrpc/libxmlrpc.mk:44: conditional override of variable LIBXMLRPC_CONF_OPTS
    package/libxmlrpc/libxmlrpc.mk:46: conditional override of variable LIBXMLRPC_CONF_OPTS

Regards,
Yann E. MORIN.

>  LIBXMLRPC_MAKE_OPTS += $(LIBXMLRPC_STATIC_OPTS)
>  LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
>  	DESTDIR=$(STAGING_DIR) install
> -- 
> 2.26.2
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
