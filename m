From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 May 2018 20:53:08 +0300
Subject: [Buildroot] [PATCH v2] dropbear: Do not build static binary
In-Reply-To: <20180507122844.30867-1-stefan.sorensen@spectralink.com>
References: <20180507122844.30867-1-stefan.sorensen@spectralink.com>
Message-ID: <20180507175308.uoq5y4jeu5xihem3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Mon, May 07, 2018 at 02:28:43PM +0200, Stefan S?rensen wrote:
> Dropbear 2018.76 now uses the --enable-static option to indicate that a static
> binary should be built. This will incorrectly pick up the generic buildroot
> option intended for building static libraries, causing an unwanted static
> binary build with BR2_SHARED_STATIC_LIBS.
> 
> Fix by appending an --disable-static configure flag, overriding the buildroot
> default.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
> Changes v1->v2:
>  * Keep the --enable-static when BR2_STATIC_LIBS=y
> 
>  package/dropbear/dropbear.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 1da1a559a3..fc41a84c1f 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -27,8 +27,11 @@ DROPBEAR_MAKE = \
>  	$(MAKE) MULTI=1 SCPPROGRESS=1 \
>  	PROGRAMS="$(DROPBEAR_PROGRAMS)"
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> -DROPBEAR_CONF_OPTS += --enable-static
> +# With BR2_SHARED_STATIC_LIBS=y the generic infrastructure adds a
> +# --enable-static flags causing dropbear to be built as a static
> +# binary. Adding a --disable-static reverts this
> +ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +DROPBEAR_CONF_OPTS += --disable-static
>  endif
>  
>  # Ensure that dropbear doesn't use crypt() when it's not available

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
