From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Feb 2021 22:50:35 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/stress-ng: disable
 libbsd on static build"
In-Reply-To: <20210201175113.937333-1-fontaine.fabrice@gmail.com>
References: <20210201175113.937333-1-fontaine.fabrice@gmail.com>
Message-ID: <20210202215035.GE2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-01 18:51 +0100, Fabrice Fontaine spake thusly:
> This reverts commit f2d6c5ff9092aa7735c7a739d15180910ae734df.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of applied to master, thanks.

I however inverted the patch order. Indeed, if we do the revert before
the static condition, then there is a window during which stess-ng will
not build again. With the static condition first, then we can safely
revert.

Regards,
Yann E. MORIN.

> ---
>  package/stress-ng/stress-ng.mk | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
> index c26206cd2e..53d7b7e5b7 100644
> --- a/package/stress-ng/stress-ng.mk
> +++ b/package/stress-ng/stress-ng.mk
> @@ -10,11 +10,8 @@ STRESS_NG_SITE = https://kernel.ubuntu.com/~cking/tarballs/stress-ng
>  STRESS_NG_LICENSE = GPL-2.0+
>  STRESS_NG_LICENSE_FILES = COPYING
>  
> -ifeq ($(BR2_PACKAGE_LIBBSD):$(BR2_STATIC_LIBS),y:)
> +ifeq ($(BR2_PACKAGE_LIBBSD),y)
>  STRESS_NG_DEPENDENCIES += libbsd
> -else
> -STRESS_NG_MAKE_OPTS += HAVE_LIB_BSD=0 HAVE_WCSLCAT=0 \
> -	HAVE_WCSLCPY=0 HAVE_SETPROCTITLE=0
>  endif
>  
>  ifeq ($(BR2_PACKAGE_KEYUTILS),y)
> @@ -22,7 +19,7 @@ STRESS_NG_DEPENDENCIES += keyutils
>  endif
>  
>  define STRESS_NG_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(STRESS_NG_MAKE_OPTS) -C $(@D)
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
>  endef
>  
>  # Don't use make install otherwise stress-ng will be rebuild without
> -- 
> 2.29.2
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
