From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 21:10:46 +0100
Subject: [Buildroot] [PATCH 01/11] package/chrony: use libedit for
 command line editing
In-Reply-To: <20191113151724.12155-2-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-2-peter@korsgaard.com>
Message-ID: <20191113201046.GM3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
> chrony is licensed under GPL-2.0, which is not license compatible with
> readline (GPL-3.0+), so remove the optional readline handling and replace
> with libedit instead.
> 
> While we are at it, also explicitly disable the libedit backend when not
> available.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/chrony/chrony.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> index f6dcb11794..379745022c 100644
> --- a/package/chrony/chrony.mk
> +++ b/package/chrony/chrony.mk
> @@ -13,6 +13,7 @@ CHRONY_CONF_OPTS = \
>  	--host-system=Linux \
>  	--host-machine=$(BR2_ARCH) \
>  	--prefix=/usr \
> +	--without-readline \
>  	--without-tomcrypt \
>  	$(if $(BR2_PACKAGE_CHRONY_DEBUG_LOGGING),--enable-debug,--disable-debug)
>  
> @@ -35,10 +36,10 @@ else
>  CHRONY_CONF_OPTS += --without-seccomp
>  endif
>  
> -ifeq ($(BR2_PACKAGE_READLINE),y)
> -CHRONY_DEPENDENCIES += readline
> +ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> +CHRONY_DEPENDENCIES += libedit
>  else
> -CHRONY_CONF_OPTS += --disable-readline
> +CHRONY_CONF_OPTS += --without-editline --disable-readline
>  endif
>  
>  # If pps-tools is available, build it before so the package can use it
> -- 
> 2.20.1
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
