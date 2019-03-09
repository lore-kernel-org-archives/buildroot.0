From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 21:35:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: disable locale
 with uclibc
In-Reply-To: <20190309145125.19822-1-fontaine.fabrice@gmail.com>
References: <20190309145125.19822-1-fontaine.fabrice@gmail.com>
Message-ID: <20190309213554.0bdbab0e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Waldemar,

What do you think about the below issue ? As Fabrice said, it
apparently exists since 2014, perhaps this is something to fix in
uClibc ?

Thanks,

Thomas

On Sat,  9 Mar 2019 15:51:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/f7be30ffa28b7f367fb5343a7d69dc8bc7c3a170
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/imagemagick/imagemagick.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index b5d0d56284..81e49eb62c 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -40,6 +40,14 @@ IMAGEMAGICK_CONF_OPTS = \
>  
>  IMAGEMAGICK_DEPENDENCIES = host-pkgconf
>  
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +# Like postgreSQL, imagemagick does not build against uClibc with
> +# locales enabled, due to an uClibc bug, see
> +# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
> +# so overwrite automatic detection and disable locale support
> +IMAGEMAGICK_CONF_ENV += ac_cv_func_newlocale=no
> +endif
> +
>  ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
>  IMAGEMAGICK_CONF_OPTS += --with-fontconfig
>  IMAGEMAGICK_DEPENDENCIES += fontconfig



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
