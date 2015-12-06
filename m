From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Dec 2015 20:27:08 +0100
Subject: [Buildroot] [PATCH] gcc: bump 5.x series to version 5.3.0
In-Reply-To: <1449428596-26365-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449428596-26365-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151206192708.GC4023@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-12-06 16:03 -0300, Gustavo Zacarias spake thusly:
> Also remove host-cloog dependency since it's not required any more.
[--SNIP--]
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index b9551e8..77f3c69 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -169,9 +169,15 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
>  HOST_GCC_COMMON_CONF_OPTS += --with-mpc=$(HOST_DIR)/usr
>  endif
>  
> +# gcc 5 doesn't need cloog any more, see
> +# https://gcc.gnu.org/gcc-5/changes.html
>  ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
> -HOST_GCC_COMMON_DEPENDENCIES += host-isl host-cloog
> -HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)/usr --with-cloog=$(HOST_DIR)/usr
> +HOST_GCC_COMMON_DEPENDENCIES += host-isl
> +HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)/usr
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
> +HOST_GCC_COMMON_DEPENDENCIES += host-cloog
> +HOST_GCC_COMMON_CONF_OPTS += --with-cloog=$(HOST_DIR)/usr
> +endif

As I understand it, this host-cloog non-dependency is not due to the
bump to 5.3, but was already true as soon as 5.x was out.

If so, then please make that a separate patch.

Regards,
Yann E. MORIN.

>  else
>  HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
>  endif
> -- 
> 2.4.10
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
