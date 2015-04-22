From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Apr 2015 00:20:33 +0200
Subject: [Buildroot] [PATCH] mosquitto: remove ipv6 depends
In-Reply-To: <1429740838-8577-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429740838-8577-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150422222033.GF4069@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-22 19:13 -0300, Gustavo Zacarias spake thusly:
> The package was added after the last iteration of the non-ipv6
> toolchain removal, so adjust it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Now it occurs to me that we should probably have kep a hiden symbol,
like so:

    config BR2_INET_IPV6
        bool
        default y

so that existing out-of-tree packages (e.g. in some br2-external trees)
continue to work seamlessly...

But them users would probably never notice the breakage, so maybe better
break early...

Regards,
Yann E. MORIN.

> ---
>  package/mosquitto/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
> index 8f579f8..50937d0 100644
> --- a/package/mosquitto/Config.in
> +++ b/package/mosquitto/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_MOSQUITTO
>  	bool "mosquitto"
>  	depends on BR2_USE_MMU # fork()
> -	depends on BR2_INET_IPV6
>  	depends on !BR2_STATIC_LIBS # builds .so
>  	help
>  	  Mosquitto is an open source message broker that implements
> @@ -14,6 +13,6 @@ config BR2_PACKAGE_MOSQUITTO
>  
>  	  http://mosquitto.org/
>  
> -comment "mosquitto needs a toolchain w/ IPv6, dynamic library"
> +comment "mosquitto needs a toolchain w/ dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_INET_IPV6 || BR2_STATIC_LIBS
> +	depends on BR2_STATIC_LIBS
> -- 
> 2.0.5
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
