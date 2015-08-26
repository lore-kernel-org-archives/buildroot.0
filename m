From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Aug 2015 14:36:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tvheadend: Fix static build
In-Reply-To: <1440537516-1908-1-git-send-email-bernd.kuhls@t-online.de>
References: <1440537516-1908-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150826123603.GA3699@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-08-25 23:18 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/bd0/bd0e8619df7cd8f21da96ae470691b1ebb2f156c/
> http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Put everything in the if-static_libs-then clause (Jerzy)
> 
>  package/tvheadend/tvheadend.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index ec04e6f..29ecf4f 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -71,6 +71,14 @@ define TVHEADEND_CONFIGURE_CMDS
>  	)
>  endef
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
> +# remove hardcoded -ldl for static builds
> +define TVHEADEND_FIX_MAKEFILE_FOR_STATIC_BUILD
> +	$(SED) 's/-ldl -lpthread -lm/-lpthread -lm/' $(@D)/Makefile

Are you sure?

src/extra/capmt_ca.c uses dlsym() so it does need -ldl.

I suspect we should instead mark tvheadend as not available for
static-only.

Regards,
Yann E. MORIN.

> +endef
> +TVHEADEND_POST_CONFIGURE_HOOKS += TVHEADEND_FIX_MAKEFILE_FOR_STATIC_BUILD
> +endif
> +
>  define TVHEADEND_BUILD_CMDS
>  	$(MAKE) -C $(@D)
>  endef
> -- 
> 2.1.4
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
