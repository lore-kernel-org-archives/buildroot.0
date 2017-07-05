From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Jul 2017 15:42:48 +0300
Subject: [Buildroot] [PATCH 1/1] libpwquality: Link with zlib when
 required in static builds
In-Reply-To: <20170705104518.23599-1-stefan.sorensen@spectralink.com>
References: <20170705104518.23599-1-stefan.sorensen@spectralink.com>
Message-ID: <20170705124248.y4rot3ibr5o5b4kc@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Wed, Jul 05, 2017 at 12:45:18PM +0200, Stefan S?rensen wrote:
> Fixes:
> http://autobuild.buildroot.net/results/cfb3a591391d90762a326d91af3ec502a6161ac5
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  package/libpwquality/libpwquality.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
> index 66b15d8..5b5c0e0 100644
> --- a/package/libpwquality/libpwquality.mk
> +++ b/package/libpwquality/libpwquality.mk
> @@ -27,6 +27,11 @@ else
>  LIBPWQUALITY_CONF_OPTS += --disable-pam
>  endif
>  
> +# Static link with cracklib requires -lz if zlib is enabled
> +ifeq ($(BR2_STATIC_LIBS):$(BR2_PACKAGE_ZLIB),y:y)

No need for ':', just test equation to 'yy'. The ':' is only useful when you 
want to make sure that one specific variable is 'y' and the other is not set. 
Testing equation to 'y' only means that any variable is set, and the other 
not.

baruch

> +LIBPWQUALITY_CONF_ENV += LIBS="-lz"
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBPWQUALITY_TOOLS),)
>  define LIBPWQUALITY_REMOVE_TOOLS
>  	rm -f $(TARGET_DIR)/usr/bin/pwmake

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
