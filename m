From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Oct 2020 22:58:27 +0200
Subject: [Buildroot] [PATCH 1/3] package/freetype: drop libpng workaround
In-Reply-To: <20201001202626.1354496-1-fontaine.fabrice@gmail.com>
References: <20201001202626.1354496-1-fontaine.fabrice@gmail.com>
Message-ID: <20201001205827.GI11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-01 22:26 +0200, Fabrice Fontaine spake thusly:
> libpng workaround which has been added with commit
> f7313cadf2ca9e0195a873f62f6b6c38a58a3630 is not needed since version
> 2.5.3 and
> https://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=00c79ed9680a0d7a367c6914adc7485391299542
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/freetype/freetype.mk | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index 516d1c0cfc..428531ed08 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -37,9 +37,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBPNG),y)
>  FREETYPE_DEPENDENCIES += libpng
> -FREETYPE_CONF_OPTS += LIBPNG_CFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --cflags`" \
> -	LIBPNG_LDFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --ldflags`"
> -FREETYPE_LIBPNG_LIBS = "`$(STAGING_DIR)/usr/bin/libpng-config --libs`"
> +FREETYPE_CONF_OPTS += --with-png
>  else
>  FREETYPE_CONF_OPTS += --without-png
>  endif
> @@ -52,14 +50,5 @@ define FREETYPE_FIX_CONFIG_FILE
>  endef
>  FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE
>  
> -# libpng isn't included in freetype-config & freetype2.pc :-/
> -define FREETYPE_FIX_CONFIG_FILE_LIBS
> -	$(SED) "s,^Libs.private:,& $(FREETYPE_LIBPNG_LIBS)," \
> -		$(STAGING_DIR)/usr/lib/pkgconfig/freetype2.pc
> -	$(SED) "s,-lfreetype,& $(FREETYPE_LIBPNG_LIBS)," \
> -		$(STAGING_DIR)/usr/bin/freetype-config
> -endef
> -FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE_LIBS
> -
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.28.0
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
