From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 10:21:04 +0200
Subject: [Buildroot] [PATCH] package/libwebsockets: Add support for
 unix-domain-sockets
In-Reply-To: <20200612113153.3220089-1-heiko@sntech.de>
References: <20200612113153.3220089-1-heiko@sntech.de>
Message-ID: <20200614082104.GE2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, Martin, All,

On 2020-06-12 13:31 +0200, Heiko Stuebner spake thusly:
> From: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> 
> libwebsockets allows the usage of unix-domain-sockets since 2016,
> so add an option to enable its usage.
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  package/libwebsockets/Config.in        | 4 ++++
>  package/libwebsockets/libwebsockets.mk | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
> index 2b350bf389..78a659fd35 100644
> --- a/package/libwebsockets/Config.in
> +++ b/package/libwebsockets/Config.in
> @@ -8,3 +8,7 @@ config BR2_PACKAGE_LIBWEBSOCKETS
>  	  in both directions.
>  
>  	  http://libwebsockets.org/
> +
> +config BR2_PACKAGE_LIBWEBSOCKETS_INCLUDE_UNIX_SOCK
> +       bool "include support for unix-sockets"
> +       depends on BR2_PACKAGE_LIBWEBSOCKETS
> diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
> index dedd03347d..3f6ab1408d 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -59,4 +59,8 @@ ifeq ($(BR2_SHARED_LIBS),y)
>  LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_STATIC=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_INCLUDE_UNIX_SOCK),y)
> +LIBWEBSOCKETS_CONF_OPTS += -DLWS_UNIX_SOCK=ON
> +endif

We like to have an else clause that explicitly disable the option:

    else
    LIBWEBSOCKETS_CONF_OPTS += -DLWS_UNIX_SOCK=OFF
    endif

Indeed the default value may change when the version is bumped, which is
actually what hapenned with this option between 3.2.2 (currently in
Buildroot), and what they currently have in master (commit 911898ad7).

However, in this case, an option is not even needed: the size increase
is a mere 12 bytes:

    $ ls -l output-nosock/target/usr/lib/libwebsockets.so.15
    -rwxr-xr-x 1 ymorin ymorin 183292 Jun 14 10:13 output-nosock/target/usr/lib/libwebsockets.so.15

    $ ls -l output-sock/target/usr/lib/libwebsockets.so.15
    -rwxr-xr-x 1 ymorin ymorin 183304 Jun 14 10:15 output-sock/target/usr/lib/libwebsockets.so.15

So this does not even warrant an option to start with.

Applied with the option removed, thanks.

Regards,
Yann E. MORIN.

>  $(eval $(cmake-package))
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
