From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 May 2018 21:08:53 +0300
Subject: [Buildroot] [PATCH] dropbear: Do not build static binary
In-Reply-To: <20180503114701.9452-2-stefan.sorensen@spectralink.com>
References: <20180503114701.9452-1-stefan.sorensen@spectralink.com>
 <20180503114701.9452-2-stefan.sorensen@spectralink.com>
Message-ID: <20180503180853.2473u472dvxhvwkn@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Thu, May 03, 2018 at 01:47:00PM +0200, Stefan S?rensen wrote:
> Dropbear 2018.76 now uses the --enable-static option to indicate that a static
> binary should be built. This will incorrectly pick up the generic buildroot
> option intended for building static libraries, causing an unwanted static
> binary build with BR2_STATIC_LIBS/BR2_SHARED_STATIC_LIBS.
> 
> Fix by appending an --disable-static configure flag, overriding the buildroot
> default.

Your sign-off is missing here.

> ---
>  package/dropbear/dropbear.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 6bfc05fb2b..f47f97d036 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -28,9 +28,10 @@ DROPBEAR_MAKE = \
>  	$(MAKE) MULTI=1 SCPPROGRESS=1 \
>  	PROGRAMS="$(DROPBEAR_PROGRAMS)"
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> -DROPBEAR_CONF_OPTS += --enable-static
> -endif
> +# The generic --enable-static flags is only intended for use when building
> +# libraries, but dropbear will be built as a static executeable with this
> +# flag, so we overide it here
> +DROPBEAR_CONF_OPTS += --disable-static

You add --disable-static unconditionally, but we do want to build statically 
when BR2_STATIC_LIBS=y. So maybe add --disable-static only for 
BR2_SHARED_STATIC_LIBS=y to counter the effect of --enable-static that 
Buildroot adds automatically. Would that work for you?

>  # Ensure that dropbear doesn't use crypt() when it's not available
>  define DROPBEAR_SVR_PASSWORD_AUTH

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
