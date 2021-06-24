From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Jun 2021 22:22:43 +0200
Subject: [Buildroot] [PATCH 14/15] Makefile: Breaks hardlinks in global
 {TARGET, HOST}_DIR on per-package build
In-Reply-To: <20210621141130.48654-15-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-15-herve.codina@bootlin.com>
Message-ID: <20210624202243.GB2852@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> Without this patch, a make <pkg>_rebuild detects overwrites. Indeed, in
> target_finalize steps some modifications are done on installed files (ie
> strip or TARGET_FINALIZE_HOOKS for instance).
> 
> In order to avoid these modifications seen from per-package {TARGET,HOST}_DIR
> and so been analyzed as some overwrites, global {TARGET,HOST}_DIR is built
> using a full copy of the involved per-package files instead of hardlinks.

OK, now it makes sense to do a partial rsync with just the needed files.

When you respin:

    Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 50bc6b4503..fe6e3f95af 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -749,7 +749,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>  define per-package-rsync-delta
>  	mkdir -p $(3)
>  	$(foreach pkg,$(1),\
> -		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(strip $(2))/ \
> +		rsync -a \
>  		--filter='merge $($(call UPPERCASE,$(pkg))_DIR)/$(strip $(4))' \
>  		$(PER_PACKAGE_DIR)/$(pkg)/$(strip $(2))/ \
>  		$(3)$(sep))
> -- 
> 2.31.1
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
