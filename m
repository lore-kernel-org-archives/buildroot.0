From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 00:32:34 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/redis: add optional support
 for TLS connections
In-Reply-To: <20200602104011.837-4-titouan.christophe@railnova.eu>
References: <20200602104011.837-1-titouan.christophe@railnova.eu>
 <20200602104011.837-4-titouan.christophe@railnova.eu>
Message-ID: <20200605223234.GY13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Titouan, All,

On 2020-06-02 12:40 +0200, Titouan Christophe spake thusly:
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/redis/redis.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 1578f97e0d..c88e107c2b 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -30,6 +30,11 @@ endif
>  REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
>  	PREFIX=$(TARGET_DIR)/usr MALLOC=libc
>  
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
> +REDIS_DEPENDENCIES += libopenssl
> +REDIS_BUILDOPTS += BUILD_TLS=yes

I've added the =no case otherwise, for consistency with other parts of
the code (--enabel/--disable for autotools packages), and to avoid an
environemnt variable from leaking.

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

> +endif
> +
>  define REDIS_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
>  endef
> -- 
> 2.25.3
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
