From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 4 Jul 2017 13:48:30 +0300
Subject: [Buildroot] [PATCH] libzip: depend on !BR2_STATIC_LIBS
In-Reply-To: <1499163849-9884-1-git-send-email-brgl@bgdev.pl>
References: <1499163849-9884-1-git-send-email-brgl@bgdev.pl>
Message-ID: <20170704104830.oqdw4edgxppm4op2@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bartosz,

On Tue, Jul 04, 2017 at 12:24:09PM +0200, Bartosz Golaszewski wrote:
> Since version 1.2.0 libzip requires dynamic library capabilities.
> 
> Fixes: http://autobuild.buildroot.net/results/c50/c50ffa5bf565e75333192edc89e2d39044d07f26/
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/libzip/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libzip/Config.in b/package/libzip/Config.in
> index 54de9e5..0414186 100644
> --- a/package/libzip/Config.in
> +++ b/package/libzip/Config.in
> @@ -1,8 +1,12 @@
>  config BR2_PACKAGE_LIBZIP
>  	bool "libzip"
> +	depends on !BR2_STATIC_LIBS

You need to propagate dependencies to packages that select BR2_PACKAGE_LIBZIP, 
and their reverse dependencies, recursively. In this case libsigrok, 
sigrok-cli, and pulseview are affected.

baruch

>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  C library for reading, creating, and modifying zip archives. This
>  	  package also contains zipcmp, ziptorrent and zipmerge utilities.
>  
>  	  http://www.nih.at/libzip/
> +
> +comment "libzip needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
