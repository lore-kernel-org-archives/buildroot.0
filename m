From: Steve Kenton <skenton@ou.edu>
Date: Mon, 24 Apr 2017 04:41:23 +0000
Subject: [Buildroot] [PATCH] xorriso: disable libcdio
In-Reply-To: <0a5dac7516bd86eca86510a190385617af60d738.1492891844.git.baruch@tkos.co.il>
References: <0a5dac7516bd86eca86510a190385617af60d738.1492891844.git.baruch@tkos.co.il>
Message-ID: <dcda91e6-6425-31a8-0da6-b4f481ed0a7c@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Looks good to me

Ack - Steve Kenton



On 04/22/2017 08:10 PM, Baruch Siach wrote:
> xorriso and libcdio define identically named symbols. This breaks static
> linking.
>
> Besides, upstream suggested that on Linux the built-in libburn adapter is much
> better tested than libcdio.
>
> Disable libcdio.
>
> Fixes:
> http://autobuild.buildroot.net/results/430/430a6b548fcc311f20ea71cecaa11fafac1d5a19/
> http://autobuild.buildroot.net/results/a5d/a5d0f8bec0d39e48f6dfe4ecc07fe0ca3c6bd70a/
>
> Cc: Steve Kenton <skenton@ou.edu>
> Suggested-by: Thomas Schmitt <scdbackup@gmx.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>   package/xorriso/xorriso.mk | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
> index b2055804302e..1f095911f80f 100644
> --- a/package/xorriso/xorriso.mk
> +++ b/package/xorriso/xorriso.mk
> @@ -18,19 +18,14 @@ HOST_XORRISO_CONF_OPTS = \
>   	--disable-libedit \
>   	--disable-libacl
>   
> +# libcdio doesn't make sense for Linux
> +# http://lists.gnu.org/archive/html/bug-xorriso/2017-04/msg00004.html
> +XORRISO_CONF_OPTS = --disable-libcdio
> +
>   ifeq ($(BR2_PACKAGE_LIBICONV),y)
>   XORRISO_DEPENDENCIES += libiconv
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBCDIO),y)
> -XORRISO_DEPENDENCIES += host-pkgconf libcdio
> -XORRISO_CONF_OPTS += \
> -	--enable-pkg-check-modules \
> -	--enable-libcdio
> -else
> -XORRISO_CONF_OPTS += --disable-libcdio
> -endif
> -
>   ifeq ($(BR2_PACKAGE_READLINE),y)
>   XORRISO_DEPENDENCIES += readline
>   XORRISO_CONF_OPTS += --enable-libreadline
