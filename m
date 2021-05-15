From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 18:10:45 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/dmalloc: fix static build
In-Reply-To: <20210515151730.3167044-1-fontaine.fabrice@gmail.com>
References: <20210515151730.3167044-1-fontaine.fabrice@gmail.com>
Message-ID: <20210515161045.GR2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-15 17:17 +0200, Fabrice Fontaine spake thusly:
> Build of dmalloc is broken since commit
> 19ec872f169a851b48ba04d22432b7c0939847d4 because --enable-shlib is
> unconditionally set
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/62c9c6aebca60649bd6f635125507bf10d63fc05
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Don't unconditionally set --enable-shlib
> 
>  package/dmalloc/dmalloc.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
> index 638fe0fcda..749c35359c 100644
> --- a/package/dmalloc/dmalloc.mk
> +++ b/package/dmalloc/dmalloc.mk
> @@ -13,10 +13,12 @@ DMALLOC_LICENSE = MIT-like
>  DMALLOC_LICENSE_FILES = dmalloc.h.1
>  
>  DMALLOC_INSTALL_STAGING = YES
> -DMALLOC_CONF_OPTS = --enable-shlib
>  DMALLOC_CFLAGS = $(TARGET_CFLAGS)
>  
> -ifeq ($(BR2_STATIC_LIBS),)
> +ifeq ($(BR2_STATIC_LIBS),y)
> +DMALLOC_CONF_OPTS += --disable-shlib
> +else
> +DMALLOC_CONF_OPTS += --enable-shlib
>  DMALLOC_CFLAGS += -fPIC
>  endif
>  
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
