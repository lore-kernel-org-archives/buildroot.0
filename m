From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 18:15:58 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/beecrypt: add host variant
In-Reply-To: <1441293831-3524-3-git-send-email-james.knight@rockwellcollins.com>
References: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
 <1441293831-3524-3-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150903161558.GD3607@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2015-09-03 11:23 -0400, James Knight spake thusly:
> Required by an upcoming host variant of the `rpm` package.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
> Changes v2 -> v3:
>   - None.
> 
> Changes v1 -> v2:
>   - Do not configured host variant based off of target variant
>      configuration (based off comments from Thomas Petazzoni).
> ---
>  package/beecrypt/beecrypt.mk | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
> index e66cec1..e3749d5 100644
> --- a/package/beecrypt/beecrypt.mk
> +++ b/package/beecrypt/beecrypt.mk
> @@ -11,11 +11,18 @@ BEECRYPT_INSTALL_STAGING = YES
>  BEECRYPT_LICENSE = LGPLv2.1+
>  BEECRYPT_LICENSE_FILES = COPYING.LIB
>  
> -BEECRYPT_CONF_OPTS = \
> +BEECRYPT_CONFIGURE_ARGS = \
>  	--disable-expert-mode \
> +	--disable-openmp \
>  	--without-java \
> -	--without-python \
> -	--disable-openmp
> +	--without-python

Do not re-order options, it just makes noise.

> +BEECRYPT_CONF_OPTS += \
> +	$(BEECRYPT_CONFIGURE_ARGS)

No need for '+=' since that;s the only assignment. Just use '='.

> +HOST_BEECRYPT_CONF_OPTS += \
> +	$(BEECRYPT_CONFIGURE_ARGS) \
> +	--without-cplusplus

Ditto.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
>  BEECRYPT_DEPENDENCIES += icu
> @@ -33,3 +40,4 @@ BEECRYPT_POST_CONFIGURE_HOOKS += BEECRYPT_LINK_WITH_CC
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 1.9.5.msysgit.1
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
