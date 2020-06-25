From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2020 23:13:24 +0200
Subject: [Buildroot] [PATCH] package/dropbear: restore full
 BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO behaviour
In-Reply-To: <20200625075841.317226-1-francois.perrad@gadz.org>
References: <20200625075841.317226-1-francois.perrad@gadz.org>
Message-ID: <20200625211324.GU20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois, All,

On 2020-06-25 09:58 +0200, Francois Perrad spake thusly:
> now, BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO works like with version 2019.78
> and as described in Config.in
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

But see a nit, below...

> ---
>  package/dropbear/dropbear.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index b32f39d64..b7342cef5 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -56,7 +56,14 @@ endef
>  DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH
>  endif
>  
> -ifneq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
> +ifeq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
> +define DROPBEAR_ENABLE_LEGACY_CRYPTO
> +	echo '#define DROPBEAR_3DES 1'                  >> $(@D)/localoptions.h
> +	echo '#define DROPBEAR_ENABLE_CBC_MODE 1'       >> $(@D)/localoptions.h
> +	echo '#define DROPBEAR_SHA1_96_HMAC 1'          >> $(@D)/localoptions.h
> +endef
> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO

I know you followed the existing code, but semantically that is not
correct: it is not a post-=extract hook, but rather, it is a
pre=configure hook.

Indeed, post-extract hooks are there to "fixup" the extraction, while
pre-configure hooks are there to "prepare" the configure step.

Would you care to see if swithching all those to _PRE_CONFIGURE_HOOKS is
possible and has not side-effect, please?

Regards,
Yann E. MORIN.

> +else
>  define DROPBEAR_DISABLE_LEGACY_CRYPTO
>  	echo '#define DROPBEAR_DSS 0'                   >> $(@D)/localoptions.h
>  	echo '#define DROPBEAR_DH_GROUP1 0'             >> $(@D)/localoptions.h
> -- 
> 2.25.1
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
