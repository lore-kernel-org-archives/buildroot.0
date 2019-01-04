From: Mark Corbin <mark.corbin@embecosm.com>
Date: Fri, 4 Jan 2019 21:04:49 +0000
Subject: [Buildroot] [PATCH 1/1] package/php: fix building pcre extension
In-Reply-To: <20181228165634.63387-1-aduskett@gmail.com>
References: <20181228165634.63387-1-aduskett@gmail.com>
Message-ID: <70859168-64ca-f537-b327-887eeb8f01af@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam

On 28/12/2018 16:56, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
>
> The configure option "--with-pcre-regex=$(STAGING_DIR)/usr" is broken.
> PHP will  prepend $(STAGING_DIR)/usr to the paths, which will cause a
> failure because it won't be able to find pcre, and will then fallback to
> searching for pcre2, which won't be installed.
>
> Removing "=$(STAGING_DIR)/usr" from --with-pcre-regex fixes the issue.
>
> Fixes:
>   http://autobuild.buildroot.net/results/586/586f56e8fcf2d2bbbd3bdf69b1c3befff7ce8bbf
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/php/php.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/php/php.mk b/package/php/php.mk
> index fd428e192a..7d7d78353b 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -244,7 +244,7 @@ PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
>  
>  ### Use external PCRE if it's available
>  ifeq ($(BR2_PACKAGE_PCRE),y)
> -PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
> +PHP_CONF_OPTS += --with-pcre-regex
>  PHP_DEPENDENCIES += pcre
>  else
>  # The bundled pcre library is not configurable through ./configure options,

I can confirm that this fixes
http://autobuild.buildroot.net/results/586/586f56e8fcf2d2bbbd3bdf69b1c3befff7ce8bbf
on my build system.

Tested-by: Mark Corbin <mark.corbin@embecosm.com>

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
