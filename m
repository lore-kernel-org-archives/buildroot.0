From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Mar 2018 19:04:13 +0200
Subject: [Buildroot] [V3 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <20180321160329.20768-2-francois.perrad@gadz.org>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
 <20180321160329.20768-2-francois.perrad@gadz.org>
Message-ID: <20180321170413.74jd5vq4ygcgbewp@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Wed, Mar 21, 2018 at 05:03:29PM +0100, Francois Perrad wrote:
> DROPBEAR_SMALL_CODE could be only honored with bundled libtomcrypt
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/dropbear/Config.in   | 1 +
>  package/dropbear/dropbear.mk | 5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index 670077816..5d6b83b6d 100644
> --- a/package/dropbear/Config.in
> +++ b/package/dropbear/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_DROPBEAR
>  	bool "dropbear"
>  	select BR2_PACKAGE_ZLIB if !BR2_PACKAGE_DROPBEAR_SMALL
> +	select BR2_PACKAGE_LIBTOMCRYPT if !BR2_PACKAGE_DROPBEAR_SMALL
>  	help
>  	  A small SSH 2 server designed for small memory environments.
>  
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 634396dc0..e32bdc758 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -63,10 +63,11 @@ DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
>  endif
>  
>  ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
> -DROPBEAR_CONF_OPTS += --disable-zlib
> +DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
>  else
>  DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
> -DROPBEAR_DEPENDENCIES += zlib
> +DROPBEAR_DEPENDENCIES += zlib libtomcrypt
> +DROPBEAR_CONF_OPTS += --disable-bundled-libtom

As I said on v2[1] I think that unbundling static libraries is not worth it.

[1] http://patchwork.ozlabs.org/comment/1879448/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
